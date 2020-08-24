package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PtDao;

@Service
public class Mypage2Service {
	
	@Autowired
	private PtDao ptDao;
/*
	public List<PtVo> getTraineeList(int userNo) {
		System.out.println("service 트레이니 리스트 받아오기");
		
		//오늘 날짜 가져오기
		Calendar cal = Calendar.getInstance();

		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String day = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
		String today = ""+year+month+day;
		System.out.println(today);
		
		List<PtVo> ptList = ptDao.selectTraineeList(userNo);
		System.out.println(ptList);
		
		for(PtVo ptvo: ptList) {
			
			//if(ptvo.getEndDate()<)
			
		}
		return ptList;
	}
 */
	
	

}
