package com.pack.information_service.service;

import com.pack.information_service.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {

    User findByUsername(String username);

    List<User> findAll();

    void save(User user);

    void update(User user);

    void changeRole(Long idUser, String name);

    void changeCategory(Long idUser, String category);

    void lock(Long idUser);

    boolean isBlocked(HttpServletRequest request, HttpServletResponse response);

    void delete(String username);

    void delete(Long idUser);

}
