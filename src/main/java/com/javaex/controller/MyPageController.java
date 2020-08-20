package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @RequestMapping("/schedule")
    public String Schedule() {
        return "mypage/schedule";
    }
    @RequestMapping("/manageTraining")
    public String ManageTraining() {
        return "mypage/manageTraining";
    }
    @RequestMapping("/manageUser")
    public String ManageUser() {
        return "mypage/manageUser";
    }
    @RequestMapping("/profile")
    public String Profile() {
        return "mypage/profile";
    }
    @RequestMapping("/recordEx")
    public String RecordEx() {
        return "mypage/recordEx";
    }
}
