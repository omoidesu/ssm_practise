package com.omoi.mapper;

import com.omoi.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    /**
     * 登录验证，通过用户名获取用户对象
     *
     * @param username 用户名
     * @return 用户对象
     */
    User getUserByUsername(String username);
}
