<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新浪微博-随时随地分享身边的新鲜事儿</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="新浪微博-随时随地分享身边的新鲜事儿">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="./scripts/frontstage/login/login.js"></script>
	<link rel="stylesheet" type="text/css" href="./styles/frontstage/login/login_style.css">
  </head>
  
  <body>
    <div class="B_login">
    	<div class="bodydiv">
    		<div class="maindiv">
    			<div class="logodiv"></div>
    			<div class="topdiv">
    				<img src="./images/6848ce01gw1e45k714tiyj20p005kt9t.jpg">
    			</div>
    			<div class="infodiv">
    				<div class="leftdiv">
    					<div class="lefttop">
    						<span style="float:left;">还没有新浪微博帐号？现在加入</span>
    						<a href="${pageContext.request.contextPath}/frontstage/register.jsp"><div>立即注册</div></a>
    					</div>
    					<div class="leftbottom">
    						<div class="showdiv"></div>
    					</div>
    				</div>
    				<div class="rightdiv">
    					<div class="r1">
    						<div id="utsdiv"></div>
    						<form action="./UsersAction_login.action" method="post" onsubmit="return checkLogin()">
    							<div class="logininfo">
    								<div id="emaildiv"><input type="text" name="users.usersEmail"></div>
    								<div id="passdiv"><input type="text" name="users.usersPassword"></div>
    							</div>
    							<div class="loginauto">
    								<span class="lsp1"><input type="checkbox">下次自动登录</span>
    								<span class="lsp2"><a href="javascript:void(0)">忘记密码</a></span>
    							</div>
    							<div class="loginbtn">
    								<input type="submit" value=" "><span class="noweibo">还没有微博？</span>
    								<span class="regnow"><a href="${pageContext.request.contextPath}/frontstage/register.jsp ">立即注册！</a></span>
    							</div>
    						</form>
    					</div>
    					<div class="r2">
    						<span>使用其他账号登陆：</span><br>
    						<div class="r2div">
    							<div class="ty"></div>
    							<a href="javascript:void(0)">天翼</a>
    						</div>
    						<div class="r2div">
    							<div class="lt"></div>
    							<a href="javascript:void(0)">联通</a>
    						</div>
    						<div class="r2div">
    							<div class="qh"></div>
    							<a href="javascript:void(0)">360</a>
    						</div>
    					</div>
    					
    				</div>
    			</div>
    			<div class="bottomdiv">
    				<br>
    				<div class="zddiv">
    					<table>
    						<tr>
    							<td><div id="zdip"></div></td>
    							<td><span class="zd"><a href="javascript:void(0)">iPhone/iPad</a>&nbsp;&nbsp;&nbsp;</span></td>
    							<td><div id="zdad"></div></td>
    							<td><span class="zd"><a href="javascript:void(0)">Android</a>&nbsp;&nbsp;&nbsp;</span></td>
    							<td><div id="zdwp"></div></td>
    							<td><span class="zd"><a href="javascript:void(0)">Windows Phone</a>&nbsp;&nbsp;&nbsp;</span></td>
    							<td><div id="zdqt"></div></td>
    							<td><span id="zd"><a href="javascript:void(0)">其他手机端</a>&nbsp;&nbsp;&nbsp;</span></td>
    						</tr>
    					</table>
    				</div>
    				<br>
    				<span class="info"><a href="javascript:void(0)">微博帮助</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0)">意见反馈</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0)">开放平台</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0)">微博招聘</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0)">新浪网导航</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    					<select>
    						<option>简体(中文)</option>
    					</select>
    				</span><br><span class="info">Copyright ® Liu Jiachen 盐城工学院 &nbsp;&nbsp;&nbsp;京网文[2011]0398-130号京ICP证号&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0)">全国人大常委会关于加强网络信息保护的决定</a>
    				</span>
    			</div>
    		</div>
    	</div>
    </div>
  </body>
</html>
