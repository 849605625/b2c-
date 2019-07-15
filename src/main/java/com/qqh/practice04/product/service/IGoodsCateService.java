package com.qqh.practice04.product.service;

import java.util.List;

import com.qqh.practice04.product.model.GoodsCateModel;

public interface IGoodsCateService {
	int selectCount(GoodsCateModel model);
	List<GoodsCateModel> getList(GoodsCateModel model);
	String insertByCode(GoodsCateModel model);
	List<GoodsCateModel> selectByPartentCode(GoodsCateModel model);
	int deleteByCode(String code);
	GoodsCateModel  selectModel (GoodsCateModel model);
	int update(GoodsCateModel model);
	List<GoodsCateModel> selectByFirstCode(GoodsCateModel model);
	List<GoodsCateModel> getAll(GoodsCateModel model);
	List<GoodsCateModel> selectNextList(GoodsCateModel model);
}
