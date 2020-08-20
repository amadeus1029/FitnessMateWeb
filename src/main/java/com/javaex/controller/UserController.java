package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService; 


    @RequestMapping("/signUpStart")
    public String signUpStart() {
    	System.out.println("/signUpStart");

        return "user/signUp";

    }
 
    @RequestMapping("/signUpForm")
    public String signUpForm() {
    	System.out.println("/signUpForm");
    	
        return "user/signUpCommon";
    }

    @RequestMapping("/signUp")
    public String signUp(@ModelAttribute UserVo vo,
    					@RequestParam("profileImage") MultipartFile profileImg) {
    	System.out.println("/signUp");
    	
    	userService.signUp(vo, profileImg);
    	
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
