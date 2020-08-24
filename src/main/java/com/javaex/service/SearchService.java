package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SearchDao;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;
import com.javaex.vo.UserVo;

@Service
public class SearchService {
	
	@Autowired
	private SearchDao searchDao; 

	//지역목록 불러오기
	public List<AddressVo> addProvince() {
		System.out.println("SearchService:Province list");
		List<AddressVo> addVo = searchDao.provinceList();		
		return addVo;
	}

	//구목록 불러오기
	public List<Object> addCity(String province) {
		System.out.println("SearchService:city list");
		System.out.println("Service:"+province);
		List<Object> cityList = searchDao.cityList(province);		
		return cityList;
	}
	
	//동목록 불러오기
	public List<Object> addRegion(String city) {
		System.out.println("SearchService:city list");
		System.out.println("Service:"+city);
		List<Object> regionList = searchDao.regionList(city);		
		return regionList;
	}

	//////////////////////////////////////////////////
	
	//전문분야 불러오기
	public List<InterestFieldVo> addField() {
		System.out.println("SearchService:Interest list");
		List<InterestFieldVo> fieldVo = searchDao.fieldList();
		return fieldVo;
	}

	
	//////////////////////////////////////////////////
	
	//트레이너 리스트
	public List<UserVo> userList() {
		System.out.println("SearchService:userList");
		
		List<UserVo> userVo = searchDao.userList();
		
		return userVo;
		
	}
	
	
	
	//트레이너 검색
	public List<UserVo> userList(String province, String city, String region, String gender, String field,
			String name) {
		System.out.println("SearchService:userList");
		
		Map<String,Object> listMap = new HashMap<>();
		
		listMap.put("location",province+"|"+city+"|"+region);
		listMap.put("field",field);
		listMap.put("gender",gender);
		listMap.put("name",name);
		
		
		
		List<UserVo> userVo = searchDao.interestList(listMap);
		
		
		return userVo;
	}
	
	
	

}
