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
		href="${pageContext.request.contextPath }/styles/frontstage/index/index_style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/styles/frontstage/top_bottomdiv_style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/styles/frontstage/myfollow/myfollowinfo.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }">
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }"></script>

  </head>
  
  <body>
    <!--个人资料  -->
	<div class="setup_main">
	<div class="setup_limail">
	<div class="hrbtop"><span class="font1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已有100人关注你</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="reques">没有尚未处理的关注请求</span></div>
	<hr color="red" style="width: 95%;"/>
	<div class="hrall"><a href="javascript:void(0);" class="font1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="font1">按关注时间排序</a></div>
		<br/>
		<div class="info">
		<br/>
			<div class="left"></div>
			<div class="left1">
				<table class="font2">
					<tr><td colspan="3"><span class="font1">简约语录</span><span class="font2">&nbsp;&nbsp;海外&nbsp;美国</span></td></tr>
					<tr><td>关注<a href="javascript:void(0);">&nbsp;1000&nbsp;|</a></td><td>粉丝<a href="javascript:void(0);">&nbsp;1000&nbsp;|</a></td><td>微博<a href="javascript:void(0);">&nbsp;1000</a></td></tr>
					<tr><td colspan="3">简介：</td></tr>
					<tr><td colspan="2">通过<a href="javascript:void(0);">新浪微博</a>关注</td><td><a href="javascript:void(0);">更多</a></td></tr>
				</table>
			</div>
			<div class="right"><a href="javascript:void(0);">关注&nbsp;|</a>&nbsp;<a href="javascript:void(0);">&nbsp;私信&nbsp;|</a>&nbsp;<a href="javascript:void(0);">&nbsp;移除粉丝&nbsp;|</a>&nbsp;<a href="javascript:void(0);">&nbsp;举报&nbsp;|</a></div>
		</div>
	</div>
	</div>
	<!--个人资料  -->
  </body>
</html>
