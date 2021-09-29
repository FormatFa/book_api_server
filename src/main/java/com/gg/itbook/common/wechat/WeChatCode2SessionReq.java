package com.gg.itbook.common.wechat;

public class WeChatCode2SessionReq {
    private String appid;
    private String secret;
    private String js_code;
    private String grant_type;

    public WeChatCode2SessionReq(String appid, String secret, String js_code, String grant_type) {
        this.appid = appid;
        this.secret = secret;
        this.js_code = js_code;
        this.grant_type = grant_type;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public String getJs_code() {
        return js_code;
    }

    public void setJs_code(String js_code) {
        this.js_code = js_code;
    }

    public String getGrant_type() {
        return grant_type;
    }

    public void setGrant_type(String grant_type) {
        this.grant_type = grant_type;
    }
}
