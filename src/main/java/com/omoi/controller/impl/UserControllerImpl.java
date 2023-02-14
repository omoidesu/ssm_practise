package com.omoi.controller.impl;

import com.omoi.controller.UserController;
import com.omoi.entity.User;
import com.omoi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserControllerImpl implements UserController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "/login";
    }

    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return 转发用户管理系统
     */
    @PostMapping("/user")
    public String login(@RequestParam String username, @RequestParam String password, HttpServletRequest request) {
        User target = userService.loginAuthentication(username, password);
        Integer code = target.getRole();

        HttpSession session = request.getSession();
        switch (code) {
            case User.ERROR:
                return "/login";
            case User.ADMIN:
                session.setAttribute("current", target);
                return "redirect:/admin/showCourse";
            case User.TEACHER:
                session.setAttribute("current", target);
                return "/teacher/showCourse";
            case User.STUDENT:
                session.setAttribute("current", target);
                return "/student/showCourse";
            default:
                return "/404";
        }
    }

    /**
     * 登出
     *
     * @return 转发到登录页
     */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("current", 0);
        return "/login";
    }
}
