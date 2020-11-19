package com.dms.demo.controllers;

import com.dms.demo.domain.Role;
import com.dms.demo.domain.User;
import com.dms.demo.service.dao.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.nio.file.AccessDeniedException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class RegistrationController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String setUser() throws AccessDeniedException {
        List<User> allByRoles = userRepo.findAllByRoles(Role.ROLE_ADMIN);
        if (!allByRoles.isEmpty()){
            throw new AccessDeniedException("You cannot to do this operation");
        }
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) throws AccessDeniedException {
        List<User> allByRoles = userRepo.findAllByRoles(Role.ROLE_SECURITY_OFFICER);
        if (!allByRoles.isEmpty()){
            throw new AccessDeniedException("You cannot to do this operation");
        }

        Optional<User> userFromDB = userRepo.findByUsername(user.getUsername());
        if (userFromDB.isPresent()){
            model.put("message", "User exists");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.ROLE_SECURITY_OFFICER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);

        return "redirect:/login";
    }
}
