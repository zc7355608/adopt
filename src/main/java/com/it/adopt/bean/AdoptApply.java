package com.it.adopt.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class AdoptApply implements Serializable {//@Data注解在类上，相当于同时加了@ToString、@EqualsAndHashCode、@Getter、@Setter 和@RequiredArgsConstrutor
    private static final long serialVersionUID = 1L;

    private Integer id;

    private Integer userId;

    private Integer petId;
    private String petName;

    private String adopterName;

    private String adopterSex;

    private String adopterPhone;

    private String adopterEmail;

    private String adopterAddress;

    @JsonFormat(pattern = "yyyy年MM月dd日 HH时mm分")
    private Date applyTime;

    private Byte state;
}