package com.it.adopt.bean;

import lombok.*;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@EqualsAndHashCode
public class Pet implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;

    private String petName;

    private String petType;

    private String sex;

    private String birth;

    private String pic;

    private Byte state;

    private String remark;
}