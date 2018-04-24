package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import com.pack.information_service.service.*;
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
    private CommentRatingService commentRatingService;

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService, ArticleRatingService articleRatingService, CommentService commentService, CommentRatingService commentRatingService) {
        this.articleService = articleService;
        this.userService = userService;
        this.articleRatingService = articleRatingService;
        this.commentService = commentService;
        this.commentRatingService = commentRatingService;
    }

    @GetMapping("/{idArticle}")
    public String openArticle(@PathVariable("idArticle") Long id, Model model) {
        Article article = articleService.findById(id);
        model.addAttribute("article", article);
        model.addAttribute("commentsAuthors", articleService.findCommentsAuthors(id));
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        if (!username.equals("anonymousUser")) {
            User loggedUser = userService.findByUsername(username);
            model.addAttribute("userArticleMark", articleRatingService.userMark(article, loggedUser));
            model.addAttribute("userCommentMarks", commentRatingService.userMark(article, loggedUser.getIdUser()));
        }
        return "article";
    }

    @PostMapping("/addArticleMark")
    public String addArticleMark(@RequestParam int mark, @RequestParam Long idArticle) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        articleRatingService.save(mark, username, idArticle);
        return "redirect:/articlePage/" + idArticle;
    }

    @PostMapping("/addComment")
    public String addComment(@RequestParam String commentContent, @RequestParam Long idArticle) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        commentService.save(commentContent, idArticle, username);
        return "redirect:/articlePage/" + idArticle;
    }

    @PostMapping("/editComment")
    public String editComment(@RequestParam String commentContent, @RequestParam Long idArticle, @RequestParam Long idComment) {
        commentService.edit(commentContent, idComment);
        return "redirect:/articlePage/" + idArticle;
    }

    @PostMapping("/commentMark")
    public String commentMark(@RequestParam int mark, @RequestParam Long idArticle, @RequestParam Long idComment) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        commentRatingService.save(username, mark, idComment, idArticle);
        return "redirect:/articlePage/" + idArticle;
    }

    @PostMapping("/deleteComment")
    public String deleteComment(@RequestParam Long idComment, @RequestParam Long idArticle) {
        commentService.delete(idComment);
        return "redirect:/articlePage/" + idArticle;
    }
}
