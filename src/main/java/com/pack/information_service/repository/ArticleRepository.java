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

    @Query(nativeQuery = true, value = "SELECT * FROM article WHERE LOWER(Title) regexp ?1 and publication_date is not null")
    List<Article> findByTitleAndPublicationDate(String pattern);

    List<Article> findByUserAndStatusLike(User user, String status);

    List<Article> findByUserAndStatusLikeOrderByPublicationDateDesc(User user, String status);

    List<Article> findByStatusAndCategory(String status, String category);

    @Query(nativeQuery = true, value = "SELECT * FROM article WHERE Status =:status AND (Category =:category OR id_user =:idUser) ORDER BY Publication_date DESC")
    List<Article> findByStatusAndCategoryOrUserOrderByPublicationDateDesc(@Param("status") String status, @Param("category") String category, @Param("idUser") Long idUser);

    List<Article> findByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(String status, String category);

    List<Article> findFirst10ByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(String status, String category);

    List<Article> findFirst20ByStatusOrderByPriorityAscPublicationDateDesc(String status);

    @Query(nativeQuery = true, value = "SELECT distinct article.* FROM article JOIN article_error on article.id_article = article_error.id_article")
    List<Article> findByError();

    @Query(nativeQuery = true,
            value = "SELECT user.id_user, COUNT(article.id_article), AVG(article.mark)" +
                    "from article " +
                    "right join user on article.id_user = user.id_user " +
                    "left join user_roles on user.id_user = user_roles.user_id " +
                    "where (user_roles.role_id = 3 " +
                    "OR user_roles.role_id = 4 " +
                    "OR user_roles.role_id = 5) " +
                    "AND article.publication_date >= (CURDATE() + INTERVAL -1 YEAR) " +
                    "GROUP BY user.id_user")
    List<Object[]> findYearStatistics();

    @Query(nativeQuery = true,
            value = "SELECT user.id_user, COUNT(article.id_article), AVG(article.mark)" +
                    "from article " +
                    "right join user on article.id_user = user.id_user " +
                    "left join user_roles on user.id_user = user_roles.user_id " +
                    "where (user_roles.role_id = 3 " +
                    "OR user_roles.role_id = 4 " +
                    "OR user_roles.role_id = 5) " +
                    "AND article.publication_date >= (CURDATE() + INTERVAL -1 MONTH) " +
                    "GROUP BY user.id_user")
    List<Object[]> findMonthStatistics();

    @Query(nativeQuery = true,
            value = "SELECT user.id_user " +
                    "from article " +
                    "right join user on article.id_user = user.id_user " +
                    "left join user_roles on user.id_user = user_roles.user_id " +
                    "where user_roles.role_id = 3 " +
                    "OR user_roles.role_id = 4 " +
                    "OR user_roles.role_id = 5 " +
                    "GROUP BY user.id_user")
    List<Object> findUsers();

}
