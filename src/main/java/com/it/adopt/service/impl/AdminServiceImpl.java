package com.it.adopt.service.impl;

import com.it.adopt.bean.Admin;
import com.it.adopt.bean.User;
import com.it.adopt.mapper.AdminMapper;
import com.it.adopt.service.AdminService;
import jakarta.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: AdminServiceImpl
 * Package: com.it.adopt.service.impl
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 18:33
 * @Version: 1.0.0
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper mapper;

    @Override
    public List<Admin> selectByName(String name) {
        return mapper.selectByName(name);
    }

    @Override
    public List<Admin> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public Admin findById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int count() { return mapper.count(); }

    @Override
    public Admin selectByNameAndPwd(String adminName, String adminPwd) {
        return mapper.selectByNameAndPwd(adminName, adminPwd);
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(Admin admin) {
        return mapper.updateByPrimaryKey(admin);
    }

    @Override
    public int addAdmin(Admin admin) {
        return mapper.insert(admin);
    }
}
