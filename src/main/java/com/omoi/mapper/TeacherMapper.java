package com.omoi.mapper;

import com.omoi.entity.Teacher;

import java.util.List;

public interface TeacherMapper {
    /**
     * 获取所有教师
     *
     * @return 教师列表
     */
    List<Teacher> getAllTeachers();

    /**
     * 根据教师工号获取教师信息
     *
     * @param teacherId 教师工号
     * @return 教师信息
     */
    Teacher getTeacherById(int teacherId);
}
