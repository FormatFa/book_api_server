package com.gg.itbook.common.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.security.Key;
import java.util.Arrays;

//TODO  expired time
public class JWTool {
    private static final Key key = Keys.hmacShaKeyFor(new byte[]{-115, 10, -54, -70, -27, 35, -71, -50, 28, -27, -38, -102, 88, 93, 77, -122, -102, -116, 35, 55, 73, 36, -93, 113, 53, -92, 66, 100, -107, -6, 44, 42});
    public static String generateJwt(String email) {
        return Jwts.builder().setSubject(email).signWith(key).compact();

    }
    public static String parseJwtSubject(String jws) {
        Jws<Claims> claims =  Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(jws);
        return claims.getBody().getSubject();
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(Keys.secretKeyFor(SignatureAlgorithm.HS256).getEncoded()));
    }
    
}
