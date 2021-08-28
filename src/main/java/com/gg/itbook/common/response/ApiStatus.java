package com.gg.itbook.common.response;

import com.fasterxml.jackson.annotation.JsonValue;

public enum ApiStatus {
    SUCCESS("success"),FAIL("fail"),ERROR("error");
    String status;

    ApiStatus(String status) {
        this.status = status;
    }

    @JsonValue
    public String getStatus() {
        return status;
    }
    @Override
    public String toString() {
        return status;
    }
}
