package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SearchService;
import com.javaex.vo.UserVo;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	//검색하기
	@ResponseBody
	@RequestMapping("/search/results")
	public List<UserVo> results(@RequestParam(value="province",required=false) String province,
						  @RequestParam(value="city",required=false) String city,
						  @RequestParam(value="region",required=false) String region,
						  @RequestParam(value="gender",required=false) String gender,
						  @RequestParam(value="field",required=false) String field,
						  @RequestParam(value="name",required=false) String name
						  ) 
	{   System.out.println("controller"+province+city+region+gender+field+name);
		List<UserVo> userVo  = searchService.userList(province,city,region,gender,field,name);
		System.out.println("controller:search/results");
				
		return userVo;
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
	
	///////////////////////////////////////////////////////////////////////////
	
	
	//트레이너 세부정보 불러오기
	@ResponseBody
	@RequestMapping("/search/trainerInfo")
	public UserVo trainerInfo(@RequestParam("no") int no) {
		System.out.println("controller:/search/trainerInfo");
				
		return searchService.trainerInfo(no);
		
	}
	
	
}
