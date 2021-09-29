package com.gg.itbook.wechat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gg.itbook.common.wechat.ErrorCode;
import com.gg.itbook.common.wechat.WeChatCode2SessionResponse;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
// 反序列化enum测试
public class ErrorCodeSerializeTest {
    @Test
    public void serializeEnum_should_correct() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ErrorCodeTemp errorCodeTemp = new ErrorCodeTemp(ErrorCode.CODE_INVALID);
        String s = mapper.writeValueAsString(errorCodeTemp);
        assertEquals("{\"error_code\":40029}",s);
    }
    @Test
    public void deserializeEnum_should_correct() throws JsonProcessingException {
        String s = "{\"error_code\":40029}";
        ObjectMapper mapper = new ObjectMapper();
        ErrorCodeTemp errorCodeTemp = mapper.readValue(s,ErrorCodeTemp.class);

        assertNotNull(errorCodeTemp.getError_code(),"error_code ");
        assertEquals(ErrorCode.CODE_INVALID,errorCodeTemp.getError_code());
    }
    @Test
    public void deserializeWechatResponse_should_correct() throws JsonProcessingException {
        String res="{\"errcode\":40029,\"errmsg\":\"invalid code, rid: 61518741-13b3887a-14efde7d\"}";
        ObjectMapper mapper = new ObjectMapper();
        WeChatCode2SessionResponse response = mapper.readValue(res,WeChatCode2SessionResponse.class);
        assertEquals(ErrorCode.CODE_INVALID,response.getErrcode());
    }
}
