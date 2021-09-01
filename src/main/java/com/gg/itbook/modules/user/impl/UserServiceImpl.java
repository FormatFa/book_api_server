package com.gg.itbook.modules.user.impl;

import com.gg.itbook.common.exception.BalanceInSufficientException;
import com.gg.itbook.common.exception.IdentityErrorException;
import com.gg.itbook.common.exception.UserExistsException;
import com.gg.itbook.common.exception.UserNotFoundException;
import com.gg.itbook.common.util.SecurityTool;
import com.gg.itbook.modules.user.User;
import com.gg.itbook.modules.user.UserMapper;
import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.dto.UseCoinDTO;
import com.gg.itbook.modules.user.vo.Coin;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

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
    public LoginDTO findUserById(int user_id) {
        User user =  userMapper.findUserById(user_id);
        if(Objects.isNull(user)){
            throw new UserNotFoundException(String.valueOf(user_id));
        }
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

//    TODO transaction process
    @Override
    public int charge(int user_id, int addCoin) {
        LoginDTO login = findUserById(user_id);
        int newCoin = login.getCoin()+addCoin;
        this.userMapper.updateCoin(user_id,newCoin);
        return newCoin;
    }


    // TODO add cost record
    @Transactional(propagation = Propagation.MANDATORY)
    @Override
    public UseCoinDTO useCoin(int  user_id, int coin) {
        LoginDTO login = findUserById(user_id);
        if(login.getCoin()<coin){
            throw new BalanceInSufficientException(coin, login.getCoin());
        }
        int newCoin = login.getCoin()-coin;
        this.userMapper.updateCoin(user_id,newCoin);
        login = findUserById(user_id);
        return new UseCoinDTO(Coin.from(login.getCoin()));
    }

}
