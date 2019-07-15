package com.qqh.practice04.product.mapper;

import java.util.List;

import com.qqh.practice04.product.model.GoodsInforModel;


public interface IGoodsInforMapper {
	int selectCount(GoodsInforModel model);
	List<GoodsInforModel> selectList(GoodsInforModel model);
	List<GoodsInforModel> selectBycode(GoodsInforModel model);
	int insert(GoodsInforModel model);
	List<GoodsInforModel> selectByPartentCode(GoodsInforModel model);
	int deleteByCode(String code);
	int update(GoodsInforModel model);
	List<GoodsInforModel> selectAll(GoodsInforModel model);
}
