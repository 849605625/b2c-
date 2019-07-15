package com.qqh.practice04.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.sys.mapper.ICarMapper;
import com.qqh.practice04.sys.model.CarModel;
import com.qqh.practice04.sys.service.ICarService;
import com.qqh.practice04.util.FmtEmpty;;
@Service
public class CarServiceImpl implements ICarService {
	@Autowired
	private ICarMapper carMapper;

	@Override
	public List<CarModel> selectModel(CarModel model) {
		return carMapper.selectList(model);
	}

	@Override
	public int insert(CarModel model) {
		return carMapper.insert(model);
	}

	@Override
	public int update(CarModel model) {
		return carMapper.update(model);
	}

	@Override
	public int deleteByCode(CarModel model) {
		if(FmtEmpty.isEmpty(model.getGoodsCode())&&FmtEmpty.isEmpty(model.getUserCode())){
			return 0;//两数都空
		}else{
			return carMapper.deleteByCode(model);
		}
		
	}

	@Override
	public int updateALL(CarModel u) {
		return carMapper.updateALL(u);
	}

	@Override
	public int selectCount(CarModel model) {
		return carMapper.selectCount(model);
	}
}
