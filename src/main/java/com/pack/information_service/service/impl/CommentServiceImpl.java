package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.CommentRepository;
import com.pack.information_service.service.CommentRatingService;
import com.pack.information_service.service.CommentService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    private CommentRepository commentRepository;
    private CommentRatingService commentRatingService;
    private UserService userRepository;
    private ArticleRepository articleRepository;

    @Autowired
    public CommentServiceImpl(CommentRepository commentRepository, CommentRatingService commentRatingService, UserService userRepository, ArticleRepository articleRepository) {
        this.commentRepository = commentRepository;
        this.commentRatingService = commentRatingService;
        this.userRepository = userRepository;
        this.articleRepository = articleRepository;
    }

    @Override
    public void delete(Long idComment) {
        Comment comment = commentRepository.findByIdComment(idComment);
        commentRatingService.deleteAllCommentRating(comment);
        commentRepository.delete(comment);
    }

    @Override
    public void edit(String commentContent, Long idComment) {
        Comment comment = commentRepository.findByIdComment(idComment);
        comment.setContent(commentContent);
        commentRepository.save(comment);
    }

    @Override
    public void save(String commentContent, Long idArticle, String username) {
        User user = userRepository.findByUsername(username);
        Article article = articleRepository.findByIdArticle(idArticle);
        Comment comment = new Comment(commentContent, user, article);
        commentRepository.save(comment);
    }

}
