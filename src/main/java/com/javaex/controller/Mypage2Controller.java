package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.Mypage2Service;
import com.javaex.vo.PtVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class Mypage2Controller {
	
	@Autowired
	private Mypage2Service mypageService;
/*
    @RequestMapping("/manageUser")
    public String ManageUser(HttpSession session) {
    	System.out.println("마이페이지 컨트롤러");
    	
        UserVo user = (UserVo) session.getAttribute("authUser");
        List<PtVo> ptList = mypageService.getTraineeList(user.getUserNo());
        

        if("trainer".equals(user.getUserType())) {
            System.out.println("트레이너 운동관리 이동");
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
        }
    	
        return "mypage/manageUser";
    }
	*/
}
