package com.omoi.mapper;

import com.omoi.dto.StudentScoreDto;
import com.omoi.entity.Score;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScoreMapper {
    /**
     * 根据学号获取学生成绩
     *
     * @param courseId 学号
     * @return 学生成绩列表
     */
    List<StudentScoreDto> getStudentScoreByCourseId(Integer courseId);

    /**
     * 设置学生成绩
     *
     * @param studentScore 学生成绩信息
     * @return 修改行数
     */
    Integer setStudentScore(StudentScoreDto studentScore);

    /**
     * 添加新学生 - 课程映射
     *
     * @param score 成绩对象
     * @return 修改行数
     */
    Integer addNewScore(Score score);

    /**
     * 取消学生 - 课程映射
     *
     * @param score 成绩对象
     * @return 修改行数
     */
    Integer cancelScore(Score score);
}
