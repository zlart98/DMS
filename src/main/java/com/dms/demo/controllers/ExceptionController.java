package com.dms.demo.controllers;


import com.dms.demo.exception.InputFormanException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(InputFormanException.class)
    public String errorValidation(InputFormanException e, RedirectAttributes redirectAttributes , HttpServletRequest request) {
        String[] path = request.getServletPath().substring(1).split("/");
        redirectAttributes.addFlashAttribute("inputFormatException", e.getMessage());

        return "redirect:/" + path[0];
    }
}