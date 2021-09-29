package com.gg.itbook.modules.user;

import com.gg.itbook.modules.user.dto.LoginDTO;

import java.io.IOException;
import java.net.URISyntaxException;

public interface WeChatUserService {
    public LoginDTO loginOrRegisterByWeChat(String code) throws IOException, URISyntaxException;
    LoginDTO findUserByOpenId(String  openid);
}
