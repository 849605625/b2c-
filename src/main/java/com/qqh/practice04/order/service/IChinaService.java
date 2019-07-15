package com.qqh.practice04.order.service;

import java.util.List;

import com.qqh.practice04.order.model.ChinaModel;

public interface IChinaService {
	List<ChinaModel> getFirst(ChinaModel model);
	List<ChinaModel>   selectBySecond(ChinaModel model);
	List<ChinaModel> selectByThird(ChinaModel model);
	ChinaModel selectBycode(ChinaModel model);
}
