package com.gg.itbook.modules.user.response;

public class ProfileResponse {
    private String email;
    private String nickname;

    public ProfileResponse() {
    }

    public ProfileResponse(String email, String nickname) {
        this.email = email;
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
