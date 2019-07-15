<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<%@ include file="/web/js/header.jsp"%>
</head>
<body>
<form  method="post" class="layui-form" >
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="./index.jsp" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">账&nbsp;&nbsp;号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="shurukuang" type="text" name="code" placeholder="请输入你的账号"/><span>请不要输入汉字</span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="pass" placeholder="请输入你的密码"/><span>请输入6位以上字符</span></div>
					
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="name" placeholder="请输入你的用户名"/><span>给自己取一个潇洒的用户名吧</span></div>
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="authCode" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src='/Practice04/userController/AutoCode.do'  onclick="this.src='/Practice04/userController/AutoCode.do?'+Math.random();"></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="button" name="submit" value="立即注册" lay-filter="reg" lay-submit>
				</div>
			</div>
		</div>
		</form>
		<script type="text/javascript">
		formSubmit("/userController/reg.do","submit(reg)","json",function(data){
			  if(data==0){
				  location.href="/Practice04/web/dami/xiaomi/jsp/login.jsp";
			  }else if(data==1){
				  layer.msg("账号已存在"); 
			  }
			  else if(data==2){
				  layer.msg("验证码错误");
			  }
			  else{
				  layer.msg("注册失败"); 
			  }
		  })
		 
	  </script>
</body>
</html>