package com.gg.itbook.wechat;

import com.gg.itbook.common.wechat.ErrorCode;
// 测试用的对象
public class ErrorCodeTemp {
    private ErrorCode error_code;

    public ErrorCodeTemp() {
    }

    public ErrorCodeTemp(ErrorCode error_code) {
        this.error_code = error_code;
    }

    public ErrorCode getError_code() {
        return error_code;
    }

    public void setError_code(ErrorCode error_code) {
        this.error_code = error_code;
    }
}
