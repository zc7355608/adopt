package com.it.adopt.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.*;
import com.it.adopt.service.AdminService;
import com.it.adopt.service.ApplyService;
import com.it.adopt.utils.JavaMailUtil;
import com.it.adopt.utils.UUIDGenerator;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

/**
 * ClassName: ApplyController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 18:58
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/apply")
public class ApplyController {
    @Resource
    private ApplyService applyService;

    @Resource
    private AdminService adminService;

    @RequestMapping("/insert")
    public String insert(Apply apply){
        apply.setState((byte)0);
        apply.setApplyTime(new Date(System.currentTimeMillis()));
        int rows = applyService.insertApply(apply);
        if(rows>0){
            return "user/success";
        }else{
            return "user/error";
        }
    }

    @RequestMapping("/applys")
    @ResponseBody
    public PageInfo<Apply> applys(@RequestParam(value = "username", required = false) String name,
                                  @RequestParam("pageNum") Integer pageNum){
        PageInfo<Apply> info = null;
        PageHelper.startPage(pageNum, 5);
        if(name!=null){
            List<Apply> applies = applyService.selectByNameAndState(name, Byte.valueOf((byte) 0));
            info = new PageInfo<>(applies, 3);
        }else{
            List<Apply> applies = applyService.selectByState(Byte.valueOf((byte) 0));
            info = new PageInfo<>(applies, 3);
        }
        return info;
    }

    @RequestMapping(value = "/agree/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public String agree(@PathVariable("id") Integer id){
        Apply apply = applyService.selectById(id);
        if(apply==null){
            return "error";
        }
        String username = apply.getName();
        String password = UUIDGenerator.generate8BitUUID();
        apply.setState(Byte.valueOf((byte) 1));
        applyService.updateById(apply);

        //新增一条管理员记录
        Admin admin = new Admin();
        admin.setAdminName(username);
        admin.setAdminPwd(password);
        admin.setRealname(username);
        admin.setEmail(apply.getEmail());
        admin.setPhone(apply.getPhone());
        admin.setPic("a.jpg");
        adminService.addAdmin(admin);

        //给用户发送申请成功邮件，邮件中包含账号密码
        String msg = "您的志愿者申请已通过！请本人("+ apply.getName() +")在3天内与负责人联系。\n" +
                "联系人：江姐\n联系电话：15517747322\n志愿者工作站地址:河西省华夏市三江区幸福大街17号2楼\r\n您的账号:"+
                username+"\n密码:"+ password;
        return JavaMailUtil.sendMail("2273705254@qq.com", msg) ? "yes" : "error";
    }

    @RequestMapping(value = "/disagree/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public String disagree(@PathVariable("id") Integer id){
        Apply apply = applyService.selectById(id);

        if(apply==null){
            return "error";
        }
        apply.setState(Byte.valueOf((byte) 2));
        applyService.updateById(apply);

        //给用户发送申请失败邮件
        String msg = "您的志愿者申请没有审核通过！具体原因为：\r\n您的申请信息不完善。";
        return JavaMailUtil.sendMail("2273705254@qq.com", msg) ? "yes" : "error";
    }
}