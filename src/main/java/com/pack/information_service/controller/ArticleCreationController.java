package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ArticleCreationController {

    private ArticleService articleService;
    private UserService userService;

    @Autowired
    public ArticleCreationController(ArticleService articleService, UserService userService) {
        this.articleService = articleService;
        this.userService = userService;
    }

    @GetMapping("/articleEdition")
    public String addArticle(Model model) {
        model.addAttribute("articleForm", new Article());
        model.addAttribute("categories", articleService.getCategories());
        return "articleEdition";
    }

    @PostMapping("articleEdition")
    public String addArticle(@ModelAttribute Article articleFrom) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        articleFrom.setUser(userService.findByUsername(username));
        articleService.save(articleFrom);
        return "redirect:/articleEdition";
    }


}
