package com.gg.itbook.common.response;

public class ApiResult {
    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse(ApiStatus.SUCCESS,data);
    }
    public static <T> ApiResponse<T> successOnly() {
        return new ApiResponse(ApiStatus.SUCCESS,null);
    }

    public static ApiResponse fail(Object data) {
        return new ApiResponse(ApiStatus.FAIL,data);
    }
    public static ApiResponse error(String message,Object data) {
        return new ApiResponse(ApiStatus.ERROR,message,data);
    }
}
