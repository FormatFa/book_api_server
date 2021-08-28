package com.gg.itbook.modules.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    void save();
    void update();
    User findUserByEmail(String email);
    void saveUser(User user);

}
