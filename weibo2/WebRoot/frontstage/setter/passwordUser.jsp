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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/frontstage/setter/passwordUser.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/styles/frontstage/setter/passwordUser.css">

	<style type="text/css">
	form .error {
		color: red;
		font-size: 12px;
	}
	</style>
  </head>
  
  <body>
    <div class="mainRMIB_200MIB_setupRight">
		<div id="" class="W_rightModule">
			<div class="title">常见安全问题</div>
			<ul class="topic_list">
				<li><span class="W_textb">1、</span><a
					href="http://help.weibo.com/faq/q/225/45#45" target="_blank">忘记密码怎么办？</a>
				</li>
				<li><span class="W_textb">2、</span><a
					href="http://help.weibo.com/faq/q/225/12506#12506" target="_blank">怎样的密码更安全？</a>
				</li>
				<li><span class="W_textb">3、</span><a
					href="http://help.weibo.com/faq/q/544/11991#11991" target="_blank">如何防止帐号被盗？</a>
				</li>
				<li><span class="W_textb">4、</span><a
					href="http://help.weibo.com/faq/q/225/12362#12362" target="_blank">修改密码次数过多不能再进行操作怎么办？</a>
				</li>
				<li><span class="W_textb">5、</span><a
					href="http://help.weibo.com/faq/q/225/13250#13250" target="_blank">为什么登录微博时提示"您的帐号存在高危风险"</a>
				</li>
			</ul>
		</div>
		<div class="divline"></div>
		<div id="" class="W_rightModule W_no_border">
			<ul class="topic_list clearfix">
				<!-- <li>客服邮箱：lp6567@sina.com</li> -->
				<li class="font1">客服电话：4000 960 960（个人） 4000 980
					980（企业）按当地市话标准计费</li>
			</ul>
		</div>
	</div>



	<div class="index_title">
		<h3 class="title">修改密码</h3>
		<hr class="divline">
		<br /> <a class="tishi">重要提示：每天互联网都会有大量用户的帐号存在着严重被盗的风险。如果你正在使用与其他网站相同的密码，建议你尽快修改。</a><br>
		<form id="update">

			<table class="tcenter">
				<tr>
					<td>当前密码：</td>
					<td><input type="text" name="oldPass" id="oldPass"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td><input type="text" name="newPass" id="newPass"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="font1">安全强度<img
						src="${pageContext.request.contextPath}/images/pwd_no.gif"
						id="imgps" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="text" name="confirmPass" id="confirmPass"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2"><input type="checkbox" checked="checked" /> <a
						class="font1"> 冻结对第三方应用的授权，防止有人通过盗用您的帐号发布不良微博。</a><br /> <a
						class="font1">被冻结的应用可以重新授权。</a> <a href="http://app.weibo.com/my"
						target='_blank' class="topic_list">查看当前授权</a><br /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="保存" /></td>
					<td />
					<td><input type="hidden" id="uid" value="${ user.usersId }"/></td>
				</tr>
				</tbody>
			</table>
		</form>

		<div class="bottom">
			<p class="font1">
				系统检测到您还未绑定微盾，提高帐号安全性（90%的用户会选择微盾抵御盗号风险垃圾信息）<a
					href="http://account.weibo.com/settings/security/vdun"><font
					style="color: orange">立刻绑定</font> </a>
			</p>
		</div>
	</div>
  </body>
</html>
