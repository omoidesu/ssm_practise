package com.omoi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author xingj
 * @create 2023/2/15 16:13
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageDto {
    private int code;
    private String msg;
    private Object data;
}
