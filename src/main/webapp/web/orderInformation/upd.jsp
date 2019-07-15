<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/js/header.jsp"%>
</head>
<body>
<fieldset class="layui-elem-field">
<legend>修改：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane"  method="get" lay-filter="formA">
 <div class="layui-form-item" >
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入编号"  class="layui-input" readonly>
    </div>
    <label class="layui-form-label">状态</label>
    <div class="layui-input-inline">
				<select name="state">
				<option value='未发货'>未发货</option>
				<option value='已发货'>已发货</option>
				<option value='已下单'>已下单</option>
				</select>
			</div>
  </div>
   收货地址:
   <div class="layui-form-item">
			<label class="layui-form-label">省:</label>
			<div class="layui-input-inline">
				<select name="provice" lay-filter="provice"></select>
			</div>
			<label class="layui-form-label">市:</label>
			<div class="layui-input-inline">
				<select name="city" lay-filter="city"></select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">区:</label>
			<div class="layui-input-inline">
				<select name="region" lay-search></select>
			</div>
			<label class="layui-form-label">详细地址</label>
     <div class="layui-input-inline">
      <input type="text"  name="addrCode" placeholder="详细地址"  class="layui-input" lay-verify="required" required>
    </div>
	</div>
  	<div class="layui-form-item" >
    <label class="layui-form-label">收件人</label>
    <div class="layui-input-inline">
      <input type="text"  name="person" placeholder="收件人"  class="layui-input" lay-verify="required" required>
    </div>
    <label class="layui-form-label">电话</label>
     <div class="layui-input-inline">
      <input type="text"  name="tel" placeholder="电话"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-item">
     <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="确定"  lay-filter="upd" lay-submit>
    </div>
  </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">


form.on('select(provice)', function(data){
	  $.ajax({
		  url:"/Practice04/orderGoodsController/secondGet.do",
		  data:{code:data.value},
		  dataType:"json",
		  type: "post",
		  success :function(msg){
			  var html='';
			  html+="<option value=''></option>";
				$.each(msg,function(i,d){
					html+=laytpl($('#opt2').html()).render(d);
				})
				$("select[name='city']").html(html);
				$("select[name='region']").html("");
				form.render();  
		  }
	  })
	});
form.on('select(city)', function(data){
	  $.ajax({
		  url:"/Practice04/orderGoodsController/thirdGet.do",
		  data:{code:data.value},
		  dataType:"json",
		  type: "post",
		  success :function(msg){
			  var html='';
				$.each(msg,function(i,d){
					html+=laytpl($('#opt3').html()).render(d);
				})
				$("select[name='region']").html(html);
				form.render();  
		  }
	  })
	});
ajax('/orderGoodsController/FirstGet.do',{},'json',function(data){
	var html='';
	html+="<option value=''></option>";
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='provice']").html(html);
	form.render();
	init();
})
var code = '<%=request.getParameter("code")%>';
function init(){
	$.ajax({
        url:"/Practice04/orderInforController/get.do",
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	var html='';
        	$.each(data.list2,function(i,d){
        		html+=laytpl($('#opt2').html()).render(d);
        	})
        	$("select[name='city']").html(html);
        	var h='';
        	$.each(data.list3,function(i,d){
        		h+=laytpl($('#opt3').html()).render(d);
        	})
        	$("select[name='region']").html(h);
        	form.render();
        	form.val("formA", {code:code,state:data.list1.state,provice:data.list1.provice,city:data.list1.city,
        		region:data.list1.region,addrCode:data.list1.addrCode,person:data.list1.person,tel:data.list1.tel
        		})
            form.render();
        }
    })
}
formSubmit('/orderInforController/update.do', 'submit(upd)', 'json', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});
</script>
	<script type="text/html" id="opt">
<option value='{{d.id}}'>{{d.name

}}</option>
</script>
	<script type="text/html" id="opt2">
<option value='{{d.id}}'>{{d.name

}}</option>
</script>
	<script type="text/html" id="opt3">
<option value='{{d.id}}'>{{d.name

}}</option>
</script>
</body>
</html>