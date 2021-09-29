package com.gg.itbook.common.wechat;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gg.itbook.modules.user.impl.WeChatUserServiceImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

//
// https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html

public class WeChatLogin {
    private static final Log logger = LogFactory.getLog(WeChatLogin.class);
    public static final String code2SessionRequestUrl = "https://api.weixin.qq.com/sns/jscode2session";

    public static WeChatCode2SessionResponse code2Session(WeChatCode2SessionReq parameter) throws IOException, URISyntaxException {
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet(code2SessionRequestUrl);
        URI uri = new URIBuilder(httpGet.getURI())
                .addParameter("appid", parameter.getAppid())
                .addParameter("secret", parameter.getSecret())
                .addParameter("js_code", parameter.getJs_code())
                .addParameter("grant_type", parameter.getGrant_type()).build();
        httpGet.setURI(uri);
        CloseableHttpResponse response = httpClient.execute(httpGet);
        ObjectMapper mapper = new ObjectMapper();
        WeChatCode2SessionResponse wechatResponse = mapper.readValue(response.getEntity().getContent(), WeChatCode2SessionResponse.class);
        httpClient.close();
        return wechatResponse;
    }
}