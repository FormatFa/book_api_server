package com.gg.itbook.modules.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    void save();
    void update();
    User findUserByEmail(String email);
    void saveUser(User user);
    void updateCoin(@Param("email") String email, @Param("coin") int coin);

}
