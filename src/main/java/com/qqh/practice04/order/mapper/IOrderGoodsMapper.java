package com.qqh.practice04.order.mapper;

import java.util.List;

import com.qqh.practice04.order.model.OrderGoodsModel;


public interface IOrderGoodsMapper {
//	int selectCount(OrderGoodsModel model);
	List<OrderGoodsModel> selectList(OrderGoodsModel model);
	List<OrderGoodsModel> selectBycode(OrderGoodsModel model);
	int insert(OrderGoodsModel model);
//	List<OrderInforModel> selectByPartentCode(OrderInforModel model);
//	int deleteByCode(String code);
//	int update(OrderInforModel model);
}
