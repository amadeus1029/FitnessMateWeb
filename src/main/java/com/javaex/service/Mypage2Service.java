package com.javaex.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PtDao;
import com.javaex.vo.PtVo;

@Service
public class Mypage2Service {
	
	@Autowired
	private PtDao ptDao;

	public List<PtVo> getTraineeList(int userNo) {
		System.out.println("service 트레이니 리스트 받아오기");
		
		//오늘 날짜 가져오기
		Calendar cal = Calendar.getInstance();

		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String day = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
		int today = Integer.parseInt(""+year+month+day);
		
		List<PtVo> ptList = ptDao.selectTraineeList(userNo);
		
		for(PtVo ptVo: ptList) {
			
			if(ptVo.getEndDate() < today || ptVo.getRegCount() < ptVo.getScheduleCount()) {
				ptVo.setProceed(false);
			}else {
				ptVo.setProceed(true);
			}
		}
		
		return ptList;
	}
	
	

}
