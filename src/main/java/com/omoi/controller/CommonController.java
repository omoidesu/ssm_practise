package com.omoi.controller;

import com.omoi.entity.Academy;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/15 9:37
 */
public interface CommonController {
    /**
     * 获取学院列表
     *
     * @return 学院列表
     */
    List<Academy> getAcademyList();

    /**
     * 根据教师id获取课程列表 id为空时获取全部课程
     *
     * @param teacherId 教师id
     * @return 课程列表
     */
    List<Course> getCourses(Integer teacherId, String courseName);

    /**
     * 根据课程id获取课程信息
     *
     * @param courseId 课程id
     * @return 课程信息
     */
    Course getCourseById(Integer courseId);

    /**
     * 根据课程id获取学生列表 id为空时获取全部学生
     *
     * @param courseId 课程id
     * @return 学生列表
     */
    List<Student> getStudents(Integer courseId, String studentName);

    /**
     * 根据学生id获取学生信息
     *
     * @param studentId 学号
     * @return 学生信息
     */
    Student getStudentById(Integer studentId);

    /**
     * 获取教师列表
     *
     * @return 教师列表
     */
    List<Teacher> getTeachers(String teacherName);

    /**
     * 根据教师id获取教师信息
     *
     * @param teacherId 教师工号
     * @return 教师信息
     */
    Teacher getTeacherById(Integer teacherId);
}
