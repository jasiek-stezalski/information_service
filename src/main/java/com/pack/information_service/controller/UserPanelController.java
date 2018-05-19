package com.pack.information_service.controller;

import com.pack.information_service.domain.User;
import com.pack.information_service.service.UserService;
import com.pack.information_service.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/userPanel")
public class UserPanelController {

    private UserService userService;
    private UserValidator userValidator;

    @Autowired
    public UserPanelController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
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
