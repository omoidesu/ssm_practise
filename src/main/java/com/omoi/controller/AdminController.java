package com.omoi.controller;

import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;

import javax.servlet.http.HttpServletRequest;

public interface AdminController {
    // 请求转发
    String showCourse();

    String showStudent();

    String showTeacher();

    String changeOther();

    String changePassword();

    String addCourse();

    String addStudent();

    String addTeacher();


    /**
     * 根据课程id删除课程
     *
     * @param courseId 课程id
     * @return 返回前端的消息
     */
    MessageDto deleteCourse(Integer courseId);

    /**
     * 根据课程id修改课程内容
     *
     * @param course 课程内容
     * @return 转发地址
     */
    String editCourse(Course course);

    /**
     * 根据课程id展示课程详情
     *
     * @param id      课程id
     * @param request http请求
     * @return 转发地址
     */
    String showCourseDetail(Integer id, HttpServletRequest request);

    /**
     * 根据学号删除学生
     *
     * @param studentId 学号
     * @return 返回前端的消息
     */
    MessageDto deleteStudent(Integer studentId);

    /**
     * 根据学号修改学生信息
     *
     * @param student 学生信息
     * @return 转发地址
     */
    String editStudent(Student student);

    /**
     * 根据学号展示学生详情
     *
     * @param id      学号
     * @param request http请求
     * @return 转发地址
     */
    String showStudentDetail(Integer id, HttpServletRequest request);

    /**
     * 根据教师工号删除教师
     *
     * @param teacherId 教师工号
     * @return 返回前端的消息
     */
    MessageDto deleteTeacher(Integer teacherId);

    /**
     * 根据教师工号修改教师信息
     *
     * @param teacher 教师信息
     * @return 转发地址
     */
    String editTeacher(Teacher teacher);

    /**
     * 根据教师工号展示教师信息
     *
     * @param id      教师工号
     * @param request http请求
     * @return 转发地址
     */
    String showTeacherDetail(Integer id, HttpServletRequest request);

    /**
     * 修改用户密码
     *
     * @param username 用户名
     * @param password 新密码
     * @param request  http请求
     * @return 转发地址
     */
    String changeAccountPassword(String username, String password, HttpServletRequest request);

    /**
     * 判断用户是否存在
     *
     * @param username 用户名
     * @return 返回前端的消息
     */
    MessageDto userIfExist(String username);
}
