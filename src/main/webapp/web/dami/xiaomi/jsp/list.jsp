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
		</div>
		
		
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
var cou=0;
var cou1=0;
var t1="";
	var t2="";
	var t3=""
	var t4=""
    var h2="";
	var h3="";
 		if (jibie == 2) {
 			ajax('/goodsInforController/listSecond.do',{code:code,flag:"1"},'json',show1)
 			}
 		if(jibie == 1){
 			ajax('/goodsInforController/listFirst.do',{code:code,flag:"1"},'json',show2)
 		}
 		function show2(data){
 			$.each(data,function(i,d){
 				count(d);
			});
 			$("#first").html("<div class='main center' id='list"+1+"'></div>");
 			if(cou1%5==0){
 				for (i = 0; i < (Math.floor(cou1/ 5)); i++) { 
 					h3+="<div class='main center' id='list"+i+"'></div>"
 				 }
 			}else{
 				for (i = 0; i < (Math.floor(cou1/ 5)+1); i++) { 
 					h3+="<div class='main center' id='list"+(i+1)+"'></div>"
 				 }
 			}
 			$("#first").html(h3);
 			$.each(data,function(i,d){
 				show4(d);
			});
 			$("#list"+(Math.floor(l/ 5)+1)).append("<div class='clear'></div></div>")
 		}
 		var l=0;
 		function show4(data){
 			data=JSON.parse(data)
 			$.each(data.infor,function(i,dom){
 				biaoqian(dom);
				l++;
				if(l%5==0){
					$("#list"+l/5).append(t4+"<div class='clear'></div></div>")
					t4=""
				}
			})
			if(l%5!=0){
				$("#list"+(Math.floor(l/ 5)+1)).append(t4)
	 			t4=""	
			}
 			pic(data)
 		}
 		
 		function count(data){
 			data=JSON.parse(data)
 			$.each(data.infor,function(i,dom){
				cou1++;
			});
 		}
 		
 		
 		     function show1(data){
 		    	t4=""
 		    	$("#first").html("<div class='main center' id='list"+1+"'></div>");
 		    	$.each(data.infor,function(i,dom){
 					cou++;
 					if(i%4==0&&i!=0){
 						h2+="<div class='main center' id='list"+i/4+"'></div>"
 					}
 				});
 				if(cou>=5){
 					if(cou%5==0){
 	 					$("#first").html(h2);
 	 				}else{
 	 					h2+="<div class='main center' id='list"+(Math.floor(cou/ 5)+1)+"'></div>"
 	 					$("#first").html(h2);
 	 				}
 				}
				$.each(data.infor,function(i,dom){
					biaoqian(dom);
				if(i%4==0&&i!=0){
					$("#list"+i/4).html(t4+"<div class='clear'></div></div>")
					t4=""
				}
			})
			$("#list"+(Math.floor(cou/ 5)+1)).html(t4+"<div class='clear'></div></div>")
			pic(data)
			cou=0;
 		}
 		     
 		function pic(data){
 			$.each(data.pic,function(i,dom){
				var t5="<a href='javascript:xiangqing(\""+dom.code+"\",2)' target='_blank'><img src='"+dom.url+"' alt='无图片'></a>"
				$("#div_"+dom.code).html(t5);	
			})
 		}
 		
 		function biaoqian(dom){
 			var da1='2px solid #fff';
			var da2='2px solid red';
			 t1="<div class='mingxing fl mb20'"
				+ " style='border:2px solid #fff;width:230px;cursor:pointer;'"
				+ " onmouseout='this.style.border=\""+da1+"\"' onmousemove='this.style.border=\""+da2+"\"'>";
			 t2="<div class='sub_mingxing' id='div_"+dom.code+"'></div>"
			 t3="<div class='pinpai'><a href='javascript:xiangqing(\""+dom.code+"\",2)' target='_blank'>"+dom.name+"</a></div>"
			+"<div class='youhui'>"+dom.descr+"</div>"+"<div class='jiage'>"+dom.price+'元'+"</div></div>"
			t4+=t1+t2+t3
			return t4;
 		}
 		var name='<%=request.getParameter("name")%>';
 		if(typeof name == "undefined" || name == null || name == ""){
 			
 		}else{
 			ajax('/goodsInforController/listSecond.do',{name:name,flag:"2"},'json',function(data){
               show1(data)
 	 		})
 		}
 		
 		function aaa(){
 			var name=$("input[name='name']").val()
	 		if(typeof name == "undefined" || name == null || name == ""){
	 			alert("你还没有输入任何条件")
	 		}else{
	 			ajax('/goodsInforController/listSecond.do',{name:name,flag:"2"},'json',function(data){
	               show1(data)
	 	 		})
	 		}
		}
 		function xiangqing(code){
 			location.href="/Practice04/goodsInforController/getDetails.do?code="+code+"&flag1=333";
 		}
	</script>
</body>
</html>