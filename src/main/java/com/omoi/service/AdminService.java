package com.omoi.service;

import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;

/**
 * @author xingj
 * @create 2023/2/15 17:06
 */
public interface AdminService {
    MessageDto deleteCourse(Integer courseId);

    void editCourse(Course course);

    MessageDto deleteStudent(Integer studentId);

    void editStudent(Student student);

    MessageDto deleteTeacher(Integer teacherId);

    void editTeacher(Teacher teacher);

    MessageDto changePassword(String username, String password);

    MessageDto userExist(String username);
}
