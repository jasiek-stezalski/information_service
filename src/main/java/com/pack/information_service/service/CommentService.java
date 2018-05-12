package com.pack.information_service.service;

public interface CommentService {

    void save(String commentContent, Long idArticle);

    void edit(String commentContent, Long idComment);

    void delete(Long idComment);

}
