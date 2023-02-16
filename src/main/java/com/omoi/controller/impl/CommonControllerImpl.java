package com.omoi.controller.impl;

import com.omoi.controller.CommonController;
import com.omoi.entity.Academy;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;
import com.omoi.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/15 10:15
 */
@RestController
public class CommonControllerImpl implements CommonController {
    private CommonService commonService;

    @Autowired
    public void setCommonService(CommonService commonService) {
        this.commonService = commonService;
    }

    /**
     * 获取学院列表
     *
     * @return 学院列表
     */
    @GetMapping("/academy")
    public List<Academy> getAcademyList() {
        return commonService.getAllAcademies();
    }

    /**
     * 根据教师id获取课程列表 id为空时获取全部课程
     *
     * @param teacherId 教师id
     * @return 课程列表
     */
    @GetMapping("/course")
    public List<Course> getCourses(
            @RequestParam(value = "teacher", required = false) Integer teacherId,
            @RequestParam(value = "name", required = false) String courseName) {
        return commonService.getCourses(teacherId, courseName);
    }

    /**
     * 根据课程id获取课程信息
     *
     * @param courseId 课程id
     * @return 课程信息
     */
    @GetMapping("/course/{id}")
    public Course getCourseById(@PathVariable("id") Integer courseId) {
        return commonService.getCourseById(courseId);
    }

    /**
     * 根据课程id获取学生列表 id为空时获取全部学生
     *
     * @param courseId 课程id
     * @return 学生列表
     */
    @GetMapping("/student")
    public List<Student> getStudents(
            @RequestParam(value = "course", required = false) Integer courseId,
            @RequestParam(value = "name", required = false) String studentName) {
        return commonService.getStudents(courseId, studentName);
    }

    /**
     * 根据学生id获取学生信息
     *
     * @param studentId 学号
     * @return 学生信息
     */
    @GetMapping("/student/{id}")
    public Student getStudentById(@PathVariable("id") Integer studentId) {
        return commonService.getStudentById(studentId);
    }

    /**
     * 获取教师列表
     *
     * @return 教师列表
     */
    @GetMapping("/teacher")
    public List<Teacher> getTeachers(@RequestParam(value = "name", required = false) String teacherName) {
        return commonService.getTeachers(teacherName);
    }

    /**
     * 根据教师id获取教师信息
     *
     * @param teacherId 教师工号
     * @return 教师信息
     */
    @GetMapping("/teacher/{id}")
    public Teacher getTeacherById(@PathVariable("id") Integer teacherId) {
        return commonService.getTeacherById(teacherId);
    }
}
