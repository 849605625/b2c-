<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/js/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/Practice04/web/dami/xiaomi/css/style.css">
</head>
<body>
<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="javascript:mycar()">购物车</a></div>
					<div class="fr">
				<ul>
					<%
						Object obj = session.getAttribute("user");
						if (obj == null) {
					%>
					<li><a href="/Practice04/web/dami/xiaomi/jsp/login.jsp"
						target="_blank">登录</a></li>
					<li>|</li>
					<li><a href="/Practice04/web/dami/xiaomi/jsp/register.jsp"
						target="_blank">注册</a></li>
					<%
						} else {
					%>
					<li><a href="javascript:mydingdan()" target="_blank">我的订单</a></li>
					<li>|</li>
					<li><a href="./register.jsp" target="_blank">用户${user.name }</a></li>
					<li>|</li>
					<li><a href="javascript:goLogout2()">注销</a></li>
					<%
						}
					%>
					<li>|</li>
					<li><a href="">消息通知</a></li>
				</ul>
			</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
		<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul id="second">
				</ul>
			</div>
			<div class="search fr">
				<form  method="post" class="layui-form">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货" name="name">
					</div>
					<div class="submit fl">
						<input type="button" class="sousuo" value="搜索" onclick="aaa()"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
		
		<script type="text/javascript">
		function mycar(){
			var user = "${user}"
				 if(user==null||user==""){
					 alert("你还没有登录")
				 }else{
					 location.href = "/Practice04/web/dami/xiaomi/jsp/car.jsp";
				 }
		}
		 function mydingdan(){
  			location.href = "/Practice04/web/dami/xiaomi/jsp/dingdan.jsp";
  		}
		</script>
</body>
</html>