package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SearchService;
import com.javaex.vo.UserVo;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	
	@RequestMapping("/search/results")
	public String results(@RequestParam("province") String province,
						  @RequestParam("city") String city,
						  @RequestParam("region") String region,
						  @ModelAttribute UserVo userVo) 
	{
					
		
		searchService.searchTr(userVo);
		System.out.println(userVo);
		
				
		return "";
	}
	
	
	//주소(구) 가져오기
	@ResponseBody
	@RequestMapping("/search/getCity")
	public List<Object> getCity(@RequestParam("province") String province) {
		System.out.println("controller:search/getCity");
		List<Object> pro = searchService.addCity(province);

		return pro;
	}

	//주소(동) 가져오기
	@ResponseBody
	@RequestMapping("/search/getRegion")
	public List<Object> getRegion(@RequestParam("city") String city) {
		System.out.println("controller:search/getRegion");
		List<Object> reg = searchService.addRegion(city);

		return reg;
	}
	
	
}
