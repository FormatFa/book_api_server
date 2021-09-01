package com.gg.itbook.common.auth;

import com.gg.itbook.common.exception.IdentityErrorException;
import com.gg.itbook.common.exception.UnAuthenticationException;
import com.gg.itbook.common.util.JWTool;
import io.jsonwebtoken.JwtException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.logging.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static  com.gg.itbook.common.auth.AuthConstant.*;
public class JwtHandlerInterceptor  implements HandlerInterceptor {
    Log LOGGER = LogFactory.getLog(JwtHandlerInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(!(handler instanceof  HandlerMethod)) {
            return true;
        }
        // check if need auth
        HandlerMethod method = (HandlerMethod) handler;
        if(!method.hasMethodAnnotation(NeedAuth.class)) {
            return true;
        }
        String jws = request.getHeader(HEADER);
        if(jws==null) {
            throw new UnAuthenticationException("error jwt :"+jws);
        }
        jws = jws.replace(TOKEN_PREFIX,"");
        try {
                String user = JWTool.parseJwtSubject(jws);
                request.setAttribute(IDENTITY_ATTRIBUTE,user);
        }
        catch (JwtException e) {
//            TODO real ip
            LOGGER.info(String.format("found invalid jwt: %s",jws));
            throw new UnAuthenticationException(request.getRemoteAddr());
        }

        return true;
    }
}
