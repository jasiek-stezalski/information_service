package com.pack.information_service.service;

import com.pack.information_service.domain.Article;

import java.util.List;

public interface CommentRatingService {

    void addCommentRate(String username, int mark, Long idComment, Long idArticle);

    List<Integer> userMark(Article article, Long idUser);

}
