package com.gg.itbook.common.response;

import lombok.Data;

@Data
public class ApiResponse<T> {

    private ApiStatus status;
    private String message;
    private Object data;

    public ApiResponse(ApiStatus status,Object data) {
        this.status = status;
        this.data = data;
    }

    public ApiResponse(ApiStatus status, String message) {
        this.status = status;
        this.message = message;
    }

    public ApiResponse(ApiStatus status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }
}
