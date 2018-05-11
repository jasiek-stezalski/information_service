package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.PictureService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Controller
public class EditorPanelController {

    private ArticleService articleService;
    private UserService userService;
    private PictureService pictureService;

    @Autowired
    public EditorPanelController(ArticleService articleService, UserService userService, PictureService pictureService) {
        this.articleService = articleService;
        this.userService = userService;
        this.pictureService = pictureService;
    }

    @GetMapping("/userPanel")
    public String userPanel(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String role = String.valueOf(authentication.getAuthorities());
        if (role.equals("[JOURNALIST]") || role.equals("[MODERATOR]") || role.equals("[EDITOR_IN_CHIEF]")) {
            String username = authentication.getName();
            model.addAttribute("articlesInProgress", articleService.findByJournalistInProgress(username));
            model.addAttribute("oldArticles", articleService.findByJournalistNotInProgress(username));
        }
        return "userPanel";
    }

    @GetMapping("/addArticle")
    public String addArticle(Model model) {
        model.addAttribute("articleForm", new Article("in progress"));
        model.addAttribute("categories", articleService.getCategories());
        return "articleEdition";
    }

    @PostMapping("addArticle")
    public String addArticle(@ModelAttribute Article articleFrom, @RequestParam MultipartFile file, @RequestParam String description) {
        articleFrom.setUser(Optional.ofNullable(articleFrom.getUser())
                .orElse(userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName())));
        articleFrom = articleService.save(articleFrom);
        if (!file.isEmpty()) {
            pictureService.save(file, description, articleFrom);
        }
        return "redirect:/userPanel";
    }

    @GetMapping("updateArticle/{idArticle}")
    public String updateArticle(@PathVariable Long idArticle, Model model) {
        Article article = articleService.findById(idArticle);
        model.addAttribute("articleForm", article);
        model.addAttribute("categories", articleService.getCategories());
        Picture picture = pictureService.findByArticle(article);
        if (picture != null) {
            model.addAttribute("description", picture.getDescription());
            model.addAttribute("path", picture.getPath());
        } else {
            model.addAttribute("description", "");
            model.addAttribute("path", "");
        }
        return "articleEdition";
    }

    @PostMapping("article/changeStatus")
    public String changeStatus(@RequestParam Long idArticle, @RequestParam String status) {
        Article article = articleService.findById(idArticle);
        article.setStatus(status);
        articleService.save(article);
        return "redirect:/userPanel";
    }

    @GetMapping("/deleteArticle/{idArticle}")
    public String deleteArticle(@PathVariable Long idArticle) {
        articleService.delete(idArticle);
        return "redirect:/userPanel";
    }

}
