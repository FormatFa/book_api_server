package com.gg.itbook.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gg.itbook.common.exception.IdentityErrorException;
import com.gg.itbook.common.exception.UnAuthenticationException;
import com.gg.itbook.common.util.JWTool;
import com.gg.itbook.modules.user.UserController;
import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.request.LoginByEmailReq;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static com.gg.itbook.common.auth.AuthConstant.HEADER;
import static com.gg.itbook.common.auth.AuthConstant.TOKEN_PREFIX;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@AutoConfigureMockMvc
public class JwtInterceptorTest {
    @Autowired
    MockMvc mockMvc;
    @Autowired
    UserController userController;
    @MockBean
    UserService userService;
    final static ObjectMapper objectMapper = new ObjectMapper();
    @BeforeEach
    public void setUp() {
        LoginDTO userDTO = new LoginDTO(0,"test@qq.com","fff");
//        assertNotNull(userController);
        Mockito.doReturn(userDTO).when(this.userService).findUserByEmail("test@qq.com");


    }

    @Test
    public void whenJwtError_thenGetError() throws Exception {
           mockMvc.perform(get("/user/profile")).andExpect(status().is4xxClientError());
    }
//    @Test
//    public void whenJwtCorrectly_thenGetProfile() throws Exception {
//        String token = JWTool.generateJwt("test@qq.com");
//        mockMvc.perform(get("/user/profile").header(HEADER,TOKEN_PREFIX+token)).andExpect(status().isOk())
//                .andExpect(jsonPath("$.email").value("test@qq.com"))
//        .andExpect(jsonPath("$.nickname").exists());
//    }

}
