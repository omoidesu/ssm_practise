package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private Integer studentId;
    private String studentName;
    private String studentGender;
    private String studentBirthday;
    private String studentRegister;
    private String studentBelong;
}
