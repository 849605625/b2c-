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
<legend>添加管理员：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane" >
<div style="position :relative; left:30%"> 
 <div class="layui-form-item" >
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入账号"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" placeholder="请输入姓名"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password"  name="pass" placeholder="请输入密码"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
     <div class="layui-form-item" >
     <label class="layui-form-label">
     <img src='/Practice04/userController/AutoCode.do' onclick="this.src='/Practice04/userController/AutoCode.do?'+Math.random();">
     </label>
    <div class="layui-input-inline" >
      <input type="text" name="authCode" class="layui-input" lay-verify="required" required>
    </div>   
  </div>
  <div class="layui-form-item">
    <div class="layui-input-item">
     <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="确定"  lay-filter="add" lay-submit>
    </div>
  </div>
  <input type="hidden" name="state" value="2"> 
   </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
		formSubmit("/userController/add.do","submit(add)","json",function(data){
			  if(data==0){
				  layer.msg("添加管理员成功");
				  closeThis(3000);
			  }
			  else if(data==2){
				  layer.msg("验证码错误");
			  }
		  })
	</script>
</body>
</html>