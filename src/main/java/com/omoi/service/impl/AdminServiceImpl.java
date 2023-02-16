package com.omoi.service.impl;

import com.omoi.constant.Gender;
import com.omoi.constant.MessageCode;
import com.omoi.constant.UserRole;
import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;
import com.omoi.entity.User;
import com.omoi.mapper.CourseMapper;
import com.omoi.mapper.StudentMapper;
import com.omoi.mapper.TeacherMapper;
import com.omoi.mapper.UserMapper;
import com.omoi.service.AdminService;
import com.omoi.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Autowired
    public AdminServiceImpl(CourseMapper courseMapper, StudentMapper studentMapper, TeacherMapper teacherMapper, UserMapper userMapper) {
        this.courseMapper = courseMapper;
        this.studentMapper = studentMapper;
        this.teacherMapper = teacherMapper;
        this.userMapper = userMapper;
    }

    @Override
    public MessageDto deleteCourse(Integer courseId) {
        MessageDto message = new MessageDto();
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
        Course tempCourse = courseMapper.getCourseById(Integer.parseInt(course.getCourseId()));

        if (tempCourse != null) {
            courseMapper.editCourse(course);
        } else {
            courseMapper.addNewCourse(course);
        }
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
    public void editStudent(Student student) {
        student.setStudentGender(Integer.parseInt(student.getStudentGender()) == Gender.MALE ? "男" : "女");
        Student tempStudent = studentMapper.getStudentById(Integer.parseInt(student.getStudentId()));

        if (tempStudent != null) {
            studentMapper.editStudent(student);
        } else {
            studentMapper.addNewStudent(student);
        }
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
    public void editTeacher(Teacher teacher) {
        teacher.setTeacherGender(Integer.parseInt(teacher.getTeacherGender()) == Gender.MALE ? "男" : "女");
        Teacher tempTeacher = teacherMapper.getTeacherById(Integer.parseInt(teacher.getTeacherId()));

        if (tempTeacher != null) {
            teacherMapper.editTeacher(teacher);
        } else {
            teacherMapper.addNewTeacher(teacher);
        }
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
