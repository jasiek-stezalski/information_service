package com.pack.information_service.repository;

import com.pack.information_service.domain.CommentRating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRatingRepository extends JpaRepository<CommentRating, Long> {

    @Query(value = "SELECT comment_rating.id_rating, comment_rating.value, comment_rating.id_comment, comment_rating.id_user " +
            "from comment_rating LEFT JOIN comment ON comment_rating.id_comment = comment.id_comment " +
            "WHERE comment.id_article = :idArticle " +
            "AND comment_rating.id_user = :idUser", nativeQuery = true)
    List<CommentRating> findAllByIdArticleAndIdUser(@Param("idArticle") Long idArticle, @Param("idUser") Long idUser);

}
