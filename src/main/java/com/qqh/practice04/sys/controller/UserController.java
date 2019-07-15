package com.qqh.practice04.sys.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qqh.practice04.sys.model.UserModel;
import com.qqh.practice04.sys.service.IUserService;
import com.qqh.practice04.util.AuthCode;
import com.qqh.practice04.util.MD5;

@Controller
@RequestMapping("/userController")
public class UserController {
	@Autowired
	private IUserService userService;
	@RequestMapping(value = "/AutoCode", method = RequestMethod.GET)
    @ResponseBody
    public void captcha(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
		AuthCode.get(request, response);
    }
	@ResponseBody
	@RequestMapping(value="/reg",method=RequestMethod.POST)
	  private String reg(UserModel model,HttpServletRequest request){
		if(isOkAuthCode(request)==false){
    		return "2";//验证码错误
    	}
    	model.setPass(MD5.encode(model.getPass()));
    	String admPass= request.getParameter("admPass");
    	if(admPass==null||admPass.trim().equals("")||!admPass.equals("0000")){
    		model.setState("1");
    	}else{
    		model.setState("2");
    	}
    	return userService.insertByCode(model);
	}
	private boolean isOkAuthCode(HttpServletRequest request) {
        Object authCode = request.getSession().getAttribute("authCode");
        String code = request.getParameter("authCode");
        return authCode.toString().equalsIgnoreCase(code);
    }

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	private String login(UserModel model, HttpServletRequest request) {
		if (isOkAuthCode(request) == false) {
			return "3";// 验证码错误
		}
		UserModel m = new UserModel();
		m.setCode(model.getCode());
		UserModel u1 = userService.selectModel(m);
		if (u1 == null) {
			return "0";// 账号不存在
		}
		model.setPass(MD5.encode(model.getPass()));
		if (u1.getPass().equals(model.getPass())) {
			request.getSession().setAttribute("user", u1);
			if (u1.getState().equals("1")) {
				return "4";// 顾客身份 登录成功
			} else {
				return "1";// 登录成功 管理员身份
			}
		} else {
			return "2";// 密码不对
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/searchUser",method=RequestMethod.POST)
	 private String getList(UserModel model,HttpServletResponse response){
		model.setName("%"+model.getName()+"%");
		model.setPageOn(true);
		Map<String,Object> map=new HashMap<>();
		map.put("list", userService.getAdminList(model));
    	map.put("count", userService.selectCount(model));
    	response.setContentType("application/json;charset=UTF-8");
    	return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/deleteByCode",method=RequestMethod.POST)
	private String deleteByCode(String code,String nowCode){
		if(code.equals(nowCode)){
			return "2";//当前账号是登录状态
		}
		int s =userService.deleteByCode(code);
		if(s==1){
			return "1";//删除成功
		}else{
			return "3";//删除失败
		}
	}
	@RequestMapping("/getUpd")
	private String getUpd(UserModel m,String flag,Model model){
		model.addAttribute("user",userService.selectModel(m));
		if(flag.equals("1")){
			return "admin/updAdmin";
		}else {
			return "admin/updPass";//修改密码
		}
		
	}
	@ResponseBody
	@RequestMapping(value="/upd",method=RequestMethod.POST)
	private String upd(UserModel m){
		int s=userService.update(m);
		if(s==1){
			return "1";//成功
		}else{
			return "2";
		}
	}
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	private String add(UserModel m,HttpServletRequest request){
		if(isOkAuthCode(request)==false){
    		return "2";//验证码错误
    	}
		m.setPass(MD5.encode(m.getPass()));
		 return userService.insertByCode(m);
	}
	@ResponseBody
	@RequestMapping(value="/updPass",method=RequestMethod.POST)
	private String updPass(String oldPassword,String newPassword,String oldPass,UserModel model){
		if(MD5.encode(oldPassword).equals(oldPass)){
			model.setPass(MD5.encode(newPassword));
			return (userService.update(model)+"");
		}else{
			return "2";
		}
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	private String logout(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "admin/login";
	}
	@RequestMapping(value="/logout2",method=RequestMethod.GET)
	private String logout2(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "dami/xiaomi/jsp/login";
	}
}
