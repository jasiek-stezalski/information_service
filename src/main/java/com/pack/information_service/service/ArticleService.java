package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;

public interface ArticleService {

    Article findById(Long idArticle);

    List<String> findCommentsAuthors(Long id);

    List<Article> findByIdJournalist(Long idUser);

    List<Article> findByCategory(String category);
}
