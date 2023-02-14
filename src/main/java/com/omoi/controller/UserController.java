package com.omoi.controller;

import javax.servlet.http.HttpServletRequest;

public interface UserController {
    /**
     * 登录页入口
     *
     * @return login page
     */
    String loginPage();

    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return 转发用户管理系统
     */
    String login(String username, String password, HttpServletRequest request);

    /**
     * 登出
     *
     * @return 转发到登录页
     */
    String logout(HttpServletRequest request);
}
