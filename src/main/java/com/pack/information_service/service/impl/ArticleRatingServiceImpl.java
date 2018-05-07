package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleRating;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRatingRepository;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.ArticleRatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.OptionalDouble;

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

        return Optional.ofNullable(articleRatings)
                .map(ArticleRating::getValue)
                .orElse(0);
    }

    @Override
    public void save(int userMark, String username, Long idArticle) {
        User user = userRepository.findByUsername(username);
        Article article = articleRepository.findByIdArticle(idArticle);
        ArticleRating articleRating = new ArticleRating(userMark, article, user);
        articleRatingRepository.save(articleRating);

        OptionalDouble articleMark = article.getArticleRatings()
                .stream()
                .mapToDouble(a -> a.getValue())
                .average();

        article.setMark(Math.round(articleMark.getAsDouble() * 100) / 100.d);
        articleRepository.save(article);
    }


}
