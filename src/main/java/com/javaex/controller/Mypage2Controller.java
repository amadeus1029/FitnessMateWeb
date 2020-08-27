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
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/mypage2")
public class Mypage2Controller {
	
	@Autowired
	private Mypage2Service mypageService;
	
    @RequestMapping("/manageUser")
    public String ManageUser(HttpSession session, Model model) {
    	System.out.println("마이페이지 컨트롤러");
    	
        UserVo user = (UserVo) session.getAttribute("authUser");
        List<PtVo> ptList = mypageService.getTraineeList(user.getUserNo());
        
        if("trainer".equals(user.getUserType())) {
            System.out.println("트레이너 운동관리 이동");
            
            model.addAttribute("ptList", ptList);
            
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
        }
        return "mypage/manageUser";
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
    	System.out.println("ptNo : "+ ptNo);
    	System.out.println("extendMonth : "+ extendMonth);
    	System.out.println("extendCount : "+ extendCount);
    	
    	mypageService.extendPt(ptNo, extendMonth, extendCount);
    	
    	//변경된 정보 가져오기
    	return mypageService.getUserInfo(ptNo);
    }
    
}
