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
						<input type="checkbox" value="quanxuan" class="quanxuan" onchange="selectAll(this)" />全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价(元)</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计(元)</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				<div id="tbody"></div>
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="./index.jsp">继续购物</a></li>
						<li>|</li>
						<li>共<span id="allnumber"></span>件商品，已选择<span id="xz">0</span>件</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="all"></span>元</div>
					<div class="jsanniu fr"><input class="jsan" type="button" name="jiesuan"  value="去结算" onclick="jiesuan()"/></div>
					<div class="clear"></div>
				</div>
				<div class="clear" style=""></div>
			</div>
             </div>
             
             <script type="text/javascript">
             var user = "${user.code}"
             if(user==null||null==''){
            	 location.href = "/Practice04/web/dami/xiaomi/jsp/index.jsp";
             }
             var all=0.0;
             var allnumber=0;
             var flag=0;
             mycar();
             function mycar(){
            	 ajax('/carController/get.do', {user : user}, 'json', function(data) {
                     var string="";
                    $.each(data,function(i,dom){
                    	var shu={id:dom.id,name:dom.name,price:dom.price,number:dom.number,sum:sum(dom.number,dom.price),pic:dom.pic,goodsCode:dom.goodsCode}
                    	var temp=$("#tradd").html();
                    	string+=laytpl(temp).render(shu);
                    })
                     $("#tbody").html(string);
                     $("#all").html(all)
                     $("#allnumber").html(allnumber)
                     allnumber=0;
 				})
             }
             function sum(number,price){
            	 var ss=(parseFloat(price)*number).toFixed(2)
            	 allnumber=parseInt(allnumber)+parseInt(number)
            	 return ss;
             }
             
             function change(goodsCode,price,obj){
            	 flag=1;
            	 var ss=parseFloat($("#"+goodsCode).val())
                if(typeof ss === 'number'&&ss%1==0&&ss>0){
                	var a=ss*parseFloat(price)
                    var a1=parseFloat($("#div"+goodsCode).html())
                    var a3=(a-a1)/parseFloat(price);
                	$("#allnumber").html(parseInt($("#allnumber").html())+a3)
            	    $("#div"+goodsCode).html(a.toFixed(2))
            	    allSum()
             }else{
            	 alert("请输入大于0的整数")
              }
             }
             function delet(goodsCode){
            	 var user = "${user.code}"
            		 ajax('/carController/delete.do', {userCode:user,goodsCode:goodsCode}, 'json', function(data) {
                        if(data==1){
                        	layer.msg("删除成功");
                        	mycar();
                        }else if(data==0){
                        	layer.msg("参数错误");
                        }else{
                        	layer.msg("删除失败");
                        }
     				})
             }
             function selectAll(obj){
            	 $("input[type='checkbox']").prop('checked',$(obj).prop("checked"))
            	 allSum();
             }
             function allSum(){
            	 var num=$("input[name='num']:checked")
            	 var allSum=0.0
            	 var xz=0.0
            	  num.each(function(i,d){
            		var cost=$(this).parent().next().next().next().next().next().html()
            		var sss=parseInt($(this).parent().next().next().next().next().children().children().val())
            		xz+=sss
            		allSum+=parseFloat(cost)
            	})
            	$("#all").html(allSum.toFixed(2))
            	 $("#xz").html(xz)
             }
             function jiesuan(){
            	 var num=$("input[name='num']:checked")
            	 var ids=[]
            	 var numbb=[]
            	 num.each(function(i,d){
            		 ids.push($(d).val())
            		numbb.push( parseInt($(this).parent().next().next().next().next().children().children().val()))
             	})
             	if(ids.length==0){
             		layer.msg("您还没有选择商品");
             		return;
             	}
            	 if(flag==1){
            		 ajax('/carController/upd.do', {ids:JSON.stringify(ids),numbb:JSON.stringify(numbb)}, 'json', function(data) {
                         if(data==2){
                         	layer.msg("下单失败");
                         }else if(data==1){
                        	 flag=0;
                         	location.href="/Practice04/web/dami/xiaomi/jsp/jiesuan.jsp?ids="+ids;
                         }
       				}) 
            	 }else{
            		 location.href="/Practice04/web/dami/xiaomi/jsp/jiesuan.jsp?ids="+ids;
            	 }
             }
             function mydingdan(){
     			location.href = "/Practice04/web/dami/xiaomi/jsp/dingdan.jsp";
     		}
             </script>
             <script id="tradd" type="text/html">
			<div class="content2 center">
					<div class="sub_content fl ">
						<input type="checkbox"  value="{{d.id}}" class="quanxuan" name="num" onchange="allSum()"/>
					</div>
					<div class="sub_content fl"><img src="/picture/{{d.pic}}"></div>
					<div class="sub_content fl ft20">{{d.name}}</div>
					<div class="sub_content fl ">{{d.price}}</div>
					<div class="sub_content fl">
                    <div style='margin:50px 2px' >
                  <input class="shuliang" type="number" id="{{d.goodsCode}}" value="{{d.number}}" step="1" min="1" onchange='change("{{d.goodsCode}}","{{d.price}}",this)' >
                   </div>
					</div>
					<div class="sub_content fl" id="div{{d.goodsCode}}">{{d.sum}}</div>
					<div class="sub_content fl"><a href="javascript:delet('{{d.goodsCode}}')">×</a></div>
					<div class="clear"></div>
				</div>
		</script>
		
</body>
</html>