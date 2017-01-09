<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <c:if test="${user == null}">
    	<script type="text/javascript">
    		window.location.href="./frontstage/login.jsp";
    	</script>
    </c:if>
    <title>我的首页 新浪微博-随时随地分享身边的新鲜事儿</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="我的首页 新浪微博-随时随地分享身边的新鲜事儿">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="./scripts/jqueryui/jquery-ui-1.10.3.custom.js"></script>
	<script type="text/javascript" src="./scripts/json/json2.js"></script>
	<script type="text/javascript" src="./scripts/json/json_parse.js"></script>
	<script type="text/javascript" src="./scripts/frontstage/index/index.js"></script>
	<script type="text/javascript" src="./scripts/frontstage/top_bottomdiv_init.js"></script>
	<link rel="stylesheet" type="text/css" href="./styles/frontstage/index/index_style.css">
	<link rel="stylesheet" type="text/css" href="./styles/frontstage/top_bottomdiv_style.css">
	<link rel="stylesheet" type="text/css" href="./styles/jqueryui/jquery-ui.min.css">
  </head>
  
  <body>
    <!-- 头部 -->
    <div id="top_bg">
    	<div id="top_div">
    		<div id="top_content">
    			<div id="top_logo" style="float:left">
    				<a href="${pageContext.request.contextPath }/index.jsp">
    					<span id="logo_img"></span>
    				</a>
    			</div>
    			<div id="top_left" style="float:left">
    				<div id="bar_index" style="float:left" class="topbar_nowpage">
    					<a href="${pageContext.request.contextPath }/index.jsp">
    						<span>首页</span>
    					</a>
    				</div>
    				<div id="bar_app" style="float:left">
    					<a href="${pageContext.request.contextPath }/index.jsp">
    						<span>应用</span>
    					</a>
    					<div id="app_show"></div>
    				</div>
    				<div id="bar_weiba" style="float:left">
    					<a href="${pageContext.request.contextPath }/index.jsp">
    						<span>微吧</span>
    					</a>
    					<div id="weiba_show"></div>
    				</div>
    				<div id="bar_game" style="float:left">
    					<a href="${pageContext.request.contextPath }/index.jsp">
    						<span>游戏</span>
    					</a>
    					<div id="game_show"></div>
    				</div>
    			</div>
    			<div id="top_search" style="float:left">
    				<input id="search_input" type="text" onchange="searchUsers()">
    				<a id="searchA" title="搜索按钮">
    					<span id="search_btn"></span>
    				</a>
    			</div>
    			<div id="top_right" style="float:right">
    				<div id="user_vip" style="float:right" onclick="logout()">
    				<!-- <a href="${pageContext.request.contextPath }/index.jsp"> -->
    					<a href="javascript:void(0);" id="logout" >
    						<span class="right_bar"><span class="ico"></span></span>
    					</a>
    					<div id="vip_show"></div>
    				</div>
    				<div id="user_setting" style="float:right">
    					<a href="${pageContext.request.contextPath }/frontstage/setter/setUser.jsp">
    						<span class="right_bar"><span class="ico"></span></span>
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
    						<span class="right_bar"><span class="ico"></span></span>
    					</a>
    					<div id="weibo_show"></div>
    				</div>
    				<div id="user_login" style="float:right">
    					<a href="${pageContext.request.contextPath }/frontstage/index.jsp">
    						<span id="user_name"></span>
    					</a>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    <!-- /头部 -->
    
    <div id="content_main">
    	<div id="content_div">
    		<div id="content_div_left">
    			<div class="left_menu">
    				<a href="${pageContext.request.contextPath }/index.jsp">
    					<span id="left_menu_index" class="left_menu_span">
    						<span id="left_icon_index" class="left_icon"></span>
    						<span class="left_mf">首页</span>
    					</span>
    				</a>
    			</div>
    			<div class="left_menu">
    				<a href="${pageContext.request.contextPath }/index.jsp">
    					<span id="left_menu_message" class="left_menu_span">
    						<span id="left_icon_message" class="left_icon"></span>
    						<span class="left_mf">消息</span>
    					</span>
    				</a>
    			</div>
    			<div class="left_menu">
    				<a href="${pageContext.request.contextPath }/index.jsp">
    					<span id="left_menu_collection" class="left_menu_span">
    						<span id="left_icon_collection" class="left_icon"></span>
    						<span class="left_mf">收藏</span>
    					</span>
    				</a>
    			</div>
    			<div class="left_menu">
    				<a href="${pageContext.request.contextPath }/index.jsp">
    					<span id="left_menu_sendtome" class="left_menu_span">
    						<span id="left_icon_sendtome" class="left_icon"></span>
    						<span class="left_mf">发给我的</span>
    					</span>
    				</a>
    			</div>
    			<div id="left_menu_cut"></div>
    			<div class="left_menu">
    				<a href="${pageContext.request.contextPath }/index.jsp">
    					<span id="left_menu_friend" class="left_menu_span">
    						<span id="left_icon_friend" class="left_icon"></span>
    						<span class="left_mf">密友圈</span>
    					</span>
    				</a>
    			</div>
    			<div id="left_grouping">
    				<div id="left_grouping_cut" class="left_menu_cut">
    					<span class="left_menu_cut_text">分组</span>
    					<span class="left_menu_hidebtn"></span>
    				</div>
    				<div id="left_grouping_menu">
    					<div class="left_menu">
    						<a href="${pageContext.request.contextPath }/index.jsp">
    							<span class="left_menu_span">
    								<span class="left_icon"></span>
    								<span class="left_mf">特别关注</span>
    								<span class="grouping_setting"></span>
    							</span>
    						</a>
    					</div>
    					<div id="left_menu">
    						<a href="${pageContext.request.contextPath }/index.jsp">
    							<span class="left_menu_span">
    								<span class="left_icon"></span>
    								<span class="left_mf">名人明星</span>
    								<span class="grouping_setting"></span>
    							</span>
    						</a>
    					</div>
    					<div class="left_menu">
    						<a href="${pageContext.request.contextPath }/index.jsp">
    							<span class="left_menu_span">
    								<span class="left_icon"></span>
    								<span class="left_mf">同事</span>
    								<span class="grouping_setting"></span>
    							</span>
    						</a>
    					</div>
    					<div class="left_menu">
    						<a href="${pageContext.request.contextPath }/index.jsp">
    							<span class="left_menu_span">
    								<span class="left_icon"></span>
    								<span class="left_mf">同学</span>
    								<span class="grouping_setting"></span>
    							</span>
    						</a>
    					</div>
    					<div class="left_menu">
    						<a href="${pageContext.request.contextPath }/index.jsp">
    							<span class="left_menu_span">
    								<span class="left_icon"></span>
    								<span class="left_mf">悄悄关注</span>
    								<span class="grouping_setting"></span>
    							</span>
    						</a>
    					</div>
    					<a href="javascript:void(0)" style="text-decoration:none;font-size:12px;margin-left:20px">创建新分组</a>
    				</div>
    			</div>
    		</div>
    	
    	<div id="content_div_center">
    		<div id="center_weibo">
    			<div>
    				<span id="center_title"></span>
    				<span id="center_hot">发言请遵守社区公约</span>
    				<span id="center_replace">还可以输入</span>
    				<span id="center_weibo_wn">字</span>
    			</div>
    			<div>
    				<textarea id="center_weibo_content" title="微博输入框"></textarea>
    				<span id="center_weibo_corner"></span>
    			</div>
    			<div id="center_send">
    				<a class="center_face_a" href="javascript:void(0);" title="表情">
    					<span class="center_face"></span>
    				</a>
    				<a id="center_uppic_a" href="javascript:void(0);" title="图片上传">
    					<span id="center_uppic"></span>
    				</a>
    				<a id="center_mood_a" href="javascript:void(0);" title="心情">
    					<span id="center_mood"></span>
    				</a>
    				<span id="send_weibo_trends"></span>
    				<a href="javascript:void(0);" id="send_weibo">
    					<span id="center_sendweibo"></span>
    				</a>
    			</div>
    			<div id="send_weibo_success">
    				<div id="success_icon"></div>
    				<div id="success_text">发布成功</div>
    			</div>
    			<div id="send_weibo_error"></div>
    		</div>
    		<div id="center_weibo_trends">
    			<div id="chose_wot">
    				<a href="javascript:void(0);" id="chose_weibo"><span>微博</span></a>
    				<a href="javascript:void(0);" id="chose_trends"><span>动态</span></a>
    			</div>
    			<span id="chose_bg"></span>
    			<span id="search_weibo"></span>
    			<span id="weibo_classes">
    				<a href="javascript:void(0);"><span>全部</span></a>
    				<a href="javascript:void(0);"><span>原创</span></a>
    				<a href="javascript:void(0);"><span>图片</span></a>
    				<a href="javascript:void(0);"><span>视频</span></a>
    				<a href="javascript:void(0);"><span>音乐</span></a>
    			</span>
    		</div>
    		<div id="weibo_content">
    			<a href="javascript:void(0);" id="weibo_new_receive_a">
    				<span id="weibo_new_receive">有<span id="weibo_new_number"></span>条新微博，点击查看</span>
    			</a>
    		</div>
    	</div>
    	
    	<div id="content_div_right">
    		<a href="javascript:void(0);" title="模板设置">
    			<span id="right_template"></span>
    		</a>
    		<div id="right_personinfo">
    			<div id="right_headphoto">
    				<c:if test="${headPic.picturesUrl != null }">
    					<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action" style="border:0">
    						<img src="${pageContext.request.contextPath }/uploadImages${headPic.picturesUrl}" width="100%" style="border:0">
    					</a>
    				</c:if>
    				<c:if test="${headPic.picturesUrl == null }">
    					<c:if test="${userinfos==null }">
    						<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action" style="border:0">
    							<img src="${pageContext.request.contextPath }/images/1.gif" width="100%" style="border:0"/>
    						</a>
    					</c:if>
    					<c:if test="${userinfos.userinfoSex=='女' }">
    						<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action" style="border:0">
    							<img src="${pageContext.request.contextPath }/images/0.gif" width="100%" height="100%" style="border:0"/>
    						</a>
    					</c:if>
    					<c:if test="${userinfos.userinfoSex=='男' }">
    						<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action" style="border:0">
    							<img src="${pageContext.request.contextPath }/images/1.gif" width="100%" height="100%" style="border:0"/>
    						</a>
    					</c:if>
    				</c:if>
    			</div>
    			<div id="right_userdiv">
    				<a href="${pageContext.request.contextPath }/UserinfoAction_getUsersInfo.action" id="right_user_a">
    					<span id="right_user">${user.usersNikename}</span>
    				</a>
    			</div>
    			<div id="right_level"></div>
    			<div style="clear:both;">
    				<div id="right_attention">
    					<a href="javascript:void(0);" id="right_user_attention_a">
    						<span id="right_user_attention" class="right_text1">0</span>
    						<span class="right_text2">关注</span>
    					</a>
    				</div>
    				<div id="right_fans">
    					<a href="javascript:void(0);" id="right_user_fans_a">
    						<span id="right_user_fans" class="right_text1">0</span>
    						<span class="right_text2">粉丝</span>
    					</a>
    				</div>
    				<div id="right_weibo">
    					<a href="javascript:void(0);" id="right_user_weibo_a">
    						<span id="right_user_weibo" class="right_text1">0</span>
    						<span class="right_text2">微博</span>
    					</a>
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
    				<td style="width:185px;padding-bottom:7px;">我找感兴趣的人</td>
    				<td style="width:185px;">精彩内容</td>
    				<td style="width:185px;">热门应用</td>
    				<td style="width:185px;">手机玩微博</td>
    				<td style="width:185px">认证&amp;合作</td>
    			</tr>
    			<tr>
    				<td><a href="javascript:void(0);">名人堂</a>&nbsp;<a href="javascript:void(0);">微博会员</a></td>
    				<td><a href="javascript:void(0);">微话题</a>&nbsp;<a href="javascript:void(0);">风云榜</a></td>
    				<td><a href="javascript:void(0);">微吧</a>&nbsp;<a href="javascript:void(0);">微公益</a></td>
    				<td><a href="javascript:void(0);">WAP版</a>&nbsp;<a href="javascript:void(0);">短彩发微博</a></td>
    				<td><a href="javascript:void(0);">申请认证</a>&nbsp;<a href="javascript:void(0);">开放平台</a></td>
    			</tr>
    			<tr>
    				<td><a href="javascript:void(0);">微博达人</a></td>
    				<td><a href="javascript:void(0);">微访谈</a></td>
    				<td>
    					<a href="javascript:void(0);">相册</a>
    					<a href="javascript:void(0)">微音乐</a>
    				</td>
    				<td>
    					<a href="javascript:void(0);">iPhone客户端</a>&nbsp;
    					<a href="javascript:void(0);">iPad客户端</a>
    				</td>
    				<td>
    					<a href="javascript:void(0);">企业微博</a>&nbsp;
    					<a href="javascript:void(0);">连接网站</a>
    				</td>
    			</tr>
    			<tr>
    				<td style="padding-bottom:15px">
    					<a href="javascript:void(0);">媒体</a>&nbsp;
    					<a href="javascript:void(0);">企业</a>&nbsp;
    					<a href="javascript:void(0);">政府</a>
    				</td>
    				<td style="padding-bottom:15px">
    					<a href="javascript:void(0);">热门微博</a>
    				</td>
    				<td style="padding-bottom:15px">
    					<a href="javascript:void(0);">投票</a>&nbsp;
    					<a href="javascript:void(0);">微游戏</a>
    				</td>
    				<td style="padding-bottom:15px">
    					<a href="javascript:void(0);">Android客户端</a>
    				</td>
    				<td style="padding-bottom:15px">
    					<a href="javascript:void(0);">微博标识</a>&nbsp;
    					<a href="javascript:void(0);">广告服务</a>
    				</td>
    			</tr>
    		</table>
    		
    		<table id="bottom_table_b">
    			<tr>
    				<td>
    					<a href="javascript:void(0);"><span class="ico" style="background-position:-350px -127px"></span>微博帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0);">意见反馈</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0);">开放平台</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0);">微博招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0);">新浪网导航</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0);">社区管理中心</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="javascript:void(0);">微博社区公约</a>&nbsp;&nbsp;&nbsp;&nbsp;
    				</td>
    			</tr>
    			<tr>
    				<td>客服电话：4000&nbsp;123&nbsp;123（个人）&nbsp;4000&nbsp;456&nbsp;456（企业）&nbsp;（按当地市话标准计算）
    					<span style="float:right;margin-top:-8px;">
    						<select><option>中文（简体）</option></select>
    					</span>
    				</td>
    			</tr>
    			<tr>
    				<td style="width:925px;">
    					<span style="color:#888">盐城工学院信息工程学院</span>&nbsp;
    					<a href="javascript:void(0);">京网文[2011]0398-130号</a>&nbsp;
    					<a href="javascript:void(0);">京ICP证100780号</a>
    					<span style="font-size:11px;float:right;color:#888;font-family:'微软雅黑'">Copyright&nbsp;&nbsp;&nbsp;1996-2013&nbsp;SINA</span>
    				</td>
    			</tr>
    		</table>
    	</div>
    </div>
  </body>
</html>
