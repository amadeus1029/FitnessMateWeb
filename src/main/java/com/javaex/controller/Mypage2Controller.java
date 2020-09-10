package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.Mypage2Service;
import com.javaex.vo.InbodyVo;
import com.javaex.vo.PtVo;
import com.javaex.vo.RecordVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/mypage2")
public class Mypage2Controller {
	
	@Autowired
	private Mypage2Service mypageService;
	
    @RequestMapping("/manageUser")
    public String ManageUser(HttpSession session, Model model) {
    	System.out.println("마이페이지 컨트롤러 회원가져오기");
    	
        UserVo user = (UserVo) session.getAttribute("authUser");
        List<PtVo> ptList = mypageService.getTraineeList(user.getUserNo());
        
        if("trainer".equals(user.getUserType())) {
            System.out.println("트레이너 운동관리 이동");
            
            model.addAttribute("ptList", ptList);
            
            //매 페이지마다 들어가는 상단 요약정보
            model.addAttribute("summary", mypageService.summary(user.getUserNo()));
            
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
            return "error";
        }
        return "mypage/manageUser";
    }
    
    @RequestMapping("/inbodyRecord")
    public String inbodyRecord(HttpSession session, Model model) {
    	System.out.println("마이페이지 인바디보기");
    	UserVo user = (UserVo) session.getAttribute("authUser");
    	
    	if("normal".equals(user.getUserType())) {
    		Map<String, Object> inbodyInfo= mypageService.getUserInbodyList(user.getUserNo());
    		model.addAttribute("inbodyInfo", inbodyInfo);
    		
    		//매 페이지마다 들어가는 상단 요약정보
    		model.addAttribute("summaryNormal", mypageService.summaryNormal(user.getUserNo()));
    		
    		return "mypage/userInbodyView";
    		
    	 }else {
         	System.out.println("트레이너는 여기 오면 안돼요");
             return "error";
         }
    }
    
    @RequestMapping("/exerciseRecord")
    public String exerciseRecord(HttpSession session, Model model) {
    	System.out.println("마이페이지 운동기록 보기");
    	UserVo user = (UserVo) session.getAttribute("authUser");
    	
    	if("normal".equals(user.getUserType())) {
    		Map<String, Object> exMap = mypageService.getExRecord(user.getUserNo());
    		model.addAttribute("exMap", exMap);
    		
    		//매 페이지마다 들어가는 상단 요약정보
    		model.addAttribute("summaryNormal", mypageService.summaryNormal(user.getUserNo()));
    		
    		return "mypage/exerciseRecord";
    		
    	 }else {
         	System.out.println("트레이너는 여기 오면 안돼요");
             return "error";
         }
    }
    
    //API
    @ResponseBody
    @RequestMapping("/userInfo")
    public Map<String, Object> getUserInfo(int ptNo) {
    	System.out.println("마이페이지 컨트롤러 ptInfo");

    	return mypageService.getUserInfo(ptNo);
    }
    
    @ResponseBody
    @RequestMapping("/searchUser")
    public UserVo searchUser(String keyword) {
    	System.out.println("마이페이지 컨트롤러 searchUser");
    	
    	return mypageService.getUserInfo(keyword);
    }
    
    @ResponseBody
    @RequestMapping("/addPt")
    public String addPt(int userNo, int period, int regCount, int trainerNo) {
    	System.out.println("마이페이지 컨트롤러 pt등록");
    	
    	mypageService.addPt(userNo, period, regCount, trainerNo);
    	
    	return "success";
    }
    
    @ResponseBody
    @RequestMapping("/modifyMemo")
    public String modifyMemo(int ptNo, String memo) {
    	System.out.println("마이페이지 컨트롤러 pt등록");
    	
    	mypageService.modifyMemo(ptNo, memo);
    	
    	return "success";
    }
    
    @ResponseBody
    @RequestMapping("getInbodyInfo")
    public InbodyVo getInbodyInfo(int inbodyNo) {
    	System.out.println("마이페이지 컨트롤러 인바디 정보");
    	
    	InbodyVo inbodyVo = mypageService.getInbodyInfo(inbodyNo);
    	
    	return inbodyVo;
    }
    
    @ResponseBody
    @RequestMapping("/saveInbody")
    public InbodyVo saveInbody(int ptNo, float weight, float percentFat, float muscleMass, float bmi) {
    	System.out.println("마이페이지 컨트롤러 인바디 저장");
    	
    	return mypageService.saveInbody(ptNo, weight, percentFat, muscleMass, bmi);
    }
    
    @ResponseBody
    @RequestMapping("/extendPt")
    public Map<String, Object> extendPt(int ptNo, int extendMonth, int extendCount) {
    	System.out.println("마이페이지 컨트롤러 pt추가");
    	
    	mypageService.extendPt(ptNo, extendMonth, extendCount);
    	
    	//변경된 정보 가져오기
    	return mypageService.getUserInfo(ptNo);
    }
    
    @ResponseBody
    @RequestMapping("/showExRecord")
    public Map<String, Object> showExRecord(int scheduleNo) {
    	System.out.println("마이페이지 컨트롤러 날짜 클릭시");
    	System.out.println("scheduleNo: "+scheduleNo);
    	
    	Map<String, Object> map = mypageService.getThisRecord(scheduleNo);
    	System.out.println(map);
    	
    	return map;
    }
    
    
}
