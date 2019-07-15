package com.qqh.practice04.order.model;

import java.sql.Timestamp;

import com.qqh.practice04.util.Pager;

public class OrderInforModel  extends Pager{
	private Integer id;
	private String code;
	private String userCode;
	private Timestamp time;
	private String addrCode;
	private String state;
	private String provice;
	private String city;
	private String region;
	private String person;
	private String tel;
	private String proviceName;
	private String cityName;
	private String regionName;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(String addrCode) {
		this.addrCode = addrCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getProvice() {
		return provice;
	}

	public void setProvice(String provice) {
		this.provice = provice;
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

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getProviceName() {
		return proviceName;
	}

	public void setProviceName(String proviceName) {
		this.proviceName = proviceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

}
