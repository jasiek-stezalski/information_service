package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleRating;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRatingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleRatingServiceImpl implements ArticleRatingService {

    private ArticleRatingRepository articleRatingRepository;

    @Autowired
    public ArticleRatingServiceImpl(ArticleRatingRepository articleRatingRepository) {
        this.articleRatingRepository = articleRatingRepository;
    }

    @Override
    public int userMark(Article article, User user) {
        ArticleRating articleRatings = articleRatingRepository.findByArticleAndUser(article, user);
        if (articleRatings != null)
            return articleRatings.getValue();
        return 0;
    }

}
