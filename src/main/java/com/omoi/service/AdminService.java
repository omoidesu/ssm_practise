package com.omoi.service;

import com.omoi.dto.Message;
import com.omoi.entity.Course;
import com.omoi.entity.Student;

/**
 * @author xingj
 * @create 2023/2/15 17:06
 */
public interface AdminService {
    Message deleteCourse(Integer courseId);

    void editCourse(Course course);

    Message deleteStudent(Integer studentId);

    void editStudent(Student student);
}
