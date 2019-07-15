package com.qqh.practice04.product.mapper;

import java.util.List;

import com.qqh.practice04.product.model.GoodsPicModel;


public interface IGoodsPicMapper {
	List<GoodsPicModel> selectList(GoodsPicModel model);
	List<GoodsPicModel> selectByUrl(GoodsPicModel model);
	int insert(GoodsPicModel model);
//	List<GoodsPicModel> selectByPartentCode(GoodsPicModel model);
	int deleteModel(GoodsPicModel model);
	int update(GoodsPicModel model);
	List<GoodsPicModel> selectBycode(GoodsPicModel model);
	List<GoodsPicModel> selectAll(GoodsPicModel model);
}
