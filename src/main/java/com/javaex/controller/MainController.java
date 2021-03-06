 package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.SearchService;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;
import com.javaex.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	private SearchService searchService;
	

    @RequestMapping("/main")
    public String Main() {
    	
        return "index";
    }
    
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("/user/logout");
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/main";
	}
	
    @RequestMapping("/search")
    public String Search(Model model) {
    	
    	//지역 불러오기
    	List<AddressVo> addVo = searchService.addProvince();
    	//지역정보 받기
    	model.addAttribute("addVo", addVo);
    	
    	//전문분야 불러오기
    	List<InterestFieldVo> fieldVo = searchService.addField();
    	//전문분야 받기
    	model.addAttribute("fieldVo", fieldVo);
    	
    	//트레이너 정보 불러오기
    	List<UserVo> userVo  = searchService.userList();
    	//트레이너 리스트 받기
    	model.addAttribute("userVo", userVo);

        return "search";
    }
}