package com.gg.itbook.util;

import com.gg.itbook.common.util.JWTool;
import io.jsonwebtoken.JwtException;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
public class JwtoolTest {

    @Test
    public  void givenSubject_whenGenerateJwt_thenGetCorrectly() {
        String subject = "111@qq.com";
        String jws = JWTool.generateJwt(subject);
        String decodeJwtSubject = JWTool.parseJwtSubject(jws);
        assertEquals(subject,decodeJwtSubject);
    }
    @Test
    public void givenJws_whenJwsInvalid_thenThrowException() {
        String jws = "invalud";
        assertThrows(JwtException.class,()->JWTool.parseJwtSubject(jws));
    }
}
