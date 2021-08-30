package com.gg.itbook.modules.user.dto;

public class LoginDTO {
    private int id;
    private String email;
    private String nickname;
    private int coin;

    public LoginDTO() {
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LoginDTO(int id, String email, String nickname) {
        this.id = id;
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
