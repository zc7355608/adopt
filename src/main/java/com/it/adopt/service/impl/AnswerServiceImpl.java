package com.it.adopt.service.impl;

import com.it.adopt.bean.Answer;
import com.it.adopt.mapper.AnswerMapper;
import com.it.adopt.service.AnswerService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * ClassName: AnswerServiceImpl
 * Package: com.it.adopt.service.impl
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/23 21:37
 * @Version: 1.0.0
 */
@Service
public class AnswerServiceImpl implements AnswerService {
    @Resource
    private AnswerMapper mapper;

    @Override
    public int insert(Answer answer) {
        return mapper.insert(answer);
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }
}