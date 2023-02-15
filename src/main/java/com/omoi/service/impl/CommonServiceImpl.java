package com.omoi.service.impl;

import com.omoi.entity.Academy;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;
import com.omoi.mapper.AcademyMapper;
import com.omoi.mapper.CourseMapper;
import com.omoi.mapper.StudentMapper;
import com.omoi.mapper.TeacherMapper;
import com.omoi.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/15 10:30
 */
@Service
public class CommonServiceImpl implements CommonService {
    private AcademyMapper academyMapper;
    private CourseMapper courseMapper;
    private StudentMapper studentMapper;
    private TeacherMapper teacherMapper;

    @Autowired
    public CommonServiceImpl(AcademyMapper academyMapper, CourseMapper courseMapper, StudentMapper studentMapper, TeacherMapper teacherMapper) {
        this.academyMapper = academyMapper;
        this.courseMapper = courseMapper;
        this.studentMapper = studentMapper;
        this.teacherMapper = teacherMapper;
    }

    @Override
    public List<Academy> getAllAcademies() {
        return academyMapper.getAllAcademies();
    }

    @Override
    public List<Course> getCourses(Integer teacherId, String courseName) {
        if (teacherId == null && courseName == null){
            return courseMapper.getAllCourses();
        }
        return courseMapper.getCourseByTeacherId(teacherId, courseName);
    }

    @Override
    public Course getCourseById(Integer courseId) {
        return courseMapper.getCourseById(courseId);
    }

    @Override
    public List<Student> getStudents(Integer courseId) {
        if (courseId == null){
            return studentMapper.getAllStudents();
        }
        return studentMapper.getStudentsByCourse(courseId);
    }

    @Override
    public Student getStudentById(Integer studentId) {
        return studentMapper.getStudentById(studentId);
    }

    @Override
    public List<Teacher> getTeachers() {
        return teacherMapper.getAllTeachers();
    }

    @Override
    public Teacher getTeacherById(Integer teacherId) {
        return teacherMapper.getTeacherById(teacherId);
    }
}
