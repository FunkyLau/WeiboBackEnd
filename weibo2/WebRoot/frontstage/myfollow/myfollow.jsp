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

<title>我的首页 新浪微博-随时随地分享身边的新鲜事儿</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="我的首页 新浪微博-随时随地分享身边的新鲜事儿">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/frontstage/index/index_style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/frontstage/top_bottomdiv_style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/frontstage/myfollow/myfollow.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jeasyui/jquery-1.8.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/frontstage/index/index_init.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/frontstage/myfollow/myfollow.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/frontstage/top_bottomdiv_init.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/jeasyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/jeasyui/themes/default/easyui.css">
</head>

<body>
	<div id="top_bg">
		<div id="top_div">
			<div id="top_content">
				<div id="top_logo" style="float:left">
					<a href="${pageContext.request.contextPath }/index.jsp"><span
						id="logo_img"></span></a>
				</div>
				<div id="top_left" style="float: left">
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
						href="#" title="搜索按钮"><span id="search_btn"></span></a>
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
						<a href="${pageContext.request.contextPath }/index.jsp"><span
							class="right_bar"><span class="ico"><span
									id="new_msg"></span></span></span></a>
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

	<div id="content_main">
		<div id="content_div" style="height:1000px">
			<div id="content_div_left">
				<h3>关注中心</h3>
				<div class="ld1">
					<span class="ioc1"></span> <a
						href="${pageContext.request.contextPath }" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;关注</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部关注（1）</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;同事（0）</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名人明星（0）</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;同学（0）</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未分组（0）</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;展开</a>
				</div>
				<div>
					&nbsp;&nbsp; <a href="${pageContext.request.contextPath }"
						target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="button" class="zkbtn" value="展开分组" /></a>
				</div>
				<dl id="ld2">
					<dt>
						<span class="ioc2"></span>&nbsp;&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath }" target="iframe"
							class="left_dl_dd">密友圈</a>
					</dt>
				</dl>
				<dl id="ld3">
					<dt>
						<span class="ioc3"></span>&nbsp;&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath }" target="iframe"
							class="left_dl_dd">悄悄关注</a>
					</dt>
				</dl>
				<dl id="ld4">
					<dt>
						<span class="ioc1"></span>&nbsp;&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath }" target="iframe"
							class="left_dl_dd">粉丝</a>
					</dt>
				</dl>
				<dl id="ld5">
					<dt>
						<span class="ioc5"></span>&nbsp;&nbsp;&nbsp; <a
							href="javascript:void(0);" target="iframe" class="left_dl_dd">邀请站外好友</a>
					</dt>
				</dl>
				<dl id="ld6">
					<dt>
						<span class="ioc6"></span>&nbsp;&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath }" target="iframe"
							class="left_dl_dd">找人</a>
					</dt>
				</dl>
				<dl id="ld7">
					<dt>
						<span class="ioc7"></span>&nbsp;&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath }" target="iframe"
							class="left_dl_dd">猜你喜欢</a>
					</dt>
				</dl>

			</div>
			<div id="content_div_center">
				 <iframe id="iframe"
					src="${pageContext.request.contextPath }/frontstage/myfollow/myfollowinfo.jsp"
					name="iframe" frameborder="0" scrolling="auto" height="1000px"
					width="800px">
				</iframe> 
				
				<br />
				<div class="mydivinfo">
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;<span class="f2">全部关注</span> <span
							class="f4">（5个）</span>&nbsp;&nbsp;&nbsp; <a
							href="javascript:void(0);" class="f3">开通微博会员</a> <span class="f1">可提高关注上限</span>
					</div>
					<hr class="hrline" />
					<br />
					<div class="btns">
						&nbsp;
						<input type="button" value="全部关注" class="allbtn" />
						<input type="button" value="按关注时间排序" class="timebtn" /> 
						<span class="yc"> 
							<input type="button" value="添加到" class="addbtn" /> 
							<input type="button" value="取消关注" class="failbtn" />&nbsp; 
							<span class="f4">已选择1人&nbsp; 
								<a href="javascript:void(0);">取消选择</a>
							</span>
						</span>
						<div style="float:right;margin-right:30px;">
							<input class="easyui-searchbox"
								data-options="prompt:'&nbsp;&nbsp;输入昵称或备注',searcher:doSearch"
								style="width:170px" />

						</div>
						<script type="text/javascript">
							function doSearch(value) {
								alert('You input:' + value);
							}
						</script>
					</div>
					<div class="maininfo">
						<div class="info">
							<table style="height:90px;width:240px;table-layout:fixed;"
								cellpadding="0" cellspacing="0">
								<tr style="50px;">
									<td rowspan="3" style="width:60px;"><img src=""
										style="width:50px;height:50px;" /></td>
									<td class="f5"><span class="mx">&nbsp;盐城工学院</span><span
										class="f5">&nbsp;<a href="javascript:void(0);"
											class="bmx">盐城工学院</a></span></td>
								</tr>
								<tr>
									<td><span class="f5">&nbsp;已关注</span></td>
								</tr>
								<tr>
									<td><span class="f5">&nbsp;<a
											href="javascript:void(0);">未分组</a></span></td>
								</tr>
								<tr>
									<td colspan="2" style="white-space:nowrap;overflow:hidden;"
										class="mx"><span class="f1">简介：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：：</span></td>
									<td colspan="2" style="white-space:nowrap;overflow: hidden;"
										class="bmx"><span class="f5">&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="javascript:void(0)">求关注</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a
											href="javascript:void(0)">设置备注</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a
											href="javascript:void(0)">取消关注</a>
									</span></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
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
						href="javascript:void(0);">微博会员</a>
					</td>
					<td><a href="javascript:void(0);">微话题</a>&nbsp;<a
						href="javascript:void(0);">风云榜</a>
					</td>
					<td><a href="javascript:void(0);">微吧</a>&nbsp;<a
						href="javascript:void(0);">微公益</a>
					</td>
					<td><a href="javascript:void(0);">WAP版</a>&nbsp;<a
						href="javascript:void(0);">短彩发微博</a>
					</td>
					<td><a href="javascript:void(0);">申请认证</a>&nbsp;<a
						href="javascript:void(0);">开放平台</a>
					</td>
				</tr>
				<tr>
					<td><a href="javascript:void(0);">微博达人</a>
					</td>
					<td><a href="javascript:void(0);">微访谈</a>
					</td>
					<td><a href="javascript:void(0);">相册</a><a
						href="javascript:void(0);"> 微音乐</a>
					</td>
					<td><a href="javascript:void(0);">iPhone客户端</a>&nbsp;<a
						href="javascript:void(0);">iPad客户端</a>
					</td>
					<td><a href="javascript:void(0);">企业微博</a>&nbsp;<a
						href="javascript:void(0);">连接网站</a>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">媒体</a>&nbsp;<a
						href="javascript:void(0);">企业</a>&nbsp;<a href="javascript:void(0)">政府</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">热门微博</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">投票</a>&nbsp;<a
						href="javascript:void(0);">微游戏</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">Android客户端</a>
					</td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">微博标识</a>&nbsp;<a
						href="javascript:void(0);">广告服务</a>
					</td>
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
						href="javascript:void(0);">微博社区公约</a>
					</td>
				</tr>
				<tr>
					<td>客服电话：4000&nbsp;960&nbsp;960（个人）&nbsp;4000&nbsp;980&nbsp;980（企业）&nbsp;（按当地市话标准计算）<span
						style="float:right;margin-top:-8px;"><select><option>中文(简体)</option>
						</select> </span>
					</td>
				</tr>
				<tr>
					<td style="width:925px;"><span style="color:#888">盐城工学院信息工程学院</span>&nbsp;<a
						href="javascript:void(0)">京网文[2011]0398-130号</a>&nbsp;<a
						href="javascript:void(0)">京ICP证100780号</a><span
						style="font-size:11px;float:right;color:#888;font-family: '微软雅黑'">Copyright&nbsp;&copy;&nbsp;1996-2013&nbsp;SINA</span>
					</td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>
