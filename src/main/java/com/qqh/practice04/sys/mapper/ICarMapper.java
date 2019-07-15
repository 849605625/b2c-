package com.qqh.practice04.sys.mapper;

import java.util.List;

import com.qqh.practice04.sys.model.CarModel;

public interface ICarMapper {
	 int insert(CarModel u);
     List<CarModel> selectList(CarModel u);
//   List<CarModel>  selectBycode(CarModel u);
   int selectCount(CarModel u);
   int deleteByCode(CarModel u);
     int update(CarModel u);
     int updateALL(CarModel u);
     
}
