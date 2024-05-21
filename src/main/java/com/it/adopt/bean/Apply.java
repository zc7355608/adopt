package com.it.adopt.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Apply implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String name;

    private String email;

    private Integer age;

    private String phone;

    private String message;

    @JsonFormat(pattern = "yyyy年MM月dd日 HH时mm分")
    private Date applyTime;

    private Byte state;
}