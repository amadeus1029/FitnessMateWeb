package com.javaex.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PtDao;
import com.javaex.dao.RecordDao;
import com.javaex.dao.ScheduleDao;
import com.javaex.vo.InbodyVo;
import com.javaex.vo.PtVo;
import com.javaex.vo.RecordVo;
import com.javaex.vo.ScheduleVo;
import com.javaex.vo.SummaryVo;
import com.javaex.vo.UserVo;

@Service
public class Mypage2Service {
	
	@Autowired
	private PtDao ptDao;

	@Autowired
	private RecordDao recordDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
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

	public Map<String, Object> getUserInfo(int ptNo) {
		System.out.println("service 트레이니 1개 받아오기");
		System.out.println("ptNo : "+ptNo);
		
		PtVo ptVo = ptDao.selectPtInfo(ptNo);
		
		List<InbodyVo> inbodyList = ptDao.selectInbodyList(ptNo);
		System.out.println(inbodyList);
		List<RecordVo> recordList = recordDao.getRecordList(ptNo);
		
		//오늘 날짜
		int today = getToday();

		//pt진행상황 데이터 넣기
		if(ptVo.getIntEndDate() < today || ptVo.getRegCount() < ptVo.getScheduleCount()) {
			ptVo.setProceed(false);
			System.out.println("끝");
		}else {
			ptVo.setProceed(true);
			System.out.println("아직 안끝");
		}
		
		//화면으로 보내줄 맵
		Map<String, Object> userInfo = new HashMap<>();
		userInfo.put("ptInfo", ptVo); //ptInfo
		userInfo.put("inbodyList", inbodyList);
		userInfo.put("recordList", recordList);
		
		return userInfo;
	}

	public UserVo getUserInfo(String keyword) {
		System.out.println("service 회원 검색");
		
		return ptDao.selectUserInfo(keyword);
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
	
	public InbodyVo getInbodyInfo(int inbodyNo) {
		System.out.println("service 인바디 가져오기");
		
		return ptDao.selectInbodyInfo(inbodyNo);
	}
	
	public InbodyVo saveInbody(int ptNo, float weight, float percentFat, float muscleMass, float bmi) {
		System.out.println("service 인바디 저장");
		
		InbodyVo inbodyVo = new InbodyVo(ptNo, weight, percentFat, muscleMass, bmi);
		
		ptDao.insertInbody(inbodyVo);
		
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		inbodyVo.setMeasureDate(today);
		
		return inbodyVo;
	}
	
	public void extendPt(int ptNo, int extendMonth, int extendCount) {
		System.out.println("service pt 연장");
		
		Map<String, Integer> extendMap = new HashMap<>();
		extendMap.put("ptNo", ptNo);
		extendMap.put("extendMonth", extendMonth);
		extendMap.put("extendCount", extendCount);
		
		ptDao.updatePt(extendMap);
	}
	
	public Map<String, Object> getUserInbodyList(int userNo) {
		System.out.println("service 개인회원 인바디리스트");
		
		Map<String, Object> inbodyInfo = new HashMap<>();
		inbodyInfo.put("inbodyList", ptDao.selectUserInbodyList(userNo));
		inbodyInfo.put("recentInbody", ptDao.selectRecentInbody(userNo));
		
		return inbodyInfo;
	}
	
	public Map<String, Object> summary(int userNo) {
		//평점, 리뷰갯수 vo에 담아오기
		SummaryVo summaryVo = scheduleDao.getReviewCount(userNo);
		
		//누적회원
		summaryVo.setCountAll(scheduleDao.countAll(userNo));
		
		//현재회원
		summaryVo.setCountCurrent(scheduleDao.countCurrent(userNo));
		
		//오늘 스케쥴 리스트
		List<ScheduleVo> scheduleList = scheduleDao.getTodaySchedule(userNo);
		
		Map<String, Object> summary = new HashMap<>();
		summary.put("summaryVo", summaryVo);
		summary.put("scheduleList", scheduleList);
		
		return summary;
	}
	
	public PtVo summaryNormal(int userNo) {
		
		PtVo ptVo = ptDao.summaryNormal(userNo);
		
		return ptVo;
	}
	
	//오늘 날짜 가져오기
	public int getToday() {
		
		String localDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		int today = Integer.parseInt(localDate);

		return today;
	}
	

}
