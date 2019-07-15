package com.qqh.practice04.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.qqh.practice04.product.model.GoodsInforModel;
import com.qqh.practice04.product.model.GoodsPicModel;
import com.qqh.practice04.product.service.IGoodsCateService;
import com.qqh.practice04.product.service.IGoodsInforService;
import com.qqh.practice04.product.service.IGoodsPicService;

@Controller
@RequestMapping("/goodsInforController")
public class GoodsInforController {
	@Autowired
	private IGoodsInforService goodsInforService;
	@Autowired
	private IGoodsCateService goodsCateService;
	@Autowired
	private IGoodsPicService goodsPicService;
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.POST)
	 private String getList(GoodsInforModel model,HttpServletResponse response){
		model.setName("%"+model.getName()+"%");
		model.setDescr("%"+model.getDescr()+"%");
		model.setPageOn(true);
		Map<String,Object> map=new HashMap<>();
		map.put("list", goodsInforService.getList(model));
    	map.put("count", goodsInforService.selectCount(model));
    	response.setContentType("application/json;charset=UTF-8");
    	return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	private String add(GoodsInforModel model){
		return goodsInforService.insertByCode(model);
	}
	@ResponseBody
	@RequestMapping(value="/get",method=RequestMethod.POST)
	private String get(GoodsInforModel model,HttpServletResponse response){
		GoodsInforModel modelDB = goodsInforService.selectModel(model);
		GoodsCateModel goodsCateModel=new GoodsCateModel();
		goodsCateModel.setPartentCode(modelDB.getTopCode());
		  List<GoodsCateModel> list=goodsCateService.selectNextList(goodsCateModel);
		  Map<String,Object> map=new HashMap<>();
		  map.put("infor", modelDB);
		  map.put("cate", list);
		  response.setContentType("application/json;charset=UTF-8");
	      return map == null ? "{}" : new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/deleteByCode",method=RequestMethod.POST)
	private String deleteByCode(String code){
		int s =goodsInforService.deleteByCode(code);
		if(s==1){
			return "1";//删除成功
		}else{
			return "3";//删除失败
		}
	}
	@ResponseBody
	@RequestMapping(value="/upd",method=RequestMethod.POST)
	private String upd(GoodsInforModel m){
		int s=goodsInforService.update(m);
		if(s==1){
			return "0";//成功
		}else{
			return "1";//失败
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/listSecond",method=RequestMethod.POST)
	private String listSecond(String code,HttpServletResponse response,String flag,String name,HttpServletRequest request){//2级信息加图片
		GoodsInforModel m=new GoodsInforModel();
//		m.setPageIndex(Integer.parseInt(request.getParameter("curr")));
//		m.setPageLimit(Integer.parseInt(request.getParameter("limit")));
		if(flag.equals("1")){
			m.setCateCode(code);
		}else if(flag.equals("2")){
			m.setName("%"+name+"%");
		}
//		m.setPageOn(true);
		List<GoodsInforModel> listInfo=goodsInforService.selectCateModel(m);
		String path="/picture/";
		List <GoodsPicModel> pic=new ArrayList<>();
		GoodsPicModel g=new GoodsPicModel();
		for(int i=0;i<listInfo.size();i++){
			if(listInfo.get(i).getNumber()>0&&listInfo.get(i).getState().equals("上架")){
				g.setCode(listInfo.get(i).getCode());
				List<GoodsPicModel> listPic=goodsPicService.getList(g);
				for(int j=0;j<listPic.size();j++){
					if(listPic.get(j).getType().equals("1")){
						String url=path+listPic.get(j).getUrl();
						GoodsPicModel a=new GoodsPicModel();
						a.setCode(listPic.get(j).getCode());
						a.setUrl(url);
						pic.add(a);
						break;
					}
				}
			}
		}
//		int cou=goodsInforService.selectCount(m);
		 Map<String,Object> map=new HashMap<>();
		  map.put("infor", listInfo);//商品信息
		  map.put("pic", pic);//图片地址
//		  map.put("count",goodsInforService.selectCount(m));
		  response.setContentType("application/json;charset=UTF-8");
//		  System.out.println(new JSONObject(map).toString());
	      return map == null ? "{}" : new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/listFirst",method=RequestMethod.POST)
	private String listFirst(String code,HttpServletResponse response,String flag,HttpServletRequest request){//1级信息加图片
		GoodsCateModel model=new GoodsCateModel();
		model.setPartentCode(code);
		List<GoodsCateModel> list=goodsCateService.getAll(model);
		List <String> result=new ArrayList<>();
		for(int i=0;i<list.size();i++){
			String s=listSecond(list.get(i).getCode(),response,flag,"",request);
			result.add(s);
		}
		return new JSONArray(result).toString();
	}
	@RequestMapping(value="/getDetails",method=RequestMethod.GET)
	private String getDetails(GoodsInforModel m,HttpServletResponse response,Model model){
		GoodsInforModel m1= goodsInforService.selectModel(m);
		model.addAttribute("goods",m1);
		String path="/picture/";
		GoodsPicModel g=new GoodsPicModel();
		g.setCode(m1.getCode());
		List<GoodsPicModel> listPic=goodsPicService.getList(g);
		for(int j=0;j<listPic.size();j++){
			if(listPic.get(j).getType().equals("1")){
				String url=path+listPic.get(j).getUrl();
				model.addAttribute("pic",url);
				break;
			}
		}
		  return "dami/xiaomi/jsp/details";
	}
	@RequestMapping(value="/buyNow",method=RequestMethod.GET)
	private String buyNow(GoodsInforModel m,HttpServletResponse response,Model model){
		GoodsInforModel m1= goodsInforService.selectModel(m);
		model.addAttribute("goods",m1);
		String path="/picture/";
		GoodsPicModel g=new GoodsPicModel();
		g.setCode(m1.getCode());
		List<GoodsPicModel> listPic=goodsPicService.getList(g);
		for(int j=0;j<listPic.size();j++){
			if(listPic.get(j).getType().equals("1")){
				String url=path+listPic.get(j).getUrl();
				model.addAttribute("pic",url);
				break;
			}
		}
		  return "dami/xiaomi/jsp/buyNow";
	}
}
