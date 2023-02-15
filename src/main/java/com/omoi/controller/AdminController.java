package com.omoi.controller;

import com.omoi.dto.Message;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface AdminController {
    // 转发接口
    String showCourse();

    String showStudent();

    String showTeacher();

    String addCourse();

    String addStudent();

    String addTeacher();

    Message deleteCourse(Integer courseId);

    String editCourse(Map<String, String> params);

    String showCourseDetail(Integer id, HttpServletRequest request);

    Message deleteStudent(Integer studentId);

    String editStudent(Map<String, String> params);

    String showStudentDetail(Integer id, HttpServletRequest request);
}
