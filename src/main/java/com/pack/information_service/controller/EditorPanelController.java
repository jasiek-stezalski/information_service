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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Optional;

@Controller
public class EditorPanelController {

    private ArticleService articleService;
    private UserService userService;

    @Autowired
    public EditorPanelController(ArticleService articleService, UserService userService) {
        this.articleService = articleService;
        this.userService = userService;
    }

    @GetMapping("/userPanel")
    public String userPanel(Model model) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("articlesInProgress", articleService.findByJournalistInProgress(username));
        return "userPanel";
    }

    @GetMapping("/addArticle")
    public String addArticle(Model model) {
        model.addAttribute("articleForm", new Article("in progress"));
        model.addAttribute("categories", articleService.getCategories());
        return "articleEdition";
    }

    @PostMapping("addArticle")
    public String addArticle(@ModelAttribute Article articleFrom) {
        articleFrom.setUser(Optional.ofNullable(articleFrom.getUser())
                .orElse(userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName())));
        articleService.save(articleFrom);
        return "redirect:/userPanel";
    }

    @GetMapping("updateArticle/{idArticle}")
    public String updateArticle(@PathVariable Long idArticle, Model model) {
        model.addAttribute("articleForm", articleService.findById(idArticle));
        model.addAttribute("categories", articleService.getCategories());
        return "articleEdition";
    }


}
