package com.gg.itbook.modules.user;

import com.gg.itbook.modules.user.dto.LoginDTO;

public interface UserService {
    boolean checkUserExistsByEmail(String email);
    void registerUserByEmail(String email,String password);
    LoginDTO findUserByEmail(String email);
    LoginDTO login(String email, String password);
    int  charge(String email,int addCoin);
    int  useCoin(String email,int coin);

}
