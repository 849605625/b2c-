package com.qqh.practice04.product.mapper;

import java.util.List;

import com.qqh.practice04.product.model.GoodsCateModel;

public interface IGoodsCateMapper {
	int selectCount(GoodsCateModel model);
	List<GoodsCateModel> selectList(GoodsCateModel model);
	List<GoodsCateModel> selectBycode(GoodsCateModel model);
	int insert(GoodsCateModel model);
	List<GoodsCateModel> selectByPartentCode(GoodsCateModel model);
	int deleteByCode(String code);
	int update(GoodsCateModel model);
	List<GoodsCateModel> selectByFirstCode(GoodsCateModel model);
	List<GoodsCateModel> selectAll(GoodsCateModel model);
}
