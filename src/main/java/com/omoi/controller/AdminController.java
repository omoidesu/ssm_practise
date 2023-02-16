package com.omoi.controller;

import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;

import javax.servlet.http.HttpServletRequest;

public interface AdminController {
    // 转发接口
    String showCourse();

    String showStudent();

    String showTeacher();

    String changeOther();

    String changePassword();

    String addCourse();

    String addStudent();

    String addTeacher();

    MessageDto deleteCourse(Integer courseId);

    String editCourse(Course course);

    String showCourseDetail(Integer id, HttpServletRequest request);

    MessageDto deleteStudent(Integer studentId);

    String editStudent(Student student);

    String showStudentDetail(Integer id, HttpServletRequest request);

    MessageDto deleteTeacher(Integer teacherId);

    String editTeacher(Teacher teacher);

    String showTeacherDetail(Integer id, HttpServletRequest request);

    String changeAccountPassword(String username, String password, HttpServletRequest request);

    MessageDto userIfExist(String username);
}
