<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的设置 新浪微哦-随时随地分享身边的新鲜事儿</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="我的设置 新浪微哦-随时随地分享身边的新鲜事儿">
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/frontstage/index/index_style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/frontstage/top_bottomdiv_style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/frontstage/setter/setUser.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/frontstage/top_bottomdiv_init.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/frontstage/setter/setUser.js"></script>

  </head>
  
  <body>
    <!-- 头部      -->
	<div id="top_bg">
		<div id="top_div">
			<div id="top_content">
				<div id="top_logo" style="float:left">
					<a href="${pageContext.request.contextPath }/index.jsp"><span
						id="logo_img"></span></a>
				</div>
				<div id="top_left" style="float:left">
					<div id="bar_index" style="float:left" class="topbar_nowpage">
						<a href="${pageContext.request.contextPath }/index.jsp"><span>首页</span></a>
					</div>
					<div id="bar_app" style="float:left">
						<a href="${pageContext.request.contextPath }/index.jsp"><span>应用</span></a>
						<div id="app_show"></div>
					</div>
					<div id="bar_weiba" style="float:left">
						<a href="${pageContext.request.contextPath }/index.jsp"><span>微吧</span></a>
						<div id="weiba_show"></div>
					</div>
					<div id="bar_game" style="float:left">
						<a href="${pageContext.request.contextPath }/index.jsp"><span>游戏</span></a>
						<div id="game_show"></div>
					</div>
				</div>
				<div id="top_search" style="float:left">
					<input id="search_input" type="text" value="搜索微博、找人"> <a
						href="#" title="搜索按钮"> <span id="search_btn"></span>
					</a>
				</div>
				<div id="top_right" style="float:right">
					<div id="user_vip" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp"><span
							class="right_bar"><span class="ico"></span></span></a>
						<div id="vip_show"></div>
					</div>
					<div id="user_setting" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp"><span
							class="right_bar"><span class="ico"></span></span></a>
						<div id="setting_show"></div>
					</div>
					<div id="user_message" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp">
						<span class="right_bar">
							<span class="ico">
								<span id="new_msg"></span>
							</span>
						</span>
						</a>
						<div id="message_show"></div>
					</div>
					<div id="user_weibo" style="float:right">
						<a href="javascript:void(0);"><span class="right_bar"><span
								class="ico"></span></span></a>
						<div id="weibo_show"></div>
					</div>
					<div id="user_login" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp"><span
							id="user_name"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /头部     -->

	<div id="content_main">
		<div id="content_div" style="height: auto">
			<div id="content_div_left">
				<h3>帐号设置</h3>
				<dl id="ld1">
					<dt>
						<a href="javascript:void(0);" class="left_dl_dd"><img
							src="${pageContext.request.contextPath }/images/setuser_1.png">个人资料<img
							id="i1"
							src="${pageContext.request.contextPath }/images/arrow_on_off_2.png">
						</a>
					</dt>
					<dd>
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/baseUser.jsp"
							target="iframe">基本信息</a>
					</dd>
					<dd>
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/targetUser.jsp"
							target="iframe">照片墙</a>
					</dd>
				</dl>
				<dl id="ld2">
					<dt>
						<a href="${pageContext.request.contextPath }/frontstage/setter/realmUser.jsp"
							target="iframe" class="left_dl_dd">
							<img src="${pageContext.request.contextPath }/images/setuser_2.png">修改头像</a>
					</dt>
				</dl>
				<dl id="ld3">
					<dt>
						<a href="javascript:void(0)" class="left_dl_dd"><img
							src="${pageContext.request.contextPath }/images/setuser_3.png">隐私设置<img
							id="i2"
							src="${pageContext.request.contextPath }/images/arrow_on_off_1.png">
						</a>
					</dt>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/commonUser.jsp"
							target="iframe">通用</a>
					</dd>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/backListUser.jsp"
							target="iframe">黑名单</a>
					</dd>
				</dl>
				<dl id="ld4">
					<dt>
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/preferencesUser.jsp"
							target="iframe" class="left_dl_dd"><img
							src="${pageContext.request.contextPath }/images/setuser_4.png">个性设置</a>
					</dt>
				</dl>
				<dl id="ld5">
					<dt>
						<a href="javascript:void(0)" class="left_dl_dd"><img
							src="${pageContext.request.contextPath }/images/setuser_5.png">账号安全<img
							id="i3"
							src="${pageContext.request.contextPath }/images/arrow_on_off_1.png">
						</a>
					</dt>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/passwordUser.jsp"
							target="iframe">修改密码</a>
					</dd>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/emailUser.jsp"
							target="iframe">安全邮箱</a>
					</dd>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/loginUser.jsp"
							target="iframe">登陆保护</a>
					</dd>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/safeUser.jsp"
							target="iframe">安全提醒</a>
					</dd>
					<dd style="display:none;">
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/papersUser.jsp"
							target="iframe">证件信息</a>
					</dd>
				</dl>
				<dl id="ld6">
					<dt>
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/emailUser.jsp"
							target="iframe" class="left_dl_dd"><img
							src="${pageContext.request.contextPath }/images/setuser_6.png">绑定邮箱</a>
					</dt>
				</dl>
				<dl id="ld7">
					<dt>
						<a
							href="${ 
