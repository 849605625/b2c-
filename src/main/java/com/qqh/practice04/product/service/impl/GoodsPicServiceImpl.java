package com.qqh.practice04.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.product.mapper.IGoodsPicMapper;
import com.qqh.practice04.product.model.GoodsPicModel;
import com.qqh.practice04.product.service.IGoodsPicService;
@Service
public class GoodsPicServiceImpl implements IGoodsPicService {
	@Autowired
	private IGoodsPicMapper goodsPicMapper;
	@Override
	public String insert(GoodsPicModel model) {
		if (selectModel(model) == null) {
			int s = addModel(model);
			if (s == 0) {
				return "3";// 3失败
			} else {
				return "0";// 成功
			}
		}
		return "1";// 图片名已存在
	}
	public GoodsPicModel selectModel(GoodsPicModel model) {
		GoodsPicModel u=new GoodsPicModel();
		u.setUrl(model.getUrl());
		List<GoodsPicModel> list = goodsPicMapper.selectByUrl(u);
		return (list == null || list.isEmpty()) ? null : list.get(0);
	}
	public int addModel(GoodsPicModel u) {
		return goodsPicMapper.insert(u);
	}
	@Override
	public List<GoodsPicModel> getList(GoodsPicModel model) {
		return goodsPicMapper.selectAll(model);
	}
	@Override
	public int update(GoodsPicModel model) {
		return goodsPicMapper.update(model);
	}
	@Override
	public int deleteModel(GoodsPicModel model) {
		// TODO Auto-generated method stub
		return goodsPicMapper.deleteModel(model);
	}
	
}
