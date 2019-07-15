<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>会员登录</title>
	<%@ include file="/web/js/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="/Practice04/web/dami/xiaomi/css/login.css">
</head>
<body>
<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="./index.jsp" target="_blank"><img src="/Practice04/web/dami/xiaomi/image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form   class="form center layui-form" >
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="/Practice04/web/dami/xiaomi/jsp/register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">账号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="code" placeholder="请输入你的账号"/></div>
					<div class="username">密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="pass" placeholder="请输入你的密码"/></div>
					<div class="username">
						<div class="left fl">验证码:&nbsp;<input class="yanzhengma" type="text" name="authCode" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src='/Practice04/userController/AutoCode.do'  onclick="this.src='/Practice04/userController/AutoCode.do?'+Math.random();"></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="button"  value="立即登录" lay-filter="login" lay-submit>
				</div>
				
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="/Practice04/web/dami/xiaomi/image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>
		</footer>
		<script type="text/javascript">
		var flag='<%=request.getParameter("flag")%>';
		var code='<%=request.getParameter("code")%>';
		form.render();
		formSubmit("/userController/login.do","submit(login)","json",function(data){
			  if(data==0){
				  layer.msg("账号不存在");
			  }else if(data==1){
				  location.href="/Practice04/web/admin/admIndex.jsp";
			  }else if(data==4){
				  if(flag==111){
					  location.href="/Practice04/web/dami/xiaomi/jsp/details.jsp?code1="+code+"&flag1=222";
				  }else
				  location.href="/Practice04/web/dami/xiaomi/jsp/index.jsp";
			  }else if(data==3){
				  layer.msg("验证码不对"); 
			  }
			  else{
				  layer.msg("密码不对"); 
			  }
		  })
  </script>
</body>
</html>