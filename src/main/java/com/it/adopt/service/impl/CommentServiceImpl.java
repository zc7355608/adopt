package com.it.adopt.service.impl;

import com.it.adopt.bean.Comment;
import com.it.adopt.mapper.CommentMapper;
import com.it.adopt.service.CommentService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: CommentServiceImpl
 * Package: com.it.adopt.service.impl
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/23 21:36
 * @Version: 1.0.0
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentMapper mapper;

    @Override
    public List<Comment> selectByPetId(Integer petId) {
        List<Comment> comments = mapper.selectByPetId(petId);
        return comments;
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public int insert(Comment comment) {
        return mapper.insert(comment);
    }
}
