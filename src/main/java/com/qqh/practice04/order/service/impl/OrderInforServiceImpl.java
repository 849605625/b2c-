package com.qqh.practice04.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.order.mapper.IOrderInforMapper;
import com.qqh.practice04.order.model.OrderInforModel;
import com.qqh.practice04.order.service.IOrderInforService;

@Service
public class OrderInforServiceImpl implements IOrderInforService {
	@Autowired
	private IOrderInforMapper orderInforMapper;
	@Override
	public int selectCount(OrderInforModel model) {
		return orderInforMapper.selectCount(model);
	}

	@Override
	public List<OrderInforModel> getList(OrderInforModel model) {
		return orderInforMapper.selectList(model);
	}

	@Override
	public int deleteByCode(String code) {
		return orderInforMapper.deleteByCode(code);
	}

	@Override
	public  List<OrderInforModel> selectBycode(String code) {
		return orderInforMapper.selectBycode(code);
	}

	@Override
	public int update(OrderInforModel model) {
		return orderInforMapper.update(model);
	}

	@Override
	public int insert(OrderInforModel model) {
		return orderInforMapper.insert(model);
	}

}
