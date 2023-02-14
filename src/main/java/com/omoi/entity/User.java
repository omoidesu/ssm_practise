package com.omoi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    public static final int ADMIN = 999;
    public static final int TEACHER = 2;
    public static final int STUDENT = 1;
    public static final int ERROR = 0;

    private Integer id;
    private String username;
    private String password;
    private Integer role;
}
