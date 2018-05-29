package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Statistic;

import java.util.List;
import java.util.Map;

public interface ArticleService {

    Article findById(Long idArticle);

    List<Article> findByIdUser(Long idUser);

    List<Article> findByCategory(String category);

    List<Article> findByTitle(String title);

    List<String> findCommentsAuthors(Long idArticle);

    Article save(Article article);

    void save(Long idArticle, String status);

    void save(Long idArticle, Integer priority);

    void propose(Article article);

    void take(Long idArticle);

    void delete(Long idArticle);

    Map<String, String> getCategories();

    List<Statistic> getStatistics();

}
