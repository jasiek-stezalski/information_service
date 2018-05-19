package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleError;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleErrorRepository;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class ArticleErrorServiceImpl implements ArticleErrorService {

    private ArticleRepository articleRepository;
    private ArticleErrorRepository articleErrorRepository;
    private UserRepository userRepository;

    @Autowired
    public ArticleErrorServiceImpl(ArticleRepository articleRepository, ArticleErrorRepository articleErrorRepository,
                                   UserRepository userRepository) {
        this.articleRepository = articleRepository;
        this.articleErrorRepository = articleErrorRepository;
        this.userRepository = userRepository;
    }

    @Override
    public void save(ArticleError articleError, Long idArticle) {
        Article article = articleRepository.findByIdArticle(idArticle);
        articleError.setArticle(article);

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username);
        articleError.setUser(user);

        articleError.setStatus("to check");

        articleErrorRepository.save(articleError);
    }

    @Override
    public void save(Long idError) {
        ArticleError articleError = articleErrorRepository.findByIdError(idError);
        articleError.setStatus("checked");
        articleErrorRepository.save(articleError);
    }

}
