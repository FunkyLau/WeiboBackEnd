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
    
    <title>我的首页 新浪微博-随时随地分享身边的新鲜事儿</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="我的首页 新浪微博-随时随地分享身边的新鲜事儿">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./styles/frontstage/attention/attention_style.css">
	<link rel="stylesheet" type="text/css" href="./styles/frontstage/top_bottomdiv_style.css">
	<script type="text/javascript" src="./scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="./scripts/frontstage/top_bottomdiv_init.js"></script>
	<script type="text/javascript" src="./scripts/frontstage/attention/attention.js"></script>
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
					<input id="search_input" type="text" onchange="searchUsers()">
					 <a id="searchA" title="搜索按钮"> <span id="search_btn"></span>
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
	<!-- /头部     -->

	<div id="content_main">
		<!-- 左边导航 -->
		<div id="content_div_left">
			<div id="div_left_titile"></div>

			<div id="div_left_attentions_group">
				<div class="content_div_left_div" id="div_all">
					<a href="javascript:void(0)" onclick="groupShow()">
						<div class="div_left_div" id="div_left_all">
							<div id="left_attentions_ico"></div>
							<div class="left_text">关注</div>
						</div>
					</a>
				</div>
				<div id="attentions_group">
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=all">
					<div class="attentions_group_div" id="all">
						<div class="group_div">
							<div class="group_text">全部关注</div>
						</div>
					</div>
					</a>
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=special">
					<div class="attentions_group_div" id="special">
						<div class="group_div">
							<div class="group_text">特别关注</div>
						</div>
					</div>
					</a>
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=star">
					<div class="attentions_group_div" id="star">
						<div class="group_div">
							<div class="group_text">名人明星</div>
						</div>
					</div>
					</a>
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=friend">
					<div class="attentions_group_div" id="friend">
						<div class="group_div">
							<div class="group_text">朋友</div>
						</div>
					</div>
					</a>
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=schoolmate">
					<div class="attentions_group_div" id="schoolmate">
						<div class="group_div">
							<div class="group_text">同学</div>
						</div>
					</div>
					</a>
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=colleague">
					<div class="attentions_group_div" id="colleague">
						<div class="group_div">
							<div class="group_text">同事</div>
						</div>
					</div>
					</a>
					<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=family">
					<div class="attentions_group_div" id="family">
						<div class="group_div">
							<div class="group_text">家人</div>
						</div>
					</div>
					</a>
				</div>

			</div>
			<div class="content_div_left_div" id="div_secret">
				<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=secret">
					<div class="div_left_div">
						<div id="left_secret_ico"></div>
						<div class="left_text">悄悄关注</div>
					</div>
				</a>
			</div>
			<div class="content_div_left_div"  id="div_fans">
				<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=fans">
					<div class="div_left_div">
						<div id="left_fance_ico"></div>
						<div class="left_text">粉丝</div>
					</div>
				</a>
			</div>
			<div class="content_div_left_div" id="div_finduser">
				<a href="${pageContext.request.contextPath }/UsersAction_searchUsers.action?searchKey=searchUsers&searchValue=''" onclick="groupHide()">
					<div class="div_left_div">
						<div id="left_finduser_ico"></div>
						<div class="left_text">找人</div>
					</div>
				</a>
			</div>
			<div class="content_div_left_div">
				<a href="javascript:void(0)" onclick="groupHide()">
					<div class="div_left_div">
						<div id="left_guess_ico"></div>
						<div class="left_text">猜你喜欢</div>
					</div>
				</a>
			</div>
		</div>
		<!-- 右边 -->
		<div id="content_div_right">
			<div id="right_top_titile">全部关注<input type="text" value="${searchFlag}" id="searchFlag" style="display: none"></div>
			<div id="right_div_button">
				<input type="text" id="chooseUsersIds" style="display: none">
			</div>
			<div class="prompt_bgcolor" id="prompt_bgcolor"></div>
			<div class="prompt_div" id="prompt_div${showUsersInfo.sUsersId}">
				<form action="${pageContext.request.contextPath }/UsersAction_addRelation.action" method="post">
							<div class="prompt_div_top">&nbsp;&nbsp;加关注<div class="closeDiv"></div></div>
							<div class="prompt_div_center">
								<div class="pdiv_center_top">
									备注名称：<input type="text" name="relationNote">
								</div>
								<div class="pdiv_center_center">
									为选择分组
								</div>
								<div class="pdiv_center_bottom">
									<table>
										<tr>
											<td>&nbsp;</td>		
											<td>&nbsp;</td>		
										</tr>	
										<tr>
											<td>&nbsp;<input type="radio" name="groupName" value="特别关注">&nbsp;特别关注</td>		
											<td>&nbsp;<input type="radio" name="groupName" value="明星名人">&nbsp;明星名人</td>		
										</tr>
										<tr>
											<td>&nbsp;<input type="radio" name="groupName" value="朋友">&nbsp;朋友</td>		
											<td>&nbsp;<input type="radio" name="groupName" value="同学">&nbsp;同学</td>		
										</tr>
										<tr>
											<td>&nbsp;<input type="radio" name="groupName" value="同事">&nbsp;同事</td>		
											<td>&nbsp;<input type="radio" name="groupName" value="家人">&nbsp;家人</td>		
										</tr>
										<tr>
											<td>&nbsp;<input type="radio" name="groupName" value="悄悄关注">&nbsp;悄悄关注</td>		
										</tr>
									</table>
								</div>
							</div>
							<div class="prompt_div_bottom"><input type="text" id="prompt_userId" name="byUsersId" style="display: none">
								<div class="prompt_close"></div>
								<button type="submit" class="prompt_save">&nbsp;</button>
							</div>
							</form>
						</div>
						
			<div class="prompt_cancelAtt">
				<form action="${pageContext.request.contextPath }/UsersAction_cancelRelation.action" method="post">
					<div class="cancelAtt_top">&nbsp;&nbsp;提示<div class="closeAtt"></div></div>
					<div class="cancelAtt_center">
						确定要取消对的关注吗？
					</div>
					<div class="cancelAtt_bottom"><input type="text" id="cancelAtt_userId" name="byUsersId" style="display: none">
						<div class="prompt_closeAtt"></div>
						<button type="submit" class="prompt_save">&nbsp;</button>
					</div>
				</form>
			</div>
			
			<div class="prompt_removeFans">
				<form action="${pageContext.request.contextPath }/UsersAction_removeFans.action" method="post">
					<div class="cancelAtt_top">&nbsp;&nbsp;提示<div class="closeFans"></div></div>
					<div class="removeFans_center">
						确定要移除吗？
					</div>
					<div class="cancelAtt_bottom"><input type="text" id="removeFans_userId" name="byUsersId" style="display: none">
						<div class="prompt_closeFans"></div>
						<button type="submit" class="prompt_save">&nbsp;</button>
					</div>
				</form>
			</div>
			
			<div class="prompt_note">
				<form action="${pageContext.request.contextPath }/UsersAction_updateNote.action" method="post">
					<div class="cancelAtt_top">&nbsp;&nbsp;设置备注名<div class="closeNote"></div></div>
					<div class="cancelAtt_center">
						备注名：<input type="text" name="relationNote">
					</div>
					<div class="cancelAtt_bottom"><input type="text" id="Note_userId" name="byUsersId"  style="display: none">
						<div class="prompt_closeNote"></div>
						<button type="submit" class="prompt_save">&nbsp;</button>
					</div>
				</form>
			</div>	
				
			<div id="right_div_user">
			<c:if test="${showUsers!=null}">
				<c:forEach items="${showUsers.showUsersInfo}" var="showUsersInfo">
					<div class="attention_userinfo" onclick="userInfoDivClick(this)">
						
						<c:if test="${showUsersInfo.sUsersHeadPicUrl==null}">
							<c:if test="${showUsersInfo.sUsersSex=='男'}">
								<div class="userinfo_img">
									<img src="${pageContext.request.contextPath}/images/1.gif" width="50px" height="50px">
								</div>
							</c:if>
							<c:if test="${showUsersInfo.sUsersSex=='女'}">
								<div class="userinfo_img">
									<img src="${pageContext.request.contextPath}/images/0.gif" width="50px" height="50px">
								</div>
							</c:if>
						</c:if>
						<c:if test="${showUsersInfo.sUsersHeadPicUrl!=null}">
							<div class="userinfo_img">
								<img src="${pageContext.request.contextPath}/uploadImages${showUsersInfo.sUsersHeadPicUrl}" width="50px" height="50px">
							</div>
						</c:if>
						<div class="userinfo_info">
							<table>
								<tr>
									<c:if test="${showUsersInfo.sUsersNote!=null }">
											<td>
												<c:if test="${showUsersInfo.sUsersSex=='男'}">
													<div id="info_div1"></div>
												</c:if>
												<c:if test="${showUsersInfo.sUsersSex=='女'}">
													<div id="info_div2"></div>
												</c:if>
												${showUsersInfo.sUsersNote }
											</td>
									</c:if>
									<c:if test="${showUsersInfo.sUsersNote==null }">
											<td>
												<c:if test="${showUsersInfo.sUsersSex=='男'}">
													<div id="info_div1"></div>
												</c:if>
												<c:if test="${showUsersInfo.sUsersSex=='女'}">
													<div id="info_div2"></div>
												</c:if>
												${showUsersInfo.sUsersNikeName }
											</td>
									</c:if>
								</tr>
									<tr>
										<td>
												<c:if test="${showUsersInfo.sUsersRelationMark=='已关注' }">
													已关注
												</c:if>
												<c:if test="${showUsersInfo.sUsersRelationMark=='相互关注' }">
													相互关注
												</c:if>
												<c:if test="${showUsersInfo.sUsersRelationMark=='粉丝' }">
													粉丝
												</c:if>
												<c:if test="${showUsersInfo.sUsersRelationMark==null}">
													<a href="javascript:void(0)">${showUsersInfo.sUsersAddress}</a>
												</c:if>
										</td>
									</tr>
									<tr>
										<td>
											<c:if test="${showUsersInfo.sUsersGroupName!=null}">
												<a href="javascript:void(0)">${showUsersInfo.sUsersGroupName}</a>
											</c:if>
											<c:if test="${showUsersInfo.sUsersGroupName==null}">
												<a href="javascript:void(0)">关注${showUsersInfo.sUsersAttention}</a>
											<a href="javascript:void(0)">粉丝${showUsersInfo.sUsersFance}</a>
											<a href="javascript:void(0)">微博${showUsersInfo.sUsersMessages}</a>
											</c:if>
										</td>
									</tr>
							</table>
						</div>
						<div class="select_gif"></div>
						<div class="user_id">
							<input type="text" value="${showUsersInfo.sUsersId }" size="1" />
						</div>
						<c:if test="${showUsersInfo.sUsersIntro!=null}">
							<div class="userinfo_intro">简介：${showUsersInfo.sUsersIntro }</div>
						</c:if>
						<c:if test="${showUsersInfo.sUsersIntro==null}">
							<div class="userinfo_intro">简介：该用户没有留下任何信息</div>
						</c:if>
						<c:if test="${user.usersId!=showUsersInfo.sUsersId }">
							<c:if test="${showUsersInfo.sUsersRelationMark!=null }">
								<div class="userinfo_operate">
									<div class="private_ico"></div>
									<div class="operate_div">
										
										<a href="javascript:void(0)">私信</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
										<c:if test="${showUsersInfo.sUsersRelationMark!='粉丝' }">
											<c:if test="${showUsersInfo.sUsersNote!=null }">
												<a href="javascript:void(0)" onclick="showNote(this)">修改备注</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
											</c:if>
											<c:if test="${showUsersInfo.sUsersNote==null }">
												<a href="javascript:void(0)" onclick="showNote(this)">设置备注</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
											</c:if>
										</c:if>
										<c:if test="${showUsersInfo.sUsersRelationMark=='已关注' }">
											<a href="javascript:void(0)" onclick="showCancelAtt(this)">取消关注</a><input type="text" value="${showUsersInfo.sUsersNikeName}" size="5" style="display: none;">
										</c:if>
										<c:if test="${showUsersInfo.sUsersRelationMark=='相互关注' }">
											<a href="javascript:void(0)" onclick="showCancelAtt(this)">取消关注</a><input type="text" value="${showUsersInfo.sUsersNikeName}" size="5" style="display: none;">
										</c:if>
										<c:if test="${showUsersInfo.sUsersRelationMark=='粉丝' }">
											<a href="javascript:void(0)" onclick="removeFans(this)">移除粉丝</a><input type="text" value="${showUsersInfo.sUsersNikeName}" size="5" style="display: none;">&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
											<a href="javascript:void(0)" onclick="showPrompt(this)">加关注</a><input type="text" value="${showUsersInfo.sUsersNikeName}" size="5" style="display: none;">
										</c:if>
									</div>
								</div>
							</c:if>
							
							<c:if test="${showUsersInfo.sUsersRelationMark==null }">
								<div class="userinfo_operate">
									<div class="private_ico"></div>
									<div class="operate_div">
										
										<a href="javascript:void(0)">聊天</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
										<a href="javascript:void(0)">查看资料</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="showPrompt(this)">加关注</a><input type="text" value="${showUsersInfo.sUsersNikeName}" size="5" style="display: none;">
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${user.usersId==showUsersInfo.sUsersId }">
							<div class="userinfo_operate">
								<div class="private_ico"></div>
								<div class="operate_div">
									<a href="javascript:void(0)">在线</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
									<a href="javascript:void(0)">自己</a>
								</div>
							</div>
						</c:if>
						
					</div>
				</c:forEach>
			</c:if>
				
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
					<td><a href="javascript:void(0)">名人堂</a>&nbsp;<a
						href="javascript:void(0)">微博会员</a></td>
					<td><a href="javascript:void(0)">微话题</a>&nbsp;<a
						href="javascript:void(0)">风云榜</a></td>
					<td><a href="javascript:void(0)">微吧</a>&nbsp;<a
						href="javascript:void(0)">微公益</a></td>
					<td><a href="javascript:void(0)">WAP版</a>&nbsp;<a
						href="javascript:void(0)">短彩发微博</a></td>
					<td><a href="javascript:void(0)">申请认证</a>&nbsp;<a
						href="javascript:void(0)">开放平台</a></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)">微博达人</a></td>
					<td><a href="javascript:void(0)">微访谈</a></td>
					<td><a href="javascript:void(0)">相册</a><a
						href="javascript:void(0)"> 微音乐</a></td>
					<td><a href="javascript:void(0)">iPhone客户端</a>&nbsp;<a
						href="javascript:void(0)">iPad客户端</a></td>
					<td><a href="javascript:void(0)">企业微博</a>&nbsp;<a
						href="javascript:void(0)">连接网站</a></td>
				</tr>
				<tr>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">媒体</a>&nbsp;<a
						href="javascript:void(0)">企业</a>&nbsp;<a href="javascript:void(0)">政府</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">热门微博</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">投票</a>&nbsp;<a
						href="javascript:void(0)">微游戏</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">Android客户端</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0)">微博标识</a>&nbsp;<a
						href="javascript:void(0)">广告服务</a></td>
				</tr>
			</table>

			<table id="bottom_table_b">
				<tr>
					<td><a href="javascript:void(0)"><span class="ico"
							style="background-position: -350px -127px"></span>微博帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0)">意见反馈</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0)">开放平台</a> &nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0)">微博招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0)">新浪网导航</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0)">社区管理中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0)">微博社区公约</a></td>
				</tr>
				<tr>
					<td>客服电话：4000&nbsp;960&nbsp;960（个人）&nbsp;4000&nbsp;980&nbsp;980（企业）&nbsp;（按当地市话标准计算）<span
						style="float:right;margin-top:-8px;"><select><option>中文(简体)</option></select></span></td>
				</tr>
				<tr>
					<td style="width:925px;"><span style="color:#888">北京微梦创科网络技术有限公司</span>&nbsp;<a
						href="javascript:void(0)">京网文[2011]0398-130号</a>&nbsp;<a
						href="javascript:void(0)">京ICP证100780号</a><span
						style="font-size:11px;float:right;color:#888;font-family: '微软雅黑'">Copyright&nbsp;&copy;&nbsp;1996-2013&nbsp;SINA</span></td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>
