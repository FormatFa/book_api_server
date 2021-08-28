package com.gg.itbook.common.exception;

public class ApiException extends RuntimeException  {
    public ApiException(String message) {
        super(message);
    }
}
