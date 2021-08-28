package com.gg.itbook.modules.user;

import com.gg.itbook.common.auth.LoginInfo;
import com.gg.itbook.common.auth.MyLoginInfo;
import com.gg.itbook.common.auth.NeedAuth;
import com.gg.itbook.common.util.JWTool;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.request.LoginByEmailReq;
import com.gg.itbook.modules.user.request.RegisterByEmailDTO;
import com.gg.itbook.modules.user.response.LoginResponse;
import com.gg.itbook.modules.user.response.ProfileResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    ModelMapper modelMapper;
    @PostMapping("/registerByEmail")
    public void registerUserByEmail(@RequestBody RegisterByEmailDTO param) {
        // TODO check form whether valid
        userService.registerUserByEmail(param.getEmail(),param.getPassword());

    }
    @PostMapping("/login")
    public  LoginResponse loginByEmail(@RequestBody LoginByEmailReq loginReq){
        LoginDTO login = userService.login(loginReq.getEmail(), loginReq.getPassword());
        String jws = JWTool.generateJwt(login.getEmail());

        LoginResponse response = new LoginResponse(jws,modelMapper.map(login, ProfileResponse.class));
        return response;
    }

    @NeedAuth
    @GetMapping("/profile")
    public com.gg.itbook.modules.user.response.ProfileResponse getUserProfile(@MyLoginInfo LoginInfo loginInfo) {
        return modelMapper.map(loginInfo.getUserDTO(), com.gg.itbook.modules.user.response.ProfileResponse.class);
    }

}
