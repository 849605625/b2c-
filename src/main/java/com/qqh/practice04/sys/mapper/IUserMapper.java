package com.qqh.practice04.sys.mapper;

import java.util.List;

import com.qqh.practice04.sys.model.UserModel;

public interface IUserMapper {
   int insert(UserModel u);
   List<UserModel> selectList(UserModel u);
   List<UserModel>  selectBycode(UserModel u);
   int selectCount(UserModel u);
   int deleteByCode(String code);
   int update(UserModel u);
}
