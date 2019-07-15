package com.qqh.practice04.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.order.mapper.IOrderGoodsMapper;
import com.qqh.practice04.order.model.OrderGoodsModel;
import com.qqh.practice04.order.model.OrderInforModel;
import com.qqh.practice04.order.service.IOrderGoodsService;
@Service
public class OrderGoodsServiceImpl implements IOrderGoodsService {
@Autowired
private IOrderGoodsMapper orderGoodsMapper;
	@Override
	public List<OrderGoodsModel> getList(OrderGoodsModel model) {
		return orderGoodsMapper.selectBycode(model);
	}
	@Override
	public int insert(OrderGoodsModel model) {
		return orderGoodsMapper.insert(model);
	}

}
