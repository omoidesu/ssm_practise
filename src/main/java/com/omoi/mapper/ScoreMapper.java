package com.omoi.mapper;

import com.omoi.dto.StudentScoreDto;

import java.util.List;

public interface ScoreMapper {
    List<StudentScoreDto> getStudentScoreByCourseId(Integer courseId);

    Integer setStudentScore(StudentScoreDto studentScore);
}
