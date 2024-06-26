package com.it.adopt.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class Blog implements Serializable {

    private static final long SerialVersionUID = 1L;

    private Integer id;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy年MM月dd日 HH:mm:ss")
    private Date actionTime;

    private String address;

    private String peoples;

    private String event;

    private String title;
}