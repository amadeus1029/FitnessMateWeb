package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.vo.UserVo;


@Controller
public class MainController {

    @RequestMapping("/main")
    public String Main() {
    	
        return "index";
    }
    
    @RequestMapping("/search")
    public String Search() {
    	
        return "search";
    }
    
    @RequestMapping("/mypage")
    public String mypage(HttpSession session) {
    	UserVo user = (UserVo) session.getAttribute("authUser");
    	
    	if("trainer".equals(user.getuserType())) {
    		System.out.println("트레이너 마이페이지 이동");
    		
    		return "mypage/schedule";
    		
    	}else {
    		System.out.println("일반회원 마이페이지 이동");
    		
    		return "";
    	}
    }

}