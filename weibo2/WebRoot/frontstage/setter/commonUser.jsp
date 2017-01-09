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
	href="${pageContext.request.contextPath }/styles/frontstage/setter/commonUser.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js">
</script>
<script type="text/javascript">
	$(function() {
		$(".btn").click(function() {
			alert("保存成功！");
		});
	});
</script>

</head>

<body>
	<div class="left">
		<h4>隐私设置</h4>
		<br>
		<hr class="divline">
		<br>
		<div class="div_total">
			<p class="td_title">
				评论&nbsp;<span>设置谁可以评论</span>
			</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />所有人 <span>(不包括你的黑名单用户)</span><br>
				<input type="radio" name="com" />可信用户 <span>(包括我关注的人、新浪认证用户、微博达人、手机绑定用户以及身份验证用户)</span><br>
				<input type="radio" name="com" />我关注的人
			</div>
		</div>
		<hr class="divline_hr">
		<div class="div_total">
			<p class="td_title">
				私信 &nbsp;<span>设置谁可以给我发私信/引荐关注</span>
			</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />所有人 <span>(不包括你的黑名单用户；部分用户会受到反垃圾系統限制，依然不能给您发送私信)</span><br>
				<input type="radio" name="com" />可信用户 <span>(包括我关注的人、新浪认证用户、微博达人、手机绑定用户以及身份验证用户)</span><br>
				<input type="radio" name="com" />我关注的人
			</div>
		</div>
		<hr class="divline_hr">
		<div class="div_total">
			<p class="td_title">
				@提到我 &nbsp;<span>设置接收哪些人@提到我的微博/评论</span>
			</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />所有人 <span>(不包括你的黑名单用户)</span><br>
				<input type="radio" name="com" />可信用户 <span>(包括我关注的人、新浪认证用户、微博达人、手机绑定用户以及身份验证用户)</span><br>
				<input type="radio" name="com" />我关注的人
			</div>
		</div>
		<hr class="divline_hr">
		<div class="div_total">
			<p class="td_title">
				推荐 &nbsp;<span>设置允许把我推荐给以下哪些人</span>
			</p>
			<br>
			<div class="div_content">
				<input type="checkbox" name="com" />在我附近上网的人<br> 
				<input type="checkbox" name="com" />我的msn/邮箱联系人<br>
				<input type="checkbox" name="com" />与我有间接关注的人<br> 
				<input type="checkbox" name="com" />与我有共同好友的人
			</div>
		</div>
		<hr class="divline_hr">
		<div class="div_total">
			<p class="td_title">
				邮箱 &nbsp;<span>设置是否允许别人通过注册邮箱找到我</span>
			</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />允许<br> <input type="radio"
					name="com" />不允许<br>
			</div>
		</div>
		<div class="div_total">
			<p class="td_title">
				手机 &nbsp;<span>设置是否允许别人通过手机找到我</span>
			</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />允许<br> <input type="radio"
					name="com" />不允许<br>
			</div>
		</div>
		<div class="div_total">
			<p class="td_title">
				地理位置信息<a href="http://help.weibo.com/faq/q/1543/14750"
					target="_blank">[这是什么？]</a><br>
				<span>发布微博时，是否允许微博保存并显示你所处的地理位置信息，包括所有的第三方工具、客户端。(此修改不影响过去已保存的历史微博)</span>
			</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />允许<br> <input type="radio"
					name="com" />不允许<br>
			</div>
		</div>
		<div class="div_total">
			<p class="td_title">勋章</p>
			<br>
			<div class="div_content">
				<input type="radio" name="com" />私密状态<span>仅在我的勋章页面显示）</span><br>
				<input type="radio" name="com" />公开状态<span>允许其他人查看我的勋章）</span><br>
			</div>
		</div>
		<div style="margin-left: 100px;">
			<input type="button" value="保存" class="btn">
		</div>
	</div>
</body>
</html>
