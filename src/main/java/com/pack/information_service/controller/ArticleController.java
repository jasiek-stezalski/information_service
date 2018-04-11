package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import com.pack.information_service.service.ArticleRatingService;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArticleController {

    private ArticleService articleService;
    private UserService userService;
    private ArticleRatingService articleRatingService;

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService, ArticleRatingService articleRatingService) {
        this.articleService = articleService;
        this.userService = userService;
        this.articleRatingService = articleRatingService;
    }

    @GetMapping("/articlePage/{idArticle}")
    public String openArticle(@PathVariable("idArticle") Long id, Model model) {
        Article article = articleService.findById(id);
        User user = article.getUser();
        model.addAttribute("article", article);
        model.addAttribute("journalist", userService.findById(user.getIdUser()));
        model.addAttribute("articleRate", articleService.findArticleRate(id));
        model.addAttribute("commentsAuthors", articleService.findCommentsAuthors(id));
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        if (username != null) {
            User loggedUser = userService.findByUsername(username);
            model.addAttribute("userMark", articleRatingService.userMark(article, loggedUser));
        }
        return "article";
    }

    @PostMapping("/articlePage/mark")
    public String articleMark(@RequestParam int mark, @RequestParam Long idArticle) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        userService.addArticleRate(username, mark, idArticle);
        return "redirect:/articlePage/" + idArticle;
    }
}
