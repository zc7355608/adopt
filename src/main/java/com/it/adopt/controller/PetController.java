package com.it.adopt.controller;

import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Pet;
import com.it.adopt.service.PetService;
import com.it.adopt.utils.UUIDGenerator;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * ClassName: PetController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/21 16:54
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/pet")
public class PetController {
    @Resource
    PetService petService;

    @RequestMapping("/allPets")
    @ResponseBody
    public PageInfo<Pet> allPets(@RequestParam(value = "pageNum",required = false) Integer pageNum){
        //不指定页码，默认显示第1页数据
        if(pageNum == null){
            pageNum = 1;
        }
        //每页显示3个宠物
        Integer pageSize = 3;

        PageInfo<Pet> info = petService.listAllPets(pageNum, 3);
        return info;
    }

    @RequestMapping(value = "/findById")
    public String findPetById(HttpSession session, @RequestParam("id") Integer id){
        Pet pet = petService.findById(id);
        if(pet!=null){
            session.setAttribute("pet", pet);
            String pic = pet.getPic();
            String[] pics = pic.split(",");
            session.setAttribute("pics", pics);
        }
        return "user/details";
    }

    @RequestMapping(value = "/pets")
    @ResponseBody
    public PageInfo<Pet> pets(@RequestParam(value = "petType", required = false) String petType, @Param("pageNum") Integer pageNum){
        PageInfo<Pet> info = null;

        if(petType!=null){
            info = new PageInfo<>(petService.findByType(petType), 3);
        }else{
            info = petService.listAllPets(pageNum, 4);
        }
        return info;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(@RequestParam("id") Integer id){
        int rows = petService.deleteById(id);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/deletePets", method = RequestMethod.POST)
    @ResponseBody
    public int[] deletePets(@RequestParam("arr") String[] arr){
        int[] rows = new int[arr.length];
        for(int i=0; i<arr.length; i++){
            rows[i] = petService.deleteById(Integer.valueOf(arr[i]));
        }
        return rows;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(Pet pet){
        Pet p = petService.findById(pet.getId());
        if(pet.getPetName()!=null){ p.setPetName(pet.getPetName()); }
        if(pet.getPetType()!=null){ p.setPetType(pet.getPetType()); }
        if(pet.getSex()!=null){ p.setSex(pet.getSex()); }
        if(pet.getBirth()!=null){ p.setBirth(pet.getBirth()); }
        if(pet.getState()!=null){ p.setState(pet.getState()); }
        if(pet.getRemark()!=null){ p.setRemark(pet.getRemark()); }

        int rows = petService.update(p);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/addPet", method = RequestMethod.POST)
    @ResponseBody
    public String addPet(@RequestParam(value = "imgs", required = false) MultipartFile[] multipartFiles, HttpServletRequest request,
                         String petName, String petType, String sex, String birth, String remark){
        Pet pet = new Pet();
        pet.setState(Byte.valueOf((byte) 0));
        if(petName!=null){ pet.setPetName(petName); }
        if(petType!=null){ pet.setPetType(petType); }
        if(sex!=null){ pet.setSex(sex); }
        if(birth!=null){ pet.setBirth(birth); }
        if(remark!=null){ pet.setRemark(remark); }

        if(multipartFiles!=null){
            //布尔标记，如果为true表示已经写入了一张图片
            boolean flag = false;
            //图片的保存位置
            String absPath = request.getServletContext().getRealPath("/static/imgs/animal");
            //写文件
            for(int i=0; i<multipartFiles.length; i++){
                //获取文件后缀(带.)
                String originalFilename = multipartFiles[i].getOriginalFilename();
                String exName = originalFilename.substring(originalFilename.lastIndexOf("."));
                if(exName.endsWith(".jpg") || exName.endsWith(".jpeg") || exName.endsWith(".png") || exName.endsWith(".gif")){
                    //是图片文件
                    try {
                        InputStream in = multipartFiles[i].getInputStream();
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
                        if(flag){
                            //不是第一张图，那么就追加文件名
                            pet.setPic(pet.getPic()+","+fileName);
                        }else{
                            //如果是第一张图
                            pet.setPic(fileName);
                        }
                        if(!flag){ flag=true; }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }else{
                    //不是图片
                }
            }
        }else{
            //默认图片
            pet.setPic("cat.jpg");
        }

        int rows = petService.add(pet);
        if (rows>0) {
            return "yes";
        }else{
            return "error";
        }
    }
}