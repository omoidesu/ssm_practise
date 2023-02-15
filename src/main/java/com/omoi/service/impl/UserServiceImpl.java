package com.omoi.service.impl;

import com.omoi.constant.UserRole;
import com.omoi.entity.User;
import com.omoi.mapper.UserMapper;
import com.omoi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return targetUser != null ? targetUser : User.builder().role(UserRole.ERROR).build();
    }
}
