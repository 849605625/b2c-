package com.qqh.practice04.order.model;

public class OrderGoodsModel {
	private Integer id;
	private String orderCode;
	private String goodsCode;
	private int number;
	private String price;
   private String name;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "OrderGoodsModel [id=" + id + ", orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", number="
				+ number + ", price=" + price + ", name=" + name + "]";
	}

}
