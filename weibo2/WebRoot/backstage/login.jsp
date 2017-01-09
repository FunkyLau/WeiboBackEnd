<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.easyui.min.js"></script>
	<!-- jQuery验证的插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/jeasyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/jeasyui/themes/icon.css">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#dd").dialog({
				title:"管理员登录",
				width:500,
				height:300,
				closed:false,
				cache:false,
				modal:true,
				top:"130px"
			});
			$("#aa").validate({
				rules:{
					code:{
						remote:{
							url:"${pageContext.request.contextPath}/AdminsAction_checkCode.action?time="+new Date().getTime(),
							type:"post",
							datatype:"json",
							data:{
								"code":function(){
									return $("#checkimg").val();
								}
							}
						}
					}
				},
				messages:{
					code:{
						required:"不能为空",
						remote:"验证码错误"
					}
				}
			});
			$("#sclick").bind("click",function(){
				var value = $("#p").progressbar("getValue");
				if(value<100){
					value+=Math.floor(Math.random() * 10);
					$("#p").progressbar("setValue",value);
					setTimeout(arguments.callee,50);
				}
			});
			
		});
		
		function change(img){
			img.src = img.src + "?time="+new Date().getTime();
		}
		function validatecheck(){
			if($("#names").val().trim()==""||$("#passs").val().trim()==""){
				alert("帐号或密码不能为空");
				return false;
			}
			return true;
		}
		/*
		function start(){
			var value=$('#p').progressbar('getValue');
			if(value<100){
				value+=Math.floor(Math.random()*10);
				$('#p').progressbar('setValue',value);
				setTimeout(arguments.callee,100);
			}
		}
		
		*/
	</script>
  </head>
  <body>
  <!-- <body bgcolor="./images/htdl.jpg"> -->
  
    <div id="dd" align="center" style="background-color:">
    	<form id="aa" method="post" action="${pageContext.request.contextPath }/AdminsAction_login.action" onsubmit="return validatecheck()">
    		<c:if test="${flag==false }">
    			<font color="red">登录失败，您输入帐号或密码错误</font>
    		</c:if>
    		<table align="center" style="position:absolute;top:80px;left:110px">
    			<tr>
    				<td>帐号：</td>
    				<td><input type="text" name="admins.adminsName" id="names"/></td>
    				<td><span id="name"></span><br/><br/></td>
    			</tr>
    			<tr>
    				<td>密码：</td>
    				<td><input type="password" name="admins.adminsPass" id="passs"/></td>
    				<td><span id="pass"></span>
    			</tr>
    			<tr>
    				<td>验证码：</td>
    				<td>
    					<input type="text" class="ch" name="code" id="checkimg"/>
    					<img id="img" src="${pageContext.request.contextPath }/ImageCheck_execute.action?time=new Date().getTime()" onclick="change(this)" style="cursor:pointer;" name="image">
    					<font size="1px">
    						<a onclick="reloadImage('${pageContext.request.contextPath }/ImageCheck_execute.action?time='+new Date().getTime())" style="cursor:pointer;">看不清，点击！</a> 
    					</font>
    				</td>
    			</tr>
    			<tr height="2px">
    				<td></td>
    				<td colspan="3">
    					<span id="check" style="font-size:12px;color:red"></span>
    					<span class="check" style="font-size:12px;color:orange"></span>
    				</td>
    			</tr>
    			<tr>
    				<td></td>
    				<td colspan="3">
    					<input type="submit" value="登录" id="sclick"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    					<input type="reset" value="重置"/>
    				</td>
    			</tr>
    		</table>
    	</form>
    	<div id="p" class="easyui-progressbar" style="width:300px;position:absolute;top:240px;left:110px"></div>
    </div>
  </body>
</html>
