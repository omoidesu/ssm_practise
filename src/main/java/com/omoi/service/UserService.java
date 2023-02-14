package com.omoi.service;

import com.omoi.entity.User;
import org.springframework.stereotype.Service;


public interface UserService {
    /**
     * 登录用户身份验证
     *
     * @param username 用户名
     * @param password 密码
     * @return 目标用户
     */
    User loginAuthentication(String username, String password);
}
