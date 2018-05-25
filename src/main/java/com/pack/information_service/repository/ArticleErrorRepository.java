package com.pack.information_service.repository;

import com.pack.information_service.domain.ArticleError;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleErrorRepository extends JpaRepository<ArticleError, Long> {

    ArticleError findByIdError(Long idError);

}
