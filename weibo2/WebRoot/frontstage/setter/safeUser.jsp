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
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".btn").click(function(){
				alert("保存成功！");
			});
		});
	</script>
  </head>
  
  <body>
    <div class="right">
    	<h3>常见安全问题</h3>
    	<ul>
    		<li>1、<a href="http://help.weibo.com/faq/q/544/12168#12168" target='_blank'>微博被盗，绑定手机被修改了怎么办？</a></li>
    		<li>2、<a href="http://help.weibo.com/faq/q/544/12221#12221" target='_blank'>微博帐号被盗用微博转发功能异常怎么办？</a></li>
			<li>3、<a href="http://help.weibo.com/faq/q/225/12506#12506" target='_blank'>怎样的密码更安全？</a></li>
			<li>4、<a href="http://help.weibo.com/faq/q/225/45#45" target='_blank'>忘记密码怎么办？</a></li>
			<li>5、<a href="http://help.weibo.com/faq/q/227/12499#12499" target='_blank'>如何更改绑定手机？</a></li>
			<li><hr class="divline"></li>
			<li class="li">客服电话：4000 960 960（个人）4000 980 980（企业）按当地市话标准计费</li>
    	</ul>
    </div>
    <h4 style="margin-top:35px;margin-bottom:20px;margin-left:20px;">提示：当帐号进行重要操作时接收提醒消息，随时掌握帐号动态，保障安全。</h4>
    <hr class="divline"><br>
    <span style="font-size:12px;color:#444444;margin-left:20px;">提示：当帐号进行重要操作时接受提醒消息，随时掌握帐号动态，保障安全。</span>
    <div class="graylog" style="margin-top:50px;">
    	<span style="margin-left:76px;font-size:16px;">请选择提醒方式：</span>
    	<table style="line-height:2em;margin-top:20px;">
    		<tr>
    			<td>消息提醒内容</td>
    			<td>邮件提醒</td>
    			<td>微博通知</td>
    			<td>不提醒</td>
    		</tr>
    		<tr>
    			<td>修改密码</td>
    			<td><input type="radio"/></td>
    			<td><input type="radio"/></td>
    			<td><input type="radio"/></td>
    		</tr>
    		<tr>
    			<td>设置登录保护</td>
    			<td><input type="radio"></td>
    			<td><input type="radio"/></td>
    			<td><input type="radio"/></td>
    		</tr>
    		<tr>
    			<td>异地登录</td>
    			<td><input type="radio"></td>
    			<td><input type="radio"/></td>
    			<td><input type="radio"/></td>
    		</tr>
    		<tr>
    			<td colspan="4" align="center"><input type="button" value="保存" class="btn"></td>
    		</tr>
    	</table>
    </div>
  </body>
</html>
