package com.pack.information_service.service;

import com.pack.information_service.domain.User;

public interface UserService {

    User findByUsername(String username);

    void save(User user);

    void update(User user);

    void delete(String username);

}
