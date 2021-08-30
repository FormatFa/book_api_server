package com.gg.itbook.modules.user.response;

public class ProfileResponse {
    private String email;
    private String nickname;
    private int coin;

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }

    public ProfileResponse() {
    }

    public ProfileResponse(String email, String nickname,int coin) {
        this.email = email;
        this.nickname = nickname;
        this.coin=coin;
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
