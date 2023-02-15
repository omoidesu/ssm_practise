package com.omoi.controller.impl;

import com.omoi.controller.AdminController;
import com.omoi.dto.Message;
import com.omoi.entity.Course;
import com.omoi.service.AdminService;
import com.omoi.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RequestMapping("/admin")
@Controller
public class AdminControllerImpl implements AdminController {
    private final AdminService adminService;
    private final CommonService commonService;

    @Autowired
    public AdminControllerImpl(AdminService adminService, CommonService commonService) {
        this.adminService = adminService;
        this.commonService = commonService;
    }

    @GetMapping("/showCourse")
    public String showCourse() {
        return "/admin/showCourse";
    }

    @GetMapping("/showStudent")
    public String showStudent() {
        return "admin/showStudent";
    }

    @GetMapping("/showTeacher")
    public String showTeacher() {
        return "admin/showTeacher";
    }

    @GetMapping("/addCourse")
    public String addCourse() {
        return "admin/course";
    }

    @GetMapping("/addStudent")
    public String addStudent() {
        return "admin/student";
    }

    @GetMapping("/addTeacher")
    public String addTeacher() {
        return "admin/teacher";
    }

    @DeleteMapping("/course")
    @ResponseBody
    public Message deleteCourse(@RequestParam Integer courseId) {
        return adminService.deleteCourse(courseId);
    }

    @PostMapping("/course")
    public String editCourse(@RequestParam Map<String, String> params) {
        Course course = Course.builder()
                .courseId(params.get("courseId"))
                .courseName(params.get("courseName"))
                .teacherId(params.get("teacherId"))
                .courseDate(params.get("courseDate"))
                .courseAddress(params.get("courseAddress"))
                .courseTimes(params.get("courseTimes"))
                .courseType(params.get("courseType"))
                .courseBelong(params.get("courseBelong"))
                .coursePoint(params.get("coursePoint")).build();
        adminService.editCourse(course);
        return "/admin/showCourse";
    }

    @GetMapping("/course/{id}")
    public String showCourseDetail(@PathVariable("id") Integer id, HttpServletRequest request) {
        Course targetCourse = commonService.getCourseById(id);

        request.setAttribute("course", targetCourse);
        return "/admin/course";
    }

    @DeleteMapping("/student")
    public Message deleteStudent(Integer studentId) {
        return null;
    }

    @Override
    public String editStudent(Map<String, String> params) {
        return null;
    }

    @Override
    public String showStudentDetail(Integer id, HttpServletRequest request) {
        return null;
    }
}
