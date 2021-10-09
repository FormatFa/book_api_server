package com.gg.itbook.wechat;

import com.gg.itbook.common.wechat.ErrorCode;
import com.gg.itbook.common.wechat.WeChatCode2SessionReq;
import com.gg.itbook.common.wechat.WeChatCode2SessionResponse;
import com.gg.itbook.common.wechat.WeChatLogin;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import static org.junit.jupiter.api.Assertions.*;
public class Code2SessionTest {
    @Test
    public void givenErrorCode_should_fetch_fail() throws IOException, URISyntaxException {
        WeChatCode2SessionResponse response= WeChatLogin.code2Session(new WeChatCode2SessionReq("wx06be867d6a00b665","7e806821edfe6958191c59ec2ca81964","11","authorization_code"));
        assertNotEquals(ErrorCode.SUCCESS,response.getErrcode());
        assertEquals(ErrorCode.CODE_INVALID,response.getErrcode());
    }
//    @Test
//    public void givenCode_should_correct() throws IOException, URISyntaxException {
//        WeChatCode2SessionResponse response= WeChatLogin.code2Session(new WeChatCode2SessionReq("wx06be867d6a00b665","7e806821edfe6958191c59ec2ca81964","081myh1w3XWZaX2sNy3w3NbG7y0myh1m","authorization_code"));
//        assertNull(response.getErrcode());
//        assertNotNull(response.getSession_key(),"session key not null");
//        assertNotNull(response.getOpenid(),"open should not null");
//    }

}
