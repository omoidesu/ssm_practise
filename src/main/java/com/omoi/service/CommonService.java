package com.omoi.service;

import com.omoi.entity.Academy;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/15 10:19
 */
public interface CommonService {
    List<Academy> getAllAcademies();

    List<Course> getCourses(Integer teacherId, String courseName);

    Course getCourseById(Integer courseId);

    List<Student> getStudents(Integer courseId, String studentName);

    Student getStudentById(Integer studentId);

    List<Teacher> getTeachers(String teacherName);

    Teacher getTeacherById(Integer teacherId);
}
