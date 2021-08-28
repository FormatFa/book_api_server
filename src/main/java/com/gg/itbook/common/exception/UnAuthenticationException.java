package com.gg.itbook.common.exception;

public class UnAuthenticationException extends  ApiException{
    public UnAuthenticationException(String ip) {
        super("unAuthentication from " + ip);
    }
}
