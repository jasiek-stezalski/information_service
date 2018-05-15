package com.pack.information_service.controller;

import com.pack.information_service.service.impl.MainPageFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {

    private MainPageFacade mainPageFacade;

    @Autowired
    public MainPageController(MainPageFacade mainPageFacade) {
        this.mainPageFacade = mainPageFacade;
    }

    @GetMapping({"/", "mainPage"})
    public String homePage(Model model) {
        mainPageFacade.generateContent();
        model.addAttribute("articles", mainPageFacade);
        return "mainPage";
    }

}
