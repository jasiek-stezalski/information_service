package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Role;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.RoleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;
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
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
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

        UsernamePasswordAuthenticationToken newAuthentication = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), nowAuthorities);
        SecurityContextHolder.getContext().setAuthentication(newAuthentication);

    }

    @Override
    public void delete(String username) {
        User user = userRepository.findByUsername(username);
        userRepository.delete(user);
    }

}
