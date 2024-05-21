package com.it.adopt.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.AdoptApply;
import com.it.adopt.bean.Pet;
import com.it.adopt.bean.User;
import com.it.adopt.service.AdoptApplyService;
import com.it.adopt.service.ApplyService;
import com.it.adopt.service.PetService;
import com.it.adopt.service.UserService;
import com.it.adopt.utils.JavaMailUtil;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpRequest;
import java.util.List;

/**
 * ClassName: AdoptController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/22 21:34
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/adopt")
public class AdoptController {
    @Resource
    private AdoptApplyService adoptApplyService;
    @Resource
    private PetService petService;

    @Resource
    private UserService userService;

    @RequestMapping(value = "/apply", method = RequestMethod.POST)
    public String apply(AdoptApply apply){
        int rows = adoptApplyService.apply(apply);
        if(rows>0){
            return "user/success";
        }else{
            return "user/error";
        }
    }

    @RequestMapping(value = "/agree/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public String agree(@PathVariable("id") Integer id){
        AdoptApply apply = adoptApplyService.findById(id);
        if(apply==null){
            return "error";
        }
        Integer petId = apply.getPetId();
        Integer userId = apply.getUserId();
        apply.setState((byte)1);
        adoptApplyService.updateById(apply);

        Pet pet = petService.findById(petId);
        pet.setState((byte)1);
        petService.update(pet);

        User user = userService.findById(userId);
        user.setState((byte)(user.getState()+1));
        userService.updateByPrimaryKey(user);

        //发送申请成功邮件
        String msg = "您的领养申请已同意，请领养者本人("+ apply.getAdopterName() +")在3天内，带上身份证到店完成宠物领养！\r\n宠物编号："+ apply.getPetId() +"\n宠物名："+ pet.getPetName() +"\r\n地址:河西省华夏市三江区幸福大街17号2楼\r\n联系人：江姐\n联系电话：15517747322";
        return JavaMailUtil.sendMail("2273705254@qq.com", msg) ? "yes" : "error";
    }

    @RequestMapping(value = "/disagree/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public String disagree(@PathVariable("id") Integer id){
        AdoptApply apply = adoptApplyService.findById(id);
        if(apply==null){
            return "error";
        }
        apply.setState((byte)2);
        adoptApplyService.updateById(apply);

        //发送申请失败邮件
        String msg = "您的领养申请未通过！\r\n具体原因：领养者信息不完善。\r\n联系电话：15517747322";
        return JavaMailUtil.sendMail("2273705254@qq.com", msg) ? "yes" : "error";
    }

    @RequestMapping(value = "/applys")
    @ResponseBody
    public PageInfo<AdoptApply> applys(@RequestParam(value = "username", required = false) String adoptName,  @RequestParam("pageNum") Integer pageNum){
        PageInfo<AdoptApply> info = null;
        //开启分页
        PageHelper.startPage(pageNum, 8);

        if(adoptName!=null){
            List<AdoptApply> applys = adoptApplyService.findByStateAndAdopterName(adoptName, 0);
            for(int i=0; i<applys.size(); i++){
                AdoptApply apply = applys.get(i);
                Pet pet = petService.findById(apply.getPetId());
                apply.setPetName(pet.getPetName());
            }
            info = new PageInfo<>(applys, 3);
        }else{
            List<AdoptApply> applys = adoptApplyService.findByState(0);
            for(int i=0; i<applys.size(); i++){
                AdoptApply apply = applys.get(i);
                Pet pet = petService.findById(apply.getPetId());
                apply.setPetName(pet.getPetName());
            }
            info = new PageInfo<>(applys, 3);
        }
        return info;
    }

    @RequestMapping(value = {"/applys/agree","/applys/disagree"})
    @ResponseBody
    public PageInfo<AdoptApply> ApplysAgree(@RequestParam(value = "username", required = false) String adoptName, @RequestParam("pageNum") Integer pageNum, HttpServletRequest req){
        PageInfo<AdoptApply> info = null;
        //开启分页
        PageHelper.startPage(pageNum, 8);

        Integer state;
        if(req.getRequestURI().endsWith("/agree")){
            state = 1;
        }else{
            state = 2;
        }

        if(adoptName!=null){
            List<AdoptApply> applys = adoptApplyService.findByStateAndAdopterName(adoptName, state);
            for(int i=0; i<applys.size(); i++){
                AdoptApply apply = applys.get(i);
                Pet pet = petService.findById(apply.getPetId());
                apply.setPetName(pet.getPetName());
            }
            info = new PageInfo<>(applys, 3);
        }else{
            List<AdoptApply> applys = adoptApplyService.findByState(state);
            for(int i=0; i<applys.size(); i++){
                AdoptApply apply = applys.get(i);
                Pet pet = petService.findById(apply.getPetId());
                apply.setPetName(pet.getPetName());
            }
            info = new PageInfo<>(applys, 3);
        }
        return info;
    }
}
