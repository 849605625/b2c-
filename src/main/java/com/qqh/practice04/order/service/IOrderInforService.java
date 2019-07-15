package com.qqh.practice04.order.service;

import java.util.List;

import com.qqh.practice04.order.model.OrderInforModel;


public interface IOrderInforService {
	int selectCount(OrderInforModel model);
	List<OrderInforModel> getList(OrderInforModel model);
//	String insertByCode(OrderInforModel model);
	List<OrderInforModel> selectBycode(String code);
	int deleteByCode(String code);
//	OrderInforModel  selectModel (OrderInforModel model);
	int update(OrderInforModel model);
	int insert(OrderInforModel model);
//	List<OrderInforModel> selectByFirstCode(OrderInforModel model);
//	List<OrderInforModel> getAll(OrderInforModel model);
//	List<OrderInforModel> selectNextList(OrderInforModel model);
}
