package com.javaex.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PtDao;
import com.javaex.vo.PtVo;
import com.javaex.vo.UserVo;

@Service
public class Mypage2Service {
	
	@Autowired
	private PtDao ptDao;
	
	public List<PtVo> getTraineeList(int trainerNo) {
		System.out.println("service 트레이니 리스트 받아오기");
		
		List<PtVo> ptList = ptDao.selectTraineeList(trainerNo);
		
		//오늘 날짜
		int today = getToday();
		
		//pt진행상황 데이터 넣기
		for(PtVo ptVo: ptList) {
			
			if(ptVo.getIntEndDate() < today || ptVo.getRegCount() < ptVo.getScheduleCount()) {
				ptVo.setProceed(false);
			}else {
				ptVo.setProceed(true);
			}
		}
		
		return ptList;
	}

	public PtVo getPtInfo(int trainerNo, int ptNo) {
		System.out.println("service 트레이니 1개 받아오기");
		
		Map<String, Integer> ptMap = new HashMap<>();
		ptMap.put("trainerNo", trainerNo);
		ptMap.put("ptNo", ptNo);

		PtVo ptVo = ptDao.selectPtInfo(ptMap);
		
		//오늘 날짜
		int today = getToday();

		System.out.println("끝날짜: "+ptVo.getIntEndDate());
		System.out.println("오늘 날짜: "+today);
		
		System.out.println("등록횟수: "+ptVo.getRegCount());
		System.out.println("스케쥴갯수: "+ptVo.getScheduleCount());
		
		System.out.println(ptVo.getIntEndDate() < today);
		System.out.println(ptVo.getRegCount() < ptVo.getScheduleCount());
		
		//pt진행상황 데이터 넣기
		if(ptVo.getIntEndDate() < today || ptVo.getRegCount() < ptVo.getScheduleCount()) {
			ptVo.setProceed(false);
			System.out.println("끝");
		}else {
			ptVo.setProceed(true);
			System.out.println("아직 안끝");
		}
		
		return ptVo;
	}

	public UserVo getUserInfo(String keyword) {
		System.out.println("service 회원 검색");
		
		UserVo userVo = ptDao.selectUserInfo(keyword);
		
		return userVo;
	}
	
	public void addPt(int userNo, int period, int regCount, int trainerNo) {
		System.out.println("service pt 추가");
		
		Map<String, Integer> regMap = new HashMap<>();
		regMap.put("userNo", userNo);
		regMap.put("period", period);
		regMap.put("regCount", regCount);
		regMap.put("trainerNo", trainerNo);
		
		ptDao.insertPt(regMap);
	}
	
	public void modifyMemo(int ptNo, String memo) {
		System.out.println("service 메모 수정");
		
		Map<String, Object> memoMap = new HashMap<>();
		memoMap.put("ptNo", ptNo);
		memoMap.put("memo", memo);
		
		ptDao.updateMemo(memoMap);
	}
	
	
	
	//오늘 날짜 가져오기
	public int getToday() {
		
		String localDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		int today = Integer.parseInt(localDate);

		return today;
	}


}
