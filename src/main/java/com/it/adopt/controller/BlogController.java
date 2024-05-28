package com.it.adopt.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Blog;
import com.it.adopt.service.BlogService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    public PageInfo<Blog> doBlogs(@RequestParam("pageNum") Integer pageNum,
                                  @RequestParam(value = "pageSize", required = false) Integer pageSize,
                                  @RequestParam(value = "title", required = false) String title){
        if(pageSize==null){
            pageSize = 3;
        }
        if(pageNum==null){
            pageNum = 1;
        }
        //开启分页
        PageHelper.startPage(pageNum, pageSize);
        List<Blog> blogs = null;
        if(title!=null){
            //根据标题查
            blogs = blogService.selectByTitle(title);
        }else{
            //查所有
            blogs = blogService.selectAll();
        }
        //封装数据返回
        return new PageInfo<>(blogs, 3);
    }

    @RequestMapping("/findById")
    @ResponseBody
    public Blog findById(@RequestParam("id") Integer blogId){
        return blogService.findById(blogId);
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteById(@PathVariable("id") Integer id){
        int rows = blogService.deleteById(id);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/deleteBlogs", method = RequestMethod.POST)
    @ResponseBody
    public int[] deleteBlogs(@RequestParam("arr") String[] arr){
        int[] rows = new int[arr.length];
        for(int i=0; i<arr.length; i++){
            rows[i] = blogService.deleteById(Integer.valueOf(arr[i]));
        }
        return rows;
    }

    @RequestMapping(value = "/addBlog", method = RequestMethod.POST)
    @ResponseBody
    public String addBlog(Blog blog){
        int rows = blogService.insert(blog);
        if(rows>0){
            return "yes";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(Blog blog){
        Blog old = blogService.findById(blog.getId());
        if(blog.getTitle()!=null){ old.setTitle(blog.getTitle()); }
        if(blog.getPeoples()!=null){ old.setPeoples(blog.getPeoples()); }
        if(blog.getEvent()!=null){ old.setEvent(blog.getEvent()); }
        if(blog.getAddress()!=null){ old.setAddress(blog.getAddress()); }
        if(blog.getActionTime()!=null){ old.setActionTime(blog.getActionTime()); }
        int rows = blogService.updateById(old);
        return rows>0 ? "yes" : "error";
    }
}
