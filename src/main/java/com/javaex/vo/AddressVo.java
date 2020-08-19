package com.javaex.vo;

public class AddressVo {
	
	//필드
	private String prorince; //시,도
	private String city;	//구
	private String region;	//동
	
	//생성자
	public AddressVo() {}
	public AddressVo(String prorince, String city, String region) {
		super();
		this.prorince = prorince;
		this.city = city;
		this.region = region;
	}
	
	//g/s
	public String getProrince() {
		return prorince;
	}
	public void setProrince(String prorince) {
		this.prorince = prorince;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	//toString
	
	@Override
	public String toString() {
		return "AddressVo [prorince=" + prorince + ", city=" + city + ", region=" + region + "]";
	}

	

}
