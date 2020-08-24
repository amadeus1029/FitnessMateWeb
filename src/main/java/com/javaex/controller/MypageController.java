package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.javaex.vo.ExerciseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String Schedule(HttpSession session) {
        UserVo user = (UserVo) session.getAttribute("authUser");

        if("trainer".equals(user.getUserType())) {
            System.out.println("트레이너 마이페이지 스케쥴 이동");

        }else {
            System.out.println("일반회원 마이페이지 스케쥴 이동");
        }
    	
        return "mypage/schedule";
    }
    
    @RequestMapping("/manageExercise")
    public String ManageTraining(HttpSession session, Model model) {
        UserVo user = (UserVo) session.getAttribute("authUser");

        if("trainer".equals(user.getUserType())) {
            int trainerNo = user.getUserNo();
            List<ExerciseVo> exList = mypageService.getExList(trainerNo);
            System.out.println(exList);
            model.addAttribute("exList", exList);
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
        }
    	
        return "mypage/manageExercise";
    }

    @ResponseBody
    @RequestMapping("/addExercise")
    public boolean addExercise(HttpSession session, @RequestBody ExerciseVo exVo) {
        UserVo user = (UserVo) session.getAttribute("authUser");
        exVo.setTrainerNo(user.getUserNo());
        return mypageService.addExercise(exVo);
    }

    @ResponseBody
    @RequestMapping("/deleteExercise")
    public boolean deleteExercise(HttpSession session, @RequestBody ExerciseVo exVo) {
        UserVo user = (UserVo) session.getAttribute("authUser");
        exVo.setTrainerNo(user.getUserNo());
        System.out.println("deleteExercise get:");
        System.out.println(exVo);
        return mypageService.deleteExercise(exVo);
    }
    
    @RequestMapping("/manageUser")
    public String ManageUser(HttpSession session) {
        UserVo user = (UserVo) session.getAttribute("authUser");

        if("trainer".equals(user.getUserType())) {
            System.out.println("트레이너 운동관리 이동");
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
        }
    	
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
    public String RecordEx(HttpSession session) {
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
