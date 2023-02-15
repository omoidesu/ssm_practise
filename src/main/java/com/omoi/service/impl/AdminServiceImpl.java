package com.omoi.service.impl;

import com.omoi.constant.MessageCode;
import com.omoi.dto.Message;
import com.omoi.entity.Course;
import com.omoi.mapper.CourseMapper;
import com.omoi.mapper.StudentMapper;
import com.omoi.mapper.TeacherMapper;
import com.omoi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author xingj
 * @create 2023/2/15 17:11
 */
@Service
public class AdminServiceImpl implements AdminService {
    private CourseMapper courseMapper;
    private StudentMapper studentMapper;
    private TeacherMapper teacherMapper;

    @Autowired
    public AdminServiceImpl(CourseMapper courseMapper, StudentMapper studentMapper, TeacherMapper teacherMapper) {
        this.courseMapper = courseMapper;
        this.studentMapper = studentMapper;
        this.teacherMapper = teacherMapper;
    }

    @Override
    public Message deleteCourse(Integer courseId) {
        Message message = new Message();
        try {
            Integer i = courseMapper.deleteCourseById(courseId);
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "unknown error");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }

    @Override
    public void editCourse(Course course) {
        Integer i = 0;
        Message message = new Message();
        Course tempCourse = courseMapper.getCourseById(Integer.parseInt(course.getCourseId()));

        try {
            if (tempCourse != null){
                i = courseMapper.editCourse(course);
            } else {
                i = courseMapper.addNewCourse(course);
            }

            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "unknown error");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
    }
}
