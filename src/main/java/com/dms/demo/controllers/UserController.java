package com.dms.demo.controllers;

import com.dms.demo.domain.Role;
import com.dms.demo.domain.User;
import com.dms.demo.service.dao.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userList(Model model){
        model.addAttribute("userList", userRepo.findAll());
        return "userList";
    }

    @GetMapping("/{idUser}")
    public String userEdit(@PathVariable("idUser") User user, Model model){
        model.addAttribute("userEdit", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping()
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user){

        if (username != null) {
            user.setUsername(username.trim());
        }

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();

        for (String key: form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.saveAndFlush(user);
        return "redirect:/user";
    }
}
