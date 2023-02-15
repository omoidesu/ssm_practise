package com.omoi.mapper;

import com.omoi.entity.Student;

import java.util.List;

public interface StudentMapper {
    /**
     * 获取学生列表
     *
     * @return 学生列表
     */
    List<Student> getAllStudents();

    /**
     * 根据课程id获取学生列表，当课程id为null时获取全部学生
     *
     * @param courseId 课程id
     * @return 学生列表
     */
    List<Student> getStudentsByCourse(Integer courseId);

    /**
     * 根据学号获取学生信息
     *
     * @param studentId 学号
     * @return 学生信息
     */
    Student getStudentById(int studentId);

    /**
     * 根据学号删除学生
     *
     * @param id 学号
     * @return 修改条数
     */
    Integer deleteStudentById(Integer id);

    /**
     * 添加新学生
     *
     * @param student 新学生信息
     * @return 修改条数
     */
    Integer addNewStudent(Student student);

    /**
     * 修改学生信息
     *
     * @param student 学生信息
     * @return 修改条数
     */
    Integer editStudent(Student student);
}
