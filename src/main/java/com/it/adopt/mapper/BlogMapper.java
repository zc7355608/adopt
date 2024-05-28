package com.it.adopt.mapper;

import com.it.adopt.bean.Blog;
import java.util.List;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Blog row);

    Blog selectByPrimaryKey(Integer id);

    List<Blog> selectAll();
    int count();

    int updateByPrimaryKey(Blog row);

    List<Blog> selectByTitle(String title);
}