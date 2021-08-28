package com.gg.itbook.common.exception;

public class UserExistsException extends  DuplicateException{

    public UserExistsException(String identity) {
        super("user",identity);
    }
}
