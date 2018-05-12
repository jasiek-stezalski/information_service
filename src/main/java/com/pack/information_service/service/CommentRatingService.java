package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;

public interface CommentRatingService {

    List<Integer> userMark(Article article, Long idUser);

    void save(Integer mark, Long idComment, Long idArticle);

}
