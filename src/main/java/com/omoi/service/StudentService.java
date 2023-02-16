package com.omoi.service;

import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/15 23:28
 */
public interface StudentService {
    List<Course> getCourseByStudent(String studentId, String courseName);

    MessageDto signUpCourse(String courseId, String studentId);

    List<Course> getAllSelectedCourse(String studentId, String complete);

    MessageDto cancelCourse(String courseId, String studentId);

    MessageDto changePassword(String username, String password);
}
