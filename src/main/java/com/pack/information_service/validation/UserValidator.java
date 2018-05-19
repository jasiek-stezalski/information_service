package com.pack.information_service.validation;

import com.pack.information_service.domain.User;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

    private UserService userService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserValidator(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        User user = (User) o;

        if (user.getUsername().length() < 8 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        } else if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }

    }

    public User usernameValidate(User userForm, Errors errors) {
        User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        if (userForm.getUsername().length() < 8 || userForm.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        } else if (userService.findByUsername(userForm.getUsername()) != null && !userForm.getUsername().equals(user.getUsername())) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        } else if (userForm.getUsername().equals(user.getUsername())) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        user.setUsername(userForm.getUsername());

        return user;
    }

    public User passwordValidate(User userForm, Errors errors) {
        User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        if (userForm.getPassword().length() < 8 || userForm.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        } else if (userForm.getOldPassword().equals(userForm.getPassword())) {
            errors.rejectValue("password", "Different.userForm.oldPassword");
        }

        if (!passwordEncoder.matches(userForm.getOldPassword(), user.getPassword())) {
            errors.rejectValue("oldPassword", "Different.user.oldPassword");
        }

        if (!userForm.getConfirmPassword().equals(userForm.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }

        user.setPassword(passwordEncoder.encode(userForm.getPassword()));

        return user;
    }

}
