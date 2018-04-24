package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;

import java.util.List;

public interface CommentRatingService {

    void save(String username, int mark, Long idComment, Long idArticle);

    List<Integer> userMark(Article article, Long idUser);

    void deleteAllCommentRating(Comment comment);
}
