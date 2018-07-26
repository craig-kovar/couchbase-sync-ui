package com.cb.demo.service;

import com.cb.demo.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
