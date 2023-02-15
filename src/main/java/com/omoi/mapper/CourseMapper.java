package com.omoi.mapper;

import com.omoi.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {
    /**
     * 获取所有课程列表
     *
     * @return 课程列表
     */
    List<Course> getAllCourses();

    /**
     * 根据课程id获取课程
     *
     * @param courseId 课程id
     * @return 课程信息
     */
    Course getCourseById(int courseId);

    /**
     * 根据教师id搜索课程
     *
     * @param teacherId  教师id
     * @param courseName 课程名(模糊查询)
     * @return 课程列表
     */
    List<Course> getCourseByTeacherId(@Param("teacherId") Integer teacherId, @Param("courseName") String courseName);

    /**
     * 根据课程id删除课程
     *
     * @param id 课程id
     * @return 修改条数
     */
    // TODO: 将删除操作修改为逻辑删除
    Integer deleteCourseById(Integer id);

    /**
     * 添加新课
     *
     * @param course 课程
     * @return 修改条数
     */
    Integer addNewCourse(Course course);

    /**
     * 修改课程
     *
     * @param course 课程
     * @return 修改条数
     */
    Integer editCourse(Course course);
}
