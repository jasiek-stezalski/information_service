package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleRating;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRatingRepository;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleRatingServiceImpl implements ArticleRatingService {

    private ArticleRatingRepository articleRatingRepository;
    private UserRepository userRepository;
    private ArticleRepository articleRepository;

    @Autowired
    public ArticleRatingServiceImpl(ArticleRatingRepository articleRatingRepository, UserRepository userRepository, ArticleRepository articleRepository) {
        this.articleRatingRepository = articleRatingRepository;
        this.userRepository = userRepository;
        this.articleRepository = articleRepository;
    }

    @Override
    public int userMark(Article article, User user) {
        ArticleRating articleRatings = articleRatingRepository.findByArticleAndUser(article, user);
        if (articleRatings != null)
            return articleRatings.getValue();
        return 0;
    }

    @Override
    public void addArticleRate(String username, int userMark, Long idArticle) {
        User user = userRepository.findByUsername(username);
        Article article = articleRepository.findByIdArticle(idArticle);
        ArticleRating articleRating = new ArticleRating(userMark, article, user);
        articleRatingRepository.save(articleRating);

        double sumOfRates = 0;
        for (ArticleRating rate : article.getArticleRatings()) {
            sumOfRates += rate.getValue();
        }
        double articleMark = sumOfRates / article.getArticleRatings().size();
        articleMark = Math.round(articleMark * 100) / 100.d;
        article.setMark(articleMark);
        articleRepository.save(article);
    }

}
