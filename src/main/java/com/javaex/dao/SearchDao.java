package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;
import com.javaex.vo.UserVo;

@Repository
public class SearchDao {
	
	@Autowired
	private SqlSession sqlSession;

	//지역정보 받기
	public List<AddressVo> provinceList() {
		System.out.println("searchDao:province list");
		
		return sqlSession.selectList("search.addressProvince");
	}

	//구정보 받기
	public List<Object> cityList(String province) {
		System.out.println("searchDao:city list");
		System.out.println(province);
		
		return sqlSession.selectList("search.addressCity",province);
	}

	
	//동정보 받기
	public List<Object> regionList(String city) {
		System.out.println("searchDao:region list");
		System.out.println(city);
		
		return sqlSession.selectList("search.addressRegion",city);
	}
	
	
	///////////////////////////////////////////////////////

	//전문분야 정보 받기
	public List<InterestFieldVo> fieldList() {
		System.out.println("searchDao:field list");
		return sqlSession.selectList("search.fieldname");
	}

	
	
	///////////////////////////////////////////////////////
	
	public List<UserVo> userList() {
		System.out.println("searchDao:userList");
		
		List<UserVo> print = sqlSession.selectList("search.userList");
		System.out.println(print);
		
		return print;
	}
	
	
	
	public List<UserVo> userList(Map<String, Object> listMap) {
		System.out.println("searchDao:userList");
		System.out.println(listMap.toString());
		
		List<UserVo> print = sqlSession.selectList("search.userList",listMap);
		System.out.println(print);
		
		return print;
	}
	
	

}
