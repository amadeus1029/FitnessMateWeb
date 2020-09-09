package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;
import com.javaex.vo.ReviewVo;
import com.javaex.vo.UserVo;

@Repository
public class SearchDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 지역정보 받기
	public List<AddressVo> provinceList() {
		System.out.println("searchDao:province list");

		return sqlSession.selectList("search.addressProvince");
	}

	// 구정보 받기
	public List<Object> cityList(String province) {
		System.out.println("searchDao:city list");
		System.out.println(province);

		return sqlSession.selectList("search.addressCity", province);
	}

	// 동정보 받기
	public List<Object> regionList(String city) {
		System.out.println("searchDao:region list");
		System.out.println(city);

		return sqlSession.selectList("search.addressRegion", city);
	}

	///////////////////////////////////////////////////////

	// 전문분야 정보 받기
	public List<InterestFieldVo> fieldList() {
		System.out.println("searchDao:field list");
		return sqlSession.selectList("search.fieldname");
	}
	
	///////////////////////////////////////////////////////

	// 트레이너 리스트
	public List<UserVo> userList() {
		System.out.println("searchDao:userList");

		List<UserVo> print = sqlSession.selectList("search.userList");
		System.out.println(print);

		return print;
	}

	// 검색(전문분야제외)
	public List<UserVo> searchList(Map<String, Object> listMap) {
		System.out.println("searchDao:userList");
		List<UserVo> print = sqlSession.selectList("search.userList", listMap);
		return print;
	}

	// 검색(전문분야 포함)
	public List<UserVo> interestList(Map<String, Object> listMap) {
		System.out.println("searchDao:userList");
		List<UserVo> print = sqlSession.selectList("search.interestList", listMap);
		return print;
	}

	///////////////////////////////////////////////////////
	
	//트레이너 세부정보 보기
	public UserVo readTrainer(int no) {
		System.out.println("searchDao:readTrainer");
		
		UserVo uVo = sqlSession.selectOne("search.readTrainer",no);
		
		
		return uVo;
	}

	public List<Object> userField(int no) {
		
		List<Object> uVo = sqlSession.selectList("search.readField",no);
		
		return uVo;
	}

	public List<Object> userRecord(int no) {
		
		
		List<Object> uVo = sqlSession.selectList("search.readCareer",no);
		
		return uVo;
	}
	
	///////////////////////////////////////////////////////

	public List<ReviewVo> reviewList(int no) {
		System.out.println("searchDao:reviewList");
		
		System.out.println("다오"+no);
		List<ReviewVo> reviewVo = sqlSession.selectList("review.reviewList", no);
		System.out.println("다오: "+reviewVo);
		
		return reviewVo;
	}

	public List<ReviewVo> reviewWrite(int no) {
		System.out.println("searchDao:reviewWrite");
		
		List<ReviewVo> reviewVo = sqlSession.selectOne("review.reviewWrite", no);
		
		
		return reviewVo;
	}

	
	

}
