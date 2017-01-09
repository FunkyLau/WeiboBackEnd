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
		href="${pageContext.request.contextPath }/styles/frontstage/setter/emailUser.css">
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/frontstage/setter/emailUser.js"></script>
	<style type="text/css">
	form .error {
		color: red;
		font-size: 12px;
	}
</style>

  </head>
  
  <body>
    <div class="right">
		<h3>常见安全问题</h3>
		<ul>
			<li>1、<a href="http://help.weibo.com/faq/q/544/12167#12167"
				target='_blank'>微博被盗，安全邮箱被修改了怎么办?</a>
			</li>
			<li>2、<a href="http://help.weibo.com/faq/q/699/12632#12632"
				target='_blank'>设置安全邮箱有哪些好处？</a>
			</li>
			<li>3、<a href="http://help.weibo.com/faq/q/225/12628"
				target='_blank'>如何使用安全邮箱找回密码？</a>
			</li>
			<li>4、<a href="http://help.weibo.com/faq/q/227/12507#12507"
				target='_blank'>安全邮箱不能用了怎么办？</a>
			</li>
			<li><hr class="divline"></li>
			<li class="li">客服电话：4000 960 960（个人）4000 980 980（企业）按当地市话标准计费</li>
		</ul>
	</div>

	<div class="title">
		<h4 style="color:#444444">设置安全邮箱，不用为密码丢失烦心了！</h4>
		<br>
		<hr class="divline">
		<br>
	</div>
	<div class="hidden">
		<br><br><img src="${ pageContext.request.contextPath }/images/ico_right.png" width="30px" height="20px"/>已设置安全邮箱
		<br>
		<br> ${ user.usersEmail } <br>
		<br> <a href="javascript:void(0);" class="click">修改安全邮箱</a>
	</div>

	<div class="left">
		<img style="margin-bottom: 30px;"
			src="${ pageContext.request.contextPath }/images/email_title.png" />
		<form id="update">
			<table class="t_center">
				<tr>
					<td>新安全邮箱：</td>
					<td><input type="text" name="newEmail" id="newEmail"
						class="tgrays" />
					</td>
				</tr>
				<tr>
					<td>当前安全邮箱：</td>
					<td><input type="text" name="oldEmail" id="oldEmail"
						class="tgrays" />
					</td>
				</tr>
				<tr>
					<td>微博登陆密码：</td>
					<td><input type="password" name="password" id="password"
						class="tgrays" />
					</td>
				</tr>
				<tr>
					<td><input type="hidden" id="uid" value="${ user.usersId }" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" value="取消"></td>
				</tr>
			</table>
		</form>
	</div>

  </body>
</html>
