package com.omoi.mapper;

import com.omoi.entity.User;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 修改用户密码
     *
     * @param user 用户对象
     * @return 修改行数
     */
    Integer changePassword(User user);
}
