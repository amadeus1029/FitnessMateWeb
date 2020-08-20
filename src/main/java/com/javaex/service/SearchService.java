package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SearchDao;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;

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

	
	//전문분야 불러오기
	public List<InterestFieldVo> addField() {
		System.out.println("SearchService:Interest list");
		List<InterestFieldVo> fieldVo = searchDao.fieldList();
		return fieldVo;
	}
	
	
	

}
