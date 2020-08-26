package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javaex.dao.ExerciseDao;
import com.javaex.dao.RecordDao;
import com.javaex.dao.ScheduleDao;
import com.javaex.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;

@Service
public class MypageService {
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private ExerciseDao exerciseDao;

	@Autowired
	private RecordDao recordDao;

	@Autowired
	private ScheduleDao scheduleDao;

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
	public List<ExerciseVo> showList() {
		return  exerciseDao.showList();
	}

	public List<ExerciseVo> partList(int trainerNo) {
		return  exerciseDao.partList(trainerNo);
	}

	public ExerciseVo addExercise(ExerciseVo exVo) {
		exerciseDao.insert(exVo);
		int exNo = exVo.getExNo();
		return exerciseDao.selectByNo(exNo);
	}

	public Boolean deleteExercise(ExerciseVo exVo) {
		return exerciseDao.delete(exVo);
	}

	public int recordExercise(List<RecordVo> recordList) {
		return recordDao.insertRecordList(recordList);
	}

	public List<ExerciseVo> showExPart(ExerciseVo exVo) {
		return exerciseDao.showExPart(exVo);
	}

	public boolean addSchedule(ScheduleVo scheduleVo) {
		return scheduleDao.insert(scheduleVo);
	}

	public List<ScheduleVo> getScheduleList(int trainerNo) {
		return scheduleDao.getScheduleList(trainerNo);
	}

}
