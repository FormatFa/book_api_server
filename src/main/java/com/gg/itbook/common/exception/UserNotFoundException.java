package com.gg.itbook.common.exception;

public class UserNotFoundException extends BusinessException{
    public UserNotFoundException(String id) {
        super(String.format("User %s not found :",id));
    }
}
