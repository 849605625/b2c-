<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户信息管理</title>
<%@ include file="/web/js/header.jsp"%>
<style type="text/css">
.bottom{
text-align: center;
}
</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">管理员权限</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> 
				<img src="javascript:initImage();" class="layui-nav-img" alt="无头像"> 用户[${user.name}]
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:openUser()">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:openPass()">修改密码</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:goLogout();">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:openUrl('/Practice04/web/user/list.jsp');">用户信息维护</a>
							</dd>
							<dd>
								<a href="javascript:openUrl('/Practice04/web/admin/list.jsp');">管理员信息维护</a>
							</dd>
						</dl></li>
						<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:openUrl('/Practice04/web/goods/list.jsp');">商品分类维护</a>
							</dd>
							<dd>
								<a href="javascript:openUrl('/Practice04/web/goodsInformation/list.jsp');">商品信息维护</a>
							</dd>
						</dl></li>
						<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:openUrl('/Practice04/web/orderInformation/list.jsp');">订单信息维护</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">基础配置</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">基础数据维护</a>
							</dd>
							<dd>
								<a href="javascript:;">其他1</a>
							</dd>
							<dd>
								<a href="javascript:;">其他2</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<iframe name="rightframe" width="99%" height="99%" src="/Practice04/web/user/list.jsp;"></iframe>
			<!-- <div style="padding: 15px;">内容主体区域</div> -->
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			<div class="bottom">BY ST.QQH</div>
		</div>
	</div>
	<script>
		function openUrl(url) {
			window.open(url, "rightframe");
		}
		function openUser(){
			openLayer('/userController/getUpd.do?code=${user.code}&flag=1'
				,function(){location.reload();})
		}
		function initImage(){
			var image ="/picture/9059255e-0aa5-4f27-93b2-3a78c7a8ff94.jpg"
			 $('img[class="layui-nav-img"]').attr('src',image) 
		}
		 function openPass(){
				openLayer('/userController/getUpd.do?code=${user.code}&flag=2')
			}
	</script>
	<script type="text/javascript" src="/Practice04/web/layui/layui.all.js"></script>
</body>
</html>