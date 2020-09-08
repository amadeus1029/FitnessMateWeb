package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.Mypage2Service;
import com.javaex.service.MypageService;
import com.javaex.service.UserService;
import com.javaex.vo.AddressVo;
import com.javaex.vo.ExerciseVo;
import com.javaex.vo.PtVo;
import com.javaex.vo.RecordVo;
import com.javaex.vo.ScheduleVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;

	@Autowired
    private Mypage2Service mypage2Service;
	
	@Autowired
	private UserService userService; 
	
    @RequestMapping("/schedule")
    public String schedule(HttpSession session, Model model) {
        UserVo user = (UserVo) session.getAttribute("authUser");

        if("trainer".equals(user.getUserType())) {
            System.out.println("트레이너 마이페이지 스케쥴 이동");
            List<PtVo> ptList  = mypage2Service.getTraineeList(user.getUserNo());
            model.addAttribute("ptList", ptList);
            List<ScheduleVo> scheduleList = mypageService.getScheduleList(user.getUserNo());
            model.addAttribute("scheduleList", scheduleList);
            
            //매 페이지마다 들어가는 상단 요약정보
            model.addAttribute("summary", mypage2Service.summary(user.getUserNo()));
            
            return "mypage/schedule";

        }else {
        	System.out.println("일반회원은 여기 오면 안돼요");
            return "error";
        }
    }
    
    @RequestMapping("/manageExercise")
    public String manageTraining(HttpSession session, Model model) {
        UserVo user = (UserVo) session.getAttribute("authUser");

        if("trainer".equals(user.getUserType())) {
            List<ExerciseVo> showList = mypageService.showList();
            int trainerNo = user.getUserNo();
            List<ExerciseVo> exList = mypageService.getExList(trainerNo);

            model.addAttribute("showList", showList);
            model.addAttribute("exList", exList);
            
            //매 페이지마다 들어가는 상단 요약정보
            model.addAttribute("summary", mypage2Service.summary(user.getUserNo()));
            return "mypage/manageExercise";
            
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping("/addExercise")
    public ExerciseVo addExercise(HttpSession session, @RequestBody ExerciseVo exVo) {
        UserVo user = (UserVo) session.getAttribute("authUser");
        exVo.setTrainerNo(user.getUserNo());
        return mypageService.addExercise(exVo);
    }

    @ResponseBody
    @RequestMapping("/showExPart")
    public List<ExerciseVo> showExPart(HttpSession session, @RequestBody ExerciseVo exVo) {
        UserVo user = (UserVo) session.getAttribute("authUser");
        exVo.setTrainerNo(user.getUserNo());
        return mypageService.showExPart(exVo);
    }

    @ResponseBody
    @RequestMapping("/deleteExercise")
    public boolean deleteExercise(HttpSession session, @RequestBody ExerciseVo exVo) {
        UserVo user = (UserVo) session.getAttribute("authUser");
        exVo.setTrainerNo(user.getUserNo());
        return mypageService.deleteExercise(exVo);
    }

    /*
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
    */
    
    @RequestMapping("/profile")
    public String profile(HttpSession session, Model model) {
       	System.out.println("/마이페이지/프로필 수정");
       	
       	UserVo userVo = (UserVo)session.getAttribute("authUser");
       	
       	Map<String, Object> proMap = mypageService.getProfile(userVo.getUserType(), userVo.getUserNo());
       	
       	model.addAttribute("profile", proMap);
       	
       	if("trainer".equals(userVo.getUserType())) {
       		
            //매 페이지마다 들어가는 상단 요약정보
            model.addAttribute("summary", mypage2Service.summary(userVo.getUserNo()));
        }


       	return "mypage/profile";
    }
    
    @RequestMapping("/recordEx")
    public String recordEx(HttpSession session, Model model) {
        UserVo user = (UserVo) session.getAttribute("authUser");

        if("trainer".equals(user.getUserType())) {
            List<ExerciseVo> partList = mypageService.partList(user.getUserNo());

            model.addAttribute("partList", partList);
            
            //매 페이지마다 들어가는 상단 요약정보
            model.addAttribute("summary", mypage2Service.summary(user.getUserNo()));
            
        }else {
            System.out.println("일반회원은 여기 오면 안돼요");
        }
    	
        return "mypage/recordEx";
    }

    
    //API controller
    @ResponseBody
    @RequestMapping("/addRecord")
    public int addRecord(@RequestBody List<RecordVo> recordList) {
        return mypageService.recordExercise(recordList);
    }

    //프로필 수정
    @RequestMapping("/modifyProfile")
    public String modifyProfile(@ModelAttribute UserVo vo,
								@ModelAttribute AddressVo address,
								@RequestParam(value="fieldNo", required=false) List<String> fieldList,
								@RequestParam(value="careerRecord", required=false) List<String> careerList,
								@RequestParam(value="birth", required=false) List<String> birthList) {
    	System.out.println("/마이페이지/프로필 수정완료");
    	
    	userService.updateProfile(vo, address, fieldList, careerList, birthList);
    	
        return "redirect:/mypage/profile";
    }
    
    //스케쥴 추가
    @ResponseBody
    @RequestMapping("/addSchedule")
    public boolean addSchedule(@RequestBody ScheduleVo scheduleVo) {
        return mypageService.addSchedule(scheduleVo);
    }


    //단일 스케쥴 조회
    @ResponseBody
    @RequestMapping("/getSchedule")
    public ScheduleVo getSchedule(@RequestBody ScheduleVo scheduleVo, HttpSession session) {
        return mypageService.getSchedule(scheduleVo);
    }

    //스케쥴 변경
    @ResponseBody
    @RequestMapping("/modifySchedule")
    public boolean modifySchedule(@RequestBody ScheduleVo scheduleVo) {
        return mypageService.modifySchedule(scheduleVo);
    }

    //스케쥴 삭제
    @ResponseBody
    @RequestMapping("/deleteSchedule")
    public boolean deleteSchedule(@RequestBody ScheduleVo scheduleVo) {
        return mypageService.deleteSchedule(scheduleVo);
    }
    
    //스케쥴 경력사항
    @ResponseBody
    @RequestMapping("/deleteCareer")
    public boolean deleteCareer(int careerNo) {
    	mypageService.deleteCareer(careerNo);
    	
        return true;
    }
}
