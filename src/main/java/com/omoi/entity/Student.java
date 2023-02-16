package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Student {
    private String studentId;
    private String studentName;
    private String studentGender;
    private String studentBirthday;
    private String studentRegister;
    private String studentBelong;

    // 以下字段不属于表 student
    private String academyName;
}
