<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小米商城</title>

</head>
<body>
<%@ include file="/web/dami/xiaomi/bodyheader.jsp"%>

	<!-- start banner_y -->
	<div class="banner_y center">
		<div class="nav" style="float: left;">
			<ul id="first">
			</ul>
		</div>
		<div class="layui-carousel" id="test1" style="float: left;">
			<div carousel-item>
				<div>
					<img src="../image/xmad_15604376269834_KomUl.jpg">
				</div>
				<div>
					<img src="../image/banner2.jpg">
				</div>
				<div>
					<img src="../image/xmad_15604196596365_kRKqW.jpg">
				</div>
				<div>
					<img src="../image/banner2.jpg">
				</div>
				<div>
					<img src="../image/banner2.jpg">
				</div>
			</div>
		</div>
	</div>
	<!-- 		end banner_y -->


	<div class="sub_banner center">
			<div class="sidebar fl">
				<div class="fl"><a href=""><img src="../image/hjh_01.gif"></a></div>
				<div class="fl"><a href=""><img src="../image/hjh_02.gif"></a></div>
				<div class="fl"><a href=""><img src="../image/hjh_03.gif"></a></div>
				<div class="fl"><a href=""><img src="../image/hjh_04.gif"></a></div>
				<div class="fl"><a href=""><img src="../image/hjh_05.gif"></a></div>
				<div class="fl"><a href=""><img src="../image/hjh_06.gif"></a></div>
				<div class="clear"></div>
			</div>
			<div class="datu fl"><a href=""><img src="../image/hongmi4x.png" alt=""></a></div>
			<div class="datu fl"><a href=""><img src="../image/xiaomi5.jpg" alt=""></a></div>
			<div class="datu fr"><a href=""><img src="../image/pinghengche.jpg" alt=""></a></div>
			<div class="clear"></div>


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
			   var h2="";
			   $.each(data,function(i,dom){
					var t1="<li><a href='javascript:fenlei(\""+dom.code+"\",1)'>"+dom.name+"</a>";
					var t2="<div class='pop' id='div_"+dom.code+"'></div>";
					h1+=t1+"</li>";
					h2+=t1+t2;
				});
			$("#first").html(h2);
			$("#second").html(h1);
			$.each(data,function(i,dom){
				var code=dom.code;
				ajax('/goodsCateController/nextGet.do',{code:code},'json',function(data){
					var h="";
					var a=0;
					$.each(data,function(i,dom){
						a++;
						h+=secondShow(i,dom);
					});
					if((a+1)%6!=0){
						h+="</div>"
					}
					$("#div_"+code).html(h);
					h=""
				})
			})
		}
		
		function secondShow(i, dom) {
			var h1 = ""
			var t0 = "<div class='left fl'>"
			var t4="<div class='ctn fl'>"
		    var t5="<div class='right fl'>"
			var t1 = "<div><div class='xuangou_left fl'>"
			var t2 = "<a href='javascript:fenlei(\""
					+ dom.code
					+ "\",2)'>"
					+ "<div class='img fl'><img src='../image/xm6_80.png' alt=''></div>"
			var t3 = "<span class='fl'>"
					+ dom.name
					+ "</span>"+"<div class='clear'></div>"
					+ "</a>"+"</div>"
					+ "<div class='xuangou_right fr'><a href='javascript:fenlei(\""+dom.code+"\",2)'>选购</a></div>"
					+"<div class='clear'></div></div>"
			if (i == 0 && Math.floor(i / 6) == 0) {
				h1 += t0 + t1 + t2 + t3 
			} else if(Math.floor(i / 6)==0){
				h1 += t1 + t2 + t3 
			}else if(i==6){
				h1 += t4 + t1 + t2 + t3 
			}
			else if(Math.floor(i / 6)==1){
				h1 += t1 + t2 + t3 
			}else if(i==12){
				h1 += t5 + t1 + t2 + t3 
			}
			else if(Math.floor(i / 6)==2){
				h1 +=  t1 + t2 + t3 
			}
			if(i!=0&&(i+1)%6==0&&i<18){
				h1+="</div>"
			}
			return h1;		
		}
		
		
		function fenlei(code,jibie) {
			 location.href="/Practice04/web/dami/xiaomi/jsp/list.jsp?code="+code+"&jibie="+jibie;
		}

		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				height : '460px',
				width : '990px' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		
		function aaa(){
           var name=$("input[name='name']").val()
	 		if(name == null || name == ""){
	 			alert("你还没有输入任何条件")
	 		}else{
	 			location.href="/Practice04/web/dami/xiaomi/jsp/list.jsp?name="+name;
	 		}
		}
		
	</script>
</body>
</html>