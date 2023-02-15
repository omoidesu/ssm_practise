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
}
