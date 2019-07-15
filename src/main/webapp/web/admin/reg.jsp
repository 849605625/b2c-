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
<legend>注册：</legend>
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
    <label class="layui-form-label">权限密码</label>
    <div class="layui-input-inline">
      <input type="password"  name="admPass" placeholder="管理员注册权限密码"  class="layui-input">
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
       <input class="layui-btn" type="button" value="注册"  lay-filter="reg" lay-submit>
        <a class="layui-btn"  value="返回登录" href="javascript:goJspLogin();" >返回登录</a>
    </div>
  </div>
   </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
		formSubmit("/userController/reg.do","submit(reg)","json",function(data){
			  if(data==0){
				  location.href="/Practice04/web/admin/login.jsp";
			  }else if(data==1){
				  layer.msg("账号已存在"); 
			  }
			  else if(data==2){
				  layer.msg("验证码错误");
			  }
			  else{
				  layer.msg("注册失败"); 
			  }
		  })
	</script>
</body>
</html>