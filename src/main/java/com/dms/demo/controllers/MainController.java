package com.dms.demo.controllers;

import com.dms.demo.domain.Role;
import com.dms.demo.domain.User;
import com.dms.demo.service.dao.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String getMain(){
        List<User> allByRoles = userRepo.findAllByRoles(Role.ROLE_ADMIN);
        if (!allByRoles.isEmpty()){
            return "menuIsLogin";
        }
        return "menu";
    }
}
