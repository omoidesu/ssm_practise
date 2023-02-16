package com.omoi.controller;

import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface StudentController {
    // 请求转发接口
    String showCourse();

    String showSelectedCourse();

    String showCompletedCourse();

    String changePassword();

    /**
     * 获取所有课程和学生是否选择了该课程
     *
     * @param studentId  学号
     * @param courseName 课程名
     * @return 课程列表
     */
    List<Course> getCourseWithStudent(String studentId, String courseName);

    /**
     * 学生选课接口
     *
     * @param courseId  课程id
     * @param studentId 学号
     * @return 返回前端的消息
     */
    MessageDto studentSignup(String courseId, String studentId);

    /**
     * 获取学生已选课程
     *
     * @param studentId 学号
     * @param complete  是否已修完, 该参数不为空即为选择已修完的课程（即有成绩的课程）
     * @return 课程列表
     */
    List<Course> getSelectedCourse(String studentId, String complete);

    /**
     * 学生退课接口
     *
     * @param courseId  课程id
     * @param studentId 学号
     * @return 返回前端的消息
     */
    MessageDto cancelCourse(String courseId, String studentId);

    /**
     * 修改账户密码
     *
     * @param password 新密码
     * @param request  http请求
     * @return 转发地址
     */
    String changeAccountPassword(String password, HttpServletRequest request);
}
