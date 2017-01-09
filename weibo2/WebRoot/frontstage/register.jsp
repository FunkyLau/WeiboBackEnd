<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/frontstage/register/register_init.js"></script>
	<link rel="stylesheet" type="text/css" href="./styles/frontstage/register/register_style.css">
	<style type="text/css">
		form .error{
			color:red;
			font-size:12px;
		}
	</style>
	<script type="text/javascript">
		function change(img){
			img.src=img.src + "?time=" + new Date().getTime();
		}
		function changeValidateCode(){
			//获取当前的时间作为参数，无具体意义
			var timenow = new Date().getTime();
			//每次请求需要一个不同的参数，否则可能会返回同样的验证码
			//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了
			$("#img").attr("src","${pageContext.request.contextPath}/ImageCheck_execute.action?d="+timenow);
		}
	</script>
  </head>
  
  <body>
    <div class="B_login">
		<div class="bodydiv">
			<div class="maindiv">
				<div class="logodiv"></div>
				<div class="topdiv"></div>
				<div class="infodiv">
					<div class="infotop">
						<div class="infotoptop"></div>
						<div class="infotopbot">
							<div class="myreg">个人注册</div>
							<div class="qyreg">企业注册</div>
						</div>
					</div>
					<div>
						<div class="infoleft">
							<div class="mail"><img src="${pageContext.request.contextPath }/images/reg_method_mail.png"></div>
								<div id="reg">
									<form action="${pageContext.request.contextPath }/UsersAction_saveregister.action" method="post" id="register">
										<table>
											<tr>
												<td></td>
												<td>
													<c:if test="${flag==false }">
														<font color="red">注册失败，你填入的信息不符合要求</font>
													</c:if>
												</td>
											</tr>
											<tr>
												<td>邮箱:</td>
												<td><input type="text" name="email" id="email" class="ch" value="请输入您的常用邮箱" style="color:#CCCCCC" /></td>
											</tr>
											<tr></tr>
											<tr class="ziti">
												<td></td>
												<td><font size="2px">没有邮箱？<a href="#">用手机注册</a></font><font class="check"></font></td>
											</tr>
											<tr>
												<td>设置密码：</td>
												<td><input type="password" name="pass" id="pass" class="ch" /></td>
											</tr>	
											<tr>
												<td></td>
												<td class="ziti">&nbsp;<span class="check"></span></td>
											</tr>
											<tr>
												<td>昵称：</td>
												<td><input type="text" name="name" id="name" class="ch"/></td>
											</tr>
											<tr class="ziti">
												<td></td>
												<td>&nbsp;<span class="check"></span></td>
											</tr>
											<tr>
												<td>验证码</td>
												<td>
													<!-- 验证码输入框 -->
													<input type="text" name="checkimg" id="checkimg" size="8px" class="ch" style="float:left;"/>
													<!-- 验证码图片 -->
													<img id="img" src="${pageContext.request.contextPath }/ImageCheck_execute.action?time=new Date().getTime()" onclick="change(this)" style="cursor:pointer;float:left;" name="image"/>
													<!-- 刷新验证码 -->
													<div class="reflash" onclick="changeValidateCode()"></div>
												</td>
											</tr>
											<tr class="ziti">
												<td></td>
												<td>&nbsp;<span class="check"></span></td>
											</tr>
											<tr>
												<td></td>
												<td class="regbtn"><input type="submit" value=""/></td>
											</tr>
											<tr>
												<td></td>
												<td class="ziti"><a href="#">新浪微博服务使用协议</a></td>
											</tr>
											<tr>
												<td></td>
												<td class="ziti"><a href="#">新浪微博个人信息保护政策</a></td>
											</tr>
											<tr>
												<td></td>
												<td class="ziti"><a href="#">全国人大常委会对于加强网络信息保护的决定</a>
											</tr>
										</table>
									</form>
								</div>
						</div>
						<div class="inforight">
							<div class="phone">
								<div class="rightdiv"></div>
								<p class="pline">已有帐号，<a href="${pageContext.request.contextPath }/frontstage/login.jsp">直接登录&gt;&gt;</a></p>
								<hr class="line" color="#cccccc" style="height:0.1px;width:80%;"/>
								<div class="r2"></div>
								<div>
									手机快速注册<br/>
									<span class="ziti1">编辑短信：</span><br/>
									<font color="orange">6-16位数字</font><br/>
									<span class="ziti1">作为登录密码发送至：</span><br/>
									<font color="orange">1069 009 088</font><br/>
									<span class="ziti1">即可注册成功。</span>
								</div>
							</div>
						</div>
					</div>
					<div class="infobottom">
						<span class="ziti">客服电话：400 096 0960（个人） 400 098 0980（企业）（按当地市话标准计费）</span>
						<br/>
						<select>
							<option>中文（简体）</option>
							<option>中文（台湾）</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="ziti">
							<img src="${pageContext.request.contextPath }/images/ioc.jpg" style="width:15px;height:15px;"/>盐城工学院信息工程学院
							<a href="#">京网文[2011]0398-130号</a>&nbsp;<a href="#">京ICP证100780号</a>
						</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="ziti">Copyright © 2015 刘嘉晨</span>
					</div>
					
				</div>
				<div class="bottomdiv"></div>
			</div>
		</div> 	   	
    </div>
  </body>
</html>
