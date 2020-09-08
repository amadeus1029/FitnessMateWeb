package com.javaex.vo;

public class SummaryVo {
	
	int countAll; //누적회원
	int countCurrent; //현재회원
	int reviewCount; //리뷰갯수
	int avgScore; //리뷰 평점
	
	public SummaryVo() {}

	public SummaryVo(int countAll, int countCurrent, int reviewCount, int avgScore) {
		this.countAll = countAll;
		this.countCurrent = countCurrent;
		this.reviewCount = reviewCount;
		this.avgScore = avgScore;
	}

	public int getCountAll() {
		return countAll;
	}

	public void setCountAll(int countAll) {
		this.countAll = countAll;
	}

	public int getCountCurrent() {
		return countCurrent;
	}

	public void setCountCurrent(int countCurrent) {
		this.countCurrent = countCurrent;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getavgScore() {
		return avgScore;
	}

	public void setavgScore(int avgScore) {
		this.avgScore = avgScore;
	}

	@Override
	public String toString() {
		return "SummaryVo [countAll=" + countAll + ", countCurrent=" + countCurrent + ", reviewCount=" + reviewCount
				+ ", avgScore=" + avgScore + "]";
	}
	

}
