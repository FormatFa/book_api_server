package com.gg.itbook.common.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.security.Key;

//TODO  expired time
public class JWTool {
    private static final Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
    public static String generateJwt(String email) {
        return Jwts.builder().setSubject(email).signWith(key).compact();

    }
    public static String parseJwtSubject(String jws) {
        Jws<Claims> claims =  Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(jws);
        return claims.getBody().getSubject();
    }
    
}
