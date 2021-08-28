package com.gg.itbook.common.response;

public class ApiResult {
    public static ApiResponse success(Object data) {
        return new ApiResponse(ApiStatus.SUCCESS,data);
    }

    public static ApiResponse fail(Object data) {
        return new ApiResponse(ApiStatus.FAIL,data);
    }
    public static ApiResponse error(String message,Object data) {
        return new ApiResponse(ApiStatus.ERROR,message,data);
    }
}
