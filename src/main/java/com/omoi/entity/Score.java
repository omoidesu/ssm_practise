package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Score {
    private Integer id;
    private Integer courseId;
    private Integer studentId;
    private Integer score;
}
