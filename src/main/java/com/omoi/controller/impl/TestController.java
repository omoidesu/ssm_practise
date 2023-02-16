package com.omoi.controller.impl;

import org.springframework.stereotype.Controller;

/**
 * 测试用Controller, 已弃用
 *
 * @author xingj
 * @create 2023/2/14 21:51
 * @deprecated 功能完成后弃用该controller
 */
//@RequestMapping("/test")
@Controller
@Deprecated
public class TestController {
    //    @GetMapping("/course")
    public String testCourse() {
        return "admin/course";
    }

    //    @GetMapping("/student")
    public String student() {
        return "admin/student";
    }

    //    @GetMapping("/teacher")
    public String teacher() {
        return "admin/teacher";
    }

    //    @GetMapping("/password")
    public String password() {
        return "/admin/password";
    }

    //    @GetMapping("/self")
    public String selfPassword() {
        return "/admin/selfPassword";
    }

    //    @GetMapping("/teacher/course")
    public String teacherCourse() {
        return "/teacher/showCourse";
    }

    //    @GetMapping("/student/course")
    public String studentCourse() {
        return "/student/showCourse";
    }
}
