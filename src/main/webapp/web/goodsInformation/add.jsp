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
<legend>添加：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane"  method="get">
<div style="position :relative; left:30%"> 
 <div class="layui-form-item" >
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入编号"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">名称</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" placeholder="请输入名称<"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">单价</label>
    <div class="layui-input-inline">
      <input type="text"  name="price" placeholder="请输入单价"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">描述</label>
    <div class="layui-input-inline">
      <input type="text"  name="descr" placeholder="请输入描述"  class="layui-input" >
    </div>
  </div>
    <div class="layui-form-item" >
    <label class="layui-form-label">数量</label>
    <div class="layui-input-inline">
      <input type="text"  name="number" placeholder="请输入数量"  class="layui-input" >
    </div>
  </div>
   <div class="layui-form-item" >
    <label class="layui-form-label">状态</label>
<!--     <div class="layui-input-inline"> -->
<!--       <input type="text"  name="state" placeholder="请输入状态"  class="layui-input" > -->
<!--     </div> -->
<div class="layui-input-inline">
				<select name="state">
				<option value='上架' selected>上架</option>
				<option value='下架'>下架</option>
				</select>
			</div>
  </div>
   <div class="layui-form-item">
			<label class="layui-form-label">一级分类:</label>
			<div class="layui-input-inline">
				<select name="firstCateCode" lay-filter="firstCateCode"></select>
			</div>
		</div>
		  <div class="layui-form-item">
			<label class="layui-form-label">二级分类:</label>
			<div class="layui-input-inline">
				<select name="cateCode" lay-search></select>
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
     
       form.on('select(firstCateCode)', function(data){
	  $.ajax({
		  url:"/Practice04/goodsCateController/nextGet.do",
		  data:{code:data.value},
		  dataType:"json",
		  type: "post",
		  success :function(msg){
			  var html='';
				$.each(msg,function(i,d){
					html+=laytpl($('#opt2').html()).render(d);
				})
				$("select[name='cateCode']").html(html);
				form.render();  
		  }
	  })
	}); 


		formSubmit("/goodsInforController/add.do","submit(add)","text",function(data){
			  if(data==0){
				  layer.msg('添加成功');
				/*   ajax('/DepartmentServlet',{action:'addNum',codeDepartment:$("select[name='codeDepartment']").val()},'json')  */
			      closeThis(3000);
			  }else if(data==1){
				  layer.msg("账号已存在"); 
			  }
			  else{
				  layer.msg("添加失败"); 
			  }
		  })
		  
	ajax('/goodsCateController/FirstGet.do',{action:'all'},'json',function(data){
	var html='';
	html+="<option value=''></option>";
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='firstCateCode']").html(html);
	form.render();
})


var laydate=layui.laydate;
laydate.render({
		elem: "#entryTime",
		type:"datetime"
	  });
	</script>
	
	<script type="text/html" id="opt">
<option value='{{d.code}}'>{{d.name

}}</option>
</script>
	<script type="text/html" id="opt2">
<option value='{{d.code}}'>{{d.name

}}</option>
</script>
</body>
</html>