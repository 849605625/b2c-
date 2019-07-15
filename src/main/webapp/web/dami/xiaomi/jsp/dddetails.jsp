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
							<td>名称</td>
							<td>数量</td>
							<td>价格</td>
							<td>收获地址</td>
							<td>收件人</td>
							<td>联系方式</td>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
		</form> 
		<script type="text/javascript">
		var code = '<%=request.getParameter("code")%>';
		var addr = '<%=request.getParameter("addr")%>';
		var tel = '<%=request.getParameter("tel")%>';
		var person = '<%=request.getParameter("person")%>';
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
						  +(dom.name?dom.name:'')+"</td><td>"+
						  ((dom.number==0)?'':dom.number)+"</td><td>"+
						  (dom.price?dom.price:'')+"</td><td>"+addr+"</td><td>"+person+"</td><td>"+tel+
						  "</td><tr>"
					  })
					  $("#tbody").html(html); 
		        }
		    })
		}
		</script>
</body>
</html>