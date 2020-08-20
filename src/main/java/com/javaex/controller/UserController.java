package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.UserService;
import com.javaex.vo.InterestVo;
import com.javaex.vo.UserVo;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService; 
	
	/*
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("/user/login");
		
		UserVo authUser = userService.login(userVo);
		
		if(authUser != null) { //로그인 성공 시
			session.setAttribute("authUser", authUser);
			return "redirect:/main";
			
		} else{ //로그인 실패 시
			System.out.println("실패");
			return "redirect:/user/loginForm?result=fail";
		}
	}
	*/
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("/user/logout");
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/main";
	}

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
    					@RequestParam("profileImage") MultipartFile profileImg,
    					Model model) {
    	System.out.println("/signUp");
    	
    	vo = userService.signUp(vo, profileImg);

    	model.addAttribute("vo", vo);
    	
    	
    	if(vo.getuserType().equals("trainer")) {
    		List<String> provinceList = userService.getAddress();
    		model.addAttribute("provinceList", provinceList);
    		
    		List<InterestVo> interestList = userService.getInterestList();
    		model.addAttribute("interestList", interestList);
    		
    		return "user/signUpServe";
    		
    	}else {
    		
    		return "user/signUpComplete";
    	}
    }
    
    @RequestMapping("/signUpComplete")
    public String signUpComplete(@ModelAttribute UserVo vo,
    							@RequestParam("fieldNo") List<Integer> fieldList,
    							@RequestParam("careerRecord") List<String> careerList,
    							Model model) {
    	System.out.println("/signUpComplete");
    	
    	return "user/signUpComplete";
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
    
    @ResponseBody
    @RequestMapping("/getCity")
    public List<String> getCity(String thisProvince) {
    	System.out.println("/getCity");
    	
    	List<String> cityList = userService.getCityList(thisProvince);
		
		return cityList;
    }
    
    @ResponseBody
    @RequestMapping("/getRegion")
    public List<String> getRegion(String thisCity) {
    	System.out.println("/getCity");
    	
    	List<String> regionList = userService.getRegionList(thisCity);
		
		return regionList;
    }
    
}
