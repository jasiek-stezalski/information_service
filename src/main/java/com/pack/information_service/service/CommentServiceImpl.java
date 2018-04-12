package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.CommentRepository;
import com.pack.information_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    private CommentRepository commentRepository;
    private ArticleRepository articleRepository;
    private UserRepository userRepository;

    @Autowired
    public CommentServiceImpl(CommentRepository commentRepository, ArticleRepository articleRepository, UserRepository userRepository) {
        this.commentRepository = commentRepository;
        this.articleRepository = articleRepository;
        this.userRepository = userRepository;
    }

    @Override
    public void save(String commentContent, Long idArticle, String username) {
        User user = userRepository.findByUsername(username);
        Article article = articleRepository.findByIdArticle(idArticle);
        Comment comment = new Comment(commentContent, user, article);
        commentRepository.save(comment);
    }

    @Override
    public void delete(Long idComment) {
        Comment comment = commentRepository.findByIdComment(idComment);
        commentRepository.delete(comment);
    }

}
