package com.it.adopt.mapper;

import com.it.adopt.bean.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin row);

    Admin selectByPrimaryKey(Integer id);

    List<Admin> selectAll();
    int count();
    List<Admin> selectByName(String name);

    int updateByPrimaryKey(Admin row);

    Admin selectByNameAndPwd(@Param("adminName") String adminName, @Param("adminPwd") String adminPwd);
}