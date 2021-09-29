package com.gg.itbook.common.wechat;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class WeChatLoginConfig {
    @Value("${wechat.mini.appid}")
    private String appid;
    @Value("${wechat.mini.secret}")
    private String secret;
    @Value("wechat.mini.grant_type")
    private String grant_type;

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

    public String getGrant_type() {
        return grant_type;
    }

    public void setGrant_type(String grant_type) {
        this.grant_type = grant_type;
    }
}
