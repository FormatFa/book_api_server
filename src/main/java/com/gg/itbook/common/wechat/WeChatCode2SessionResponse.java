package com.gg.itbook.common.wechat;

public class WeChatCode2SessionResponse {
    private String openid;
    private String session_key;
    private String unionid;
    private ErrorCode errcode;
    private String errmsg;

    public WeChatCode2SessionResponse() {
    }

    public WeChatCode2SessionResponse(String openid, String session_key, String unionid, ErrorCode errcode, String errmsg) {
        this.openid = openid;
        this.session_key = session_key;
        this.unionid = unionid;
        this.errcode = errcode;
        this.errmsg = errmsg;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getSession_key() {
        return session_key;
    }

    public void setSession_key(String session_key) {
        this.session_key = session_key;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    public ErrorCode getErrcode() {
        return errcode;
    }

    public void setErrcode(ErrorCode errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    @Override
    public String toString() {
        return "WeChatCode2SessionResponse{" +
                "openid='" + openid + '\'' +
                ", session_key='" + session_key + '\'' +
                ", unionid='" + unionid + '\'' +
                ", errcode=" + errcode +
                ", errmsg='" + errmsg + '\'' +
                '}';
    }
}
