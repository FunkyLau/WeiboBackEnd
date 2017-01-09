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
	href="${pageContext.request.contextPath }/styles/frontstage/setter/setButtom.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/frontstage/setter/area.js"></script>
<script type="text/javascript">
	$(function() {
		var area = new Area();
		area.init("xml/area.xml", "all");
		//初始化省份下拉列表
		$("#province").html(
				"<option>请选择</option>" + area.getNextOption("0", null));
		//监听各个下拉列表
		$("select").change(
				function() {
					var value = $(this).val();
					var id = $(this).attr("id");
					var options = "<option>请选择</option>"
							+ area.getNextOption(value, null);
					if (id == "province") {
						$("#city").html(options);
					} else if (id == "city") {
						$("#county").html(options);
					}
				});
		
		//添加登录地点操作
		$(".rc").click(function() {
			$("#p1").show();
			$("#aa1").click(function() {
				$("#p2").show();
				$("#aa2").click(function() {
					$("#aa1").hide();
					$("#aa2").hide();
					$("#p3").show();
				});
			});
		});
		//删除登录地点操作
		$("#ad1").click(function(){
		   $("#p1").hide();
		});
		$("#ad2").click(function(){
		   $("#p2").hide();
		});
		$("#ad3").click(function(){
		   $("#p3").hide();
		});
		
		$(".btn").click(function(){
		   if($("#county").val() != "请选择"){		   
		   alert("添加成功");
		   }else{
		   alert("请选择相应的地区");
		   }
		});
		
		$(".rc1").click(function(){
		   $("#p1").hide();
		   $("#p2").hide();
		   $("#p3").hide();
		});
		
		
	});
</script>

  </head>
  
  <body>
    <div class="right">
		<h3>常见安全问题</h3>
		<ul>
			<li>1、<a href="http://help.weibo.com/faq/q/736/12512#12512"
				target='_blank'>为什么设置登录保护？</a></li>
			<li>2、<a href="http://help.weibo.com/faq/q/736/12511#12511"
				target='_blank'>怎样设置登录保护？</a></li>
			<li>3、<a href="http://help.weibo.com/faq/q/544/11991#11991"
				target='_blank'>如何防止帐号被盗？</a></li>
			<li>4、<a href="http://help.weibo.com/faq/q/225/12505#12505"
				target='_blank'>怎样提高帐号安全?</a></li>
			<li><hr class="divline"></li>
			<li class="li">客服电话：4000 960 960（个人）4000 980 980（企业）按当地市话标准计费</li>
		</ul>
	</div>

	<div class="left">
		<h3>登录保护</h3><br>
		<hr class="divline">
		<br />
		<p style="color:#B8B7B7;font-size: 14px">设置登录保护，帮你解决帐号被盗和重要操作保护。灵活设置常用登录地，减少验证次数。</p>
		<br> <br>
		<div class="graylog">
			<h3 style="font-size: 18px;color:#oooooo">设置验证地点：</h3>
			<br>
			<p>
				<input type="radio" id="1" class="rc1" name="ra">
				为了最大程度保护，在所有地点都填写验证码
			</p>
			<br>
			<p>
				<input type="radio" id="2" class="rc" name="ra">
				为了减少验证次数，在以下地点不需要填写验证码
			</p>
			<br>
			<p id="p1" style="display: none">
				地点一：<select id="province" class="tgray1"><option>请选择</option>
				</select> <select id="city" class="tgray1"><option>请选择</option>
				</select> <select id="county" class="tgray1"><option>请选择</option>
				</select> <a href="javascript:void(0);" id="aa1">添加</a>&nbsp;<a
					href="javascript:void(0);" id="ad1">删除</a>
			</p>
			<p id="p2" style="display: none">
				<br> 地点二：<select id="province" class="tgray1"><option>请选择</option>
				</select> <select id="city" class="tgray1"><option>请选择</option>
				</select> <select id="county" class="tgray1"><option>请选择</option>
				</select> <a href="javascript:void(0);" id="aa2">添加</a>&nbsp;<a
					href="javascript:void(0);" id="ad2">删除</a>
			</p>
			<br>
			<p id="p3" style="display: none">
				地点三：<select id="province" class="tgray1"><option>请选择</option>
				</select> <select id="city" class="tgray1"><option>请选择</option>
				</select> <select id="county" class="tgray1"><option>请选择</option>
				</select> &nbsp;<a href="javascript:void(0);" id="ad3">删除</a>
			</p>
			<br>
			<p>
				<input type="button" value="保存" class="btn"> <input
					type="button" value="取消" class="btn1" onClick="window.location.href = 'loginUser.jsp'">
			</p>
		</div>
	</div>
  </body>
</html>
