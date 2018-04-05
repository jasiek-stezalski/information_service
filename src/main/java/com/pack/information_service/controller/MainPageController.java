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
public class MainPageController {

    private MainPageFacade mainPageFacade;
    private ArticleService articleService;
    private UserService userService;

    @Autowired
    public MainPageController(MainPageFacade mainPageFacade, ArticleService articleService, UserService userService) {
        this.mainPageFacade = mainPageFacade;
        this.articleService = articleService;
        this.userService = userService;
    }

    @GetMapping({"/", "mainPage"})
    public String homePage(Model model) {
        mainPageFacade.generateContent();
        model.addAttribute("articles", mainPageFacade);
        return "mainPage";
    }

    @GetMapping("/articlePage/{idArticle}")
    public String openArticle(@PathVariable("idArticle") Long id, Model model) {
        Article article = articleService.findById(id);
        User user = article.getUser();
        model.addAttribute("article", article);
        model.addAttribute("journalist", userService.findById(user.getIdUser()));
        return "article";
    }

}
