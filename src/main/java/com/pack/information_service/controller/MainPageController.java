package com.pack.information_service.controller;

import com.pack.information_service.service.impl.ArticlePanelFacade;
import com.pack.information_service.service.impl.MainPageFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {

    private MainPageFacade mainPageFacade;
    private ArticlePanelFacade articlePanelFacade;

    @Autowired
    public MainPageController(MainPageFacade mainPageFacade, ArticlePanelFacade articlePanelFacade) {
        this.mainPageFacade = mainPageFacade;
        this.articlePanelFacade = articlePanelFacade;
    }

    @GetMapping({"/", "mainPage"})
    public String homePage(Model model) {
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
        }
        return "userPanel";
    }

}
