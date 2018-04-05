package com.pack.information_service.repository;

import com.pack.information_service.domain.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

    List<Article> findFirst10ByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(String status, String category);

    List<Article> findFirst10ByOrderByPriorityAscPublicationDateDesc();
}
