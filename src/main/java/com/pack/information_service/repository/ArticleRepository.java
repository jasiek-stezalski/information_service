package com.pack.information_service.repository;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

    List<Article> findFirst10ByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(String status, String category);

    List<Article> findFirst20ByOrderByPriorityAscPublicationDateDesc();

    Article findByIdArticle(Long idArticle);

    List<Article> findByUser(User user);

    List<Article> findByCategory(String category);
}
