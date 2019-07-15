<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/js/header.jsp"%>
</head>
<body>
  <form class="layui-form"  method="get">
		<div>
				<table class="layui-table">
					<thead>
						<tr>
							<td>商品编号</td>
							<td>名称</td>
							<td>数量</td>
							<td>价格</td>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
		</form> 
		<script type="text/javascript">
		var code = '<%=request.getParameter("code")%>';
		init();
		function init(){
			$.ajax({
		        url:"/Practice04/orderInforController/getGoods.do",
		        data : {code:code},
		        dataType : 'json',
		        type : 'post',
		        success : function(data) {
		        	 var html="";
					  $.each(data,function(index,dom){
					 	  html+="<tr><td>"
						  +(dom.goodsCode?dom.goodsCode:'')+"</td><td>"+(dom.name?dom.name:'')+"</td><td>"+
						  ((dom.number==0)?'':dom.number)+"</td><td>"+
						  (dom.price?dom.price:'')+"</td><tr>"
					  })
					  $("#tbody").html(html); 
		        }
		    })
		}
		</script>
</body>
</html>