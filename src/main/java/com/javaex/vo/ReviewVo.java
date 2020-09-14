package com.javaex.vo;

public class ReviewVo {
	
	
	private int reviewNo;/*리뷰넘버*/
	private int ptNo;/*피티번호*/
	private String regDate;/*리뷰등록 날짜*/
	private int score;/*평점*/
	private String content;/*리뷰내용*/
	private int userNo;/*회원번호*/
	private int trainerNo;/*트레이너번호*/
	private int scheduleCount;/*트레이닝 횟수*/
	private String name;/*회원이름*/
	private int reviewCount;/*리뷰갯수*/
	private int reviewAvg;/*평점 평균*/
	
	public ReviewVo() {}
	
	
	public ReviewVo(int score, String content,int ptNo) {
		this.score = score;
		this.content = content;
		this.ptNo = ptNo;
	}
	public ReviewVo(int reviewNo, int ptNo, String regDate, int score, String content, int userNo, int trainerNo,
			int scheduleCount, String name, int reviewCount, int reviewAvg) {
		this.reviewNo = reviewNo;
		this.ptNo = ptNo;
		this.regDate = regDate;
		this.score = score;
		this.content = content;
		this.userNo = userNo;
		this.trainerNo = trainerNo;
		this.scheduleCount = scheduleCount;
		this.name = name;
		this.reviewCount = reviewCount;
		this.reviewAvg = reviewAvg;
	}


	
	public int getReviewCount() {
		return reviewCount;
	}


	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}


	public int getReviewAvg() {
		return reviewAvg;
	}


	public void setReviewAvg(int reviewAvg) {
		this.reviewAvg = reviewAvg;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScheduleCount() {
		return scheduleCount;
	}
	public void setScheduleCount(int scheduleCount) {
		this.scheduleCount = scheduleCount;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getPtNo() {
		return ptNo;
	}
	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTrainerNo() {
		return trainerNo;
	}
	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}


	@Override
	public String toString() {
		return "ReviewVo [reviewNo=" + reviewNo + ", ptNo=" + ptNo + ", regDate=" + regDate + ", score=" + score
				+ ", content=" + content + ", userNo=" + userNo + ", trainerNo=" + trainerNo + ", scheduleCount="
				+ scheduleCount + ", name=" + name + ", reviewCount=" + reviewCount + ", reviewAvg=" + reviewAvg + "]";
	}
	
	
	
	

}
