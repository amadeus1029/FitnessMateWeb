package com.javaex.vo;

public class PtVo {
	
	private int ptNo;
	private int userNo;
	private String userId;
	private String name;
	private String profileImg;
	private int endDate;
	private int regCount;
	private int scheduleCount;
	private boolean proceed;

	public PtVo() {}

	public int getPtNo() {
		return ptNo;
	}

	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}

	public boolean isProceed() {
		return proceed;
	}

	public void setProceed(boolean proceed) {
		this.proceed = proceed;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getEndDate() {
		return endDate;
	}

	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}

	public int getRegCount() {
		return regCount;
	}

	public void setRegCount(int regCount) {
		this.regCount = regCount;
	}

	public int getScheduleCount() {
		return scheduleCount;
	}

	public void setScheduleCount(int scheduleCount) {
		this.scheduleCount = scheduleCount;
	};
	
	
	
}
