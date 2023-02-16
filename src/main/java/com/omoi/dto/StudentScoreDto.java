package com.omoi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author xingj
 * @create 2023/2/16 13:44
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentScoreDto {
    private String courseId;
    private String studentId;
    private String studentName;
    private String score;
}
