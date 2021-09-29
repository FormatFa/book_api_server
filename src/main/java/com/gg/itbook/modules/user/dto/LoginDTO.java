package com.gg.itbook.modules.user.dto;

public class LoginDTO {
    private int id;
    private String email;
    private String nickname;
    private int coin;
    private String openid;
    private String session_key;

    public String getSession_key() {
        return session_key;
    }

    public void setSession_key(String session_key) {
        this.session_key = session_key;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

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

    public LoginDTO(int id, String email, String nickname, int coin, String openid,String session_key) {
        this.id = id;
        this.email = email;
        this.nickname = nickname;
        this.coin = coin;
        this.openid = openid;
        this.session_key = session_key;
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
