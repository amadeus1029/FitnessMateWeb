package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class UserController {


    @RequestMapping("/signUp")
    public String SignUp() {
    	System.out.println("/signUp");
        return "user/signUp";
    }
 

    
    
}
