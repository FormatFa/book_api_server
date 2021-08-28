package com.gg.itbook.common.util;

import org.mindrot.jbcrypt.BCrypt;

public class SecurityTool {
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword,BCrypt.gensalt());
    }
    public static boolean  checkPassword(String plainPassword,String hashed) {

        return BCrypt.checkpw(plainPassword,hashed);

    }
}
