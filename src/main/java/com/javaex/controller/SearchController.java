package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	
	@RequestMapping("/search/results")
	public String results() {
		
		
		
		
		return "search";
	}
	
	
	
	
	

}
