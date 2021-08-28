package com.gg.itbook.common.auth;

import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import static  com.gg.itbook.common.auth.AuthConstant.*;
@Component
public class LoginInfoArgumentResolver implements HandlerMethodArgumentResolver {
    @Autowired
    UserService userService;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.hasParameterAnnotation(MyLoginInfo.class);
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        // set from jwt interceptor
        String email = (String) webRequest.getAttribute(IDENTITY_ATTRIBUTE, RequestAttributes.SCOPE_REQUEST);
        if(email==null){

        }
        LoginDTO user = userService.findUserByEmail(email);
        LoginInfo  info = new LoginInfo(user);
        return info;
    }
}
