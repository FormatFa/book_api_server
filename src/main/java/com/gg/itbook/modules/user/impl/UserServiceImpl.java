package com.gg.itbook.modules.user.impl;

import com.gg.itbook.common.exception.IdentityErrorException;
import com.gg.itbook.common.exception.UserExistsException;
import com.gg.itbook.common.util.SecurityTool;
import com.gg.itbook.modules.user.User;
import com.gg.itbook.modules.user.UserMapper;
import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;
    @Autowired
    ModelMapper modelMapper;
    @Override
    public boolean checkUserExistsByEmail(String email) {
        User user = userMapper.findUserByEmail("test@qq.com");
        return userMapper.findUserByEmail(email)!=null;
    }

    @Override
    public void registerUserByEmail(String email, String password) {
        if(this.checkUserExistsByEmail(email)) {
            throw new UserExistsException(email);
        }
        User user = new User();
        user.setEmail(email);
        user.setPassword(SecurityTool.hashPassword(password));
        userMapper.saveUser(user);
    }

    @Override
    public LoginDTO findUserByEmail(String email) {
        User user =  userMapper.findUserByEmail(email);;
        LoginDTO userDto = modelMapper.map(user, LoginDTO.class);
        return userDto;
    }

    @Override
    public LoginDTO login(String email, String password) {
//        TODO filter sql injection
        User user = userMapper.findUserByEmail(email);
        if(!SecurityTool.checkPassword(password,user.getPassword())) {
            throw new IdentityErrorException(email);
        }
        LoginDTO userDto = modelMapper.map(user, LoginDTO.class);
        return userDto;
    }

}
