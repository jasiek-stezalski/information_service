package com.pack.information_service.service;

import com.pack.information_service.domain.User;

import java.util.List;

public interface UserService {

    List listAllUsers();

    void save(User user);

    void update(User user);

    User findById(Long idUser);

    void deleteUser(Long idUser);

    User findByUsername(String username);
}
