package com.omoi.service;

import com.omoi.dto.MessageDto;
import com.omoi.dto.StudentScoreDto;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/16 13:57
 */
public interface TeacherService {
    List<StudentScoreDto> getStudentScoreByCourseId(String courseId);

    MessageDto setStudentScore(StudentScoreDto studentScore);

    MessageDto changePassword(String username, String password);
}
