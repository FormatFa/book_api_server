package com.gg.itbook.modules.user.request;

import lombok.Data;

@Data
public class RegisterByEmailDTO {
    private String email;
    private String password;
    private String verifyCode;

    public RegisterByEmailDTO(String email, String password, String verifyCode) {
        this.email = email;
        this.password = password;
        this.verifyCode = verifyCode;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getVerifyCode() {
        return verifyCode;
    }
}
