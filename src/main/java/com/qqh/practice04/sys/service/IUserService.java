package com.qqh.practice04.sys.service;

import java.util.List;

import com.qqh.practice04.sys.model.UserModel;

public interface IUserService {

	String insertByCode(UserModel model); 
	UserModel selectModel(UserModel model);
	List<UserModel>getAdminList(UserModel model);
	int selectCount(UserModel model);
	int deleteByCode(String code);
	int update(UserModel model);
	         
}
