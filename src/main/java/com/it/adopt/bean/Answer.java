package com.it.adopt.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Answer implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;

    private Integer userId;
    private String username;

    private Integer commentId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date answerTime;

    private String content;
//    private User user;
}