package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ArticleController {

    private ArticleService articleService;
    private UserService userService;

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService) {
        this.articleService = articleService;
        this.userService = userService;
    }

    @GetMapping("/articlePage/{idArticle}")
    public String openArticle(@PathVariable("idArticle") Long id, Model model) {
        Article article = articleService.findById(id);
        User user = article.getUser();
        model.addAttribute("article", article);
        model.addAttribute("journalist", userService.findById(user.getIdUser()));
        model.addAttribute("articleRate", articleService.findArticleRate(id));
        model.addAttribute("commentsAuthors", articleService.findCommentsAuthors(id));
        return "article";
    }
}
