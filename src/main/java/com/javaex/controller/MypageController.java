package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MypageService;
import com.javaex.service.UserService;
import com.javaex.vo.AddressVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private UserService userService; 
	
    @RequestMapping("/schedule")
    public String Schedule() {
    	System.out.println("/마이페이지/스케쥴");
    	
        return "mypage/schedule";
    }
    
    @RequestMapping("/manageTraining")
    public String ManageTraining() {
    	System.out.println("/마이페이지/운동관리");
    	
        return "mypage/manageTraining";
    }
    
    @RequestMapping("/manageUser")
    public String ManageUser() {
       	System.out.println("/마이페이지/회원관리");
    	
        return "mypage/manageUser";
    }
    
    @RequestMapping("/profile")
    public String profile(HttpSession session, Model model) {
       	System.out.println("/마이페이지/프로필 수정");
       	
       	UserVo userVo = (UserVo)session.getAttribute("authUser");
       	
       	Map<String, Object> proMap = mypageService.getProfile(userVo.getUserNo());
       	System.out.println(proMap);
       	
       	model.addAttribute("profile", proMap);
    	
        return "mypage/profile";
    }
    
    @RequestMapping("/recordEx")
    public String RecordEx() {
       	System.out.println("/마이페이지/운동기록");
    	
        return "mypage/recordEx";
    }
    
    //프로필 수정
    @RequestMapping("/modifyProfile")
    public String modifyProfile(@ModelAttribute UserVo vo,
								@ModelAttribute AddressVo address,
								@RequestParam("fieldNo") List<Integer> fieldList,
								@RequestParam(value="careerRecord", required=false) List<String> careerList,
								Model model) {
    	System.out.println("/마이페이지/프로필 수정완료");
    	
    	userService.deleteInterest(vo.getUserNo());
    	
    	userService.signUpTrainer(vo, address, fieldList, careerList, null);
    	
        return "redirect:/mypage/profile";
    }
    

    
    
    
}
