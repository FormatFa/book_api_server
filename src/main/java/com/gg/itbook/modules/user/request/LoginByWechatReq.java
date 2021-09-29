package com.gg.itbook.modules.user.request;

public class LoginByWechatReq {
    private String code;

    public LoginByWechatReq() {
    }

    public LoginByWechatReq(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
