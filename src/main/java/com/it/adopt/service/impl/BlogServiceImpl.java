package com.it.adopt.service.impl;

import com.it.adopt.bean.Blog;
import com.it.adopt.mapper.BlogMapper;
import com.it.adopt.service.BlogService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: BlogServiceImpl
 * Package: com.it.adopt.service.impl
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 13:07
 * @Version: 1.0.0
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private BlogMapper mapper;

    @Override
    public int insert(Blog blog) {
        return mapper.insert(blog);
    }

    @Override
    public List<Blog> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public Blog findById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }
}
