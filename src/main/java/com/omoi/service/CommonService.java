package com.omoi.service;

import com.omoi.constant.MessageCode;
import com.omoi.dto.MessageDto;
import com.omoi.entity.*;
import com.omoi.mapper.UserMapper;

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

    public static MessageDto changePassword(String username, String password, UserMapper userMapper){
        MessageDto message = new MessageDto();
        try {
            Integer i = userMapper.changePassword(User.builder().username(username).password(password).build());
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error: unknown reason");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }
}
