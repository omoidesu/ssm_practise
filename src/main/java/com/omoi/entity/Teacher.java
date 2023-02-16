package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Teacher {
    private String teacherId;
    private String teacherName;
    private String teacherGender;
    private String teacherBirthday;
    private String teacherEducation;
    private String teacherRank;
    private String teacherRegister;
    private String teacherBelong;

    // 以下字段不属于表 teacher
    private String academyName;
}
