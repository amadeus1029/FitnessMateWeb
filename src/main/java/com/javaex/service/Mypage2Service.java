package com.javaex.service;

import java.util.Calendar;
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
		
		//pt진행상황 데이터 넣기
		if(ptVo.getIntEndDate() < today || ptVo.getRegCount() < ptVo.getScheduleCount()) {
			ptVo.setProceed(false);
		}else {
			ptVo.setProceed(true);
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
		Calendar cal = Calendar.getInstance();

		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String day = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
		int today = Integer.parseInt(""+year+month+day);
		
		return today;
	}


}
