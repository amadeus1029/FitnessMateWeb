package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService; 

    @RequestMapping("/signUp")

    public String SignUp() {
    
    	return "user/signUp";}

    public String signUp() {
    	System.out.println("/signUp");
    	
        return "user/signUp";

    }
 
    @RequestMapping("/signUpForm")
    public String signUpForm() {
    	System.out.println("/signUpForm");
    	
        return "user/signUpCommon";
    }
    
    //API controller
    @ResponseBody
    @RequestMapping("/idCheck")
    public boolean idCheck(String newId) {
    	System.out.println("/idCheck");
    	
    	int sameId = userService.idCheck(newId);
		boolean result = false;
		
		if(sameId == 0) {
			result = true;
		}
		
		return result;
    }
    
}
