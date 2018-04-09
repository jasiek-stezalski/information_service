package com.pack.information_service.repository;

import com.pack.information_service.domain.ArticleRating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleRatingRepository extends JpaRepository<ArticleRating, Long>{
}
