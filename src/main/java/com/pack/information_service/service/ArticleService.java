package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {

    Article findById(Long idArticle);

    List<String> findCommentsAuthors(Long id);

    List<Article> findByIdUser(Long idUser);

    List<Article> findByCategory(String category);

    List<Article> findByTitle(String search);

    Article save(Article articleFrom);

    Map<String,String> getCategories();

    List<Article> findByUserAndStatus(String username, String status);

    void delete(Long idArticle);

    List<Article> findByUserAndNotStatus(String username, String status);

    List<Article> findByStatus(String status);

    List<Article> findByStatusAndCategory(String status, String username);
}
