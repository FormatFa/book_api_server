package com.gg.itbook.modules.user;

import com.gg.itbook.common.auth.LoginInfo;
import com.gg.itbook.common.auth.MyLoginInfo;
import com.gg.itbook.common.auth.NeedAuth;
import com.gg.itbook.common.response.ApiResponse;
import com.gg.itbook.common.response.ApiResult;
import com.gg.itbook.common.util.JWTool;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.request.LoginByEmailReq;
import com.gg.itbook.modules.user.request.LoginByWechatReq;
import com.gg.itbook.modules.user.request.RegisterByEmailDTO;
import com.gg.itbook.modules.user.response.LoginResponse;
import com.gg.itbook.modules.user.response.ProfileResponse;
import com.gg.itbook.modules.user.response.WeChatLoginResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URISyntaxException;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    WeChatUserService weChatUserService;
    @PostMapping("/loginByWeChat")
    public WeChatLoginResponse loginByWeChat( @RequestBody  LoginByWechatReq req) throws IOException, URISyntaxException {
           LoginDTO loginDTO =  this.weChatUserService.loginOrRegisterByWeChat(req.getCode());
           String jws = JWTool.generateJwt(String.valueOf(loginDTO.getId()));
           return new WeChatLoginResponse(jws,modelMapper.map(loginDTO, ProfileResponse.class));
    }

    @PostMapping("/registerByEmail")
    public void registerUserByEmail(@RequestBody RegisterByEmailDTO param) {
        // TODO check form whether valid
        userService.registerUserByEmail(param.getEmail(),param.getPassword());
    }
    @PostMapping("/login")
    public  LoginResponse loginByEmail(@RequestBody LoginByEmailReq loginReq){
        LoginDTO login = userService.login(loginReq.getEmail(), loginReq.getPassword());
        String jws = JWTool.generateJwt(String.valueOf(login.getId()));

        LoginResponse response = new LoginResponse(jws,modelMapper.map(login, ProfileResponse.class));
        return response;
    }

    @NeedAuth
    @GetMapping("/profile")
    public ApiResponse<com.gg.itbook.modules.user.response.ProfileResponse> getUserProfile(@MyLoginInfo LoginInfo loginInfo) {
        return ApiResult.success(modelMapper.map(loginInfo.getUserDTO(), com.gg.itbook.modules.user.response.ProfileResponse.class));
    }


}
