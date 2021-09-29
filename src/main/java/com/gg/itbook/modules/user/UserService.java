package com.gg.itbook.modules.user;

import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.dto.UseCoinDTO;

public interface UserService {
    boolean checkUserExistsByEmail(String email);
    void registerUserByEmail(String email,String password);
    LoginDTO findUserByEmail(String email);
    LoginDTO findUserById(int user_id);

    LoginDTO login(String email, String password);
    int  charge(int  user_id,int addCoin);
    UseCoinDTO useCoin(int  user_id, int coin);

}
