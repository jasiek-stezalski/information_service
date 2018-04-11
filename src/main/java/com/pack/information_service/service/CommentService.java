package com.pack.information_service.service;

public interface CommentService {

    void saveComment(String commentContent, Long idArticle, String username);
}
