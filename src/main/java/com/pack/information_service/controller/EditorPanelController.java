package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.domain.User;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.PictureService;
import com.pack.information_service.service.UserService;
import com.pack.information_service.service.impl.ArticlePanelFacade;
import com.pack.information_service.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class EditorPanelController {

    private ArticleService articleService;
    private UserService userService;
    private PictureService pictureService;
    private ArticlePanelFacade articlePanelFacade;
    private UserValidator userValidator;

    @Autowired
    public EditorPanelController(ArticleService articleService, UserService userService, PictureService pictureService,
                                 ArticlePanelFacade articlePanelFacade, UserValidator userValidator) {
        this.articleService = articleService;
        this.userService = userService;
        this.pictureService = pictureService;
        this.articlePanelFacade = articlePanelFacade;
        this.userValidator = userValidator;
    }

    @GetMapping("/userPanel")
    public String userPanel(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String role = String.valueOf(authentication.getAuthorities());
        if (role.equals("[JOURNALIST]") || role.equals("[MODERATOR]") || role.equals("[EDITOR_IN_CHIEF]")) {
            articlePanelFacade.generateContent();
            model.addAttribute("articles", articlePanelFacade);
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
    public String addArticle(@ModelAttribute("articleForm") @Valid Article articleFrom, BindingResult result,
                             @RequestParam MultipartFile file, @RequestParam String description, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("categories", articleService.getCategories());
            return "articleEdition";
        }

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
        articleService.save(idArticle, status);
        return "redirect:/userPanel";
    }

    @PostMapping("article/setPriority")
    public String setPriority(@RequestParam Long idArticle, @RequestParam Integer priority) {
        articleService.save(idArticle, priority);
        return "redirect:/userPanel";
    }

    @GetMapping("/deleteArticle/{idArticle}")
    public String deleteArticle(@PathVariable Long idArticle) {
        articleService.delete(idArticle);
        return "redirect:/userPanel";
    }

    @GetMapping("/updateUser")
    public String updateUser(Model model) {
        User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("userForm", user);
        return "userEdition";
    }

    @PostMapping("/updateUsername")
    public String updateUsername(@ModelAttribute("userForm") @Valid User userForm, BindingResult result) {
        User user = userValidator.usernameValidate(userForm, result);

        if (result.hasErrors()) return "userEdition";

        userService.update(user);

        return "redirect:/userPanel";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@ModelAttribute("userForm") @Valid User userForm, BindingResult result) {
        User user = userValidator.passwordValidate(userForm, result);

        if (result.hasErrors()) return "userEdition";

        userService.update(user);

        return "redirect:/userPanel";
    }

    @GetMapping("/deleteUser")
    public String deleteUser() {
        userService.delete(SecurityContextHolder.getContext().getAuthentication().getName());
        return "redirect:/logout";
    }

}
