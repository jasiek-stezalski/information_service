package com.pack.information_service.service.impl;

import com.pack.information_service.domain.*;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.math.BigInteger;
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
    public List<Article> findByIdUserAndPublicationDate(Long idUser) {
        User user = userRepository.findByIdUser(idUser);
        return articleRepository.findByUserAndPublicationDateIsNotNull(user);
    }

    @Override
    public List<Article> findByCategoryAndPublicationDate(String category) {
        return articleRepository.findByCategoryAndPublicationDateIsNotNull(category);
    }

    @Override
    public List<Article> findByTitleAndPublicationDate(String title) {
        String pattern;
        if (title.length() >= 3) {
            pattern = ".*" + title.toLowerCase() + ".*";
            return articleRepository.findByTitleAndPublicationDateIsNotNull(pattern);
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
            put("News", "news");
            put("Sport", "sport");
            put("Business", "business");
            put("Entertainment", "entertainment");
            put("Technologies", "technologies");
            put("Motorization", "motorization");
        }};
    }

    @Override
    public List<Statistic> getStatistics() {
        List<Object> users = articleRepository.findUsers();
        List<Object[]> yearStatistics = articleRepository.findYearStatistics();
        List<Object[]> monthStatistics = articleRepository.findMonthStatistics();
        List<Statistic> statistics = new ArrayList<>();
        User user;

        for (int i = 0; i < users.size(); i++) {
            user = userRepository.findByIdUser(((BigInteger) users.get(i)).longValue());

            if (yearStatistics.size() > i && users.get(i).equals(yearStatistics.get(i)[0])) {
                if (monthStatistics.size() > i && users.get(i).equals(monthStatistics.get(i)[0])) {
                    statistics.add(
                            new Statistic(
                                    user,
                                    ((BigInteger) yearStatistics.get(i)[1]).intValue(),
                                    (yearStatistics.get(i)[2] != null) ? (double) yearStatistics.get(i)[2] : 0D,
                                    ((BigInteger) monthStatistics.get(i)[1]).intValue(),
                                    (monthStatistics.get(i)[2] != null) ? (double) monthStatistics.get(i)[2] : 0D));
                } else {
                    statistics.add(new Statistic(user,
                            ((BigInteger) yearStatistics.get(i)[1]).intValue(),
                            (yearStatistics.get(i)[2] != null) ? (double) yearStatistics.get(i)[2] : 0D, 0, 0D));
                }
            } else statistics.add(new Statistic(user, 0, 0D, 0, 0D));
        }
        return statistics;
    }

}
