<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/js/header.jsp"%>
<title>用户信息维护</title>
</head>
<body>
    <form class="layui-form"  method="get">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名:</label>
					<div class="layui-input-inline">
						<input type="text" name="name"  placeholder="用户名"  class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">账号:</label>
					<div class="layui-input-inline">
						<input type="text" name="code"  placeholder="账号"  class="layui-input" />
					</div>
				</div>
				<input type="hidden" name="pageIndex" value="1">
				<input type="hidden" name="pageLimit" value="2">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input type="button" value="添加" class="layui-btn"  onclick="openAdd()">
						<input type="button" value="查询" class="layui-btn"  lay-filter="search" lay-submit>
						<input type="reset" value="重置" class="layui-btn" >
					</div>
				</div>
				  <input type="hidden" name="state" value="1"> 
		</form>    
<form class="layui-form"  method="get">
		<div>
				<table class="layui-table">
					<thead>
						<tr>
							<td style="10%">序号</td>
							<td>账号</td>
							<td>用户名</td>
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
			 formSubmit("/userController/searchUser.do","submit(search)","json",function(data){
				 var  curr=$("input[name='pageIndex']").val();
				 var  limit=$("input[name='pageLimit']").val();
				var laypage = layui.laypage  
					laypage.render({
				    elem: 'pageInfoUser',
				    count: data.count,
				    curr:curr,
				    limit:limit,
				    limits:[2,4,6,8],
				    layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
				    ,jump: function(obj,first){
				    	var  curr=$("input[name='pageIndex']").val(obj.curr);
				    	 var  limit=$("input[name='pageLimit']").val(obj.limit);
				    	  if(!first){
				    		 refresh();
				    	 } 
				    } 
				  }); 
				 /*  setPageInfo('pageInfoUser',data.count,curr,limit,) */
				  var html="";
				  $.each(data.list,function(index,dom){
				 	  html+="<tr><td>"+((index+1)+(curr-1)*limit)+"</td><td>"
					  +(dom.code?dom.code:'')+"</td><td>"+(dom.name?dom.name:'')+"</td><td>"+
					  "<input type='button' class='layui-btn' onclick='openUpd(\""+dom.code+"\")' value='修改' />&nbsp;"+
					  "<input type='button' class='layui-btn layui-btn-danger' onclick='del(\""+dom.code+"\")' value='删除' />&nbsp;"+
					  "<input type='button' class='layui-btn' onclick='openPass(\""+dom.code+"\")' value='修改密码' />&nbsp;"+
					  "</td></tr>"    
				  })
				  $("#tbody").html(html); 
			  }) 
             function refresh(){
				$("input[value='查询']").click();
			 } 
			 var nowCode=${user.code}
			 function del(code){
					openConfirm(function(index){
						ajax('/userController/deleteByCode.do', {code:code,nowCode:nowCode}, 'json', function(data){
					        if (data == 1) {
					            layer.msg('删除成功');
					            $("input[name='pageIndex']").val(1);
					            refresh();
					        } else if (data == 2){
					            layer.msg('删除失败--账号正在被使用');
					        } else if (data == 3){
				                layer.msg('删除失败');
				            }
					    })
					})
				}
			 function openUpd(code){
					openLayer('/userController/getUpd.do?code='+code+'&flag=1',refresh)
				}
			 function openAdd(){
					openLayer('/web/user/add.jsp',refresh)
				}
			 function openPass(code){
					openLayer('/userController/getUpd.do?code='+code+'&flag=2')
				}
		</script>
</body>
</html>