package com.gg.itbook.modules.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    void save();
    void update();
    User findUserByEmail(String email);
    User findUserById(int user_id);
    void saveUser(User user);
    void updateCoin(@Param("user_id") int user_id, @Param("coin") int coin);

}
