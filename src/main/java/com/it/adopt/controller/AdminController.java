package com.it.adopt.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Admin;
import com.it.adopt.bean.AdoptApply;
import com.it.adopt.bean.User;
import com.it.adopt.service.*;
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
import java.util.List;

/**
 * ClassName: AdminController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/17 21:55
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    @Resource
    private BlogService blogService;

    @Resource
    private CommentService commentService;

    @Resource
    private AdoptApplyService adoptApplyService;

    @Resource
    private UserService userService;

    @Resource
    private PetService petService;

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public String doLogin(HttpSession session, @RequestParam("adminName") String adminName, @RequestParam("adminPwd") String adminPwd){
        Admin admin = adminService.selectByNameAndPwd(adminName, adminPwd);
        if(admin!=null){
            //此时登录的管理员账号信息
            session.setAttribute("admin", admin);

            //待领养宠物
            session.setAttribute("petNum", String.valueOf(petService.count()));
            //注册用户
            session.setAttribute("userNum", String.valueOf(userService.count()));
            //领养申请
            session.setAttribute("applyNum", String.valueOf(adoptApplyService.count()));
            //评论
            session.setAttribute("commentNum", String.valueOf(commentService.count()));
            //团队活动
            session.setAttribute("blogNum", String.valueOf(blogService.count()));
            //团队规模
            session.setAttribute("adminNum", String.valueOf(adminService.count()));

            //密码正确
            return "yes";
        }else{
            //密码错误
            return "no";
        }
    }

    @RequestMapping("/allAdmins")
    @ResponseBody
    public PageInfo<Admin> all(@RequestParam("pageNum") Integer pageNum){
        //每页4条数据
        int pageSize = 4;
        if(pageNum==null){
            pageNum = 1;
        }
        //开启分页
        PageHelper.startPage(pageNum, pageSize);
        //查询
        List<Admin> admins = adminService.selectAll();
        //返回info对象
        return new PageInfo<>(admins, 3);
    }

    @RequestMapping(value = {"/user-edit", "/user-password"})
    public ModelAndView editUser(HttpServletRequest req, @RequestParam("id") String id, @RequestParam("username") String username){
        ModelAndView mav = new ModelAndView();
        mav.addObject("id", id);
        mav.addObject("username", username);
        if(req.getRequestURI().endsWith("/user-password")){
            mav.setViewName("admin/user-password");
        }else{
            mav.setViewName("admin/user-edit");
        }
        return mav;
    }

    @RequestMapping(value = {"/admin-edit", "/admin-password"})
    public ModelAndView editAdmin(HttpServletRequest req, @RequestParam("id") String id, @RequestParam("username") String username){
        ModelAndView mav = new ModelAndView();
        mav.addObject("id", id);
        mav.addObject("username", username);
        if(req.getRequestURI().endsWith("/admin-password")){
            mav.setViewName("admin/admin-password");
        }else{
            mav.setViewName("admin/admin-edit");
        }
        return mav;
    }

    @RequestMapping(value = "/pet-edit")
    public ModelAndView editPet(HttpServletRequest req, @RequestParam("id") String id, @RequestParam("petName") String petName){
        ModelAndView mav = new ModelAndView();
        mav.addObject("id", id);
        mav.addObject("petName", petName);
        mav.setViewName("admin/pet-edit");
        return mav;
    }

    @RequestMapping(value = "/blog-edit")
    public ModelAndView editBlog(HttpServletRequest req, @RequestParam("id") String id, @RequestParam("title") String title){
        ModelAndView mav = new ModelAndView();
        mav.addObject("id", id);
        mav.addObject("title", title);
        mav.setViewName("admin/blog-edit");
        return mav;
    }

    @RequestMapping(value = "/admins")
    @ResponseBody
    public PageInfo<Admin> admins(@RequestParam(value = "name", required = false) String name, @Param("pageNum") Integer pageNum){
        PageInfo<Admin> info = null;
        //开启分页
        PageHelper.startPage(pageNum, 5);

        if(name!=null){
            info = new PageInfo<>(adminService.selectByName(name), 3);
        }else{
            info = new PageInfo<>(adminService.selectAll(), 3);
        }
        return info;
    }

    @RequestMapping(value = "/deleteAdmins", method = RequestMethod.POST)
    @ResponseBody
    public int[] deleteAdmins(@RequestParam("arr") String[] arr){
        int[] rows = new int[arr.length];
        for(int i=0; i<arr.length; i++){
            rows[i] = adminService.deleteById(Integer.valueOf(arr[i]));
        }
        return rows;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam("id") Integer id){
        int rows = adminService.deleteById(id);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public String updatePassword(@RequestParam("id") Integer id, @RequestParam("old-password") String old, @RequestParam("new-password") String niu){
        Admin admin = adminService.findById(id);
        if(admin.getAdminPwd().equals(old)){
            admin.setAdminPwd(niu);
            int rows = adminService.updateByPrimaryKey(admin);
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
    public String update(HttpServletRequest request,Integer id,String adminName,String adminPwd,String realname,String phone,String email,String birth,String sex,String remark,
                         @RequestParam(value = "img", required = false) MultipartFile multipartFile){
        Admin admin = adminService.findById(id);
        if( admin==null ){ return "error"; }

        if( adminName!=null ){ admin.setAdminName(adminName); }
        if( adminPwd!=null ){
            if( adminPwd.equals(admin.getAdminPwd()) ){
                //密码没变
            }else{
                //密码变了，session过期掉
                admin.setAdminPwd(adminPwd);
                request.getSession().invalidate();
            }
        }
        if( realname!=null ){ admin.setRealname(realname); }
        if( phone!=null ){ admin.setPhone(phone); }
        if( email!=null ){ admin.setEmail(email); }
        if( birth!=null ){ admin.setBirth(birth); }
        if( sex!=null ){ admin.setSex(sex); }
        if( remark!=null ){ admin.setRemark(remark); }

        //上传图片
        if( multipartFile!=null ){
            try {
                InputStream in = multipartFile.getInputStream();
                //图片的保存位置
                String absPath = request.getServletContext().getRealPath("/static/imgs/admin");
                //获取文件后缀(带.)
                String originalFilename = multipartFile.getOriginalFilename();
                String exName = originalFilename.substring(originalFilename.lastIndexOf("."));
                String fileName = UUIDGenerator.generate8BitUUID() + exName;
                BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(absPath, fileName)));
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
                admin.setPic(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        int rows = adminService.updateByPrimaryKey(admin);
        if (rows>0) {
            if ( request.getSession(false)==null ) {
                //拿不到session了，说明密码变了
            }else{
                //拿到session了，说明密码没变，session中数据更新
                request.getSession(false).setAttribute("admin", admin);
            }
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
    @ResponseBody
    public String addAdmin(Admin admin){
        //添加的是普通管理员
        admin.setPower(Byte.valueOf((byte) 0));
        admin.setPic("a.jpg");
        int rows = adminService.addAdmin(admin);
        if (rows>0) {
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping("/{path}")
    public String path(HttpSession session, @PathVariable("path") String path){
        //如果是退出请求，那么就退出登录
        if("logout".equals(path)){
            session.invalidate();
            return "admin/login";
        }
        //如果是其他请求路径，判断session中是否有数据
        if(session.getAttribute("admin")!=null){
            //有就跳转到主页
            return "admin/"+ path;
        }else{
            //没有数据就去登陆
            return "admin/login";
        }
    }
}