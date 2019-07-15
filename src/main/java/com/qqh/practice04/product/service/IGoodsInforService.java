package com.qqh.practice04.product.service;

import java.util.List;

import com.qqh.practice04.product.model.GoodsInforModel;


public interface IGoodsInforService {
	int selectCount(GoodsInforModel model);
	List<GoodsInforModel> getList(GoodsInforModel model);
	String insertByCode(GoodsInforModel model);
//	GoodsInforModel selectBycode(GoodsInforModel model);
	int deleteByCode(String code);
	GoodsInforModel  selectModel (GoodsInforModel model);
	int update(GoodsInforModel model);
	List<GoodsInforModel>  selectCateModel (GoodsInforModel model);
}
