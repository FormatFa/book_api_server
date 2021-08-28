package com.gg.itbook.user;

import com.gg.itbook.common.config.ToolSpringConfig;
import com.gg.itbook.common.exception.IdentityErrorException;
import com.gg.itbook.common.exception.UserExistsException;
import com.gg.itbook.common.util.SecurityTool;
import com.gg.itbook.modules.user.User;
import com.gg.itbook.modules.user.UserMapper;
import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.impl.UserServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@Import(ToolSpringConfig.class)
public class UserServiceImplTest {

    @Autowired
    UserMapper userMapper;
    @Autowired
    UserService userService;
    User testUser;
    @BeforeEach
    public  void setUp() {
        testUser = new User();
        testUser.setEmail("test@qq.com");
        testUser.setPassword(SecurityTool.hashPassword("123"));
        Mockito.doReturn(testUser).when(userMapper).findUserByEmail("test@qq.com");
    }
    @TestConfiguration
    static class UserServiceTestContextConfiguration {
        @Bean
        public UserService userService() {
            return new UserServiceImpl();
        }
        @Bean
        public UserMapper  userMapper  () {
            UserMapper mapper = Mockito.mock(UserMapper.class);
            return mapper;
        }
    }

    @Test
    public void givenEmail_whenEmailExists_thenShouldCheckExists() {
        assertTrue(userService.checkUserExistsByEmail("test@qq.com"),"check exists email");

    }
    @Test
    public void givenEmail_whenEmailNotExists_thenShouldCorrectlyCheckExists() {
        assertFalse(userService.checkUserExistsByEmail("noexitsQ@qq.com"),"check not exists email");
    }
    @Test
    public void givenEmailRegister_whenEmailExists_thenThrowException() {
        assertThrows(UserExistsException.class,()->userService.registerUserByEmail("test@qq.com",""));
    }
    @Test
    public void givenEmailRegister_whenEmailNotExists_thenNotThrow() {
        assertDoesNotThrow(()->userService.registerUserByEmail("testnew@qq.com","123"));
    }


    @Test
    public void givenCredentials_whenMatch_thenReturnDTO() {
        LoginDTO userDto = userService.login("test@qq.com","123");
        assertNotNull(userDto,"login dto shouldn't null");
        assertEquals("test@qq.com", userDto.getEmail());
    }
    @Test
    public void givenCredentials_whenNotMatch_thenThrows() {
        assertThrows(IdentityErrorException.class,()->userService.login("test@qq.com","12311"));
    }
}
