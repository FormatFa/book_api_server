package com.gg.itbook.util;

import com.gg.itbook.common.util.SecurityTool;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
public class SecurityToolTest {
    @Test
    public void testPasswordHash() {
        String plainPassword="1758759399";
        String hashed = SecurityTool.hashPassword(plainPassword);
        assertEquals(60,hashed.length());
        assertTrue(SecurityTool.checkPassword(plainPassword,hashed));
    }

}
