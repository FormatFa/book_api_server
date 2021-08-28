package com.gg.itbook.controller;

import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gg.itbook.common.exception.IdentityErrorException;
import com.gg.itbook.modules.user.UserController;
import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.request.LoginByEmailReq;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@AutoConfigureMockMvc
public class UserControllerTest {
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
        Mockito.doReturn(userDTO).when(this.userService).login("test@qq.com","123");
        Mockito.doThrow(IdentityErrorException.class).when(this.userService).login("test@qq.com","1234");

    }
    @Test
    public void testLoginResult() throws Exception {
        assertNotNull(userController);
        LoginByEmailReq req = new LoginByEmailReq("test@qq.com","123");

        mockMvc.perform(post("/user/login").contentType(MediaType.APPLICATION_JSON).content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists())
                .andExpect(jsonPath("$.user").exists())
                .andExpect(jsonPath("$.user.email").value(req.getEmail()))
        ;


    }
}
