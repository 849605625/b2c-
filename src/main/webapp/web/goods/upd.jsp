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
<legend>修改商品分类：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane" lay-filter="formA">
<div style="position :relative; left:30%"> 
 <div class="layui-form-item">
			<label class="layui-form-label">所属分类:</label>
			<div class="layui-input-inline">
				<select name="partentCode" lay-search></select>
			</div>
		</div>
 <div class="layui-form-item" >
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入编号"  class="layui-input" lay-verify="required" required readonly>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">名称</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" placeholder="请输入名称"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">描述</label>
    <div class="layui-input-inline">
      <input type="text"  name="descr" placeholder="请输入描述"  class="layui-input" >
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-item">
     <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="确定"  lay-filter="upd" lay-submit>
    </div>
  </div>
   </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">

function init(){
	form.val("formA", {partentCode:"${goods.partentCode}",code:"${goods.code}",name:"${goods.name}",descr:"${goods.descr}"})
    form.render();
}
		formSubmit("/goodsCateController/upd.do","submit(upd)","json",function(data){
			  if(data==0){
				  layer.msg("修改成功");
				  closeThis(3000);
			  }
			  else{
				  layer.msg("修改失败");
			  }
		  })
		  
	ajax('/goodsCateController/get.do',{action:'all'},'json',function(data){
	var html='';
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='partentCode']").html(html);
	form.render();
	init();
})
		  
	</script>
<script type="text/html" id="opt">
<option value='{{d.code}}'>{{d.name

}}</option>
</script>
</body>
</html>