package com.gg.itbook.common.exception;

import com.gg.itbook.common.response.ApiResponse;
import com.gg.itbook.common.response.ApiResult;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ApiExceptionHandler extends ResponseEntityExceptionHandler {
    @ExceptionHandler(value = {ApiException.class})
    protected ResponseEntity<ApiResponse> handleApiException(RuntimeException ex, WebRequest request) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(ApiResult.error(ex.getMessage(),null));
    }

    @ExceptionHandler(value = {UnAuthenticationException.class,UserNotFoundException.class})
    protected ResponseEntity<ApiResponse> handleUnAuthenticationException(RuntimeException ex,WebRequest request) {

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(ApiResult.error("unauthentication",ex.getMessage()));
    }
    @Override
    protected ResponseEntity<Object> handleExceptionInternal(Exception ex, Object body, HttpHeaders headers, HttpStatus status, WebRequest request) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(ApiResult.error(ex.getMessage(),null));
    }
}
