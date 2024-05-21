package com.it.adopt.service;

import com.it.adopt.bean.Answer;

/**
 * ClassName: AnswerService
 * Package: com.it.adopt.service
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/23 21:37
 * @Version: 1.0.0
 */
public interface AnswerService {
    int insert(Answer answer);

    int deleteById(Integer id);
}
