package com.pack.information_service.service;

public interface CommentService {

    void save(String commentContent, Long idArticle, String username);

    void delete(Long idComment);
}
