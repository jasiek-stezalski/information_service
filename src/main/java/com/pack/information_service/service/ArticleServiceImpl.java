package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService{

    private ArticleRepository articleRepository;

    @Autowired
    public ArticleServiceImpl(ArticleRepository articleRepository) {
        this.articleRepository = articleRepository;
    }

    @Override
    public Article findById(Long idArticle) {
        return articleRepository.findByIdArticle(idArticle);
    }

}
