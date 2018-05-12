package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {

    Article findById(Long idArticle);

    List<Article> findByIdUser(Long idUser);

    List<Article> findByCategory(String category);

    List<Article> findByStatus(String status);

    List<Article> findByStatusInOrder(String status);

    List<Article> findByTitle(String title);

    List<Article> findByUserAndStatus(String status, String username);

    List<Article> findByUserAndNotStatus(String status, String username);

    List<Article> findByStatusAndCategory(String status, String username);

    List<Article> findByStatusAndCategoryInOrder(String status, String username);

    List<String> findCommentsAuthors(Long idArticle);

    Article save(Article article);

    void save(Long idArticle, String status);

    void save(Long idArticle, Integer priority);

    void delete(Long idArticle);

    Map<String,String> getCategories();

}
