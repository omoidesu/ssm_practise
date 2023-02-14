package com.omoi.controller.impl;

import com.omoi.controller.AdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminControllerImpl implements AdminController {

    @GetMapping("/showCourse")
    public String showAdminCourse(){
        return "/showCourse";
    }
}
