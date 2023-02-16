package com.omoi.controller;

import com.omoi.dto.MessageDto;
import com.omoi.dto.StudentScoreDto;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface TeacherController {
    // 请求转发接口
    String showCourse();

    String changePassword();

    /**
     * 请求转发接口, 将课程id加入到http请求的参数中
     *
     * @param courseId 课程id
     * @param request  http请求
     * @return 转发地址
     */
    String getCourseStudents(String courseId, HttpServletRequest request);

    /**
     * 根据课程获取学生部分信息和该学生在该课程的成绩
     *
     * @param courseId 课程id
     * @return 学生信息和成绩的列表
     */
    List<StudentScoreDto> getStudentAndScoreByCourseId(String courseId);

    /**
     * 给学生打分
     *
     * @param studentScore 包含学生成绩和成绩的对象
     * @return 返回前端的消息
     */
    MessageDto setStudentScore(StudentScoreDto studentScore);

    /**
     * 修改账号密码
     *
     * @param password 新密码
     * @param request  http请求
     * @return 转发地址
     */
    String changeAccountPassword(String password, HttpServletRequest request);
}
