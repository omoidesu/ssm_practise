package com.omoi.controller.impl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author xingj
 * @create 2023/2/14 21:51
 */
@RequestMapping("/test")
@Controller
public class TestController {
    // FIXME 2023/2/15 a controller for testing, delete when the project complete
    
    @GetMapping("/course")
    public String testCourse() {
        return "admin/course";
    }

    @GetMapping("/student")
    public String student() {
        return "admin/student";
    }

    @GetMapping("/teacher")
    public String teacher() {
        return "admin/teacher";
    }
}
