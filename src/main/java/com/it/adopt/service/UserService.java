package com.it.adopt.service;

import com.it.adopt.bean.User;

import java.util.List;

public interface UserService {
//    List<User> findByName(String userName, Integer state);
//    List<User> showName(String userName);
    //登录
    User userLogin(String userName, String password);
//    //注册
    int registerUser(User user);
    int count();
    List<User> findAll();
    List<User> findByUsername(String username);
    int updateByPrimaryKey(User user);
//    User findById(Integer id);
//    PageInfo<User> allUser(String userName, Integer pageNum, Integer pageSize);
    int deleteById(Integer id);

    User findById(Integer id);
}
