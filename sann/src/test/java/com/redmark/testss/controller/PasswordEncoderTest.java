package com.redmark.testss.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.testng.annotations.Test;

import static org.testng.Assert.assertTrue;

public class PasswordEncoderTest {

    String password = "abc";
    String encodedPassword;

    @Test
    public void testBCrypt() throws Exception {
        BCryptPasswordEncoder bce = new BCryptPasswordEncoder();
        encodedPassword = bce.encode(password);
        System.out.println(encodedPassword);

    }

    @Test(dependsOnMethods = {"testBCrypt"})
    public void testMatchBCrypt() throws Exception {
        BCryptPasswordEncoder bce = new BCryptPasswordEncoder();
        assertTrue(bce.matches(password, encodedPassword));

    }

    @Test(dependsOnMethods = {"testMatchBCrypt"})
    public void testSt() throws Exception {
        StandardPasswordEncoder  sde = new StandardPasswordEncoder();
        encodedPassword = sde.encode(password);
        System.out.println(encodedPassword);

    }

    @Test(dependsOnMethods = {"testSt"})
    public void testMatchSt() throws Exception {
        StandardPasswordEncoder sde = new StandardPasswordEncoder();
        assertTrue(sde.matches(password, encodedPassword));

    }


}