package com.qqh.practice04.product.service;

import java.util.List;

import com.qqh.practice04.product.model.GoodsPicModel;


public interface IGoodsPicService {
//	int selectCount(GoodsPicModel model);
	List<GoodsPicModel> getList(GoodsPicModel model);
	String insert(GoodsPicModel model);
//	List<GoodsPicModel> selectByPartentCode(GoodsPicModel model);
	int deleteModel(GoodsPicModel model);
	GoodsPicModel  selectModel (GoodsPicModel model);
	int update(GoodsPicModel model);
//	List<GoodsPicModel> selectBycode(GoodsPicModel model);
//	List<GoodsPicModel> getAll(GoodsPicModel model);
//	List<GoodsPicModel> selectNextList(GoodsPicModel model);
}
