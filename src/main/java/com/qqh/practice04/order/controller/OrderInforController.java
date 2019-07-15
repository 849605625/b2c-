package com.qqh.practice04.order.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qqh.practice04.order.model.ChinaModel;
import com.qqh.practice04.order.model.OrderGoodsModel;
import com.qqh.practice04.order.model.OrderInforModel;
import com.qqh.practice04.order.service.IChinaService;
import com.qqh.practice04.order.service.IOrderGoodsService;
import com.qqh.practice04.order.service.IOrderInforService;
import com.qqh.practice04.sys.model.CarModel;
import com.qqh.practice04.sys.service.ICarService;

@Controller
@RequestMapping("/orderInforController")
public class OrderInforController {
	@Autowired
	private IOrderInforService orderInforService;
	@Autowired
	private IOrderGoodsService orderGoodsService;
	@Autowired
	private IChinaService chinaService;
	@Autowired
	   private ICarService carService;
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	private String getList(OrderInforModel model, HttpServletResponse response) {
		model.setPageOn(true);
		Map<String, Object> map = new HashMap<>();
		map.put("list", orderInforService.getList(model));
		map.put("count", orderInforService.selectCount(model));
		response.setContentType("application/json;charset=UTF-8");
		return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value = "/getGoods", method = RequestMethod.POST)
	private String getGoods(String code, HttpServletResponse response){
		OrderGoodsModel model=new OrderGoodsModel();
		model.setOrderCode(code);
		List<OrderGoodsModel> list=orderGoodsService.getList(model);
		response.setContentType("application/json;charset=UTF-8");
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value="/deleteByCode",method=RequestMethod.POST)
	private String deleteByCode(String code){
		int s =orderInforService.deleteByCode(code);
		if(s==1){
			return "1";//删除成功
		}else{
			return "3";//删除失败
		}
	}
	@ResponseBody
	@RequestMapping(value="/get",method=RequestMethod.POST)
	private String get(String code, HttpServletResponse response){
		List<OrderInforModel> list1 =orderInforService.selectBycode(code);
		ChinaModel model=new ChinaModel();
		model.setParentId(list1.get(0).getProvice());
		List <ChinaModel> list2=chinaService.selectBySecond(model);
		ChinaModel model2=new ChinaModel();
		model2.setParentId(list1.get(0).getCity());
		List <ChinaModel> list3=chinaService.selectByThird(model2);
		response.setContentType("application/json;charset=UTF-8");
		Map<String, Object> map = new HashMap<>();
		map.put("list1", list1.get(0));
		map.put("list2", list2);
		map.put("list3", list3);
		return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	private String update(OrderInforModel model, HttpServletResponse response){
		int s=orderInforService.update(model);
		if(s==1){
			return "1";//成功
		}else{
			return "2";
		}
	}
	@ResponseBody
	@RequestMapping(value="/getAddr",method=RequestMethod.POST)
	private String getAddr (OrderInforModel model, HttpServletResponse response){
		List<OrderInforModel> list1=orderInforService.getList(model);
		for(int i=list1.size()-1;i>0;i--){
			for(int j=i-1;j>=0;j--){
				OrderInforModel o1=list1.get(i);
				OrderInforModel o2=list1.get(j);
				if(o1.getAddrCode().equals(o2.getAddrCode())&&o1.getProvice().equals(o2.getProvice())&&o1.getCity().equals(o2.getCity())&&o1.getRegion().equals(o2.getRegion())&&o1.getTel().equals(o2.getTel())&&o1.getPerson().equals(o2.getPerson())){
					list1.remove(i);
					break;
				}
			}
		}
		response.setContentType("application/json;charset=UTF-8");
		return new JSONArray(list1).toString();
	}

	@ResponseBody
	@RequestMapping(value = "/many", method = RequestMethod.POST) // 下单
	private String many(HttpServletRequest request, String goodsCo, String goodsNu, String goodspri) {
		String orderAddr = request.getParameter("orderAddr");
		String user = request.getParameter("userCode");
		String tel = request.getParameter("tel");
		String person = request.getParameter("person");
		String addrCo[] = orderAddr.split(",");
		OrderInforModel model = new OrderInforModel();
		model.setUserCode(user);
		model.setTel(tel);
		model.setPerson(person);
		model.setAddrCode(addrCo[3]);
		model.setProvice(addrCo[0]);
		model.setCity(addrCo[1]);
		model.setRegion(addrCo[2]);
		model.setState("已下单");
		String code = UUID.randomUUID().toString();
		model.setCode(code);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		model.setTime(Timestamp.valueOf(df.format(new Date())));// new
																// Date()为获取当前系统时间
		JSONArray arr1 = new JSONArray(goodsCo);
		JSONArray arr2 = new JSONArray(goodsNu);
		JSONArray arr3 = new JSONArray(goodspri);
		int s = 0;
		s = orderInforService.insert(model);
		if (s == 1) {
			OrderGoodsModel m = new OrderGoodsModel();
			CarModel m2 = new CarModel();
			m2.setUserCode(user);
			m.setOrderCode(code);
			for (int i = 0; i < arr1.length(); i++) {
				m2.setGoodsCode(arr1.getString(i).toString());
				s = carService.deleteByCode(m2);
				if (s == 1) {
					m.setGoodsCode(arr1.getString(i).toString());
					m.setNumber(arr2.getInt(i));
					m.setPrice(arr3.getString(i).toString());
					s = orderGoodsService.insert(m);
					if (s != 1) {
						return "2";// 失败
					}
				} else {
					return "2";// 失败
				}
			}
			return "1";// 成功
		}
		return "2";// 失败
	}
	@ResponseBody
	@RequestMapping(value="/getOrder",method=RequestMethod.POST)//下单
	private String getOrder(OrderInforModel model,HttpServletResponse response,HttpServletRequest request){
		model.setPageIndex(Integer.parseInt(request.getParameter("curr")));
		model.setPageLimit(Integer.parseInt(request.getParameter("limit")));
		Map<String,Object> map=new HashMap<>();
		model.setPageOn(true);
		map.put("list", orderInforService.getList(model));
		map.put("count", orderInforService.selectCount(model));
		response.setContentType("application/json;charset=UTF-8");
		 return map == null ? "{}" : new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/buyNow",method=RequestMethod.POST)
	private String buyNow(HttpServletRequest request){
		String orderAddr = request.getParameter("orderAddr");
		String user = request.getParameter("userCode");
		String tel = request.getParameter("tel");
		String price = request.getParameter("price");
		String goodsCode = request.getParameter("code");
		String person = request.getParameter("person");
		String addrCo[] = orderAddr.split(",");
		OrderInforModel model = new OrderInforModel();
		model.setUserCode(user);
		model.setTel(tel);
		model.setPerson(person);
		model.setAddrCode(addrCo[3]);
		model.setProvice(addrCo[0]);
		model.setCity(addrCo[1]);
		model.setRegion(addrCo[2]);
		model.setState("已下单");
		String code = UUID.randomUUID().toString();
		model.setCode(code);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		model.setTime(Timestamp.valueOf(df.format(new Date())));// new
																// Date()为获取当前系统时间
		int s = 0;
		s = orderInforService.insert(model);
		if (s == 1) {
			OrderGoodsModel m = new OrderGoodsModel();
			m.setOrderCode(code);
			m.setGoodsCode(goodsCode);
			m.setNumber(1);
			m.setPrice(price);
			s = orderGoodsService.insert(m);
			if (s != 1) {
				return "2";// 失败
			}else{
				return "1";
			}
		}
		return "2";// 失败
	}
}
