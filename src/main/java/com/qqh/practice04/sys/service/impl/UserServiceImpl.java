package com.qqh.practice04.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qqh.practice04.sys.mapper.IUserMapper;
import com.qqh.practice04.sys.model.UserModel;
import com.qqh.practice04.sys.service.IUserService;
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserMapper userMapper;
	@Override
	public String insertByCode(UserModel u) {
		if (selectModel(u) == null) {
			int s = addModel(u);
			if (s == 0) {
				return "3";// 3失败
			} else {
				return "0";//成功
			}
		}
		return "1";// 账号已存在
	}
	public UserModel selectModel(UserModel u) {
		UserModel ul = new UserModel();
		ul.setCode(u.getCode());
		List<UserModel> list = userMapper.selectBycode(ul);
		return (list == null || list.isEmpty()) ? null : list.get(0);
	}
	public int addModel(UserModel u) {
		return userMapper.insert(u);
	}
	@Override
	public List<UserModel> getAdminList(UserModel model) {
		return userMapper.selectList(model);
	}
	@Override
	public int selectCount(UserModel model) {
		return userMapper.selectCount(model);
	}
	@Override
	public int deleteByCode(String code) {
		return  userMapper.deleteByCode(code);
	}
	@Override
	public int update(UserModel model) {
		return userMapper.update(model);
	}
	
}
