package com.it.adopt.bean;

import lombok.*;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@EqualsAndHashCode
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;

    private String username;

    private String password;

    private String sex;

    private Integer age;

    private String phone;

    private String email;

    private String address;

    private String pic;

    private Byte state;
}