package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.Mypage2Service;
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
    @RequestMapping("/ptInfo")
    public PtVo getPtInfo(int ptNo, int trainerNo) {
    	System.out.println("마이페이지 컨트롤러 ptInfo");

    	PtVo ptInfo = mypageService.getPtInfo(trainerNo, ptNo);

    	return ptInfo;
    }
    
    @ResponseBody
    @RequestMapping("/searchUser")
    public UserVo searchUser(String keyword) {
    	System.out.println("마이페이지 컨트롤러 searchUser");
    	
    	UserVo userVo = mypageService.getUserInfo(keyword);
    	
    	return userVo;
    }
    	
    
    
}
