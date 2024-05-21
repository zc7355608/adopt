package com.it.adopt.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Blog;
import com.it.adopt.service.BlogService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * ClassName: BlogController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 12:24
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/blog")
public class BlogController {
    @Resource
    private BlogService blogService;

    @RequestMapping("/blogs")
    @ResponseBody
    public PageInfo<Blog> doBlogs(@RequestParam("pageNum") Integer pageNum){
        //每页3条数据
        int pageSize = 3;
        if(pageNum==null){
            pageNum = 1;
        }
        //开启分页
        PageHelper.startPage(pageNum, pageSize);
        //查所有
        List<Blog> blogs = blogService.selectAll();
        //封装数据返回
        return new PageInfo<>(blogs, 3);
    }

    @RequestMapping("/findById")
    @ResponseBody
    public Blog findById(@RequestParam("id") Integer blogId){
        return blogService.findById(blogId);
    }
}
