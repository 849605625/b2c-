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
<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<input type="hidden" name="pageIndex" value="1">
				<input type="hidden" name="pageLimit" value="3">
			<div class="subddzx">
				<ul>
					<li><a href="./self_info.html">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		   </div>
		   <div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
			<div id="dingdan"></div>
		   </div>
		 </div>
		 <div id="pageInfoUser" style="text-align: right">
				
				</div>
	</div>

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
   var user = "${user.code}"
	 aaaa();
	 function aaaa(){
		 var  curr=$("input[name='pageIndex']").val();
		 var  limit=$("input[name='pageLimit']").val();
			ajax('/orderInforController/getOrder.do',{userCode:user,curr:curr,limit:limit},'json',function(data){
				var laypage = layui.laypage  
					laypage.render({
				    elem: 'pageInfoUser',
				    count: data.count,
				    curr:curr,
				    limit:limit,
				    limits:[2,3,4,5],
				    layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
				    ,jump: function(obj,first){
				    	var  curr=$("input[name='pageIndex']").val(obj.curr);
				    	 var  limit=$("input[name='pageLimit']").val(obj.limit);
					    	  if(!first){
					    		  aaaa();
					    	 } 
				    } 
				  }); 
				
				var html='';
				$.each(data.list,function(i,d){
					var string=d.proviceName+","+d.cityName+","+d.regionName+","+d.addrCode
					var shu={code:d.code,state:d.state,code:d.code,time:d.time,addr:string,tel:d.tel,person:d.person}
					 html+=laytpl($('#tradd').html()).render(shu);
				})
				$("#dingdan").html(html)
			})
	 }

	function order(code,addr,tel,person){
	   openLayer('/web/dami/xiaomi/jsp/dddetails.jsp?code='+code+'&addr='+addr+'&tel='+tel+'&person='+person)
   }
</script>
<script id="tradd" type="text/html">
<div class="ddxq">
				<div class="ddspt fl"><img src="../image/liebiao_hongmin4_dd.jpg" alt=""></div>
				<div class="ddbh fl">订单号:{{d.code}}</div>
				<div class="ztxx fr">
					<ul>
						<li style="width:80px">{{d.state}}</li>
						<li>{{d.time}}</li>
						<li><a href="javascript:order('{{d.code}}','{{d.addr}}','{{d.tel}}','{{d.person}}')">订单详情></a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
</script>
</body>
</html>