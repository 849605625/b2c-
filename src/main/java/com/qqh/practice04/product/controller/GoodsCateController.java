package com.qqh.practice04.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qqh.practice04.product.model.GoodsCateModel;
import com.qqh.practice04.product.service.IGoodsCateService;

@Controller
@RequestMapping("/goodsCateController")
public class GoodsCateController {
	@Autowired
	private IGoodsCateService goodsCateService;
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.POST)
	 private String getList(GoodsCateModel model,HttpServletResponse response){
		model.setName("%"+model.getName()+"%");
		model.setDescr("%"+model.getDescr()+"%");
		model.setPageOn(true);
		Map<String,Object> map=new HashMap<>();
		map.put("list", goodsCateService.getList(model));
    	map.put("count", goodsCateService.selectCount(model));
    	response.setContentType("application/json;charset=UTF-8");
    	return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/addFirst",method=RequestMethod.POST)
	private String add(GoodsCateModel model){
		 return goodsCateService.insertByCode(model);
	}
	@ResponseBody
	@RequestMapping(value="/get",method=RequestMethod.POST)
	private String get(HttpServletResponse response){
		GoodsCateModel model=new GoodsCateModel();
		response.setContentType("application/json;charset=UTF-8");
		List<GoodsCateModel> list=goodsCateService.selectByPartentCode(model);
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value="/deleteByCode",method=RequestMethod.POST)
	private String deleteByCode(String code){
		int s =goodsCateService.deleteByCode(code);
		if(s==1){
			return "1";//删除成功
		}else{
			return "3";//删除失败
		}
	}
	@RequestMapping("/getUpd")
	private String getUpd(GoodsCateModel m,String flag,Model model){
		model.addAttribute("goods",goodsCateService.selectModel(m));
			return "goods/upd";
	}
	@ResponseBody
	@RequestMapping(value="/upd",method=RequestMethod.POST)
	private String upd(GoodsCateModel m){
		int s=goodsCateService.update(m);
		if(s==1){
			return "0";//成功
		}else{
			return "1";//失败
		}
	}
	@ResponseBody
	@RequestMapping(value="/FirstGet",method=RequestMethod.POST)
	private String firstGet(HttpServletResponse response){
		GoodsCateModel model=new GoodsCateModel();
		response.setContentType("application/json;charset=UTF-8");
		List<GoodsCateModel> list=goodsCateService.selectByFirstCode(model);
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value="/nextGet",method=RequestMethod.POST)
	private String nexGet(String code,HttpServletResponse response){
		if(code==null||code.trim().equals("")){
			List<GoodsCateModel> list=new ArrayList<>();
			return new JSONArray(list).toString();
		}
		GoodsCateModel model=new GoodsCateModel();
		model.setPartentCode(code);
		model.setOrderby("name");
		List<GoodsCateModel> list=goodsCateService.getAll(model);
		response.setContentType("application/json;charset=UTF-8");
		return new JSONArray(list).toString();
	}
}
