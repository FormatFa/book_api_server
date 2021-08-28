package com.gg.itbook.common.exception;

public class IdentityErrorException extends ApiException{
    public IdentityErrorException(String identity) {
        super(identity+" credentials not match");
    }
}
