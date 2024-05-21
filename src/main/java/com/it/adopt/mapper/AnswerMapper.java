package com.it.adopt.mapper;

import com.it.adopt.bean.Answer;
import java.util.List;

public interface AnswerMapper {
    List<Answer> selectByCommentId(Integer commentId);

    int deleteByPrimaryKey(Integer id);

    int insert(Answer row);

    Answer selectByPrimaryKey(Integer id);

    List<Answer> selectAll();

    int updateByPrimaryKey(Answer row);

    int deleteByCommentid(Integer commentId);
}