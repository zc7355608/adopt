package com.it.adopt.bean;

import lombok.Data;

import java.io.Serializable;

@Data
public class Admin implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;

    private String adminName;

    private String adminPwd;

    private String realname;

    private String phone;

    private String email;

    private String birth;

    private String sex;

    private String pic;

    private String remark;
}