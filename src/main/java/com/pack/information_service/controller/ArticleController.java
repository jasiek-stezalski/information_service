package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import com.pack.information_service.service.ArticleRatingService;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.CommentService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/articlePage")
public class ArticleController {

    private ArticleService articleService;
    private UserService userService;
    private ArticleRatingService articleRatingService;
    private CommentService commentService;

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService, ArticleRatingService articleRatingService, CommentService commentService) {
        this.articleService = articleService;
        this.userService = userService;
        this.articleRatingService = articleRatingService;
        this.commentService = commentService;
    }

    @GetMapping("/{idArticle}")
    public String openArticle(@PathVariable("idArticle") Long id, Model model) {
        Article article = articleService.findById(id);
        User user = article.getUser();
        model.addAttribute("article", article);
        model.addAttribute("commentsAuthors", articleService.findCommentsAuthors(id));
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        if (username != null) {
            User loggedUser = userService.findByUsername(username);
            model.addAttribute("userMark", articleRatingService.userMark(article, loggedUser));
        }
        return "article";
    }

    @PostMapping("/mark")
    public String articleMark(@RequestParam int mark, @RequestParam Long idArticle) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        articleRatingService.addArticleRate(username, mark, idArticle);
        return "redirect:/articlePage/" + idArticle;
    }

    @PostMapping("/addComment")
    public String addComment(@RequestParam String commentContent, @RequestParam Long idArticle) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        commentService.save(commentContent, idArticle, username);
        return "redirect:/articlePage/" + idArticle;
    }

    @PostMapping("/deleteComment")
    public String deleteComment(@RequestParam Long idComment, @RequestParam Long idArticle) {
        commentService.delete(idComment);
        return "redirect:/articlePage/" + idArticle;
    }
}
