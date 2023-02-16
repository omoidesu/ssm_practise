package com.omoi.controller;

import com.omoi.dto.Message;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

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

    Message deleteCourse(Integer courseId);

    String editCourse(Course course);

    String showCourseDetail(Integer id, HttpServletRequest request);

    Message deleteStudent(Integer studentId);

    String editStudent(Student student);

    String showStudentDetail(Integer id, HttpServletRequest request);

    Message deleteTeacher(Integer teacherId);

    String editTeacher(Teacher teacher);

    String showTeacherDetail(Integer id, HttpServletRequest request);

    String changeAccountPassword(String username, String password, HttpServletRequest request);

    Message userIfExist(String username);
}
