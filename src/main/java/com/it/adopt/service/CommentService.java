package com.it.adopt.service;

import com.it.adopt.bean.Comment;

import java.util.List;

/**
 * ClassName: CommentService
 * Package: com.it.adopt.service
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/23 21:35
 * @Version: 1.0.0
 */
public interface CommentService {
    List<Comment> selectByPetId(Integer petId);

    int deleteById(Integer id);

    int count();

    int insert(Comment comment);
}
