package com.omoi.service.impl;

import com.omoi.constant.Gender;
import com.omoi.constant.MessageCode;
import com.omoi.constant.UserRole;
import com.omoi.dto.MessageDto;
import com.omoi.dto.StudentScoreDto;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;
import com.omoi.entity.User;
import com.omoi.mapper.*;
import com.omoi.service.AdminService;
import com.omoi.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author xingj
 * @create 2023/2/15 17:11
 */
@Service
public class AdminServiceImpl implements AdminService {
    private final CourseMapper courseMapper;
    private final StudentMapper studentMapper;
    private final TeacherMapper teacherMapper;
    private final UserMapper userMapper;
    private final ScoreMapper scoreMapper;

    @Autowired
    public AdminServiceImpl(CourseMapper courseMapper, StudentMapper studentMapper, TeacherMapper teacherMapper, UserMapper userMapper, ScoreMapper scoreMapper) {
        this.courseMapper = courseMapper;
        this.studentMapper = studentMapper;
        this.teacherMapper = teacherMapper;
        this.userMapper = userMapper;
        this.scoreMapper = scoreMapper;
    }

    @Override
    public MessageDto deleteCourse(Integer courseId) {
        MessageDto message = new MessageDto();

        List<StudentScoreDto> score = scoreMapper.getStudentScoreByCourseId(courseId);
        List<String> scores = score.stream().map(StudentScoreDto::getScore).filter(x -> !"".equals(x)).collect(Collectors.toList());

        if (scores.size() != 0) {
            message.setCode(MessageCode.ERROR);
            message.setMsg("该课程已有学生完成");
            return message;
        }

        try {
            Integer i = courseMapper.deleteCourseById(courseId);
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }

    @Override
    public void editCourse(Course course, String fromPage) {
        if ("/addCourse".equals(fromPage)) {
            try {
                courseMapper.addNewCourse(course);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }

        courseMapper.editCourse(course);
    }

    @Override
    public MessageDto deleteStudent(Integer studentId) {
        MessageDto message = new MessageDto();
        try {
            Integer i = studentMapper.deleteStudentById(studentId);
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error: unknown reason");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }

    @Override
    public void editStudent(Student student, String fromPage) {
        student.setStudentGender(Integer.parseInt(student.getStudentGender()) == Gender.MALE ? "男" : "女");

        if ("/addStudent".equals(fromPage)) {
            try {
                studentMapper.addNewStudent(student);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }

        studentMapper.editStudent(student);
    }

    @Override
    public MessageDto deleteTeacher(Integer teacherId) {
        MessageDto message = new MessageDto();
        try {
            Integer i = teacherMapper.deleteTeacherById(teacherId);
            message.setCode(i == 1 ? MessageCode.SUCCESS : MessageCode.ERROR);
            message.setMsg(i == 1 ? "success" : "sql error: unknown reason");
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }

    @Override
    public void editTeacher(Teacher teacher, String fromPage) {
        if ("/addTeacher".equals(fromPage)) {
            try {
                teacherMapper.addNewTeacher(teacher);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }

        teacherMapper.editTeacher(teacher);
    }

    @Override
    public MessageDto changePassword(String username, String password) {
        return CommonService.changePassword(username, password, userMapper);
    }

    @Override
    public MessageDto userExist(String username) {
        MessageDto message = new MessageDto();
        try {
            User user = userMapper.getUserByUsername(username);
            message.setCode(MessageCode.SUCCESS);
            message.setMsg("success");
            if (user == null) {
                message.setData("not exist");
            } else if (user.getRole() == UserRole.ADMIN) {
                message.setData("is admin");
            } else {
                message.setData("exist");
            }
        } catch (Exception e) {
            message.setCode(MessageCode.ERROR);
            message.setMsg(e.getMessage());
        }
        return message;
    }
}
