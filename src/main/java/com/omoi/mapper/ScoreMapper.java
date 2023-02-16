package com.omoi.mapper;

import com.omoi.dto.StudentScoreDto;
import com.omoi.entity.Score;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScoreMapper {
    List<StudentScoreDto> getStudentScoreByCourseId(Integer courseId);

    Integer setStudentScore(StudentScoreDto studentScore);

    Integer addNewScore(Score score);

    Integer cancelScore(Score score);
}
