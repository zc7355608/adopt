package com.it.adopt.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Admin;
import com.it.adopt.bean.AdoptApply;
import com.it.adopt.bean.Pet;
import com.it.adopt.bean.User;
import com.it.adopt.service.UserService;
import com.it.adopt.utils.UUIDGenerator;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

/**
 * ClassName: UserController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/17 21:55
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user){
        user.setPic("t.png");
        user.setState((byte) 0);
        int rows = userService.registerUser(user);
        if(rows>0){
            return "redirect:/static/html/registerSuccess.html";
        }else{
            return "redirect:/static/html/registerError.html";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
        User user = userService.userLogin(username, password);
        //登陆成功，session中放数据，返回yes
        if(user!=null){
            session.setAttribute("user", user);
            return "yes";
        //登陆失败，返回no
        }else{
            return "no";
        }
    }

    @RequestMapping("/logout")
    public String login(HttpSession session){
        //将session中数据删除，饭回登录
        session.removeAttribute("user");
        return "redirect:/static/html/login.html";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public String update(@RequestParam(value = "img", required = false) MultipartFile multipartFile, HttpServletRequest request,
                         Integer id, String username, String password, Integer age, String sex,
                         String phone, String email, String address, Byte state){
        User user = userService.findById(id);
        if( user==null ){ return "error"; }

        if( username!=null ){ user.setUsername(username); }
        if( password!=null ){
            if( password.equals(user.getPassword()) ){
                //密码没变
            }else{
                //密码变了，session过期掉
                user.setPassword(password);
                request.getSession().invalidate();
            }
        }
        if( age!=null ){ user.setAge(age); }
        if( sex!=null ){ user.setSex(sex); }
        if( phone!=null ){ user.setPhone(phone); }
        if( email!=null ){ user.setEmail(email); }
        if( address!=null ){ user.setAddress(address); }
        if( state!=null ){ user.setState(state); }

        //如果有上传文件
        if( multipartFile!=null ){
            String filename = multipartFile.getOriginalFilename();
            //确实是图片文件
            if(filename.endsWith(".jpg") || filename.endsWith(".jpeg") || filename.endsWith(".png") || filename.endsWith("gif")){
                //保存图片
                try {
                    InputStream in = multipartFile.getInputStream();
                    //图片的保存位置
                    String absPath = request.getServletContext().getRealPath("/static/imgs/user");
                    //获取文件后缀(带.)
                    String exName = filename.substring(filename.lastIndexOf("."));
                    String newFileName = UUIDGenerator.generate8BitUUID() + exName;
                    BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(absPath, newFileName)));
                    byte[] bytes = new byte[1024 * 100];
                    int readCount = 0;
                    while((readCount = in.read(bytes)) != -1){
                        out.write(bytes,0,readCount);
                    }
                    // 刷新缓冲流
                    out.flush();
                    // 关闭流
                    in.close();
                    out.close();
                    //保存文件名
                    user.setPic(newFileName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        int rows = userService.updateByPrimaryKey(user);
        if (rows>0) {
            if ( request.getSession(false)==null ) {
                //拿不到session了，说明密码变了
            }else{
                //拿到session了，说明密码没变，session中数据更新
                request.getSession(false).setAttribute("user", user);
            }
            return "redirect:/user/top";
        }else{
            //操作失败，重定向到500页面
            return "redirect:/static/html/error/500.html";
        }
    }

    @RequestMapping(value = "/users")
    @ResponseBody
    public PageInfo<User> users(@RequestParam(value = "username", required = false) String username, @RequestParam("pageNum") Integer pageNum){
        PageInfo<User> info = null;
        //开启分页
        PageHelper.startPage(pageNum, 9);

        if(username!=null){
            info = new PageInfo<>(userService.findByUsername(username), 3);
        }else{
            info = new PageInfo<>(userService.findAll(), 3);
        }

        return info;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam("id") Integer id){
        int rows = userService.deleteById(id);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/deleteUsers", method = RequestMethod.POST)
    @ResponseBody
    public int[] deleteUsers(@RequestParam("arr") String[] arr){
        int[] rows = new int[arr.length];
        for(int i=0; i<arr.length; i++){
            rows[i] = userService.deleteById(Integer.valueOf(arr[i]));
        }
        return rows;
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public String updatePassword(@RequestParam("id") Integer id, @RequestParam("old-password") String old, @RequestParam("new-password") String niu){
        User user = userService.findById(id);
        if(user.getPassword().equals(old)){
            user.setPassword(niu);
            int rows = userService.updateByPrimaryKey(user);
            if(rows>0){
                return "yes";
            }else{
                return "error";
            }
        }else{
            return "no";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(User user){
        User u = userService.findById(user.getId());
        u.setUsername(user.getUsername());
        u.setAge(user.getAge());
        u.setSex(user.getSex());
        u.setPhone(user.getPhone());
        u.setAddress(user.getAddress());
        int rows = userService.updateByPrimaryKey(u);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public String addUser(User user){
        int rows = userService.registerUser(user);
        if (rows>0) {
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping("/{path}")
    public String path(HttpSession session, @PathVariable("path") String path){
        //如果session中有数据，就跳转到主页
        if(session.getAttribute("user")!=null){
            return "user/"+ path;
        }else{//没有数据就去登陆
            return "redirect:/static/html/login.html";
        }
    }
}