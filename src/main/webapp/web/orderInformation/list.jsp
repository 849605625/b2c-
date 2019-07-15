<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/js/header.jsp"%>
<title>订单信息维护</title>
</head>
<body>
    <form class="layui-form"  method="get">
				<div class="layui-form-item">
					<label class="layui-form-label">编号:</label>
					<div class="layui-input-inline">
						<input type="text" name="code"  placeholder="编号"  class="layui-input" />
					</div>
				</div>
				   <div class="layui-form-item" >
    <label class="layui-form-label">状态</label>
    <div class="layui-input-inline">
				<select name="state">
				<option value=''></option>
				<option value='已发货'>已发货</option>
				<option value='未发货'>未发货</option>
				<option value='已下单'>已下单</option>
				</select>
			</div>
  </div>
				<input type="hidden" name="pageIndex" value="1">
				<input type="hidden" name="pageLimit" value="2">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input type="button" value="查询" class="layui-btn"  lay-filter="search" lay-submit>
						<input type="reset" value="重置" class="layui-btn" >
					</div>
				</div>
		</form>    
<form class="layui-form"  method="get">
		<div>
				<table class="layui-table">
					<thead>
						<tr>
							<td style="10%">序号</td>
							<td>编号</td>
							<td>用户编号</td>
							<td>收货人</td>
							<td>电话</td>
							<td>时间</td>
							<td>详细地址</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
				<div id="pageInfoUser" style="text-align: right">
				
				</div>
			</div>
		</form> 

		<script type="text/javascript">
			form.render();
			 $(function(){
				refresh();
			}) 
			 formSubmit("/orderInforController/search.do","submit(search)","json",function(data){
				 var  curr=$("input[name='pageIndex']").val();
				 var  limit=$("input[name='pageLimit']").val();
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
				    		 refresh();
				    	 } 
				    } 
				  }); 
				  var html="";
				  $.each(data.list,function(index,dom){
					  var addrCode=dom.proviceName+dom.cityName+dom.regionName+dom.addrCode;
				 	  html+="<tr><td>"+((index+1)+(curr-1)*limit)+"</td><td>"
					  +(dom.code?dom.code:'')+"</td><td>"+(dom.userCode?dom.userCode:'')+"</td><td>"+
					  (dom.person?dom.person:'')+"</td><td>"+(dom.tel?dom.tel:'')+"</td><td>"+
					  (dom.time?dom.time:'')+"</td><td>"+
					  (addrCode?addrCode:'')+"</td><td>"+
					  (dom.state?dom.state:'')+"</td><td>"+
					  "<input type='button' class='layui-btn' onclick='openUpd(\""+dom.code+"\")' value='修改' />&nbsp;"+
					  "<input type='button' class='layui-btn' onclick='openGoods(\""+dom.code+"\")' value='显示商品信息' />&nbsp;"+
					  "<input type='button' class='layui-btn layui-btn-danger' onclick='del(\""+dom.code+"\")' value='删除' />&nbsp;"+
					  "</td></tr>"    
				  })
				  $("#tbody").html(html); 
			  }) 
             function refresh(){
				$("input[value='查询']").click();
			 } 
			 function del(code){
					openConfirm(function(index){
						ajax('/orderInforController/deleteByCode.do', {code:code}, 'json', function(data){
					        if (data == 1) {
					            layer.msg('删除成功');
					            $("input[name='pageIndex']").val(1);
					            refresh();
					        } 
					         else if (data == 3){
				                layer.msg('删除失败');
				            }
					    })
					})
				}
			 
			 function openUpd(code){
					openLayer('/web/orderInformation/upd.jsp?code='+code,refresh)
				}
			 function openGoods(code){
					openLayer('/web/orderInformation/orderGoods.jsp?code='+code,refresh)
				}
		</script>
</body>
</html>