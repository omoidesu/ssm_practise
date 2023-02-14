package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {
    public static final int OBLIGATORY = 1; // 必修
    public static final int ELECTIVE = 0; // 选修

    private Integer courseId;
    private String courseName;
    private String courseDate;
    private String courseAddress;
    private Integer courseTimes;
    private Integer courseType;
    private Integer coursePoint;
    private Integer teacherId;
    private String courseBelong;
}
