package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.SearchService;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;


@Controller
public class MainController {
	
	@Autowired
	private SearchService searchService;

    @RequestMapping("/main")
    public String Main() {
        return "index";
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
    	
    	    	
        return "search";
    }
    
    

}