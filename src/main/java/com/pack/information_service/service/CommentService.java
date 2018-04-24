package com.pack.information_service.service;

public interface CommentService {

    void delete(Long idComment);

    void edit(String commentContent, Long idComment);

    void save(String commentContent, Long idArticle, String username);
}
