package com.pack.information_service.service;

import com.pack.information_service.domain.ArticleError;

public interface ArticleErrorService {

    void save(ArticleError articleError, Long idArticle);

    void save(Long idError);

}
