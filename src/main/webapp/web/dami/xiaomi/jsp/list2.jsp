<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>
</head>
<body>
<%@ include file="/web/dami/xiaomi/bodyheader.jsp"%>


<!-- start danpin -->
		<div class="danpin center">
		<div class="biaoti center">小米手机</div>
	    <div id="first"></div>
	    <div id="pageInfoUser" style="text-align: right">
				
				</div>
		</div>
		
		<input type="hidden" name="pageIndex" value="1">
				<input type="hidden" name="pageLimit" value="4">
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
		var code = '<%=request.getParameter("code")%>';
		var jibie='<%=request.getParameter("jibie")%>';
		if (jibie == 2) {
			listSecond();
			function listSecond(){
				var  curr=$("input[name='pageIndex']").val();
				 var  limit=$("input[name='pageLimit']").val();
				ajax('/goodsInforController/listSecond.do',{code:code,flag:"1",curr:curr,limit:limit},'json',function (data){
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
						    		  listSecond();
						    	 } 
					    } 
					  }); 
						show1(data)
				})
			 }
 			}
		if(jibie == 1){
			listFirst();
			function listFirst(){
				var  curr=$("input[name='pageIndex']").val();
				 var  limit=$("input[name='pageLimit']").val();
				ajax('/goodsInforController/listFirst.do',{code:code,flag:"1",curr:curr,limit:limit},'json',function(data){
					$.each(data,function(i,d){
		 				count111(d);
					});
					var laypage = layui.laypage  
					laypage.render({
				    elem: 'pageInfoUser',
				    count: count1,
				    curr:curr,
				    limit:limit,
				    limits:[2,3,4,5],
				    layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
				    ,jump: function(obj,first){
				    	var  curr=$("input[name='pageIndex']").val(obj.curr);
				    	 var  limit=$("input[name='pageLimit']").val(obj.limit);
					    	  if(!first){
					    		  listFirst();
					    	 } 
				    } 
				  }); 
					count1=0;
					$.each(data,function(i,d){
						d=JSON.parse(d)
						show1(d)
					});
				})
			}
 		}
		var count1=0
		function count111(data){
 			data=JSON.parse(data)
 			count1+=data.count
 		}
		var count=0;
		function show1(data){
			         t4=""
					var h2="";
					var string="";
					flag77=2;
			$.each(data.infor,function(i,dom){
				count++;
				if(count%6==0||count==1){
				h2+="<div class='main center' id='list"+(Math.floor(count/ 5)+1)+"'><div class='clear'></div></div>"
				$("#first").append(h2);
				h2=""
				}
				string+=laytpl($('#tradd').html()).render(dom);
				if((i+1)%5==0){
					$("#list"+((i+1)/5)).html(string);
					string="";
					flag77=1;
				}
			})
			if(flag77!=1){
				$("#list"+(Math.floor(count/ 5)+1)).append(string);
				string="";
			}
			pic(data)
		}
		function pic(data){
 			$.each(data.pic,function(i,dom){
				var t5="<a href='javascript:xiangqing(\""+dom.code+"\",2)' target='_blank'><img src='"+dom.url+"' alt='无图片'></a>"
				$("#div_"+dom.code).html(t5);	
			})
 		}
		</script>
		
		  <script id="tradd" type="text/html">
			<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<div class="sub_mingxing" id="div_{{d.code}}"></div>
					<div class="pinpai"><a href="javascript:xiangqing('{{d.code}}',2)" target="_blank">{{d.name}}</a></div>
					<div class="youhui">{{d.descr}}</div>
					<div class="jiage">{{d.price}}元</div>
				</div>
		</script>
</body>
</html>