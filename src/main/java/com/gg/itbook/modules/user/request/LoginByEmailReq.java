package com.gg.itbook.modules.user.request;

public class LoginByEmailReq {
    private String email;
    private String password;

    public LoginByEmailReq() {
    }

    public LoginByEmailReq(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
