package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Course {
    private String courseId;
    private String courseName;
    private String courseDate;
    private String courseAddress;
    private String courseTimes;
    private String courseType;
    private String coursePoint;
    private String teacherId;
    private String courseBelong;

    // 以下两个字段不属于表 course
    private String score;
    private String selected;
    private String academyName;
    private String teacherName;
}
