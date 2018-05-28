package com.pack.information_service.controller;

import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.RoleService;
import com.pack.information_service.service.UserService;
import com.pack.information_service.service.impl.ArticlePanelFacade;
import com.pack.information_service.service.impl.MainPageFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MainPageController {

    private MainPageFacade mainPageFacade;
    private ArticlePanelFacade articlePanelFacade;
    private UserService userService;
    private RoleService roleService;
    private ArticleService articleService;

    @Autowired
    public MainPageController(MainPageFacade mainPageFacade, ArticlePanelFacade articlePanelFacade, UserService userService,
                              RoleService roleService, ArticleService articleService) {
        this.mainPageFacade = mainPageFacade;
        this.articlePanelFacade = articlePanelFacade;
        this.userService = userService;
        this.roleService = roleService;
        this.articleService = articleService;
    }

    @GetMapping({"/", "mainPage"})
    public String homePage(Model model, HttpServletRequest request, HttpServletResponse response) {
        if (userService.isBlocked(request, response)) {
            model.addAttribute("blocked", true);
            return "/login";
        }
        mainPageFacade.generateContent();
        model.addAttribute("articles", mainPageFacade);
        return "mainPage";
    }

    @GetMapping("/userPanel")
    public String userPanel(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String role = String.valueOf(authentication.getAuthorities());
        if (role.equals("[JOURNALIST]") || role.equals("[MODERATOR]") || role.equals("[EDITOR_IN_CHIEF]")) {
            articlePanelFacade.generateContent();
            model.addAttribute("articles", articlePanelFacade);
            if (role.equals("[EDITOR_IN_CHIEF]")) model.addAttribute("statistics", articleService.getStatistics());
        } else if (role.equals("[ADMIN]")) {
            model.addAttribute("users", userService.findAll());
            model.addAttribute("allRoles", roleService.findAll());
            model.addAttribute("categories", articleService.getCategories());
        }
        return "userPanel";
    }

}
