package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Statistic;

import java.util.List;
import java.util.Map;

public interface ArticleService {

    Article findById(Long idArticle);

    List<Article> findByStatus(String status);

    List<Article> findByStatusAndUser(String status);

    List<Article> findByStatusOrderByPriority(String status);

    List<Article> findByStatusAndCategoryOrderByPriority(String status);

    List<Article> findByStatusAndCategoryOrUser(String status);

    List<Article> findByIdUserAndPublicationDate(Long idUser);

    List<Article> findByCategoryAndPublicationDate(String category);

    List<Article> findByTitleAndPublicationDate(String title);

    List<String> findCommentsAuthors(Long idArticle);

    List<Article> findByError();

    Article save(Article article);

    void save(Long idArticle, String status);

    void save(Long idArticle, Integer priority);

    void propose(Article article);

    void take(Long idArticle);

    void delete(Long idArticle);

    Map<String, String> getCategories();

    List<Statistic> getStatistics();

}
