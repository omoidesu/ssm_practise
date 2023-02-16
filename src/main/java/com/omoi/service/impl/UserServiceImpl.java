package com.omoi.service.impl;

import com.omoi.constant.UserRole;
import com.omoi.entity.User;
import com.omoi.mapper.UserMapper;
import com.omoi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 登录用户身份验证
     *
     * @param username 用户名
     * @param password 密码
     * @return 目标用户
     */
    public User loginAuthentication(String username, String password) {
        User targetUser = userMapper.getUserByUsername(username);
        if (password == null){
            return User.builder().role(UserRole.ERROR).build();
        }

        if (targetUser == null){
            return User.builder().role(UserRole.NO_USER).build();
        }

        if (targetUser.getPassword().equals(password)){
            return targetUser;
        }

        return  User.builder().role(UserRole.ERROR).build();
    }
}
