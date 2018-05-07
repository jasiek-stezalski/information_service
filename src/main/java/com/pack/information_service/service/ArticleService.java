package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {

    Article findById(Long idArticle);

    List<String> findCommentsAuthors(Long id);

    List<Article> findByIdJournalist(Long idUser);

    List<Article> findByCategory(String category);

    List<Article> findByTitle(String search);

    void save(Article articleFrom);

    Map<String,String> getCategories();
}
