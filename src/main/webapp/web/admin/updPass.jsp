<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/js/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="layui-form"   method="post">
   <div class="layui-form-item">
            <label class="layui-form-label">请输入旧密码</label>
            <div class="layui-input-inline">
                <input type="password" name="oldPassword" lay-verify="required" placeholder="请输入旧密码" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请输入新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="newPassword" lay-verify="required" placeholder="请输入新密码" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
        <input type="hidden" name="oldPass" value="${user.pass}"> 
        <input type="hidden" name="code" value="${user.code}"> 
        <div class="layui-form-item">
					<div class="layui-input-block">
						<input type="button" value="确定" class="layui-btn"  lay-filter="updPass" lay-submit>
					</div>
				</div>
</form>
<script type="text/javascript">

	form.on('submit(updPass)', function(data) {
		$.ajax({
			url : "/Practice04/userController/updPass.do",
			data : data.field,
			dataType : "json",
			type : "post",
			success : function(data) {
				if (data == 2) {
					layer.msg("旧密码错误");
				} else if (data == 1) {
					layer.msg("修改成功");
				} 
			}
		})
	});
</script>
</body>
</html>