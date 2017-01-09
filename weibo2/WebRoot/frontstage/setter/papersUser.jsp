<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		$(".btn").click(function() {
			if ($("#name").val() == "") {
				alert("请填写真实姓名！");
			} else if ($("#so").val() == "0") {
				alert("请选择证件类型！");
			} else if ($("#number").val() == "") {
				alert("证件号码不允许为空！");
			} else if ($("#pass").val() == "") {
				alert("微博登陆密码不允许为空！");
			} else {
				alert("保存成功！");
			}
		});
	});
</script>

</head>

<body>
	<div class="right">
		<h3>常见安全问题</h3>
		<ul>
			<li>1、<a href="http://help.weibo.com/faq/q/699/12629#12629"
				target='_blank'>为什么要设置证件信息？</a>
			</li>
			<li>2、<a href="http://help.weibo.com/faq/q/699/12630#12630"
				target='_blank'>证件信息会透露给别人吗？</a>
			</li>
			<li><hr style="width: 120px;" />
			</li>
			<li><hr class="divline"></li>
			<li class="li">客服电话：4000 960 960（个人）4000 980 980（企业）按当地市话标准计费</li>
		</ul>
	</div>
	<div>
		<h4 style="margin-top:30px;margin-left:20px; margin-bottom: 20px;">设置证件信息，增强帐号安全度！</h4>
		<hr class="divline"><br>
		<img style="margin-bottom: 60px;" src="${ pageContext.request.contextPath }/images/papers_title.png"/>
		<span style="margin-left:90px; font-size: 12px;color:red">提示：证件信息设置成功后不能修改。请您务必填写真实信息。</span>
		<table style="margin-top:15px;line-height: 2em;">
			<tr>
				<td>真实姓名：</td>
				<td class="tgray"><input type="text" id="name" /></td>
			</tr>
			<tr>
				<td>证件类型：</td>
				<td><select id="so">
						<option value="0">请选择</option>
						<option value="1">身份证</option>
						<option value="6">港澳台身份证</option>
						<option value="2">学生证</option>
						<option value="3">军官证</option>
						<option value="4">护照</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>证件号码：</td>
				<td class="tgray"><input type="text" id="number" /></td>
			</tr>
			<tr>
				<td>微博登陆密码：</td>
				<td class="tgray"><input type="text" id="pass" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="font-size: 12px;color:#444444"><input type="checkbox">我已阅读并同意<a
					href="http://help.weibo.com/faq/q/699/12510#12510" target="_blank">《新浪安全中心服务条款》</a>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" value="保存" class="btn">
				</td>
			</tr>
		</table>

	</div>
</body>
</html>
