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
<fieldset class="layui-elem-field">
<legend>登录：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane">
<div style="position :relative; left:30%"> 
 <div class="layui-form-item" >
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入账号"  class="layui-input" lay-verify="required" required>
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
       <input class="layui-btn" type="button" value="登录"  lay-filter="login" lay-submit>
        <a class="layui-btn"  value="返回注册" href="javascript:goJspReg();" >返回注册</a>
    </div>
  </div>
<!--   <input type="hidden" name="state" value="2">  -->
   </div> 
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
form.render();
		formSubmit("/userController/login.do","submit(login)","text",function(data){
			  if(data==0){
				  layer.msg("账号不存在");
			  }else if(data==1){
				  location.href="/Practice04/web/admin/admIndex.jsp";
			  }else if(data==4){
				 // location.href="/Practice04/web/admin/admIndex.jsp";
				  layer.msg("您是顾客身份"); 
			  }else if(data==3){
				  layer.msg("验证码不对"); 
			  }
			  else{
				  layer.msg("密码不对"); 
			  }
		  })
	</script>
</body>
</html>