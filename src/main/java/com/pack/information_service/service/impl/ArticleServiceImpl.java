package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
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
    public List<Article> findByStatus(String status) {
        return articleRepository.findByStatus(status);
    }

    @Override
    public List<Article> findByStatusInOrder(String status) {
        return articleRepository.findByStatusOrderByPriorityAscPublicationDateDesc(status);
    }

    @Override
    public List<Article> findByTitle(String title) {
        String pattern = ".*" + title.toLowerCase() + ".*";
        return articleRepository.findByTitle(pattern);
    }

    @Override
    public List<Article> findByUserAndStatus(String status, String username) {
        User user = userRepository.findByUsername(username);
        return articleRepository.findByUserAndStatusLike(user, status);
    }

    @Override
    public List<Article> findByUserAndNotStatus(String status, String username) {
        User user = userRepository.findByUsername(username);
        return articleRepository.findByUserAndStatusNotLike(user, status);
    }

    @Override
    public List<Article> findByStatusAndCategory(String status, String username) {
        User user = userRepository.findByUsername(username);
        return articleRepository.findByStatusAndCategory(status, user.getCategory());
    }

    @Override
    public List<Article> findByStatusAndCategoryInOrder(String status, String username) {
        User user = userRepository.findByUsername(username);
        return articleRepository.findByStatusAndCategoryOrderByPriorityAscPublicationDateDesc(status, user.getCategory());
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
        Map<String, String> categories = new LinkedHashMap<String, String>() {{
            put("News", "MainPage.article.news");
            put("Sport", "MainPage.article.sport");
            put("Business", "MainPage.article.business");
            put("Entertainment", "MainPage.article.entertainment");
            put("Technologies", "MainPage.article.technologies");
            put("Motorization", "MainPage.article.motorization");
        }};

        return categories;
    }

}
