package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;

public interface ArticleService {

    Article findById(Long idArticle);

    Double findArticleRate(Long id);

    List<String> findCommentsAuthors(Long id);
}
