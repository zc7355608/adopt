package com.it.adopt.service.impl;

import com.it.adopt.bean.User;
import com.it.adopt.mapper.UserMapper;
import com.it.adopt.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper mapper;

    @Override
    public int registerUser(User user) {
        return mapper.insert(user);
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public List<User> findAll() {
        return mapper.selectAll();
    }

    @Override
    public List<User> findByUsername(String username) {
        return mapper.selectByUsername(username);
    }

    @Override
    public int updateByPrimaryKey(User user) {
        return mapper.updateByPrimaryKey(user);
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public User findById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public User userLogin(String username, String password) {
        return mapper.selectByNameAndPwd(username, password);
    }
}
