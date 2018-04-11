package com.pack.information_service.repository;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleRating;
import com.pack.information_service.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleRatingRepository extends JpaRepository<ArticleRating, Long> {

    ArticleRating findByArticleAndUser(Article article, User user);

}
