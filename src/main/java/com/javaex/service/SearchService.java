package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SearchDao;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestFieldVo;
import com.javaex.vo.ReviewVo;
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
		
		
		
		//map에 받은 파라미터 값 담기
		Map<String,Object> listMap = new HashMap<>();
		
		//지역 정보 담기
		if(region!="") {
			listMap.put("location",province+"|"+city+"|"+region);
		} else if(city!="") {
			listMap.put("location",province+"|"+city);
		} else { listMap.put("location",province);}
		
		
		//전공,성별,이름담기
		listMap.put("field",field);
		listMap.put("gender",gender);
		listMap.put("name",name);
		
		
		if("".equals(listMap.get("field") )){
		List<UserVo> userVo = searchDao.searchList(listMap);
		return userVo;
		} //전문분야
		else {
			List<UserVo> userVo = searchDao.interestList(listMap);
			return userVo;
		}
		
		
	}
	
	
	//////////////////////////////////////////////////////////

	//트레이너 세부정보 가져오기
	public UserVo trainerInfo(int no) {
		System.out.println("SearchService:trainerInfo");
		
		UserVo uVo = searchDao.readTrainer(no);
		
		
		
		System.out.println(uVo);
		
		return uVo;
	}

	
	public List<Object> fieldInfo(int no) {
		
		List<Object> uVo = searchDao.userField(no);
		
		return uVo;
	}

	public List<Object> recordInfo(int no) {
		List<Object> uVo = searchDao.userRecord(no);
		return uVo;
	}
	
	
	public List<Object> reviewInfo(int no) {
		System.out.println("서비스:리뷰정보 불러오기");
		List<Object> uVo = searchDao.reviewInfo(no);
		return uVo;
	}
	
	
	//////////////////////////////////////////////////////////
	
	//리뷰 목록 가져오기
	public List<ReviewVo> reviewList(int no) {
		System.out.println("SearchService:reviewList");
		
		System.out.println("서비스"+no);
		List<ReviewVo> reviewVo = searchDao.reviewList(no);
		return reviewVo;
	}

	// 리뷰작성자격 확인
	public ReviewVo reviewWrite(int no) {
		System.out.println("SearchService:reviewWrite");
		ReviewVo reviewVo = searchDao.reviewWrite(no);
		return reviewVo;
	}

	
	//리뷰 추가
	public ReviewVo reviewPlus(int score, String content, int ptNo) {
		System.out.println("SearchService:reviewPlus");

		ReviewVo reviewVo = new ReviewVo(score, content,ptNo);
		System.out.println("서비스 보 확인" + reviewVo);

		searchDao.reviewPlus(reviewVo);

		int reviewNo = reviewVo.getReviewNo();

		ReviewVo vo = searchDao.reviewOne(reviewNo);

		return vo;
	}
	
	//답글추가
	public ReviewVo rereviewPlus(int score, String content, int ptNo, int reviewNo) {
		System.out.println("SearchService:rereviewPlus");
		
		Map<String,Object> remap = new HashMap<>();
		remap.put("score", score);
		remap.put("content", content);
		remap.put("reviewNo", ptNo);
		remap.put("reviewNo", reviewNo);
		
		
		
		
		return null;
	}

	// 리뷰수정
	public List<ReviewVo> reviewModify(int score, String content, int reviewNo) {
		System.out.println("SearchService:reviewPlus");
		
		Map<String,Object> remap = new HashMap<>();
		remap.put("score", score);
		remap.put("content", content);
		remap.put("reviewNo", reviewNo);
		
		searchDao.reviewModify(remap);
		System.out.println("수정내용 확인" + remap);
		
		ReviewVo vo = searchDao.reviewOne(reviewNo);
		
		int tNo = vo.getTrainerNo();
		System.out.println("트레이너 넘버확인"+tNo);
		List<ReviewVo> reviewVo = searchDao.reviewList(tNo);
		
		
		return reviewVo;
	}

	//리뷰 추가위해 pt넘버 불러오기
	public int findPt(int userNo) {
		System.out.println("SearchService:findPt");
		
		int ptNo = searchDao.findPt(userNo);
		
		return ptNo;
	}

	//리뷰삭제
	public int reviewRemove(int reviewNo) {
		System.out.println("SearchService:reviewRemove");
		
		int remove = searchDao.reviewRemove(reviewNo);
		
		return remove;
	}

	
	
	

	
	
	
	

}
