package com.gg.itbook.modules.user.impl;

import com.gg.itbook.common.exception.WeChatCode2SessionException;
import com.gg.itbook.common.wechat.WeChatCode2SessionReq;
import com.gg.itbook.common.wechat.WeChatCode2SessionResponse;
import com.gg.itbook.common.wechat.WeChatLogin;
import com.gg.itbook.common.wechat.WeChatLoginConfig;
import com.gg.itbook.modules.user.User;
import com.gg.itbook.modules.user.UserController;
import com.gg.itbook.modules.user.UserMapper;
import com.gg.itbook.modules.user.WeChatUserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URISyntaxException;
@Service
public class WeChatUserServiceImpl implements WeChatUserService {
    private static final Log logger = LogFactory.getLog(WeChatUserServiceImpl.class);
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    private WeChatLoginConfig weChatLoginConfig;
    @Autowired
    private UserMapper userMapper;
    @Override
    public LoginDTO loginOrRegisterByWeChat(String code) throws IOException, URISyntaxException {
        logger.info("login with wechat use code:"+code);
        if(code==null){
            throw new WeChatCode2SessionException("wechat code must not null");
        }
        WeChatCode2SessionReq parameter = new WeChatCode2SessionReq(
                weChatLoginConfig.getAppid(),
                weChatLoginConfig.getSecret(),
                code,
                weChatLoginConfig.getGrant_type()
        );
        WeChatCode2SessionResponse response = WeChatLogin.code2Session(parameter);
//        TODO: add error message
        if(response.getErrcode()!=null){
                throw new WeChatCode2SessionException(response.getErrcode());
        }
        logger.info("wechat response:"+response.toString());
        User foundUser =userMapper.findUserByOpenId(response.getOpenid());
        if(foundUser!=null){
            LoginDTO userDto = modelMapper.map(foundUser, LoginDTO.class);
            userDto.setSession_key(response.getSession_key());
            return userDto;
        }
        logger.info("save wechat user , openid:"+response.getOpenid());
        User user = new User(response.getOpenid());
        user.setCoin(99999);
        userMapper.saveUser(user);
        LoginDTO userDto = modelMapper.map(user, LoginDTO.class);
        userDto.setSession_key(response.getSession_key());
        return userDto;
    }

    @Override
    public LoginDTO findUserByOpenId(String openid) {
        User user =  userMapper.findUserByOpenId(openid);
        LoginDTO userDto = modelMapper.map(user, LoginDTO.class);
        return userDto;
    }
}
