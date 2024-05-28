package com.it.adopt.service;

import com.it.adopt.bean.Blog;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: BlogService
 * Package: com.it.adopt.service
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 13:05
 * @Version: 1.0.0
 */
public interface BlogService {

    int updateById(Blog blog);

    int insert(Blog blog);

    List<Blog> selectAll();
    int count();

    Blog findById(Integer id);

    List<Blog> selectByTitle(String title);

    int deleteById(Integer id);
}
