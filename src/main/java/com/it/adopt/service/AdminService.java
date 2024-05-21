package com.it.adopt.service;

import com.it.adopt.bean.Admin;
import com.it.adopt.bean.User;

import java.util.List;

/**
 * ClassName: AdminService
 * Package: com.it.adopt.service
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 18:33
 * @Version: 1.0.0
 */
public interface AdminService {
    List<Admin> selectByName(String name);
    List<Admin> selectAll();
    Admin findById(Integer id);
    int count();
    Admin selectByNameAndPwd(String adminName, String adminPwd);

    int deleteById(Integer id);
    int updateByPrimaryKey(Admin admin);

    int addAdmin(Admin admin);
}
