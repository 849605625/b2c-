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
<legend>添加商品分类：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane" >
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
      <input type="text"  name="code" placeholder="请输入编号"  class="layui-input" lay-verify="required" required>
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
       <input class="layui-btn" type="button" value="确定"  lay-filter="add" lay-submit>
    </div>
  </div>
   </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
		formSubmit("/goodsCateController/addFirst.do","submit(add)","json",function(data){
			  if(data==0){
				  layer.msg("添加成功");
				  closeThis(3000);
			  }else if(data==1){
				  layer.msg("编号已存在");
			  }
			  else{
				  layer.msg("添加失败");
			  }
		  })
		  
	ajax('/goodsCateController/get.do',{action:'all'},'json',function(data){
	var html='';
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='partentCode']").html(html);
	form.render();
})
		  
	</script>
<script type="text/html" id="opt">
<option value='{{d.code}}'>{{d.name

}}</option>
</script>
</body>
</html>