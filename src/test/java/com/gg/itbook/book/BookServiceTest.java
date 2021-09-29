package com.gg.itbook.book;
import com.gg.itbook.common.config.ToolSpringConfig;
import com.gg.itbook.modules.book.impl.BookServiceImpl;
import com.gg.itbook.modules.book.service.BookService;
import com.gg.itbook.modules.user.UserMapper;
import com.gg.itbook.modules.user.UserService;
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
public class BookServiceTest {

    @Autowired
    BookService bookService;

    @TestConfiguration
    static class TestBookServiceConfiguration {
        @Bean
        BookService bookService() {
            return new BookServiceImpl();
        }
        @Bean
        UserService userService() {
            return new UserServiceImpl();
        }
        @Bean
        public UserMapper userMapper  () {
            UserMapper mapper = Mockito.mock(UserMapper.class);
            return mapper;
        }
    }





}
