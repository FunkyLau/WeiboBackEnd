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
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/frontstage/setter/setButtom.css">
	

  </head>
  
  <body>
    <div class="left">
    	<h4>黑名单</h4><br>
    	<hr class="divline"><br>
    	<p style="color:#B8B7B7;font-size:14px">被加入黑名单的用户将无法关注你、评论你。如果你已经关注他，也会自动解除关系。</p>
    	
    	<div style="visibility:hidden;" class="info_tip gray6">
    		<span class="error_color">*</span>
    	</div><br>
    	<p style="color:#444444;font-size:16px">还没有人被你拉入黑名单呢。</p>
    </div>
  </body>
</html>
