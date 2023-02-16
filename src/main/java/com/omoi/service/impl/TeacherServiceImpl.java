package com.omoi.service.impl;

import com.omoi.constant.MessageCode;
import com.omoi.dto.MessageDto;
import com.omoi.dto.StudentScoreDto;
import com.omoi.entity.Course;
import com.omoi.mapper.CourseMapper;
import com.omoi.mapper.ScoreMapper;
import com.omoi.mapper.UserMapper;
import com.omoi.service.CommonService;
import com.omoi.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author xingj
 * @create 2023/2/16 13:58
 */
@Service
public class TeacherServiceImpl implements TeacherService {
    private final ScoreMapper scoreMapper;
    private final UserMapper userMapper;
    private final CourseMapper courseMapper;

    @Autowired
    public TeacherServiceImpl(ScoreMapper scoreMapper, UserMapper userMapper, CourseMapper courseMapper) {
        this.scoreMapper = scoreMapper;
        this.userMapper = userMapper;
        this.courseMapper = courseMapper;
    }

    @Override
    public List<StudentScoreDto> getStudentScoreByCourseId(String courseId) {
        List<StudentScoreDto> studentScore = scoreMapper.getStudentScoreByCourseId(Integer.parseInt(courseId));
        return studentScore.stream().peek(x -> x.setScore(x.getScore() == null || "".equals(x.getScore()) ? "未打分" : x.getScore())).collect(Collectors.toList());
    }

    @Override
    public MessageDto setStudentScore(StudentScoreDto studentScore, String teacherId) {
        MessageDto message = new MessageDto();

        String courseId = studentScore.getCourseId();
        Course course = courseMapper.getCourseById(Integer.parseInt(courseId));
        System.out.println(course);

        if (!course.getTeacherId().equals(teacherId)) {
            message.setCode(MessageCode.ERROR);
            message.setMsg("You are not the teacher of this course, target teacher id is " + course.getTeacherId());
            message.setData(course);
            return message;
        }

        try {
            Integer i = scoreMapper.setStudentScore(studentScore);
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error: unknown reason");
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
