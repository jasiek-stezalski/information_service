package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

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
        article.getComments().sort((comment1, comment2) -> -comment1.getDate().compareTo(comment2.getDate()));
        return article;
    }

    @Override
    public List<Article> findByIdUser(Long idUser) {
        User user = userRepository.findByIdUser(idUser);
        return articleRepository.findByUser(user);
    }

    @Override
    public List<Article> findByCategory(String category) {
        return articleRepository.findByCategory(category);
    }

    @Override
    public List<Article> findByTitle(String title) {
        String pattern;
        if (title.length() >= 3) {
            pattern = ".*" + title.toLowerCase() + ".*";
            return articleRepository.findByTitle(pattern);
        }
        return new ArrayList<>();
    }

    @Override
    public List<String> findCommentsAuthors(Long idArticle) {
        Article article = articleRepository.findByIdArticle(idArticle);
        List<String> commentsAuthors = new ArrayList<>();
        User user;
        for (Comment comment : article.getComments()) {
            user = userRepository.findByIdUser(comment.getUser().getIdUser());
            commentsAuthors.add(user.getUsername());
        }
        return commentsAuthors;
    }

    @Override
    public Article save(Article article) {
        return articleRepository.saveAndFlush(article);
    }

    @Override
    public void save(Long idArticle, String status) {
        Article article = articleRepository.findByIdArticle(idArticle);
        if (status.equals("to display")) article.setPublicationDate(new Date());
        article.setStatus(status);
        articleRepository.save(article);
    }

    @Override
    public void save(Long idArticle, Integer priority) {
        Article article = articleRepository.findByIdArticle(idArticle);
        article.setPriority(priority);
        articleRepository.save(article);
    }

    @Override
    public void propose(Article article) {
        article.setStatus("proposed");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        article.setUser(userRepository.findByUsername(username));
        articleRepository.save(article);
    }

    @Override
    public void take(Long idArticle) {
        Article article = articleRepository.findByIdArticle(idArticle);
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        article.setUser(userRepository.findByUsername(username));
        article.setStatus("in progress");
        articleRepository.save(article);
    }

    @Override
    public void delete(Long idArticle) {
        Article article = articleRepository.findByIdArticle(idArticle);
        try {
            String path = ResourceUtils.getFile("classpath:application.properties").getPath();
            for (Picture p : article.getPictures()) {
                File file = new File(path.substring(0,
                        path.indexOf("target")) + "src\\main\\webapp\\resources\\images\\image" + p.getIdPicture() + ".jpg");
                file.delete();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        articleRepository.delete(article);
    }

    @Override
    public Map<String, String> getCategories() {
        return new LinkedHashMap<String, String>() {{
            put("News", "MainPage.article.news");
            put("Sport", "MainPage.article.sport");
            put("Business", "MainPage.article.business");
            put("Entertainment", "MainPage.article.entertainment");
            put("Technologies", "MainPage.article.technologies");
            put("Motorization", "MainPage.article.motorization");
        }};
    }

}
