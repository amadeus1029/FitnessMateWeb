package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.AddressDao;
import com.javaex.vo.AddressVo;

@Service
public class SearchService {
	
	@Autowired
	private AddressDao addressDao; 

	//주소목록 불러오기
	public List<AddressVo> addList() {
		System.out.println("SearchService:address list");
		
		List<AddressVo> addVo = addressDao.addList();
		
		return addVo;
	}

}
