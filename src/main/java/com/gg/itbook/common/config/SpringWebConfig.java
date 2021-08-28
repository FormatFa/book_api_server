package com.gg.itbook.common.config;

import com.gg.itbook.common.auth.JwtHandlerInterceptor;
import com.gg.itbook.common.auth.LoginInfoArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class SpringWebConfig implements WebMvcConfigurer {
    @Autowired
    LoginInfoArgumentResolver loginInfoArgumentResolver;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new JwtHandlerInterceptor());
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(loginInfoArgumentResolver);
    }
}
