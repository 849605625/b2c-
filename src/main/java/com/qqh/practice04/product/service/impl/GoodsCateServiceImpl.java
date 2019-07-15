package com.qqh.practice04.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.product.mapper.IGoodsCateMapper;
import com.qqh.practice04.product.model.GoodsCateModel;
import com.qqh.practice04.product.service.IGoodsCateService;

@Service
public class GoodsCateServiceImpl implements IGoodsCateService {
	@Autowired
	private IGoodsCateMapper goodsCateMapper;

	@Override
	public int selectCount(GoodsCateModel model) {
		return goodsCateMapper.selectCount(model);
	}

	@Override
	public List<GoodsCateModel> getList(GoodsCateModel model) {
		return goodsCateMapper.selectList(model);
	}

	@Override
	public String insertByCode(GoodsCateModel model) {
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

	public GoodsCateModel selectModel(GoodsCateModel model) {
		GoodsCateModel u=new GoodsCateModel();
		u.setCode(model.getCode());
		List<GoodsCateModel> list = goodsCateMapper.selectBycode(u);
		return (list == null || list.isEmpty()) ? null : list.get(0);
	}
	public int addModel(GoodsCateModel u) {
		return goodsCateMapper.insert(u);
	}

	@Override
	public List<GoodsCateModel> selectByPartentCode(GoodsCateModel model) {
		return goodsCateMapper.selectByPartentCode(model);
	}

	@Override
	public int deleteByCode(String code) {
		return  goodsCateMapper.deleteByCode(code);
	}

	@Override
	public int update(GoodsCateModel model) {
		return  goodsCateMapper.update(model);
	}

	@Override
	public List<GoodsCateModel> selectByFirstCode(GoodsCateModel model) {
		return goodsCateMapper.selectByFirstCode(model);
	}

	@Override
	public List<GoodsCateModel> getAll(GoodsCateModel model) {
		return goodsCateMapper.selectAll(model);
	}

	@Override
	public List<GoodsCateModel> selectNextList(GoodsCateModel model) {
		return goodsCateMapper.selectAll(model);
	}
}