pageContext.request.contextPath }/frontstage/setter/languageUser.jsp"
							target="iframe" class="left_dl_dd"><img
							src="${pageContext.request.contextPath }/images/setuser_7.png">语言设置</a>
					</dt>
				</dl>

			</div>
			<div id="content_div_center">
				<iframe id="iframe"
					src="${ 
pageContext.request.contextPath }/frontstage/setter/baseUser.jsp"
					name="iframe" frameborder="0" scrolling="no" height="1600px"
					width="800px"></iframe>
			</div>
		</div>
	</div>
	<div id="bottom_div">
		<div id="bottom_content">
			<table id="bottom_table_t">
				<tr>
					<td style="width:185px;padding-bottom:7px;">找找感兴趣的人</td>
					<td style="width:185px;">精彩内容</td>
					<td style="width:185px;">热门应用</td>
					<td style="width:185px;">手机玩微博</td>
					<td style="width:185px;">认证&amp;合作</td>
				</tr>
				<tr>
					<td><a href="javascript:void(0);">名人堂</a>&nbsp;<a
						href="javascript:void(0);">微博会员</a></td>
					<td><a href="javascript:void(0);">微话题</a>&nbsp;<a
						href="javascript:void(0);">风云榜</a></td>
					<td><a href="javascript:void(0);">微吧</a>&nbsp;<a
						href="javascript:void(0);">微公益</a></td>
					<td><a href="javascript:void(0);">WAP版</a>&nbsp;<a
						href="javascript:void(0);">短彩发微博</a></td>
					<td><a href="javascript:void(0);">申请认证</a>&nbsp;<a
						href="javascript:void(0);">开放平台</a></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0);">微博达人</a></td>
					<td><a href="javascript:void(0);">微访谈</a></td>
					<td><a href="javascript:void(0);">相册</a><a
						href="javascript:void(0);"> 微音乐</a></td>
					<td><a href="javascript:void(0);">iPhone客户端</a>&nbsp;<a
						href="javascript:void(0);">iPad客户端</a></td>
					<td><a href="javascript:void(0);">企业微博</a>&nbsp;<a
						href="javascript:void(0);">连接网站</a></td>
				</tr>
				<tr>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">媒体</a>&nbsp;<a
						href="javascript:void(0)">企业</a>&nbsp;<a href="javascript:void(0);">政府</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">热门微博</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">投票</a>&nbsp;<a
						href="javascript:void(0)">微游戏</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">Android客户端</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">微博标识</a>&nbsp;<a
						href="javascript:void(0)">广告服务</a></td>
				</tr>
			</table>

			<table id="bottom_table_b">
				<tr>
					<td><a href="javascript:void(0);"><span class="ico"
							style="backgrodnd-position: -350px -127px"></span>微博帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">意见反馈</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">开放平台</a> &nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">微博招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">新浪网导航</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">社区管理中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">微博社区公约</a></td>
				</tr>
				<tr>
					<td>客服电话：4000&nbsp;960&nbsp;960（个人）&nbsp;4000&nbsp;980&nbsp;980（企业）&nbsp;（按当地市话标准计算）<span
						style="float:right;margin-top:-8px;"><select><option>中文(简体)</option>
						</select> </span>
					</td>
				</tr>
				<tr>
					<td style="width:925px;"><span style="color:#888">北京微梦创科网络技术有限公司</span>&nbsp;<a
						href="javascript:void(0);">京网文[2011]0398-130号</a>&nbsp;<a
						href="javascript:void(0);">京ICP证100780号</a><span
						style="font-size:11px;float:right;color:#888;font-family: '微软雅黑'">Copyright&nbsp;&copy;&nbsp;1996-2013&nbsp;SINA</span>
					</td>
				</tr>
			</table>

		</div>
	</div>
  </body>
</html>
