package com.qqh.practice04.product.model;

import com.qqh.practice04.util.Pager;

public class GoodsInforModel extends Pager {
	private Integer id;
	private String code;
	private String name;
	private String price;
	private String descr;
	private int number;
	private String state;
	private String cateCode;
	private String topCode;
	private String topName;
	public String getTopName() {
		return topName;
	}

	public void setTopName(String topName) {
		this.topName = topName;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getTopCode() {
		return topCode;
	}

	public void setTopCode(String topCode) {
		this.topCode = topCode;
	}

}
