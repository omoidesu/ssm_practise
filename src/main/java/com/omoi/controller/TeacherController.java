package com.omoi.controller;

import com.omoi.dto.MessageDto;
import com.omoi.dto.StudentScoreDto;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface TeacherController {
    String showCourse();

    public String changePassword();

    String students(String courseId, HttpServletRequest request);

    public List<StudentScoreDto> getStudentAndScoreByCourseId(String courseId);

    public MessageDto setStudentScore(StudentScoreDto studentScore);
}
