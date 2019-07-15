package com.qqh.practice04.product.model;

import com.qqh.practice04.util.Pager;

public class GoodsCateModel  extends Pager{
	private Integer id;
	private String code;// 类型编号
	private String name;
	private String descr;
	private String partentCode;

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

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getPartentCode() {
		return partentCode;
	}

	public void setPartentCode(String partentCode) {
		this.partentCode = partentCode;
	}

}
