package com.pack.information_service.service;

import com.pack.information_service.domain.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

    User findById(Long idUser);

    void addArticleRate(String username, int userMark, Long idArticle);
}
