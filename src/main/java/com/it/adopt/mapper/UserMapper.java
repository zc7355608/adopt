package com.it.adopt.mapper;

import com.it.adopt.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User row);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();
    int count();
    List<User> selectByUsername(String username);

    User selectByNameAndPwd(@Param("username") String username, @Param("password") String password);

    int updateByPrimaryKey(User row);
}