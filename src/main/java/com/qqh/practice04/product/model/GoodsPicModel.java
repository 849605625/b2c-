package com.qqh.practice04.product.model;

public class GoodsPicModel {
	private Integer id;
	private String url;
	private String code;
	private String type;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "GoodsPicModel [id=" + id + ", url=" + url + ", code=" + code + ", type=" + type + "]";
	}

}
