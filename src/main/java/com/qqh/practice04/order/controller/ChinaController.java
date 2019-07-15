package com.qqh.practice04.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qqh.practice04.order.model.ChinaModel;
import com.qqh.practice04.order.service.IChinaService;

@Controller
@RequestMapping("/orderGoodsController")
public class ChinaController {
	@Autowired
	private IChinaService chinaService;
	@ResponseBody
	@RequestMapping(value = "/FirstGet", method = RequestMethod.POST)
	private String firstGet(HttpServletResponse response){
		ChinaModel model=new ChinaModel();
		List <ChinaModel> list=chinaService.getFirst(model);
		response.setContentType("application/json;charset=UTF-8");
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value = "/secondGet", method = RequestMethod.POST)
	private String secondGet(String code,HttpServletResponse response){
		if(code==null||code.trim().equals("")){
			List<ChinaModel> list=new ArrayList<>();
			return new JSONArray(list).toString();
		}
		ChinaModel model=new ChinaModel();
		model.setParentId(code);
		List <ChinaModel> list=chinaService.selectBySecond(model);
		response.setContentType("application/json;charset=UTF-8");
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value = "/thirdGet", method = RequestMethod.POST)
	private String thirdGet(String code,HttpServletResponse response){
		if(code==null||code.trim().equals("")){
			List<ChinaModel> list=new ArrayList<>();
			return new JSONArray(list).toString();
		}
		ChinaModel model=new ChinaModel();
		model.setParentId(code);
		List <ChinaModel> list=chinaService.selectByThird(model);
		response.setContentType("application/json;charset=UTF-8");
		return new JSONArray(list).toString();
	}
}
