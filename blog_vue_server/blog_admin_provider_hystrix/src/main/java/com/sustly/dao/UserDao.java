package com.sustly.dao;

import com.sustly.entry.User;
import org.apache.ibatis.annotations.*;

/**
 * @Author: liyue
 * @Date: 19-9-4 下午5:13
 */
@Mapper
public interface UserDao {

    @Select("select * from user where username=#{username}")
    User findByUsername(@Param("username") String username);

    @Options(useGeneratedKeys = true, keyColumn = "id")
    @Insert("insert into user(username, password, create_time, last_login_time) values (#{username}, #{password}, #{createTime}, #{lastLoginTime})")
    void save(User user);

    @Select("select * from user where username=#{username} and password=#{password}")
    User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}
