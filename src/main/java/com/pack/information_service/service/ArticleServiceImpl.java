package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    private ArticleRepository articleRepository;
    private UserRepository userRepository;

    @Autowired
    public ArticleServiceImpl(ArticleRepository articleRepository, UserRepository userRepository) {
        this.articleRepository = articleRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Article findById(Long idArticle) {
        Article article = articleRepository.findByIdArticle(idArticle);
        Collections.sort(article.getComments(),
                (comment1, comment2) -> -comment1.getDate().compareTo(comment2.getDate()));
        return article;
    }

    @Override
    public List<String> findCommentsAuthors(Long id) {
        Article article = articleRepository.findByIdArticle(id);
        List<String> commentsAuthors = new ArrayList<>();
        User user;
        for (Comment comment : article.getComments()) {
            user = userRepository.findByIdUser(comment.getUser().getIdUser());
            commentsAuthors.add(user.getUsername());
        }
        return commentsAuthors;
    }

    @Override
    public List<Article> findByIdJournalist(Long idUser) {
        User user = userRepository.findByIdUser(idUser);
        return articleRepository.findByUser(user);
    }

    @Override
    public List<Article> findByCategory(String category) {
        return articleRepository.findByCategory(category);
    }

    @Override
    public List<Article> findByTitle(String search) {
        String pattern = ".*" + search.toLowerCase() + ".*";
        return articleRepository.findByTitle(pattern);
    }

}
