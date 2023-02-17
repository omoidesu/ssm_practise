package com.omoi.mapper;

import com.omoi.entity.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
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

    /**
     * 根据学号获取课程及是否已选择该课程
     *
     * @param studentId  学号
     * @param courseName 学生名
     * @return 课程列表
     */
    List<Course> getAllCourseWithStudent(@Param("studentId") Integer studentId, @Param("name") String courseName);

    /**
     * 获取所有已选课程或已修课程(即有成绩的课程)
     *
     * @param studentId 学号
     * @param complete  是否为已修课程(不为null即可)
     * @return 课程列表
     */
    List<Course> getAllSelectedCourse(@Param("studentId") String studentId, @Param("complete") String complete);
}
