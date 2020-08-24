package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javaex.dao.ExerciseDao;
import com.javaex.vo.ExerciseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.CareerVo;
import com.javaex.vo.InterestVo;
import com.javaex.vo.UserVo;

@Service
public class MypageService {
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private ExerciseDao exerciseDao;

	public Map<String, Object> getProfile(int userNo) {
		System.out.println("/마이페이지 서비스/프로필 수정");
		
		//기본프로필
		UserVo vo = userDao.selectProfile(userNo);
		
		//주소 자르기
		String[] splitAddress = vo.getLocation().split("[|]");
		
		//생년월일 자르기
		String[] splitbirthDate = vo.getBirthDate().split("[/]");
		System.out.println(splitbirthDate);
		
		//전문분야
		List<String> userInterest = userDao.selectUserInterest(userNo);
		
		//경력상세
		List<CareerVo> careerList = userDao.selectCareerList(userNo);
		
		//기본적으로 깔려있는 정보들 우앙 짱많아
		List<String> provinceList = userDao.selectAddress();
		List<String> cityList = userDao.selectCity(splitAddress[0]);
		List<String> regionList = userDao.selectRegion(splitAddress[1]);
		List<InterestVo> interestList = userDao.selectInterestAll();
		
		//맵에 user 데이터 넣기
		Map<String, Object> proMap = new HashMap<>();
		proMap.put("userVo", vo);
		proMap.put("splitAddress", splitAddress);
		proMap.put("splitbirthDate", splitbirthDate);
		proMap.put("userInterest", userInterest);
		proMap.put("careerList", careerList);
		
		//맵에 기본 데이터 넣기
		proMap.put("provinceList", provinceList);
		proMap.put("cityList", cityList);
		proMap.put("regionList", regionList);
		proMap.put("interestList", interestList);
		
		return proMap;
	}

	public List<ExerciseVo> getExList(int trainerNo) {
		return  exerciseDao.getList(trainerNo);
	}

	public Boolean addExercise(ExerciseVo exVo) {
		return  exerciseDao.insert(exVo);
	}

	public Boolean deleteExercise(ExerciseVo exVo) {
		System.out.println("mypageservice get:");
		System.out.println(exVo);
		return exerciseDao.delete(exVo);
	}

}
