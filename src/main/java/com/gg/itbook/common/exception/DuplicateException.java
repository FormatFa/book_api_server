package com.gg.itbook.common.exception;

public class DuplicateException extends ApiException{

    public DuplicateException(String subject,String identity) {
        super(String.format("%S exists %s",subject,identity));
    }
}
