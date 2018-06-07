package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Role;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.RoleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public User findById(Long idUser) {
        return userRepository.findByIdUser(idUser);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.getOne(1L));
        user.setRoles(roles);
        userRepository.save(user);
    }

    @Override
    public void update(User user) {
        userRepository.save(user);

        Collection<? extends GrantedAuthority> nowAuthorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        UsernamePasswordAuthenticationToken newAuthentication =
                new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), nowAuthorities);
        SecurityContextHolder.getContext().setAuthentication(newAuthentication);

    }

    @Override
    public void changeRole(Long idUser, String name) {
        User user = userRepository.findByIdUser(idUser);
        Role role = roleRepository.findByName(name);

        if (user.getRole().stream().findFirst().get().getName().equals("MODERATOR")) user.setCategory(null);

        Set<Role> roles = new HashSet<Role>() {{
            add(role);
        }};
        user.setRoles(roles);

        if (name.equals("MODERATOR")) user.setCategory("News");

        userRepository.save(user);
    }

    @Override
    public void changeCategory(Long idUser, String category) {
        User user = userRepository.findByIdUser(idUser);

        user.setCategory(category);
        userRepository.save(user);
    }

    @Override
    public void lock(Long idUser) {
        User user = userRepository.findByIdUser(idUser);
        user.setBlocked(!user.isBlocked());
        userRepository.save(user);
    }

    @Override
    public boolean isBlocked(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        if (!username.equals("anonymousUser")) {
            User user = userRepository.findByUsername(username);
            if (user.isBlocked()) {
                new SecurityContextLogoutHandler().logout(request, response, auth);
                return true;
            }
        }
        return false;
    }

    @Override
    public void delete(String username) {
        User user = userRepository.findByUsername(username);
        userRepository.delete(user);
    }

    @Override
    public void delete(Long idUser) {
        User user = userRepository.findByIdUser(idUser);
        userRepository.delete(user);
    }

}
