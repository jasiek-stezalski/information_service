package com.pack.information_service.controller;

import com.pack.information_service.service.UserService;
import com.pack.information_service.service.impl.MainPageFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MainPageController {

    private MainPageFacade mainPageFacade;
    private UserService userService;

    @Autowired
    public MainPageController(MainPageFacade mainPageFacade, UserService userService) {
        this.mainPageFacade = mainPageFacade;
        this.userService = userService;
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

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

}
