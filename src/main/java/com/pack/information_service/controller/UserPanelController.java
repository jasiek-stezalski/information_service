package com.pack.information_service.controller;

import com.pack.information_service.domain.User;
import com.pack.information_service.service.ArticleService;
import com.pack.information_service.service.RoleService;
import com.pack.information_service.service.UserService;
import com.pack.information_service.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/userPanel")
public class UserPanelController {

    private UserService userService;
    private UserValidator userValidator;
    private ArticleService articleService;
    private RoleService roleService;

    @Autowired
    public UserPanelController(UserService userService, UserValidator userValidator, ArticleService articleService
            , RoleService roleService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.articleService = articleService;
        this.roleService = roleService;
    }

    @GetMapping("")
    public String userPanel() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        if (username.equals("anonymousUser")) return "redirect:/mainPage";
        return "userPanel";
    }

    @GetMapping("/updateUser")
    public String updateUser(Model model) {
        User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("userForm", user);
        return "userEdition";
    }

    @PostMapping("/changeRole")
    public String changeRole(@RequestParam Long idUser, @RequestParam String role) {
        userService.changeRole(idUser, role);
        return "redirect:/userPanel/usersList";
    }

    @PostMapping("/changeCategory")
    public String changeCategory(@RequestParam Long idUser, @RequestParam String category) {
        userService.changeCategory(idUser, category);
        return "redirect:/userPanel/usersList";
    }

    @GetMapping("/updateUsername")
    public String updateUsername() {
        return "redirect:/userPanel/updateUser";
    }

    @PostMapping("/updateUsername")
    public String updateUsername(@ModelAttribute("userForm") @Valid User userForm, BindingResult result) {
        User user = userValidator.usernameValidate(userForm, result);

        if (result.hasErrors()) return "userEdition";

        userService.update(user);

        return "redirect:/userPanel/updateUser";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@ModelAttribute("userForm") @Valid User userForm, BindingResult result) {
        User user = userValidator.passwordValidate(userForm, result);

        if (result.hasErrors()) return "userEdition";

        userService.update(user);

        return "redirect:/userPanel/updateUser";
    }

    @GetMapping("/blocked/{idUser}")
    public String lock(@PathVariable Long idUser) {
        userService.lock(idUser);
        return "redirect:/userPanel/usersList";
    }

    @GetMapping("/deleteUser")
    public String deleteUser() {
        userService.delete(SecurityContextHolder.getContext().getAuthentication().getName());
        return "redirect:/logout";
    }

    @GetMapping("/deleteUser/{idUser}")
    public String deleteUserByAdmin(@PathVariable Long idUser) {
        userService.delete(idUser);
        return "redirect:/userPanel/usersList";
    }

    @GetMapping("/stats")
    public String stats(Model model) {
        model.addAttribute("statistics", articleService.getStatistics());
        return "stats";
    }

    @GetMapping("/usersList")
    public String usersList(Model model) {
        model.addAttribute("users", userService.findAll());
        model.addAttribute("allRoles", roleService.findAll());
        model.addAttribute("categories", articleService.getCategories());
        return "usersList";
    }

}
