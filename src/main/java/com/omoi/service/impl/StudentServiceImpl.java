package com.omoi.service.impl;

import com.omoi.constant.MessageCode;
import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.Score;
import com.omoi.mapper.CourseMapper;
import com.omoi.mapper.ScoreMapper;
import com.omoi.mapper.UserMapper;
import com.omoi.service.CommonService;
import com.omoi.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author xingj
 * @create 2023/2/15 23:35
 */
@Service
public class StudentServiceImpl implements StudentService {
    private final CourseMapper courseMapper;
    private final ScoreMapper scoreMapper;
    private final UserMapper userMapper;

    @Autowired
    public StudentServiceImpl(CourseMapper courseMapper, ScoreMapper scoreMapper, UserMapper userMapper) {
        this.courseMapper = courseMapper;
        this.scoreMapper = scoreMapper;
        this.userMapper = userMapper;
    }

    public List<Course> getCourseByStudent(String studentId, String courseName) {
        return courseMapper.getAllCourseWithStudent(Integer.parseInt(studentId), courseName);
    }

    @Override
    public MessageDto signUpCourse(String courseId, String studentId) {
        MessageDto message = new MessageDto();
        try {
            Integer i = scoreMapper.addNewScore(Score.builder().courseId(courseId).studentId(studentId).build());
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }

    @Override
    public List<Course> getAllSelectedCourse(String studentId, String complete) {
        return courseMapper.getAllSelectedCourse(studentId, complete);
    }

    @Override
    public MessageDto cancelCourse(String courseId, String studentId) {
        MessageDto message = new MessageDto();
        try {
            Integer i = scoreMapper.cancelScore(Score.builder().courseId(courseId).studentId(studentId).build());
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }

    @Override
    public MessageDto changePassword(String username, String password) {
        return CommonService.changePassword(username, password, userMapper);
    }
}
