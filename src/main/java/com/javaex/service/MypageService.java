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

	/* 프로필수정 페이지로 이동 */
	public Map<String, Object> getProfile(String userType, int userNo) {
		System.out.println("/마이페이지 서비스/프로필 수정");
		
		//데이터 화면으로 보내줄 맵
		Map<String, Object> proMap = new HashMap<>();

		//기본프로필
		UserVo vo = userDao.selectProfile(userNo);
		proMap.put("userVo", vo);
		if("trainer".equals(userType)) {

			//주소 자를 배열
			String[] splitAddress = new String[3];
			
			//주소 자르기
			if(vo.getLocation() != null) {
				splitAddress = vo.getLocation().split("[|]");
				proMap.put("splitAddress", splitAddress);
			}else {
				splitAddress = " | | ".split("[|]");
				proMap.put("splitAddress", splitAddress);
			}
			
			//생년월일 자르기
			if(vo.getBirthDate() != null) {
				String[] splitBirthDate = vo.getBirthDate().split("[/]");
				proMap.put("splitBirthDate", splitBirthDate);
			}
			
			//경력상세
			List<CareerVo> careerList = userDao.selectCareerList(userNo);
			proMap.put("careerList", careerList);

			//user 선택 전문분야
			List<String> userInterest = userDao.selectUserInterest(userNo); 
			proMap.put("userInterest", userInterest);

			//전체 전문분야 리스트
			List<InterestVo> interestList = userDao.selectInterestAll(); 
			proMap.put("interestList", interestList);
			
			//기본 주소 정보들
			List<String> provinceList = userDao.selectAddress();
			List<String> cityList = userDao.selectCity(splitAddress[0]);
			List<String> regionList = userDao.selectRegion(splitAddress[1]);

			//맵에 기본 데이터 넣기
			proMap.put("provinceList", provinceList);
			proMap.put("cityList", cityList);
			proMap.put("regionList", regionList);
		}
		
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

	public ScheduleVo getSchedule(ScheduleVo scheduleVo) {
		return scheduleDao.getSchedule(scheduleVo);
	}

	public boolean modifySchedule(ScheduleVo scheduleVo) {
		return scheduleDao.modifySchedule(scheduleVo);
	}

	public boolean deleteSchedule(ScheduleVo scheduleVo) {
		return scheduleDao.deleteSchedule(scheduleVo);
	}
	
	public void deleteCareer(int careerNo) {
		userDao.deleteCareer(careerNo);
	}
}
