package com.qqh.practice04.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.order.mapper.IChinaMapper;
import com.qqh.practice04.order.model.ChinaModel;
import com.qqh.practice04.order.service.IChinaService;

@Service
public class ChinaServiceImpl implements IChinaService{
	@Autowired
	private IChinaMapper chinaMapper;
	@Override
	public List<ChinaModel> getFirst(ChinaModel model) {
		return chinaMapper.selectByFirst(model);
	}
	@Override
	public List<ChinaModel> selectBySecond(ChinaModel model) {
		return chinaMapper.selectBySecond(model);
	}
	@Override
	public List<ChinaModel> selectByThird(ChinaModel model) {
		return chinaMapper.selectByThird(model);
	}
	@Override
	public ChinaModel selectBycode(ChinaModel model) {
		return chinaMapper.selectBycode(model);
	}

}
