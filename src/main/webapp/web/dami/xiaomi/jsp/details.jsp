<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/web/dami/xiaomi/bodyheader.jsp"%>

<!-- xiangqing -->
	<form action="post" method="">
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">${goods.topName}</div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl"><img src="${pic}"></div>
		<div class="right fr">
			<div class="h3 ml20 mt20">${goods.topName}</div>
			<div class="jianjie mr40 ml20 mt10">${goods.descr}</div>
			<div class="jiage ml20 mt10">${goods.price}元</div>
			<div class="ft20 ml20 mt20">库存</div>
			<div class="xzbb ml20 mt10">
				<div class="banben fl">
					<a>
						<span>${goods.number}</span>
<!-- 						<span>2499元</span> -->
					</a>
				</div>
				<div class="banben fr">
					<a>
						<span>状态:${goods.state}</span>
<!-- 						<span>2899元</span> -->
					</a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="ft20 ml20 mt20">选择颜色</div>
			<div class="xzbb ml20 mt10">
				<div class="banben">
					<a>
						<span class="yuandian"></span>
						<span class="yanse">亮黑色</span>
					</a>
				</div>
				
			</div>
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl">${goods.topName} 全网通版 6GB内存 64GB 亮黑色</div>
					<div class="right1 fr">${goods.price}元</div>
					<div class="clear"></div>
				</div>
				<div class="bot mt20 ft20 ftbc">总计：${goods.price}元</div>
			</div>
			<div class="xiadan ml20 mt20">
					<input class="jrgwc"  type="button" name="jrgwc" value="立即选购" onclick="buyNow()"/>
					<input class="jrgwc" type="button" name="jrgwc" value="加入购物车" onclick="car()"/>
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</form>
	<!-- footer -->
	<footer class="mt20 center">
			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>



	<script type="text/javascript">
ajax('/goodsCateController/FirstGet.do',{},'json',firstshow)
function firstshow(data){
			   var h1="";
			   $.each(data,function(i,dom){
					var t1="<li><a href='javascript:fenlei(\""+dom.code+"\",1)'>"+dom.name+"</a>";
					h1+=t1+"</li>";
				});
			$("#second").html(h1);
		}
function fenlei(code,jibie) {
	 location.href="/Practice04/web/dami/xiaomi/jsp/list.jsp?code="+code+"&jibie="+jibie;
}
function aaa(){
    var name=$("input[name='name']").val()
		if(name == null || name == ""){
			
		}else{
			location.href="/Practice04/web/dami/xiaomi/jsp/list.jsp?name="+name;
		}
	}
		function car() {
			var user = "${user.code}"
			if (typeof user == "undefined" || user == null || user == "") {
				location.href = "/Practice04/web/dami/xiaomi/jsp/login.jsp?flag=111&code="+ "${goods.code}";
			} else {
				ajax('/carController/add.do', {code : "${goods.code}",user : user}, 'json', function(data) {
					if (data == 2) {
						layer.msg("加入成功");
					} else {
						layer.msg("加入失败");
					}
				})
			}
		}
		function buyNow(){
// 			location.href = "/Practice04/web/dami/xiaomi/jsp/buyNow.jsp?code="+"${goods.code}";
			location.href="/Practice04/goodsInforController/buyNow.do?code="+"${goods.code}";
		}
		    var flag1='<%=request.getParameter("flag1")%>';
		    var code1='<%=request.getParameter("code1")%>';
			if (flag1 == 333) {
			} else if (flag1 == 222) {
				location.href = "/Practice04/goodsInforController/getDetails.do?code="+ code1;
			}
	</script>
</body>
</html>