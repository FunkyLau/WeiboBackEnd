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
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery/jquery.Jcrop.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/frontstage/setter/realmUser.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/styles/frontstage/setter/realmUser.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/styles/jquery/jquery.Jcrop.css" type="text/css" />


  </head>
  
  <body>
    <div id="maindiv">
    	<div id="titlediv">
    		<span>修改头像</span>
    	</div>
    	<div id="contentdiv">
    		<form id="uploadHeadImg" enctype="multipart/form-data" method="post">
    			<div id="contentdiv_title">
    				<input type="file" name="upload" onchange="javascript:fileChange(this)" id="uploadFile"/>
    			</div>
    		</form>
    		<div id="contentdiv_left">
    			<div id="left_div">
    				<div>
    					<img id="target" src="${pageContext.request.contextPath }/images/nohead.png"/>
    				</div>
    			</div>
    		</div>
    		<div id="contentdiv_right">
    			<div id="preview_box">
    				<img id="crop_preview" src="${pageContext.request.contextPath }/images/male_180.png" width="180px" height="180px">
    			</div>
    			<div id="left_div_submit">
    				<input type="button" value="保存" onclick="cutImgBtn()"/>
    			</div>
    		</div>
    	</div>
    </div>
  </body>
</html>
