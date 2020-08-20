package com.javaex.vo;

public class AddressVo {
	
	private String province;
	private String city;
	private String region;
	
	public AddressVo() {}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
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

	@Override
	public String toString() {
		return "AddressVo [province=" + province + ", city=" + city + ", region=" + region + "]";
	}
	

}
