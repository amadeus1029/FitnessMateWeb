package com.javaex.vo;

public class UserVo {
	
	private int userNo; /* 회원번호 PK */
	private String userId; /* 아이디 */
	private String password; /* 패스워드 */
	private String name; /* 이름 */
	private String gender; /* 성별 */
	private String phone; /* 전화번호 */
	private String age; /* 나이 */
	private String userCode; /* 회원구분 */
	private String profileImg; /* 프로필img경로 */
	private String introduction; /* 자기소개 */
	private int career; /* 경력 */
	private String location; /* 지역 */
	private String company; /* 소속회사 */
	private String price; /* 가격 */
	
	public UserVo() {}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userId=" + userId + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", phone=" + phone + ", age=" + age + ", userCode=" + userCode
				+ ", profileImg=" + profileImg + ", introduction=" + introduction + ", career=" + career + ", location="
				+ location + ", company=" + company + ", price=" + price + "]";
	}
	

}
