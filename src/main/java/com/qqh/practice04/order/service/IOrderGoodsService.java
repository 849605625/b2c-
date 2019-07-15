package com.qqh.practice04.order.service;

import java.util.List;

import com.qqh.practice04.order.model.OrderGoodsModel;


public interface IOrderGoodsService {
	//int selectCount(OrderGoodsModel model);
	List<OrderGoodsModel> getList(OrderGoodsModel model);
	int insert(OrderGoodsModel model);
//	String insertByCode(OrderInforModel model);
//	List<OrderInforModel> selectByPartentCode(OrderInforModel model);
//	int deleteByCode(String code);
//	OrderInforModel  selectModel (OrderInforModel model);
//	int update(OrderInforModel model);
//	List<OrderInforModel> selectByFirstCode(OrderInforModel model);
//	List<OrderInforModel> getAll(OrderInforModel model);
//	List<OrderInforModel> selectNextList(OrderInforModel model);
}
