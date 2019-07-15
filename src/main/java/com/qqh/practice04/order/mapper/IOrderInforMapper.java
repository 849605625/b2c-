package com.qqh.practice04.order.mapper;

import java.util.List;

import com.qqh.practice04.order.model.OrderInforModel;


public interface IOrderInforMapper {
	int selectCount(OrderInforModel model);
	List<OrderInforModel> selectList(OrderInforModel model);
	List<OrderInforModel> selectBycode(String code);
	int insert(OrderInforModel model);
//	List<OrderInforModel> selectByPartentCode(OrderInforModel model);
	int deleteByCode(String code);
	int update(OrderInforModel model);
}
