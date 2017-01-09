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
		href="${pageContext.request.contextPath }/styles/frontstage/setter/preferencesUser.css">
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".langbtsave").click(function() {
				alert("保存成功！");
			});
		});
	</script>

  </head>
  
  <body>
    <div class="MIB_column">
		<div class="MIB_main_cont">
			<div class="MIB_setup">
				<div class="setup_main">
					<div class="index_title">
						<h4>个性设置</h4>
					</div>
					<div class="divline"></div><br>
					<div>
						<div class="wleft1">
							<div>
								<span class="font2">微博小黄签</span><span class="font1">设置哪些新消息，通过微博小黄签提醒我</span>
							</div>
							<div class="tag_tips marBt12 MIB_linedot2" id="talk">
								<p class="gray6">
									<input type="checkbox" id="new_comm" name="new_comm"
										checked="checked" /> <label class="font3">新评论提醒</label> <a
										id="arrow_commtype" class="arrow_t" href="javascript:void(0)"></a>
								</p>
								<div class="newaddtalk case_tips" id="newcommtype">
									<div class="font3">设置哪些评论计入评论提醒数字中</div>
									<table class="gray9">
										<tr>
											<td class="font1">评论的作者是：</td>
											<td><input type="radio" id="commall" name="commentype"
												checked="checked" value="0" /> <label class="font1">所有人&nbsp;&nbsp;&nbsp;&nbsp;</label>
											</td>
											<td><input type="radio" id="commone" name="commentype"
												value="1" /> <label class="font1">关注的人</label>
											</td>
										</tr>
									</table>
								</div>
								<p class="gray6">
									<input type="checkbox" id="new_fans" name="new_fans"
										checked="checked" /> <label class="font3">新增粉丝提醒</label>
								</p>
								<p class="gray6">
									<input type="checkbox" id="new_msg" name="new_msg"
										checked="checked" /> <label class="font3">新私信提醒</label>
								</p>
								<p class="gray6">
									<input type="checkbox" id="new_atme" name="new_atme"
										checked="checked" /> <label class="font3">@提到我提醒</label><a
										href="javascript:void(0)" id="arrow" class="arrow_t"></a>
								</p>
								<div class="newaddtalk case_tips" id="newaddtalk">
									<div class="font3">设置哪些@提到我的微博/评论计入@提醒数字中</div>
									<table class="gray9">
										<tr>
											<td class="font1">微博/评论的作者是：</td>
											<td><input type="radio" id="all" name="atblogrelation"
												checked="checked" value="0" /> <label class="font1">所有人&nbsp;&nbsp;&nbsp;&nbsp;</label>
											</td>
											<td><input type="radio" id="one" name="atblogrelation"
												value="1" /> <label class="font1">关注的人</label>
											</td>
										</tr>
										<tr>
											<td class="font1">微博的类型是：</td>
											<td><input type="radio" id="allblog" name="atblogtype"
												value="0" checked="checked" /> <label class="font1">所有微博</label>
											</td>
											<td><input type="radio" id="oriblog" name="atblogtype"
												value="1" /> <label class="font1">原创的微博</label>
											</td>
										</tr>
									</table>
								</div>
								<p class="gray6">
									<input type="checkbox" checked="checked" name="new_sendme"
										id="new_sendme"> <label class="font3">发给我的微博提醒</label><a
										id="arrow_sendme" class="arrow_t" href="javascript:void(0)"></a>
								</p>
								<div id="sendmetalk" class="newaddtalk case_tips">
									<div class="font3">设置收到哪些人发给我的微博提醒</div>
									<table class="gray9">
										<tbody>
											<tr>
												<td><input type="radio" value="1" checked="checked"
													id="allfen" name="to_me_status"> <label
													class="font1">全部互粉的人</label>
												</td>
											</tr>
											<tr>
												<td><input type="radio" value="2" id="asignfen"
													name="to_me_status"> <span id="sendText"
													class="font1">指定分组互粉的人</span> <a class="arrow_d"
													id="arrow_asignfen" href="javascript:void(0)"></a><span
													class="font1">（最多可以选择10个分组）</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<p class="gray6">
									<input type="checkbox" id="new_swarm" name="new_swarm"
										checked="checked" /> <label class="font3">群内新消息提醒</label>
								</p>
								<!-- 相册新消息提醒 -->
								<p class="gray6">
									<input type="checkbox" id="new_photo" name="new_photo"
										checked="checked" /> <label class="font3">相册新消息提醒</label>
								</p>
								<!-- //相册新消息提醒 -->
								<p class="gray6">
									<label class="font1"><input type="checkbox"
										id="new_notice" name="sys_notice" checked="checked" />系统通知提醒</label>
									<label class="font1"><input type="checkbox"
										id="new_notice_app" name="app_notice" checked="checked" />应用消息提醒</label>
								</p>
								<p class="gray6">
									<input type="checkbox" id="invite" name="new_invite"
										checked="checked" /> <label class="font1">新邀请提醒</label>
								</p>
								<!-- 微博小黄签 -->
								<div class="setupNewtips">
									<a class="font2">位置示意：</a>
									<div class="positionbg"></div>
								</div>
								<!-- //微博小黄签 -->
							</div>
						</div>
						<br />
						<div class="divline"></div>
						<br />
						<!--webIM-->
						<a name='webim'></a>
						<div class="rb_t" id="chatset">
							<a class="font2">聊天<span class="font3">&nbsp;&nbsp;设置一对一私聊模式</span>
							</a>
							<p class="gray6">
								<input type="checkbox" checked="checked" name="onwebim"
									id="onwebim"><label class="font3">开启即时聊天对话模式（可在我的首页中与互粉好友一对一即时聊天）</label>
							</p>
							<div class="rb_t">
								<a class="font2">在线状态 </a><span class="font1">设置是否允许别人看到我的在线状态</span>
							</div>
							<div class="tag_tips MIB_linedot2 iv_space1">
								<p class="pstyle gray6">
									<input type="radio" id="allone20" value="0" checked="checked"
										name="online" /><label class="font1">允许</label>
								</p>
								<p class="pstyle gray6">
									<input type="radio" id="allone21" value="1" name="online" /><label
										class="font1">不允许</label>
								</p>
							</div>
						</div>
						<div class="duihua">

							<div class="yellow">
								<p class="font2">对话模式来新消息提醒：</p>
								<div class="picview">
									<img
										src="http://img.t.sinajs.cn/t36/style/images/setup/webimpre.jpg"
										alt="" />
								</div>
							</div>
						</div>
				
						<div class="divline"></div>
						<br />
						<!--/webIM-->
					
							<div class="subbot">
								<div class="rb_t">
									<a class="font2">邮件</a> <span class="font1">设置是否接受微博邮件提示服务</span>
								</div>
								<div class="lang_div MIB_linedot2 marBt12">
									&nbsp;&nbsp;<input type="checkbox" id="notice_email"
										name="notice_email" checked="checked" /> <label class="font3">接收来自微博的邮件(较长时间不登录时，自动获取新浪微博的提示信息)</label>
								</div>
								<br />
								<div class="divline"></div>
								<br />
								<div class="langbtsave">保存</div>
							</div>
					<!--</div>  -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="asignfentalk" class="layer_menu_list"
		style="position: absolute; z-index: 99;display:none">
		<ul class="scroll_bar class close_friend_group" id="scrollArea">
			<li><a href="javascript:void(0);"><img class="addicon"
					src="http://img.t.sinajs.cn/t36/style/images/common/transparent.gif"><i
					class="i_conn_group"></i>同事</a></li>
			<li><a href="javascript:void(0);"><img class="addicon"
					src="http://img.t.sinajs.cn/t36/style/images/common/transparent.gif"><i
					class="i_conn_group"></i>特别关注</a></li>
			<li><a href="javascript:void(0);"><img class="addicon"
					src="http://img.t.sinajs.cn/t36/style/images/common/transparent.gif"><i
					class="i_conn_group"></i>名人明星</a></li>
			<li><a href="javascript:void(0);"><img class="addicon"
					src="http://img.t.sinajs.cn/t36/style/images/common/transparent.gif"><i
					class="i_conn_group"></i>同学</a></li>
		</ul>
		<ul>
			<li class="line"></li>
			<li id="confirm" class="opt disable"><a
				href="javascript:void(0);">确定</a></li>
		</ul>
	</div>
  </body>
</html>
