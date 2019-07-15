package com.qqh.practice04.order.mapper;

import java.util.List;

import com.qqh.practice04.order.model.ChinaModel;

public interface IChinaMapper {
	List<ChinaModel> selectByFirst(ChinaModel model);
	List<ChinaModel>   selectBySecond(ChinaModel model);
	List<ChinaModel> selectByThird(ChinaModel model);
	ChinaModel selectBycode(ChinaModel model);
	
}
