package com.pack.information_service.repository;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

    Article findByIdArticle(Long idArticle);

    List<Article> findByUser(User user);

    List<Article> findByCategory(String category);

    List<Article> findByStatus(String status);

    List<Article> findByStatusOrderByPriorityAscPublicationDateDesc(String status);

    List<Article> findByStatusOrderByPublicationDateDesc(String status);

    @Query(nativeQuery = true, value = "SELECT * FROM article WHERE LOWER(Title) regexp ?1")
    List<Article> findByTitle(String pattern);

    List<Article> findByUserAndStatusLike(User user, String status);

    List<Article> findByUserAndStatusLikeOrderByPublicationDateDesc(User user, String status);

    List<Article> findByUserAndStatusNotLike(User user, String status);

    List<Article> findByStatusAndCategory(String status, String category);

    @Query(nativeQuery = true, value = "SELECT * FROM article WHERE Status =:status AND (Category =:category OR id_user =:idUser) ORDER BY Publication_date DESC")
    List<Article> findByStatusAndCategoryOrUserOrderByPublicationDateDesc(@Param("status") String status, @Param("category") String category, @Param("idUser") Long idUser);

    List<Article> findByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(String status, String category);

    List<Article> findFirst10ByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(String status, String category);

    List<Article> findFirst20ByStatusOrderByPriorityAscPublicationDateDesc(String status);

}
