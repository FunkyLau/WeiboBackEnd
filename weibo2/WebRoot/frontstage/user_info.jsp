<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" type="text/css" href="./styles/frontstage/user_info/user_info_style.css">
<link rel="stylesheet" type="text/css" href="./styles/frontstage/top_bottomdiv_style.css">
<script type="text/javascript" src="./scripts/jquery/jquery-1.11.2.js"></script>
<script type="text/javascript" src="./scripts/frontstage/top_bottomdiv_init.js"></script>
<script type="text/javascript" src="./scripts/frontstage/user_info/user_info.js"></script>
<script type="text/javascript" src="./scripts/frontstage/user_info/birthdayDate/jquery.jSelectDate.js"></script>

</head>

<body>
	<!--头部  -->
	<div id="top_bg">
		<div id="top_div">
			<div id="top_content">
				<div id="top_logo" style="float:left">
					<a href="${pageContext.request.contextPath }/index.jsp"> <span
						id="logo_img"></span>
					</a>
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
					<input id="search_input" type="text" onchange="searchUsers()" /> <a
						id="searchA" title="搜索按钮"><span id="search_btn"></span></a>
				</div>
				<div id="top_right" style="float:right">
					<div id="user_vip" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp"><span
							class="right_bar"><span class="ico"></span></span></a>
						<div id="vip_show"></div>
					</div>
					<div id="user_setting" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp">
						<span class="right_bar">
							<span class="ico"></span>
						</span>
						</a>
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
						<a href="javascript:void(0);">
						<span class="right_bar">
							<span class="ico"></span>
						</span>
						</a>
						<div id="weibo_show"></div>
					</div>
					<div id="user_login" style="float:right">
						<a href="${pageContext.request.contextPath }/index.jsp">
							<span class="user_name"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /头部 -->
	
	
	<div id="content_main">
		<div id="content_div">
			<!-- 皮肤标题图片 -->
			<div id="content_div_top"></div>
			<!-- 信息展示 -->
			<div id="content_div_info">
			<div id="info_show">
				<div id="info_show_text">
					<div id="show_text_name">
						<table>
							<tr>
								<td id="text_name_span">${user.usersNikename}</td>
								<td id="text_name_rank">
									<div id="rank_bg"></div>
									<div id="rank_img"></div>
								</td>
								<td id="text_name_url"><a href="${userinfos.userinfoBlogurl }">${userinfos.userinfoBlogurl }</a></td>
							</tr>
						</table>
					</div>
					<div id="show_text_intro">&nbsp;${userinfos.userinfoIntro }</div>
					<div id="show_text_info">
						<c:if test="${userinfos.userinfoSex=='男'} ">
							<div id="show_text_info_div"></div>
						</c:if>
						<c:if test="${userinfos.userinfoSex=='女'}">
							<div id="show_text_info_div2"></div>
						</c:if>
						&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
						<c:if test="${userinfos.userinfoSexual != null && userinfos.userinfoSexual != '' && userinfos.userinfoSexual==userinfos.userinfoSex }">
							<a href="javascript:void(0);">同性恋</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    					</c:if>
						<c:if test="${userinfos.userinfoSexual != null &&userinfo.userinfoSexual != '' && userinfos.userinfoSexual != userinfos.userinfoSex && userinfos.userinfoSexual != '男,女' }">
							<a href="javascript:void(0);">异性恋</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    					</c:if>
						<c:if test="${userinfos.userinfoSexual !=null && userinfos.userinfoSexual !='' && userinfos.userinfoSexual==userinfos.userinfoSex && userinfos.userinfoSexual == '男,女'  }">
							<a href="javascript:void(0);">双性恋</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    					</c:if>
						<c:if test="${userinfos.userinfoFeeling != null && userinfos.userinfoFeeling !='' }">
							<a href="javascript:void(0);">${userinfos.userinfoFeeling }</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    					</c:if>
						<c:if test="${userinfos.userinfoBirthday != null && userinfos.userinfoBirthday !='' }">
							<a href="javascript:void(0);" id="signText">摩羯座</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    						<input type="text" value="${userinfos.userinfoBirthday }" id="signInput">
						</c:if>
						<a href="javascript:void(0);">${userinfos.userinfoAddress }</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
						<c:if test="${userinfos!=null }">
    						毕业于<a href="javascript:void(0);">盐城工学院</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    					</c:if>
						<c:if test="${userinfos.userinfoLabel!=null }">
							<a href="javascript:void(0);">标签</a>
						</c:if>
					</div>
				</div>
				<div id="info_show_button">
					<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action">
						<div id="info_show_button_div"></div>
					</a> <input type="text" value="${pageflag }" id="pageflag">
				</div>
			</div>
		
		</div>
	
		<!--头像展示  -->
		<div id="content_div_headphoto">
			<c:if test="${userinfos.userinfoSex=='男' }">
				<div id="headphoto_top">
					<c:if test="${headPic != null }">
						<img alt="${user.usersNikename }"
							src="${pageContext.request.contextPath }/uploadImages${headPic.picturesUrl}"
							width="100%" height="100%">
					</c:if>
				</div>
			</c:if>
			<c:if test="${userinfos.userinfoSex=='女' }">
				<div id="headphoto_top2">
					<c:if test="${headPic != null }">
						<img alt="${user.usersNikename }"
							src="${pageContext.request.contextPath }/uploadImages${headPic.picturesUrl}"
							width="100%" height="100%">
					</c:if>
				</div>
			</c:if>
			<a href="${pageContext.request.contextPath }/frontstage/setter/setUser.jsp" target="_blank">
				<div id="headphoto_change"></div>
			</a>
			<div id="headphoto_info">
				<div id="info_attention">
					<a href="javascript:void(0);">
						<span id="headphoto_info_spannum">${userAttention }</span> 
						<span id="headphoto_info_spantext">关注</span>
					</a>
				</div>
				<div id="info_fance">
					<a href="javascript:void(0);"> 
						<span id="headphoto_info_spannum">${userFans }</span>
						<span id="headphoto_info_spantext">粉丝</span>
					</a>
				</div>
				<div id="info_blog">
					<a href="javascript:void(0);"> 
						<span id="headphoto_info_spannum">${userMessages }</span>
						<span id="headphoto_info_spantext">微博</span>
					</a>
				</div>
			</div>
		</div>
		<!-- 导航div -->
		<div id="content_div_navigation">
			<!-- 回顶部 -->
			<!-- scroll第一个参数是水平位置，第二个参数是垂直位置，比如要想定位在垂直50像素处，改成scroll(0,50)就可以了。  -->
			<a href="javascript:scroll(0,50)"><div id="page_anchor"></div></a>

			<div id="navigation_index">
				<div id="index_bg"></div>
				<div id="index_ico"></div>
				<div id="index_text">我的主页</div>
			</div>
			<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action" class="a_div">
				<div id="navigation_userinfo">
					<div id="userinfo_bg"></div>
					<div id="userinfo_ico"></div>
					<div id="index_text">个人资料</div>
				</div>
			</a> 
			<a href="${pageContext.request.contextPath }/UsersAction_searchAttention.action?searchKey=all" class="a_div">
				<div id="navigation_fance">
					<div id="fance_bg"></div>
					<div id="fance_ico"></div>
					<div id="index_text">关注/粉丝</div>
				</div>
			</a> 
			<a href="${pageContext.request.contextPath}/frontstage/setter/targetUser.jsp">
				<div id="navigation_photos">
					<div id="photos_bg"></div>
					<div id="photos_ico"></div>
					<div id="index_text">相册</div>
				</div>
			</a>

		</div>
		<!-- 我的主页微博内容 -->
		<div id="navigation_index_showdiv">
			<div id="content_div_blogtitle">
				<div id="blogtitle_top">
					<div id="blogtitle_top_all">
						<div id="top_all_text">全部</div>
						<div id="top_all_ico"></div>
					</div>
					<div id="blogtitle_top_weibo">
						<div id="top_weibo_text">微博</div>
						<div id="top_weibo_ico"></div>
					</div>
				</div>

				<div id="blogtitle_bottom">
					<div id="blogtitle_bottom_all">
						<a href="javascript:void(0);">全部</a>
					</div>
					<div>
						<a href="javascript:void(0);">原创</a>
					</div>
					<div>
						<a href="javascript:void(0);">转载</a>
					</div>
					<div>
						<a href="javascript:void(0);">图片</a>
					</div>
					<div>
						<a href="javascript:void(0);">标签</a>
					</div>
					<div>
						<a href="javascript:void(0);">心情</a>
					</div>
					<div>
						<a href="javascript:void(0);">私信</a>
					</div>
				</div>
			</div>
			<!-- 原创微博模板 -->
			<div class="content_div_bloginfo">
				<!--cellpadding 属性规定单元边沿与其内容之间的空白。cellspacing 属性规定的是单元之间的空间。  -->
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td class="bloginfo_td1">
							<div>新浪微博 新浪微博新浪微博新浪微博</div>
						</td>
					</tr>
					<tr>
						<td class="bloginfo_td2"><label>标签：</label>
							<div>微博</div>
							<div>微博</div></td>
					</tr>
					<tr>
						<td class="bloginfo_td3">
							<div class="bloginfo_leftdiv">
								<label><a href="javascript:void(0);">今天&nbsp;08:30</a></label>&nbsp;<span>来自</span>
								<label><a href="javascript:void(0);">微博达人</a></label>
							</div>
							<div class="bloginfo_rightdiv">
								<div class="rightdiv_showdiv">
									<span class="rightdiv_agreelabel">&nbsp;&nbsp;</span> 
									<label class="rightdiv_readspan">（000）</label> 
									<span>|</span>
									<label class="rightdiv_readspan">阅读（000）</label> 
									<span>|</span>
									<label class="rightdiv_readlabel">
										<a href="javascript:void(0);">转发（000）</a>
									</label> 
									<span>|</span>
									<label class="rightdiv_readlabel">
										<a href="javascript:void(0);">收藏（000）</a>
									</label> 
									<span>|</span>
									<label class="rightdiv_readlabel">
										<a href="javascript:void(0);">评论（000）</a>
									</label>
									
								</div>
								<div class="rightdiv_hidediv">
									<label class="rightdiv_readlabel">
										<a href="javascript:void(0);">删除</a>
									</label>
									<span>|</span> 
									<label class="rightdiv_readlabel">
										<a href="javascript:void(0);">置顶</a>
									</label>
									<span>|</span>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<!-- 转发微博模板 -->
				<div class="content_div_blogat">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td class="bloginfo_td1">
								<div>新浪微博 新浪微博新浪微博新浪微博</div>
							</td>
						</tr>
						<tr>
							<td class="bloginfo_td4">
								<div id="bloginfo_td4_div">
									<span id="span1"></span> <b class="b1"></b> <b class="b2 d1"></b>
									<b class="b3 d1"></b> <b class="b4 d1"></b>
									<div class="b d1 k"></div>
									<b class="b4b d1"></b> <b class="b3b d1"></b> <b class="b2b d1"></b>
									<b class="b1b"></b>
								</div>

							</td>
						</tr>
						<tr>
							<td class="bloginfo_td2"><label>标签：</label>
								<div>微博</div>
								<div>微博</div></td>

						</tr>
						<tr>
							<td class="bloginfo_td3">
								<div class="bloginfo_leftdiv">
									<label><a href="javascript:void(0);">今天&nbsp;08:30</a></label>&nbsp;<span>来自</span><label><a
										href="javascript:void(0);">微博达人</a></label>
								</div>
								<div class="bloginfo_rightdiv">
									<div class="rightdiv_showdiv">
										<span class="rightdiv_agreelabel">&nbsp;&nbsp;</span> <label
											class="rightdiv_readspan">（000）</label><span>|</span> <label
											class="rightdiv_readspan">阅读（000）</label><span>|</span> <label
											class="rightdiv_readlabel"><a
											href="javascript:void(0);">转发（000）</a></label><span>|</span> <label
											class="rightdiv_readlabel"><a
											href="javascript:void(0);">收藏（000）</a></label><span>|</span> <label
											class="rightdiv_readlabel"><a
											href="javascript:void(0);">评论（000）</a></label><span>|</span>
									</div>
									<div class="bloginfo_hidediv">
										<label class="rightdiv_readlabel"><a
											href="javascript:void(0);">删除</a></label><span>|</span> <label
											class="rightdiv_readlabel"><a
											href="javascript:void(0);">置顶</a></label><span>|</span>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>

				<!-- 底部页码 -->
				<div id="div_buttom">
					<div id="buttom_pagediv">
						<div id="pagediv_prev"></div>
						<div id="pagediv_text">
							<a href="javascript:void(0);">第二页</a>
						</div>
						<div id="pagediv_next"></div>
					</div>
				</div>
			
			</div>
				<!-- 个人资料 -->
				<div id="navigation_userinfo_showdiv">
					<div id="userinfo_showdiv_maindiv">
						<div id="maindiv_blockjb">
							<div id="blockjb_tool">
								<div class="tool_text">基本信息</div>
								<div class="tool_img"></div>
								<div class="tool_btn_jb"></div>
							</div>
							<div id="blockjb_info">
								<table>
									<tr>
										<td class="tdleft">登录名</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;${user.usersEmail}
											<a href=" ${pageContext.request.contextPath}/frontstage/setter/setUser.jsp">修改密码</a>
										</td>
									</tr>
									<tr>
										<td class="tdleft">昵 称</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;${user.usersNikename }</td>
									</tr>
									<tr>
										<td class="tdleft">真实姓名</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoTruename!=null&&userinfos.userinfoTruename!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoTruename }
												</c:if> <c:if
												test="${userinfos.userinfoTruename==null||userinfos.userinfoTruename==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的真实姓名，找到同名同姓的你
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">所在地</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoAddress }</td>
									</tr>
									<tr>
										<td class="tdleft">性 别</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoSex }</td>
									</tr>
									<tr>
										<td class="tdleft">性取向</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoSexual!=null&&userinfos.userinfoSexual!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoSexual }
												</c:if> <c:if
												test="${userinfos.userinfoSexual==null||userinfos.userinfoSexual==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的性取向,让合适的人找到你
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">感情状况</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoFeeling!=null&&userinfos.userinfoFeeling!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoFeeling }
												</c:if> <c:if
												test="${userinfos.userinfoFeeling==null||userinfos.userinfoFeeling==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的感情状况,让更多的人了解你 
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">生日</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoBirthday!=null&&userinfos.userinfoBirthday!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoBirthday }
												</c:if> <c:if
												test="${userinfos.userinfoBirthday==null||userinfos.userinfoBirthday==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的生日,可以收到更多的生日祝福哦
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">血型</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoBloodtype!=null&&userinfos.userinfoBloodtype!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoBloodtype }
												</c:if> <c:if
												test="${userinfos.userinfoBloodtype==null||userinfos.userinfoBloodtype==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的血型,可以被更多同血型的人找到哦
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">博客地址</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoBlogurl!=null&&userinfos.userinfoBlogurl!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;<a href="${userinfos.userinfoBlogurl }">${userinfos.userinfoBlogurl }</a>
											</c:if> <c:if
												test="${userinfos.userinfoBlogurl==null||userinfos.userinfoBlogurl==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的博客地址,让自己的心声被更多的人了解 
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">个性域名</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoRealname!=null&&userinfos.userinfoRealname!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;<a href="${userinfos.userinfoRealname }">${userinfos.userinfoRealname }</a>
											</c:if> <c:if
												test="${userinfos.userinfoRealname==null||userinfos.userinfoRealname==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>还没有个性域名和微号哦，现在就去申请吧~ 
												</c:if></td>
									</tr>
									<tr>
										<td class="tdleft">简介</td>
										<td class="tdright"><c:if
												test="${userinfos.userinfoIntro!=null&&userinfos.userinfoIntro!=''}">
													&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoIntro }
												</c:if> <c:if test="${userinfos.userinfoIntro==null||userinfos.userinfoIntro==''}">
												<div class="editico"></div>
												<a href="javascript:void(0);">马上填写</a>自己的个人介绍,让大家快速了解真实的你
												</c:if></td>
									</tr>
								</table>
							</div>
						</div>
					
					<!-- 基本信息编辑状态 -->
					<div id="maindiv_blockjb_edit">
						<form
							action="${pageContext.request.contextPath }/UserinfoAction_updateUserInfo.action?updateflag=jbinfo"
							method="post">
							<div id="blockjb_tool">
								<div class="tool_text">基本信息</div>
								<div class="tool_img"></div>
								<div class="tool_btn_jb">
									<input type="submit" value=" " id="savebtn_jb">
								</div>
							</div>
							<div id="blockjb_info">
								<table>
									<tr>
										<td class="tdleft">登录名</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;${user.usersEmail }
											<a
											href="${pageContext.request.contextPath}/frontstage/setter/setUser.jsp">修改密码</a>
										</td>
									</tr>
									<tr>
										<td class="tdleft">昵 称</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${user.usersNikename!=null}">
												<input type="text" value="${user.usersNikename }"
													name="users.usersNikename" style="width: 195px" maxlength="20" />
											</c:if> <c:if test="${user.usersNikename==null||user.usersNikename==''}">
												<input type="text" name="users.usersNikename"
													style="width: 195px" maxlength="20" />
											</c:if>

										</td>
									</tr>
									<tr>
										<td class="tdleft">真实姓名</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoTruename!=null&&userinfos.userinfoTruename!=''}">
												<input type="text" value="${userinfos.userinfoTruename }"
													name="userinfo.userinfoTruename" style="width: 195px"
													maxlength="20" />
											</c:if> <c:if
												test="${userinfos.userinfoTruename==null||userinfos.userinfoTruename==''}">
												<input type="text" name="userinfo.userinfoTruename"
													style="width: 195px" maxlength="20" />
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">所在地</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <select
											id="province" runat="server" name="province"
											onchange="selectprovince(this)" onclick="changeAddress()"></select>
											<select id="city" runat="server" name="city"
											onclick="changeAddress()"></select> <input id="uiAddress"
											type="text" value="${userinfos.userinfoAddress}"
											name="userinfo.userinfoAddress" />
										</td>
									</tr>
									<tr>
										<td class="tdleft">性 别</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoSex=='男'}">
												<input type="radio" value="男" name="userinfo.userinfoSex"
													checked="checked">男
										 	 <input type="radio" value="女" name="userinfo.userinfoSex">女
										</c:if> <c:if test="${userinfos.userinfoSex=='女'}">
												<input type="radio" value="男" name="userinfo.userinfoSex">男
										 	 <input type="radio" value="女" name="userinfo.sex"
													checked="checked">女
										</c:if> <c:if test="${userinfos.userinfoSex==''}">
												<input type="radio" value="男" name="userinfo.userinfoSex">男
										 	 <input type="radio" value="女" name="userinfo.userinfoSex">女
										</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">性取向</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoSexual=='男'}">
												<select name="userinfo.userinfoSexual">
													<option value=""></option>
													<option selected="selected" value="男">男</option>
													<option value="女">女</option>
													<option value="男,女">双性</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoSexual=='女'}">
												<select name="userinfo.userinfoSexual">
													<option value=""></option>
													<option value="男">男</option>
													<option selected="selected" value="女">女</option>
													<option value="男,女">双性</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoSexual=='男,女'}">
												<select name="userinfo.userinfoSexual">
													<option value=""></option>
													<option value="男">男</option>
													<option value="女">女</option>
													<option selected="selected" value="男,女">双性</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoSexual==null||userinfos.userinfoSexual==''}">
												<select name="userinfo.userinfoSexual">
													<option selected="selected" value=""></option>
													<option value="男">男</option>
													<option value="女">女</option>
													<option value="男,女">双性</option>
												</select>
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">感情状况</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; 
										<c:if test="${userinfos.userinfoFeeling==null||userinfos.userinfoFeeling==''}">
												<select name="userinfo.userinfoFeeling">
													<option selected="selected" value=""></option>
													<option value="单身">单身</option>
													<option value="暗恋中">暗恋中</option>
													<option value="恋爱中">恋爱中</option>
													<option value="已婚">已婚</option>
													<option value="离异">离异</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoFeeling=='单身'}">
												<select name="userinfo.userinfoFeeling">
													<option value=""></option>
													<option selected="selected" value="单身">单身</option>
													<option value="暗恋中">暗恋中</option>
													<option value="恋爱中">恋爱中</option>
													<option value="已婚">已婚</option>
													<option value="离异">离异</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoFeeling=='暗恋中'}">
												<select name="userinfo.userinfoFeeling">
													<option value=""></option>
													<option selected="selected" value="单身">单身</option>
													<option value="暗恋中">暗恋中</option>
													<option value="恋爱中">恋爱中</option>
													<option value="已婚">已婚</option>
													<option value="离异">离异</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoFeeling=='暗恋中'}">
												<select name="userinfo.userinfoFeeling">
													<option value=""></option>
													<option value="单身">单身</option>
													<option selected="selected" value="暗恋中">暗恋中</option>
													<option value="恋爱中">恋爱中</option>
													<option value="已婚">已婚</option>
													<option value="离异">离异</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoFeeling=='恋爱中'}">
												<select name="userinfo.userinfoFeeling">
													<option value=""></option>
													<option value="单身">单身</option>
													<option value="暗恋中">暗恋中</option>
													<option selected="selected" value="恋爱中">恋爱中</option>
													<option value="已婚">已婚</option>
													<option value="离异">离异</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoFeeling=='已婚'}">
												<select name="userinfo.userinfoFeeling">
													<option value=""></option>
													<option value="单身">单身</option>
													<option value="暗恋中">暗恋中</option>
													<option value="恋爱中">恋爱中</option>
													<option selected="selected" value="已婚">已婚</option>
													<option value="离异">离异</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoFeeling=='离异'}">
												<select name="userinfo.userinfoFeeling">
													<option value=""></option>
													<option value="单身">单身</option>
													<option value="暗恋中">暗恋中</option>
													<option value="恋爱中">恋爱中</option>
													<option value="已婚">已婚</option>
													<option selected="selected" value="离异">离异</option>
												</select>
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">生日</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoBirthday!=null}">
												<input type="text" id="txtName" class="date"
													value="${userinfos.userinfoBirthday }" name="userinfo.userinfoBirthday" />
											</c:if> <c:if
												test="${userinfos.userinfoBirthday==null||userinfos.userinfoBirthday==''}">
												<input type="text" id="txtName" class="date" value=" - - "
													name="userinfo.userinfoBirthday" />
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">血型</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoBloodtype==null||userinfos.userinfoBloodtype==''}">
												<select name="userinfo.userinfoBloodtype">
													<option selected="selected" value=""></option>
													<option value="A型">A型</option>
													<option value="B型">B型</option>
													<option value="AB型">AB型</option>
													<option value="O型">O型</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoBloodtype=='A型'}">
												<select name="userinfo.userinfoBloodtype">
													<option value=""></option>
													<option selected="selected" value="A型">A型</option>
													<option value="B型">B型</option>
													<option value="AB型">AB型</option>
													<option value="O型">O型</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoBloodtype=='B型'}">
												<select name="userinfo.userinfoBloodtype">
													<option value=""></option>
													<option value="A型">A型</option>
													<option selected="selected" value="B型">B型</option>
													<option value="AB型">AB型</option>
													<option value="O型">O型</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoBloodtype=='AB型'}">
												<select name="userinfo.userinfoBloodtype">
													<option value=""></option>
													<option value="A型">A型</option>
													<option value="B型">B型</option>
													<option selected="selected" value="AB型">AB型</option>
													<option value="O型">O型</option>
												</select>
											</c:if> <c:if test="${userinfos.userinfoBloodtype=='O型'}">
												<select name="userinfo.userinfoBloodtype">
													<option value=""></option>
													<option value="A型">A型</option>
													<option value="B型">B型</option>
													<option value="AB型">AB型</option>
													<option selected="selected" value="O型">O型</option>
												</select>
											</c:if>

										</td>
									</tr>
									<tr>
										<td class="tdleft">博客地址</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoBlogurl!=null}">
												<input type="text" value="${userinfos.userinfoBlogurl }"
													name="userinfo.userinfoBlogurl" style="width: 195px"
													onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9a-zA-Z_?#%&+.:=\/]+/,'');}).call(this);"
													onblur="this.v;" maxlength="20" />
											</c:if> <c:if test="${userinfos.userinfoBlogurl==null}">
												<input type="text" name="userinfo.userinfoBlogurl" value="http://"
													style="width: 195px"
													onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9a-zA-Z_?#%&+.:=\/]+/,'');}).call(this);"
													onblur="this.v;" maxlength="20" />
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">个性域名</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoRealname!=null}">
												<input type="text" value="${userinfos.userinfoRealname }"
													name="userinfo.userinfoRealname" style="width: 195px"
													maxlength="20" />
											</c:if> <c:if test="${userinfos.userinfoRealname==null}">
												<input type="text" name="userinfo.userinfoRealname"
													style="width: 195px" maxlength="20" />
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">简介</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoIntro!=null}">
												<textarea name="userinfo.userinfoIntro" cols="20" rows="1"
													style="resize:none" maxlength="50">${userinfos.userinfoIntro }</textarea>
											</c:if> <c:if test="${userinfos.userinfoIntro==null}">
												<textarea name="userinfo.userinfoIntro" cols="20" rows="1"
													style="resize:none" maxlength="50"></textarea>
											</c:if>

										</td>
									</tr>
								</table>

							</div>
						</form>

					</div>
					<script type="text/javascript">
						/* var addressValue=document.getElementById("uiAddress").value;
						var spilAddress=addressValue.split(" ");
						document.getElementById("province").value=spilAddress[0];
						document.getElementById("city").value=spilAddress[1]; */
						//alert(spilAddress[0]+"--"+spilAddress[1]);
						var list1 = new Array;
						var list2 = new Array;

						list1[list1.length] = "北京市";
						list1[list1.length] = "天津市";
						list1[list1.length] = "河北省";
						list1[list1.length] = "山西省";
						list1[list1.length] = "内蒙古";
						list1[list1.length] = "辽宁省";
						list1[list1.length] = "吉林省";
						list1[list1.length] = "黑龙江省";
						list1[list1.length] = "上海市";
						list1[list1.length] = "江苏省";
						list1[list1.length] = "浙江省";
						list1[list1.length] = "安徽省";
						list1[list1.length] = "福建省";
						list1[list1.length] = "江西省";
						list1[list1.length] = "山东省";
						list1[list1.length] = "河南省";
						list1[list1.length] = "湖北省";
						list1[list1.length] = "湖南省";
						list1[list1.length] = "广东省";
						list1[list1.length] = "广西自治区";
						list1[list1.length] = "海南省";
						list1[list1.length] = "重庆市";
						list1[list1.length] = "四川省";
						list1[list1.length] = "贵州省";
						list1[list1.length] = "云南省";
						list1[list1.length] = "西藏自治区";
						list1[list1.length] = "陕西省";
						list1[list1.length] = "甘肃省";
						list1[list1.length] = "青海省";
						list1[list1.length] = "宁夏回族自治区";
						list1[list1.length] = "新疆维吾尔自治区";
						list1[list1.length] = "香港特别行政区";
						list1[list1.length] = "澳门特别行政区";
						list1[list1.length] = "台湾省";
						list1[list1.length] = "其它";

						//list2[list2.length] = new Array("--请选择--");
						list2[list2.length] = new Array("北京", "东城区", "西城区",
								"崇文区", "宣武区", "朝阳区", "丰台区", "石景山区",
								" 海淀区（中关村）", "门头沟区", "房山区", "通州区", "顺义区",
								"昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县", "其他");
						list2[list2.length] = new Array("和平区", "河东区", "河西区",
								"南开区", "红桥区", "塘沽区", "汉沽区", "大港区", "西青区",
								"津南区", "武清区", "蓟县", "宁河县", "静海县", "其他");
						list2[list2.length] = new Array("石家庄市", "张家口市", "承德市",
								"秦皇岛市", "唐山市", "廊坊市", "衡水市", "沧州市", "邢台市",
								"邯郸市", "保定市", "其他");
						list2[list2.length] = new Array("太原市", "朔州市", "大同市",
								"长治市", "晋城市", "忻州市", "晋中市", "临汾市", "吕梁市",
								"运城市", "其他");
						list2[list2.length] = new Array("呼和浩特市", "包头市", "赤峰市",
								"呼伦贝尔市", "鄂尔多斯市", "乌兰察布市", "巴彦淖尔市", "兴安盟",
								"阿拉善盟", "锡林郭勒盟", "其他");
						list2[list2.length] = new Array("沈阳市", "朝阳市", "阜新市",
								"铁岭市", "抚顺市", "丹东市", "本溪市", "辽阳市", "鞍山市",
								"大连市", "营口市", "盘锦市", "锦州市", "葫芦岛市", "其他");
						list2[list2.length] = new Array("长春市", "白城市", "吉林市",
								"四平市", "辽源市", "通化市", "白山市", "延边朝鲜族自治州", "其他");
						list2[list2.length] = new Array("哈尔滨市", "七台河市", "黑河市",
								"大庆市", "齐齐哈尔市", "伊春市", "佳木斯市", "双鸭山市", "鸡西市",
								"大兴安岭地区(加格达奇)", "牡丹江", "鹤岗市", "绥化市　", "其他");
						list2[list2.length] = new Array("黄浦区", "卢湾区", "徐汇区",
								"长宁区", "静安区", "普陀区", "闸北区", "虹口区", "杨浦区",
								"闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区",
								"青浦区", "南汇区", "奉贤区", "崇明县", "其他");
						list2[list2.length] = new Array("南京市", "徐州市", "连云港市",
								"宿迁市", "淮安市", "盐城市", "扬州市", "泰州市", "南通市",
								"镇江市", "常州市", "无锡市", "苏州市", "其他");
						list2[list2.length] = new Array("杭州市", "湖州市", "嘉兴市",
								"舟山市", "宁波市", "绍兴市", "衢州市", "金华市", "台州市",
								"温州市", "丽水市", "其他");
						list2[list2.length] = new Array("合肥市", "宿州市", "淮北市",
								"亳州市", "阜阳市", "蚌埠市", "淮南市", "滁州市", "马鞍山市",
								"芜湖市", "铜陵市", "安庆市", "黄山市", "六安市", "巢湖市",
								"池州市", "宣城市", "其他");
						list2[list2.length] = new Array("福州市", "南平市", "莆田市",
								"三明市", "泉州市", "厦门市", "漳州市", "龙岩市", "宁德市", "其他");
						list2[list2.length] = new Array("南昌市", "九江市", "景德镇市",
								"鹰潭市", "新余市", "萍乡市", "赣州市", "上饶市", "抚州市",
								"宜春市", "吉安市", "其他");
						list2[list2.length] = new Array("济南市", "聊城市", "德州市",
								"东营市", "淄博市", "潍坊市", "烟台市", "威海市", "青岛市",
								"日照市", "临沂市", "枣庄市", "济宁市", "泰安市", "莱芜市",
								"滨州市", "菏泽市", "其他");
						list2[list2.length] = new Array("郑州市", "三门峡市", "洛阳市",
								"焦作市", "新乡市", "鹤壁市", "安阳市", "濮阳市", "开封市",
								"商丘市", "许昌市", "漯河市", "平顶山市", "南阳市", "信阳市",
								"周口市", "驻马店市", "其他");
						list2[list2.length] = new Array("武汉市", "十堰市", "襄樊市",
								"荆门市", "孝感市", "黄冈市", "鄂州市", "黄石市", "咸宁市",
								"荆州市", "宜昌市", "随州市", "恩施土家族苗族自治州", "仙桃市",
								"天门市", "潜江市", "神农架林区", "其他");
						list2[list2.length] = new Array("长沙市", "张家界市", "常德市",
								"益阳市", "岳阳市", "株洲市", "湘潭市", "衡阳市", "郴州市",
								"永州市", "邵阳市", "怀化市", "娄底市", "湘西土家族苗族自治州", "其他");
						list2[list2.length] = new Array("广州市", "清远市市", "韶关市",
								"河源市", "梅州市", "潮州市", "汕头市", "揭阳市", "汕尾市",
								" 惠州市", "东莞市", "深圳市", "珠海市", "中山市", "江门市",
								"佛山市", "肇庆市", "云浮市", "阳江市", "茂名市", "湛江市", " 其他");
						list2[list2.length] = new Array("南宁市", "桂林市", "柳州市",
								"梧州市", "贵港市", "玉林市", "钦州市", "北海市", "防城港市",
								"崇左市", "百色市", "河池市", "来宾市", "贺州市", "其他");
						list2[list2.length] = new Array("海口市", "三亚市", "其他");
						list2[list2.length] = new Array("渝中区", "大渡口区", "江北区",
								"沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区",
								"渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区",
								"合川市", "永川市", "江津市", "南川市", "綦江县", "潼南县",
								"铜梁县", "大足县", "璧山县", "垫江县", "武隆县", "丰都县",
								"城口县", "开县", "巫溪县", "巫山县", "奉节县", "云阳县", "忠县",
								"石柱土家族自治县", "彭水苗族土家族自治县", "酉阳土家族苗族自治县",
								"秀山土家族苗族自治县", "其他");
						list2[list2.length] = new Array("成都市", "广元市", "绵阳市",
								"德阳市", "南充市", "广安市", "遂宁市", "内江市", "乐山市",
								"自贡市", "泸州市", "宜宾市", "攀枝花市", "巴中市", "资阳市",
								"眉山市", "雅安", "阿坝藏族羌族自治州", "甘孜藏族自治州",
								"凉山彝族自治州县", "其他");
						list2[list2.length] = new Array("贵阳市", "六盘水市", "遵义市",
								"安顺市", "毕节地区", "铜仁地区", "黔东南苗族侗族自治州",
								"黔南布依族苗族自治州", "黔西南布依族苗族自治州", "其他");
						list2[list2.length] = new Array("昆明市", "曲靖市", "玉溪市",
								"保山市", "昭通市", "丽江市", "普洱市", "临沧市", "宁德市",
								"德宏傣族景颇族自治州", "怒江傈僳族自治州", "楚雄彝族自治州",
								"红河哈尼族彝族自治州", "文山壮族苗族自治州", "大理白族自治州",
								"迪庆藏族自治州", "西双版纳傣族自治州", "其他");
						list2[list2.length] = new Array("拉萨市", "那曲地区", "昌都地区",
								"林芝地区", "山南地区", "日喀则地区", "阿里地区", "其他");
						list2[list2.length] = new Array("西安市", "延安市", "铜川市",
								"渭南市", "咸阳市", "宝鸡市", "汉中市", "安康市", "商洛市", "其他");
						list2[list2.length] = new Array("兰州市 ", "嘉峪关市", "金昌市",
								"白银市", "天水市", "武威市", "酒泉市", "张掖市", "庆阳市",
								"平凉市", "定西市", "陇南市", "临夏回族自治州", "甘南藏族自治州", "其他");
						list2[list2.length] = new Array("西宁市", "海东地区",
								"海北藏族自治州", "黄南藏族自治州", "玉树藏族自治州", "海南藏族自治州",
								"果洛藏族自治州", "海西蒙古族藏族自治州", "其他");
						list2[list2.length] = new Array("银川市", "石嘴山市", "吴忠市",
								"固原市", "中卫市", "其他");
						list2[list2.length] = new Array("乌鲁木齐市", "克拉玛依市",
								"喀什地区", "阿克苏地区", "和田地区", "吐鲁番地区", "哈密地区",
								"塔城地区", "阿勒泰地区", "克孜勒苏柯尔克孜自治州", "博尔塔拉蒙古自治州",
								"昌吉回族自治州伊犁哈萨克自治州", "巴音郭楞蒙古自治州", "河子市", "阿拉尔市",
								"五家渠市", "图木舒克市", "其他");
						list2[list2.length] = new Array("香港", "其他");
						list2[list2.length] = new Array("澳门", "其他");
						list2[list2.length] = new Array("台湾", "其他");

						var ddlProvince = document.getElementById("province");
						var ddlCity = document.getElementById("city");
						for (var i = 0; i < list1.length; i++) {
							var option = document.createElement("option");
							option.appendChild(document
									.createTextNode(list1[i]));
							option.value = list1[i];
							ddlProvince.appendChild(option);

						}
						//city initialize
						var firstprovince = list2[0];
						for (var j = 0; j < firstprovince.length; j++) {

							var optioncity = document.createElement("option");
							optioncity.appendChild(document
									.createTextNode(firstprovince[j]));
							optioncity.value = firstprovince[j];
							ddlCity.appendChild(optioncity);
						}
						function indexof(obj, value) {
							var k = 0;
							for (; k < obj.length; k++) {
								if (obj[k] == value)
									return k;
							}
							return k;
						}
						function selectprovince(obj) {
							ddlCity.options.length = 0;//clear
							var index = indexof(list1, obj.value);
							var list2element = list2[index];
							for (var i = 0; i < list2element.length; i++) {
								var option = document.createElement("option");
								option.appendChild(document
										.createTextNode(list2element[i]));
								option.value = list2element[i];
								ddlCity.appendChild(option);
							}
						}
					</script>

					<div id="maindiv_blocklx">
						<div id="blocklx_tool">
							<div class="tool_text">联系信息</div>
							<div class="tool_img"></div>
							<div class="tool_btn_lx"></div>
						</div>
						<div id="blocklx_info">
							<table>

								<tr>
									<td class="tdleft">邮箱</td>
									<td class="tdright"><c:if
											test="${userinfos.userinfoEmail!=null&&userinfos.userinfoEmail!=''}">
											&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoEmail}
										</c:if> <c:if test="${userinfos.userinfoEmail==null||userinfos.userinfoEmail==''}">
											<div class="editico"></div>
											<a href="javascript:void(0);">马上填写</a>你的邮箱信息
										</c:if></td>
								</tr>
								<tr>
									<td class="tdleft">QQ</td>
									<td class="tdright"><c:if
											test="${userinfos.userinfoQqnumber!=null&&userinfos.userinfoQqnumber!=''}">
											&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoQqnumber}
										</c:if> <c:if
											test="${userinfos.userinfoQqnumber==null||userinfos.userinfoQqnumber==''}">
											<div class="editico"></div>
											<a href="javascript:void(0);">马上填写</a>你的QQ信息
										</c:if></td>
								</tr>
								<tr>
									<td class="tdleft">MSN</td>
									<td class="tdright"><c:if
											test="${userinfos.userinfoMessenger!=null&&userinfos.userinfoMessenger!=''}">
											&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoMessenger}
										</c:if> <c:if
											test="${userinfos.userinfoMessenger==null||userinfos.userinfoMessenger==''}">
											<div class="editico"></div>
											<a href="javascript:void(0);">马上填写</a>你的MSN信息
										</c:if></td>
								</tr>
							</table>
						</div>
					</div>

					<!-- 联系信息编辑状态 -->
					<div id="maindiv_blocklx_edit">
						<form
							action="${pageContext.request.contextPath }/UserinfoAction_updateUserInfo.action?updateflag=lxinfo"
							method="post">
							<div id="blocklx_tool">
								<div class="tool_text">联系信息</div>
								<div class="tool_img"></div>
								<div class="tool_btn_lx">
									<input type="submit" value=" " id="savebtn_lx">
								</div>
							</div>
							<div id="blocklx_info">
								<table>

									<tr>
										<td class="tdleft">邮箱</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoEmail!=null}">
												<input type="text" value="${userinfos.userinfoEmail }"
													name="userinfo.userinfoEmail" style="width: 195px"
													onkeyup="(this.e=function(){this.value=this.value.replace(/[^\_0-9a-zA-Z@.]+/,'');}).call(this);"
													onblur="this.e;" maxlength="20" />
											</c:if> <c:if test="${userinfos.userinfoEmail==null}">
												<input type="text" name="userinfo.userinfoEmail" style="width:195px"
													onkeyup="(this.e=function(){this.value=this.value.replace(/[^\_0-9a-zA-Z@.]+/,'');}).call(this);"
													onblur="this.e;" maxlength="20" />
												<span>请填写您的常用邮箱</span>
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">QQ</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoQqnumber!=null}">
												<input type="text" value="${userinfos.userinfoQqnumber }"
													name="userinfo.userinfoQqnumber" style="width: 195px"
													onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this);"
													onblur="this.v;" maxlength="12" />
											</c:if> <c:if test="${userinfos.userinfoQqnumber==null}">
												<input type="text" name="userinfo.userinfoQqnumber"
													style="width: 195px"
													onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this);"
													onblur="this.v;" maxlength="12" />
												<span>QQ号码只能为5~12位数字</span>
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="tdleft">MSN</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoMessenger!=null}">
												<input type="text" value="${userinfos.userinfoMessenger }"
													name="userinfo.userinfoMessenger" style="width: 195px"
													onkeyup="(this.m=function(){this.value=this.value.replace(/[^\_0-9a-zA-Z@.]+/,'');}).call(this);"
													onblur="this.m;" maxlength="20" />
											</c:if> <c:if test="${userinfos.userinfoMessenger==null}">
												<input type="text" name="userinfo.userinfoMessenger"
													style="width: 195px"
													onkeyup="(this.m=function(){this.value=this.value.replace(/[^\_0-9a-zA-Z@.]+/,'');}).call(this);"
													onblur="this.m;" maxlength="20" />
												<span>请输入您的MSN账号</span>
											</c:if>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>



					<div id="maindiv_blockzy">
						<div id="blockzy_tool">
							<div class="tool_text">职业信息</div>
							<div class="tool_img"></div>
							<div class="tool_btn_zy"></div>
						</div>
						<div id="blockzy_info">

							<c:if
								test="${userinfos.userinfoProfession!=null&&userinfos.userinfoProfession!=''}">
								<table>
									<tr>
										<td class="tdleft">职业</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;${userinfos.userinfoProfession }</td>
									</tr>
								</table>
							</c:if>
							<c:if
								test="${userinfos.userinfoProfession==null||userinfos.userinfoProfession==''}">
								&nbsp;&nbsp;&nbsp;&nbsp;<div class="tdright">
									<div class="editico"></div>
									<a href="javascript:void(0);">马上填写</a>你的职业信息，让他人更好的了解你，与更多的同事微博相遇！
								</div>
							</c:if>
						</div>
					</div>

					<!-- 职业信息编辑状态 -->
					<div id="maindiv_blockzy_edit">
						<form action="${pageContext.request.contextPath }/UserinfoAction_updateUserInfo.action?updateflag=zyinfo" method="post">
							<div id="blockzy_tool">
								<div class="tool_text">职业信息</div>
								<div class="tool_img"></div>
								<div class="tool_btn_zy">
									<input type="submit" value=" " id="savebtn_zy">
								</div>
							</div>
							<div id="blockzy_info">
								<table>
									<tr>
										<td class="tdleft">职业</td>
										<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp; <c:if
												test="${userinfos.userinfoProfession!=null}">
												<input type="text" value="${userinfos.userinfoProfession}"
													name="userinfo.userinfoProfession" style="width: 195px"
													maxlength="50" />
											</c:if> <c:if test="${userinfos.userinfoProfession==null}">
												<input type="text" name="userinfo.userinfoProfession"
													style="width: 195px" maxlength="10" />
											</c:if>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>

					<div id="maindiv_blockjy">
						<div id="blockjy_tool">
							<div class="tool_text">教育信息</div>
							<div class="tool_img"></div>
							<div class="tool_btn_jy"></div>
						</div>
						<div id="blockjy_info">
							<table>
								<tr>
									<td class="tdleft">大学</td>
									<td class="tdright">&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="javascript:void(0);">盐城工学院</a></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- 教育信息编辑状态 -->
					<div id="maindiv_blockjy_edit">
						<div id="blockjy_tool">
							<div class="tool_text">教育信息</div>
							<div class="tool_img"></div>
							<div class="tool_btn_jy">
								<input type="submit" value=" " id="savebtn_jy">
							</div>
						</div>
						<div id="blockjy_info">
							<table>
								<tr>
									<td class="tdleft">大学</td>
									<td class="tdright">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="http://www.ycit.cn">盐城工学院</a>
									</td>
								</tr>
							</table>
						</div>
					</div>


					<div id="maindiv_blockbq">
						<div id="blockbq_tool">
							<div class="tool_text">标签信息</div>
							<div class="tool_img"></div>
							<div class="tool_btn_bq"></div>
						</div>
						<div id="blockbq_info">

							<c:if test="${userinfos.userinfoLabel!=null&&userinfos.userinfoLabel!=''}">
								<table>
									<tr>
										<td class="tdleft">标签</td>
										<td class="tdright">
											<div class="tdright_bq">${userinfos.userinfoLabel}</div>
										</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${userinfos.userinfoLabel==null||userinfos.userinfoLabel==''}">
								&nbsp;&nbsp;&nbsp;&nbsp;<div class="tdright">
									<div class="editico"></div>
									<a href="javascript:void(0);">马上填写</a>自己的标签，让大家全方位了解你。
								</div>
							</c:if>
						</div>
					</div>
					<!-- 标签信息编辑状态 -->
					<div id="maindiv_blockbq_edit">
						<form
							action="${pageContext.request.contextPath }/UserinfoAction_updateUserInfo.action?updateflag=bqinfo"
							method="post">
							<div id="blockbq_tool">
								<div class="tool_text">标签信息</div>
								<div class="tool_img"></div>
								<div class="tool_btn_bq">
									<input type="submit" value=" " id="savebtn_bq">
								</div>
							</div>
							<div id="blockbq_info">
								<table>
									<tr>
										<td class="tdleft">标签</td>
										<td class="tdright">
											<div class="tdright_bq">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<c:if test="${userinfos.userinfoLabel!=null}">
													<input type="text" value="${userinfos.userinfoLabel }"
														name="userinfo.userinfoLabel" style="width: 195px" maxlength="50" />
												</c:if>
												<c:if test="${userinfos.userinfoLabel==null}">
													<input type="text" name="userinfo.userinfoLabel"
														style="width: 195px" maxlength="50" />
												</c:if>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
					</div>
				</div>
			
			<!-- 粉丝 -->
			<div id="navigation_fance_showdiv">
				<div id="fance_showdiv_maindiv"></div>
			</div>

			<!-- 照片 -->
			<div id="navigation_photos_showdiv">
				<div id="photos_showdiv_maindiv"></div>
			</div>
		
		</div>
	</div>
	
	<!-- /底部 -->
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
					<td style="padding-bottom:15px"><a href="javascript:void(0);">媒体</a>&nbsp;<a
						href="javascript:void(0);">企业</a>&nbsp;<a href="javascript:void(0);">政府</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">热门微博</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">投票</a>&nbsp;<a
						href="javascript:void(0);">微游戏</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">Android客户端</a></td>
					<td style="padding-bottom:15px"><a href="javascript:void(0);">微博标识</a>&nbsp;<a
						href="javascript:void(0);">广告服务</a></td>
				</tr>
			</table>

			<table id="bottom_table_b">
				<tr>
					<td><a href="javascript:void(0);"><span class="ico"
							style="background-position: -350px -127px"></span>微博帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">意见反馈</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">开放平台</a> &nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">微博招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">新浪网导航</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">社区管理中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="javascript:void(0);">微博社区公约</a></td>
				</tr>
				<tr>
					<td>客服电话：4000&nbsp;960&nbsp;960（个人）&nbsp;4000&nbsp;980&nbsp;980（企业）&nbsp;（按当地市话标准计算）<span
						style="float:right;margin-top:-8px;"><select><option>中文(简体)</option></select></span></td>
				</tr>
				<tr>
					<td style="width:925px;"><span style="color:#888">北京微梦创科网络技术有限公司</span>&nbsp;<a
						href="javascript:void(0);">京网文[2011]0398-130号</a>&nbsp;<a
						href="javascript:void(0);">京ICP证100780号</a><span
						style="font-size:11px;float:right;color:#888;font-family: '微软雅黑'">Copyright&nbsp;&copy;&nbsp;1996-2013&nbsp;SINA</span></td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>
