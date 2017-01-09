<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>index</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="index">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/styles/frontstage/setter/setButtom.css">
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".zh").attr("checked", "checked");
			$(".btn").click(function() {
				alert("保存成功！");
			});
		});
	</script>

  </head>
  
  <body>
    <div class="left">
		<h3>语言设置</h3>
		<img
			src="${pageContext.request.contextPath }/images/left_nav_border1.png"
			class="hrline" /><br /> <span style="color:#B8B7B7;font-size: 14px">以下信息设置后会在每次登录时都保留您的选择</span>

		<ul class="ul">
			<li><input type="radio" class="zh" name="language">中文</li>
			<li><input type="radio" class="en" name="language">英文</li>
			<li><a href="javascript:void(0);"><input type="button"
					value="保存" class="btn"> </a></li>
		</ul>
	</div>
  </body>
</html>
