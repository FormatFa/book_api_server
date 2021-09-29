package com.gg.itbook.common.wechat;

import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

@JsonDeserialize(using = ErrorCodeDeSerializer.class)
public enum ErrorCode {
    BUSY(-1),SUCCESS(0),CODE_INVALID(40029),RATE_LIMIT(45011)
    ,RISK_USER(40226),UNKNOW(999);
    private int value;

    ErrorCode(int value){
        this.value=value;
    }
    @JsonValue
    public int getValue() {
        return value;
    }


    public void setValue(int value) {
        this.value = value;
    }
}
