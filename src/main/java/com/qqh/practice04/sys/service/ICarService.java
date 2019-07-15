package com.qqh.practice04.sys.service;

import java.util.List;

import com.qqh.practice04.sys.model.CarModel;

public interface ICarService {
	int  insert(CarModel model); 
	List<CarModel> selectModel(CarModel model);
//	List<CarModel>getAdminList(CarModel model);
	int selectCount(CarModel model);
	int deleteByCode(CarModel model);
	int update(CarModel model);
	int updateALL(CarModel u);
}
