package com.pack.information_service.controller;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.service.ArticleErrorService;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.PictureService;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping(value = "/articlePanel")
public class ArticlePanelController {

    private ArticleService articleService;
    private UserService userService;
    private PictureService pictureService;
    private ArticleErrorService articleErrorService;

    @Autowired
    public ArticlePanelController(ArticleService articleService, UserService userService, PictureService pictureService,
                                  ArticleErrorService articleErrorService) {
        this.articleService = articleService;
        this.userService = userService;
        this.pictureService = pictureService;
        this.articleErrorService = articleErrorService;
    }

    @GetMapping("/addArticle")
    public String addArticle(Model model) {
        model.addAttribute("articleForm", new Article("in progress"));
        model.addAttribute("categories", articleService.getCategories());
        return "articleEdition";
    }

    @PostMapping("/addArticle")
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
        return "redirect:/articlePanel/yourArticles";
    }

    @GetMapping("/proposeArticle")
    public String proposeArticle(Model model) {
        model.addAttribute("articleForm", new Article());
        return "proposeArticle";
    }

    @PostMapping("/proposeArticle")
    public String proposeArticle(@ModelAttribute("articleForm") @Valid Article articleForm, BindingResult result) {
        if (result.hasErrors()) {
            return "proposeArticle";
        }

        articleService.propose(articleForm);
        return "redirect:/userPanel";
    }

    @GetMapping("/takeArticle/{idArticle}")
    public String takeArticle(@PathVariable Long idArticle) {
        articleService.take(idArticle);
        return "redirect:/articlePanel/updateArticle/" + idArticle;
    }

    @GetMapping("/updateArticle/{idArticle}")
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

    @PostMapping("/changeStatus")
    public String changeStatus(@RequestParam Long idArticle, @RequestParam String status) {
        articleService.save(idArticle, status);
        return "redirect:/articlePanel/yourArticles";
    }

    @PostMapping("/setPriority")
    public String setPriority(@RequestParam Long idArticle, @RequestParam Integer priority) {
        articleService.save(idArticle, priority);
        return "redirect:/userPanel";
    }

    @GetMapping("/deleteArticle/{idArticle}")
    public String deleteArticle(@PathVariable Long idArticle) {
        articleService.delete(idArticle);
        return "redirect:/articlePanel/yourArticles";
    }

    @GetMapping("/errorFixed/{idError}")
    public String errorFixed(@PathVariable Long idError) {
        articleErrorService.save(idError);
        return "redirect:/userPanel";
    }

    @GetMapping("/yourArchive")
    public String archiveArticle(Model model) {
        model.addAttribute("articles", articleService.findByStatusAndCategoryOrUser("archive"));
        return "archive";
    }

    @GetMapping("/moderatorArchive")
    public String moderatorArchive(Model model) {
        model.addAttribute("articles", articleService.findByStatusAndUser("archive"));
        return "archive";
    }

    @GetMapping("/allArchive")
    public String allArchive(Model model) {
        model.addAttribute("articles", articleService.findByStatus("archive"));
        return "archive";
    }

    @GetMapping("/yourArticles")
    public String yourArticles(Model model) {
        model.addAttribute("articles", articleService.findByStatusAndUser("in progress"));
        return "yourArticles";
    }

    @GetMapping("/proposedArticles")
    public String proposedArticles(Model model) {
        model.addAttribute("articles", articleService.findByStatus("proposed"));
        return "proposedArticles";
    }

    @GetMapping("/displayedCategoryArticles")
    public String displayedCategoryArticles(Model model) {
        model.addAttribute("articles", articleService.findByStatusAndCategoryOrderByPriority("to display"));
        return "displayedArticles";
    }

    @GetMapping("/displayedAllArticles")
    public String displayedAllArticles(Model model) {
        model.addAttribute("articles", articleService.findByStatusOrderByPriority("to display"));
        return "displayedArticles";
    }

    @GetMapping("/articlesCategoryToDisplay")
    public String articlesCategoryToDisplay(Model model) {
        model.addAttribute("articles", articleService.findByStatusAndCategoryOrderByPriority("checked"));
        return "articlesToDisplay";
    }

    @GetMapping("/allArticlesToDisplay")
    public String allArticlesToDisplay(Model model) {
        model.addAttribute("articles", articleService.findByStatusOrderByPriority("checked"));
        return "articlesToDisplay";
    }


    @GetMapping("/articlesCategoryToCheck")
    public String articlesCategoryToCheck(Model model) {
        model.addAttribute("articles", articleService.findByStatusAndCategoryOrderByPriority("to check"));
        return "articlesToCheck";
    }

    @GetMapping("/allArticlesToCheck")
    public String allArticlesToCheck(Model model) {
        model.addAttribute("articles", articleService.findByStatusOrderByPriority("to check"));
        return "articlesToCheck";
    }

    @GetMapping("/errorsInArticles")
    public String errorsInArticles(Model model) {
        model.addAttribute("articles", articleService.findByError());
        return "errorsInArticles";
    }
}
