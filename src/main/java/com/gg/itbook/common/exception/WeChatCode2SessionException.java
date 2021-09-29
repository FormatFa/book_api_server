package com.gg.itbook.common.exception;

import com.gg.itbook.common.wechat.ErrorCode;

public class WeChatCode2SessionException extends ApiException{
    public WeChatCode2SessionException(String message) {
        super(message);
    }

    public WeChatCode2SessionException(ErrorCode code) {
        super( "request wechat exception:"+code.getValue());
    }
}
