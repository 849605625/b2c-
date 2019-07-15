<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/js/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/Practice04/web/dami/xiaomi/css/style.css">
<style type="text/css">
.gwcxqbj .gwcxd .content2 .sub_content img{display:block;width: 90px;height: 90px;opacity: 0.85}
.gwcxqbj .gwcxd .content2 .sub_content img:hover{width: 90px;height: 90px;opacity: 1;}
</style>
</head>
<body>
<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40">我的购物车</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				<ul>
					<li><a href="javascript:mydingdan()" target="_blank">我的订单</a></li>
					<li>|</li>
					<li><a href="./register.jsp" target="_blank">用户${user.name }</a></li>
					<li>|</li>
					<li><a href="javascript:goLogout2()">注销</a></li>	
				</ul>
				
			</div>
			<div class="clear"></div>
		</div>

		<div class="xiantiao"></div>
             <div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
				<div class="sub_top fl">
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价(元)</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计(元)</div>
					<div class="clear"></div>
				</div>
<!-- 				<div id="tbody"></div> -->
			<div class="content2 center">
                    <div class="sub_content fl ">
					</div>
					<div class="sub_content fl"><img src="${pic}"></div>
					<div class="sub_content fl ft20">${goods.name}</div>
					<div class="sub_content fl ">${goods.price}元</div>
					<div class="sub_content fl">
                    <div style='margin:50px 2px' >
                  <input class="shuliang" id="" value="1" readonly>
                   </div>
					</div>
					<div class="sub_content fl" id="div{{d.goodsCode}}">${goods.price}元</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="./index.jsp">继续购物</a></li>
						<li>|</li>
						<li>共<span id="allnumber">1</span>件商品
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="all">${goods.price}</span>元</div>
					<div class="jsanniu fr"><input class="jsan" type="button" name="jiesuan"  value="下单" onclick="xiadan()"/></div>
					<div class="clear"></div>
				</div>
				<div class="clear" style=""></div>
			</div>
             </div>
	<fieldset class="layui-elem-field">
		<div class="layui-field-box" id="show1">
			<form class="layui-form layui-form-pane" method="get"
				lay-filter="formA">
				收货地址:
				<div class="layui-form-item">
				<label class="layui-form-label">地址:</label>
					<div class="layui-input-inline">
						<select name="region" ></select>
					</div>
					<label class="layui-form-label">收件人</label>
					<div class="layui-input-inline">
						<select name="person" ></select>
					</div>
					<label class="layui-form-label">电话</label>
					<div class="layui-input-inline">
						<select name="tel" ></select>
					</div>
					<input class="layui-btn" type="button" value="使用新地址" onclick="add(1)">
				</div>
			</form>
		</div>
		
		<div class="layui-field-box" id="show2">
    <form class="layui-form layui-form-pane"  method="get" lay-filter="formB">
   新添地址:
   <div class="layui-form-item">
			<label class="layui-form-label">省:</label>
			<div class="layui-input-inline">
				<select name="provice" lay-filter="provice"></select>
			</div>
			<label class="layui-form-label">市:</label>
			<div class="layui-input-inline">
				<select name="city" lay-filter="city"></select>
			</div>
			<label class="layui-form-label">区:</label>
			<div class="layui-input-inline">
				<select name="region2" lay-search></select>
			</div>
			<label class="layui-form-label">详细地址</label>
     <div class="layui-input-inline">
      <input type="text"  name="addrCode" placeholder="详细地址"  class="layui-input" lay-verify="required" required>
    </div>
		</div>
		<div class="layui-form-item">
    <label class="layui-form-label">收件人</label>
    <div class="layui-input-inline">
      <input type="text"  name="person2" placeholder="收件人"  class="layui-input" lay-verify="required" required>
    </div>
    <label class="layui-form-label">电话</label>
     <div class="layui-input-inline">
      <input type="text"  name="tel2" placeholder="电话"  class="layui-input" lay-verify="required" required>
    </div>
       <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="下单" onclick="xiadan()">
       <input class="layui-btn" type="button" value="取消" onclick="add(2)">
	</div>
  </form>
  </div>
	</fieldset>
	<script type="text/javascript">
	         $("#show2").hide();
	         var code='<%=request.getParameter("code")%>';
             var user = "${user.code}"
             if(user==""){
            	 alert("你还没有登录")
            	 location.href="/Practice04/web/dami/xiaomi/jsp/login.jsp"
             }
             var string="";
             var biao=1;
             init();
             function init(){
            	 if(code==''){
            		 layer.msg("您还没有选择商品");
            		 location.href="./index.jsp"
              		return;
            	 }
             }
             gerAddr();
             function gerAddr(){
            	 ajax('/orderInforController/getAddr.do',{userCode:user},'json',function(data){
                	 var html1='';
                	 var html2='';
                	 var html3='';
                	 $.each(data,function(i,dom){
                		 var StringCo=dom.provice+","+dom.city+","+dom.region+","+dom.addrCode
                		 var string=dom.proviceName+","+dom.cityName+","+dom.regionName+","+dom.addrCode
                		 var shu={addr:string,person:dom.person,tel:dom.tel,StringCo:StringCo}
                		 html1+=laytpl($('#opt').html()).render(shu);
                		 html2+=laytpl($('#opt2').html()).render(shu);
                		 html3+=laytpl($('#opt3').html()).render(shu);
                	 })
                		$("select[name='region']").html(html1);
                	 $("select[name='person']").html(html2);
                	 $("select[name='tel']").html(html3);
                		form.render();
                	}) 
             }
		function xiadan() {
			if (biao == 1) {
				ajax('/orderInforController/buyNow.do', {
					userCode : user,
					orderAddr : $("select[name='region']").val(),
					price:"${goods.price}",
					code:"${goods.code}",
					person : $("select[name='person']").val(),
					tel : $("select[name='tel']").val()
				}, 'json', function(data) {
					if (data == 1) {
						layer.msg("下单成功");
					} else {
						layer.msg("下单失败");
					}
				})
			}
			if (biao == 2) {
				var StringCo1 = $("select[name='provice']").val() + ","
						+ $("select[name='city']").val() + ","
						+ $("select[name='region2']").val() + ","
						+ $("input[name='addrCode']").val()
				ajax('/orderInforController/buyNow.do', {
					userCode : user,
					orderAddr : StringCo1,
					price:"${goods.price}",
					code:"${goods.code}",
					person : $("input[name='person2']").val(),
					tel : $("input[name='tel2']").val()
				}, 'json', function(data) {
					if (data == 1) {
						layer.msg("下单成功");
					} else {
						layer.msg("下单失败");
					}

				})
			}

		}
		function add(a) {
			if (a == 1) {
				$("#show1").hide();
				$("#show2").show();
				ajax('/orderGoodsController/FirstGet.do', {}, 'json', function(
						data) {
					var html = '';
					html += "<option value=''></option>";
					$.each(data, function(i, d) {
						html += laytpl($('#opt4').html()).render(d);
					})
					$("select[name='provice']").html(html);
					$("select[name='city']").html("");
					 $("select[name='region']").html("");
					form.render();
				})
				biao = 2;
			}
			if (a == 2) {
				$("#show2").hide();
				$("#show1").show();
				 biao=1;
				 $("select[name='city']").html("");
				 $("select[name='region2']").html("");
			}
		}
		form.on('select(provice)', function(data) {
			$.ajax({
				url : "/Practice04/orderGoodsController/secondGet.do",
				data : {
					code : data.value
				},
				dataType : "json",
				type : "post",
				success : function(msg) {
					var html = '';
					html += "<option value=''></option>";
					$.each(msg, function(i, d) {
						var shu = {
							person : d.name,
							StringCo : d.id
						}
						html += laytpl($('#opt5').html()).render(d);
					})
					$("select[name='city']").html(html);
					$("select[name='region2']").html("");
					form.render();
				}
			})
		});
		form.on('select(city)', function(data) {
			$.ajax({
				url : "/Practice04/orderGoodsController/thirdGet.do",
				data : {
					code : data.value
				},
				dataType : "json",
				type : "post",
				success : function(msg) {
					var html = '';
					html += "<option value=''></option>";
					$.each(msg, function(i, d) {
						html += laytpl($('#opt6').html()).render(d);
					})
					$("select[name='region2']").html(html);
					form.render();
				}
			})
		});
		function mydingdan(){
			location.href = "/Practice04/web/dami/xiaomi/jsp/dingdan.jsp";
		}
	</script>
	<script type="text/html" id="opt">
        <option value='{{d.StringCo}}'>{{d.addr}}</option>
       </script>
	<script type="text/html" id="opt2">
        <option value='{{d.person}}'>{{d.person}}</option>
    </script>
	<script type="text/html" id="opt3">
        <option value='{{d.tel}}'>{{d.tel}}</option>
    </script>
	<script type="text/html" id="opt4">
<option value='{{d.id}}'>{{d.name

}}</option>
</script>
	<script type="text/html" id="opt5">
<option value='{{d.id}}'>{{d.name

}}</option>
</script>
	<script type="text/html" id="opt6">
<option value='{{d.id}}'>{{d.name

}}</option>
</script>
</body>
</html>