package com.omoi.mapper;

import com.omoi.entity.Teacher;

import java.util.List;

public interface TeacherMapper {
    /**
     * 获取所有教师
     *
     * @return 教师列表
     */
    List<Teacher> getTeachers(String teacherName);

    /**
     * 根据教师工号获取教师信息
     *
     * @param teacherId 教师工号
     * @return 教师信息
     */
    Teacher getTeacherById(int teacherId);

    /**
     * 根据教师工号删除教师
     *
     * @param id 工号
     * @return 修改条数
     */
    Integer deleteTeacherById(Integer id);

    /**
     * 添加新教师
     *
     * @param teacher 新教师
     * @return 修改条数
     */
    Integer addNewTeacher(Teacher teacher);

    /**
     * 修改教师信息
     *
     * @param teacher 教师信息
     * @return 修改条数
     */
    Integer editTeacher(Teacher teacher);
}
