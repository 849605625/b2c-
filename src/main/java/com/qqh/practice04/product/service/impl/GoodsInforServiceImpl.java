package com.qqh.practice04.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.product.mapper.IGoodsInforMapper;
import com.qqh.practice04.product.model.GoodsInforModel;
import com.qqh.practice04.product.service.IGoodsInforService;

@Service
public class GoodsInforServiceImpl implements IGoodsInforService{
	@Autowired
	private IGoodsInforMapper goodsInforMapper;
	@Override
	public int selectCount(GoodsInforModel model) {
		return goodsInforMapper.selectCount(model);
	}

	@Override
	public List<GoodsInforModel> getList(GoodsInforModel model) {
		return goodsInforMapper.selectList(model);
	}

	@Override
	public String insertByCode(GoodsInforModel model) {
		if (selectModel(model) == null) {
			int s = addModel(model);
			if (s == 0) {
				return "3";// 3失败
			} else {
				return "0";// 成功
			}
		}
		return "1";// 编号已存在
	}
	public GoodsInforModel selectModel(GoodsInforModel model) {
		GoodsInforModel u=new GoodsInforModel();
		u.setCode(model.getCode());
		List<GoodsInforModel> list = goodsInforMapper.selectBycode(u);
		return (list == null || list.isEmpty()) ? null : list.get(0);
	}
	public int addModel(GoodsInforModel u) {
		return goodsInforMapper.insert(u);
	}

	@Override
	public int deleteByCode(String code) {
		return goodsInforMapper.deleteByCode(code);
	}

	@Override
	public int update(GoodsInforModel model) {
		return  goodsInforMapper.update(model);
	}

	@Override
	public List<GoodsInforModel> selectCateModel(GoodsInforModel model) {
		List<GoodsInforModel> list = goodsInforMapper.selectList(model);
		return list;
	}

	
}
