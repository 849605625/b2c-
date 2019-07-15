package com.qqh.practice04.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qqh.practice04.sys.model.CarModel;
import com.qqh.practice04.sys.model.UserModel;
import com.qqh.practice04.sys.service.ICarService;

@Controller
@RequestMapping("/carController")
public class CarController {
   @Autowired
   private ICarService carService;
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	private String add(String code,String user){
		int s=0;
		CarModel model=new CarModel();
		model.setGoodsCode(code);
		model.setUserCode(user);
		List<CarModel> usermodel=carService.selectModel(model);
		if(usermodel==null||usermodel.size()==0){
			model.setNumber(1);
			s=carService.insert(model);
		}else{
			model.setNumber(usermodel.get(0).getNumber()+1);
			s=carService.update(model);
		}
		if(s==1){
			return "2";//成功
		}else {
			return "3";//失败
		}
	}
	@ResponseBody
	@RequestMapping(value="/get",method=RequestMethod.POST)
	private String get(String user,HttpServletResponse response){
		CarModel model=new CarModel();
		model.setUserCode(user);
		List<CarModel> list=carService.selectModel(model);
		 response.setContentType("application/json;charset=UTF-8");
	     return list == null ? "{}" : new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	private String delete(CarModel model){
		int s=carService.deleteByCode(model);
		if(s==0){
			return "0";//两数都空
		}else if(s==1){
			return "1";//成功
		}else{
			return "2";//失败
		}
	}
	@ResponseBody
	@RequestMapping(value="/upd",method=RequestMethod.POST)
	private String upd(String ids,String numbb){
		JSONArray arr1=new JSONArray(ids);
		JSONArray arr2=new JSONArray(numbb);
		CarModel model=new CarModel();
		int flag=1;
		for(int i=0;i<arr1.length();i++){
			model.setId(Integer.parseInt(arr1.getString(i).toString()));
			model.setNumber(arr2.getInt(i));
			int s=carService.updateALL(model);
			if(s!=1){
				flag=2;
				break;
			}
		}
		if(flag==1){
			return "1";//成功
		}
		else{
			return "2";//失败
		}
	}
	@ResponseBody
	@RequestMapping(value="/getlist",method=RequestMethod.POST)
	private String getlist(String canshu,HttpServletResponse response){
		List<CarModel> list=new ArrayList<>();
		String []can=canshu.split(",");
		for(int i=0;i<can.length;i++){
			int id=Integer.parseInt(can[i]);
			CarModel model=new CarModel();
			model.setId(id);
			list.add(carService.selectModel(model).get(0));
		}
		 response.setContentType("application/json;charset=UTF-8");
	     return list == null ? "{}" : new JSONArray(list).toString();
	}
}
