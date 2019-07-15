package com.qqh.practice04.sys.model;

import com.qqh.practice04.util.Pager;

public class UserModel extends Pager {
	private Integer id;
	private String code;
	private String pass;
	private String name;
	private String state;// 1为普通 2为管理

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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
