package com.redmark.testss.controller;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.*;

public class CustomUserDetailsService implements UserDetailsService {

    // simulate user service manipulating db
    private final static Map<String, User> userMap = new HashMap<>();

    static {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        userMap.put("test", new User("test", encoder.encode("test"), Arrays.asList("USER")));
        userMap.put("admin", new User("admin", encoder.encode("admin"), Arrays.asList("ADMIN")));
        userMap.put("dba", new User("dba", encoder.encode("dba"), Arrays.asList("ADMIN", "DBA")));
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMap.get(username);
        if (user == null)
            throw new UsernameNotFoundException("user not exists");
        return convertUser(user);
    }

    private org.springframework.security.core.userdetails.User convertUser(User user) {
        org.springframework.security.core.userdetails.User secUser;
        List<GrantedAuthority> roles = new ArrayList<>();
        user.getRoles().forEach(s -> roles.add(new SimpleGrantedAuthority("ROLE_" + s)));
        secUser = new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), roles);
        return secUser;
    }
}
