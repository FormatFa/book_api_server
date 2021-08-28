package com.gg.itbook.common.auth;

import com.gg.itbook.modules.user.dto.LoginDTO;

public class LoginInfo {

    private LoginDTO userDTO;

    public LoginInfo(LoginDTO userDTO) {
        this.userDTO = userDTO;
    }

    public LoginDTO getUserDTO() {
        return userDTO;
    }

    public void setUserDTO(LoginDTO userDTO) {
        this.userDTO = userDTO;
    }
}
