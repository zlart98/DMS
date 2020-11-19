package com.dms.demo.controllers;

import com.dms.demo.domain.Role;
import com.dms.demo.domain.User;
import com.dms.demo.exception.InputFormanException;
import com.dms.demo.service.dao.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.nio.file.AccessDeniedException;
import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping
    @Secured(value = "ROLE_SECURITY_OFFICER")
    public String userList(Principal principal, Model model) {
        List<User> users = userRepo.findAllByUsernameIsNot(principal.getName());
        model.addAttribute("userList", users);
        return "userList";
    }

    @GetMapping("/{idUser}")
    @Secured(value = "ROLE_SECURITY_OFFICER")
    public String userEdit(@PathVariable("idUser") User user, Model model) {
        model.addAttribute("userEdit", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @GetMapping("/remove/{idUser}")
    @Secured(value = "ROLE_SECURITY_OFFICER")
    public String removeUser(@PathVariable("idUser") Long userId) {
        User user = userRepo.findByIdUser(userId).orElseThrow(EntityNotFoundException::new);
        userRepo.delete(user);
        return "redirect:/user";
    }

    @PostMapping()
    @Secured(value = "ROLE_SECURITY_OFFICER")
    public String userSave(Principal principal,
                           @RequestParam String username,
                           @RequestParam("userId") Long userId,
                           @ModelAttribute(name = "Role") String role) {

        Optional<User> userfromDb = userRepo.findByUsername(username);
        Optional<User> save = userRepo.findById(userId);
        if (!save.isPresent()) {
            throw new InputFormanException("Аккаунт не найден");
        }

        User user = save.get();

        if (userfromDb.isPresent()) {
            if (!user.getIdUser().equals(userfromDb.get().getIdUser()))
                throw new InputFormanException("Аккаунт с таким логином уже существует");
        }

        if (username != null) {
            user.setUsername(username.trim());
        }

        if (username.equals("")) {
            throw new InputFormanException("Неверный ввод");
        }

        Set<Role> roles = user.getRoles();
        roles.clear();
        roles.add(Role.valueOf("ROLE_" + role));
        user.setRoles(roles);
        userRepo.saveAndFlush(user);
        return "redirect:/user";
    }

    @PostMapping("/newUser")
    @Secured(value = "ROLE_SECURITY_OFFICER")
    public String addUser(User user, @ModelAttribute(name = "Role") String role) {
        Optional<User> userFromDB = userRepo.findByUsername(user.getUsername());
        String username = user.getUsername();
        String password = user.getPassword();

        if (username != null) {
            username = username.trim();
        } else {
            throw new InputFormanException("Неверный ввод");
        }

        if (password != null) {
            password = password.trim();
        } else {
            throw new InputFormanException("Неверный ввод");
        }


        if (username.equals("") || password.equals("")) {
            throw new InputFormanException("Неверный ввод");
        }

        if (userFromDB.isPresent()) {

            throw new InputFormanException("Аккаунт с таким именем уже существует");
        }

        user.setUsername(username);
        user.setPassword(password);

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.valueOf("ROLE_" + role)));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        return "redirect:/user";
    }
}
