package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher {
    private String teacherId;
    private String teacherName;
    private String teacherGender;
    private String teacherBirthday;
    private String teacherEducation;
    private String teacherRank;
    private String teacherRegister;
    private String teacherBelong;
}
