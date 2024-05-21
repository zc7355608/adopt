package com.it.adopt.mapper;

import com.it.adopt.bean.Comment;
import java.util.List;

public interface CommentMapper {
    List<Comment> selectByPetId(Integer petId);
    int deleteByPrimaryKey(Integer id);

    int insert(Comment row);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectAll();
    int count();

    int updateByPrimaryKey(Comment row);
}