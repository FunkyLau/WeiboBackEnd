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
    
    <title>My JSP 'baseUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/frontstage/setter/baseUser.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jeasyui/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/frontstage/setter/baseUser.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/frontstage/setter/area.js"></script>
	<script type="text/javascript">
		$(function(){
			var area = new Area();
			area.init("frontstage/setter/xml/area.xml","all");
			//初始化省份下拉列表
			$("#province").html(
				"<option>请选择</option>"+area.getNextOption("0",null)
			);
			//监听各个下拉列表
			$("select").change(
				function(){
					var value = $(this).val();
					var id = $(this).attr("id");
					var options = "<option>请选择</option>"+area.getNextOption(value,null);
					if(id == "province"){
						$("#city").html(options);
					}else if(id == "city"){
						$("#country").html(options);
					}
				});
			
		});
		
	</script>
	
  </head>
  
  <body>
    <div class="head">
    	<b>基本信息</b><span class="grey1">（<em class="em">*</em>必须填写项）</span>
    	<img src="${pageContext.request.contextPath }/images/left_nav_border1.png" class="hrline"/>
    	<!-- *****************problem here****************** -->
    	<p class="gray1">以下信息将显示在<a href="http://weibo.com/2659241503/info">个人资料页</a>方便大家了解你。</p>
    </div>
    <div class="center">
    	<form id="addUser">
    		<table style="height:200">
    			<tr>
    				<td>登录名：</td>
    				<td colspan="2"><input type="text" name="uemail" id="uemail" value="${user.usersEmail }" readonly="readonly">
    					&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/frontstage/setter/passwordUser.jsp">修改密码</a>
    				</td>
    				<td><span class="s">&nbsp;&nbsp;<img src="${pageContext.request.contextPath }/images/icon.gif">&nbsp;选择资料的可见权限</span></td>
    			</tr>
    			<tr>
    				<td>昵&nbsp;&nbsp;称&nbsp;<em class="em">*</em>&nbsp;:</td>
    				<td class="tfont"><input type="text" name="nikename" id="nickname" value="${user.usersNikename }"class="tgray1"></td>
    			</tr> 
    			<tr>
    				<td>真实姓名：</td>
    				<td><input type="text" name="trueName" id="trueName" value="${userinfos.userinfoTruename }" class="tgray1"></td>
    				<td>
    					<select class="tgray2">
    						<option value="2">所有人可见</option>
    						<option value="1">我关注的人可见</option>
    						<option value="0" selected>仅自己可见</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<td>所在地&nbsp;<em class="em">*&nbsp;：</em></td>
    				<td>
    					<select id="province" class="tgray">
    						<option>请选择</option>
    					</select>
    					<select id="city" class="tgray">
    						<option>请选择</option>
    					</select>
    					<select id="country" class="tgray">
    						<option>请选择</option>
    					</select>
    				</td>
    			</tr>
    			<tr id="sex">
					<td>性&nbsp;&nbsp;别&nbsp;<em class="em">*</em>&nbsp;:</td>
					<td><input type="radio" name="sex" value="男"
						<c:if test="${userinfos.userinfoSex=='男' }">checked="checked"</c:if> />男&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="女"
						<c:if test="${userinfos.userinfoSex=='女' }">checked="checked"</c:if> />女
						&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="保密"
						<c:if test="${userinfos.userinfoSex=='保密' }">checked="checked"</c:if> />保密</td>
				</tr>
				<tr id="sexUal">
					<td>性取向:</td>
					<td><input type="radio" name="sexUal" value="男"
						<c:if test="${userinfos.userinfoSexual=='男' }">checked="checked"</c:if> />男&nbsp;&nbsp;&nbsp;<input
						type="radio" name="sexUal" value="女"
						<c:if test="${userinfos.userinfoSexual=='女' }">checked="checked"</c:if> />女
						&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="保密"
						<c:if test="${userinfos.userinfoSexual=='保密' }">checked="checked"</c:if> />保密</td>
					<td><select class="tgray2">
							<option value="2" selected>所有人可见</option>
							<option value="1">我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>感情状况:</td>
					<td>
						<select name="feeling" id="feeling" class="tgray">
							<option value=""></option>
							<option value="1">单身</option>
							<option value="2" selected="selected">求交往</option>
							<option value="3">暗恋中</option>
							<option value="4">暧昧中</option>
							<option value="5">恋爱中</option>
							<option value="6">订婚</option>
							<option value="7">已婚</option>
							<option value="8">分居</option>
							<option value="9">离异</option>
							<option value="10">丧偶</option>
						</select>
					</td>
					<td><select class="tgray2">
							<option value="2">所有人可见</option>
							<option value="1">我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>生日:</td>
					<td><select name="birthday_y" class="tgray" id="birthday_y">
							<option value="1"></option>
							<option label="2013" value="2013">2013</option>
							<option label="2012" value="2012">2012</option>
							<option label="2011" value="2011">2011</option>
							<option label="2010" value="2010">2010</option>
							<option label="2009" value="2009">2009</option>
							<option label="2008" value="2008">2008</option>
							<option label="2007" value="2007">2007</option>
							<option label="2006" value="2006">2006</option>
							<option label="2005" value="2005">2005</option>
							<option label="2004" value="2004">2004</option>
							<option label="2003" value="2003">2003</option>
							<option label="2002" value="2002">2002</option>
							<option label="2001" value="2001">2001</option>
							<option label="2000" value="2000">2000</option>
							<option label="1999" value="1999">1999</option>
							<option label="1998" value="1998">1998</option>
							<option label="1997" value="1997">1997</option>
							<option label="1996" value="1996">1996</option>
							<option label="1995" value="1995">1995</option>
							<option label="1994" value="1994">1994</option>
							<option label="1993" value="1993">1993</option>
							<option label="1992" value="1992" selected="selected">1992</option>
							<option label="1991" value="1991">1991</option>
							<option label="1990" value="1990">1990</option>
							<option label="1989" value="1989">1989</option>
							<option label="1988" value="1988">1988</option>
							<option label="1987" value="1987">1987</option>
							<option label="1986" value="1986">1986</option>
							<option label="1985" value="1985">1985</option>
							<option label="1984" value="1984">1984</option>
							<option label="1983" value="1983">1983</option>
							<option label="1982" value="1982">1982</option>
							<option label="1981" value="1981">1981</option>
							<option label="1980" value="1980">1980</option>
							<option label="1979" value="1979">1979</option>
							<option label="1978" value="1978">1978</option>
							<option label="1977" value="1977">1977</option>
							<option label="1976" value="1976">1976</option>
							<option label="1975" value="1975">1975</option>
							<option label="1974" value="1974">1974</option>
							<option label="1973" value="1973">1973</option>
							<option label="1972" value="1972">1972</option>
							<option label="1971" value="1971">1971</option>
							<option label="1970" value="1970">1970</option>
							<option label="1969" value="1969">1969</option>
							<option label="1968" value="1968">1968</option>
							<option label="1967" value="1967">1967</option>
							<option label="1966" value="1966">1966</option>
							<option label="1965" value="1965">1965</option>
							<option label="1964" value="1964">1964</option>
							<option label="1963" value="1963">1963</option>
							<option label="1962" value="1962">1962</option>
							<option label="1961" value="1961">1961</option>
							<option label="1960" value="1960">1960</option>
							<option label="1959" value="1959">1959</option>
							<option label="1958" value="1958">1958</option>
							<option label="1957" value="1957">1957</option>
							<option label="1956" value="1956">1956</option>
							<option label="1955" value="1955">1955</option>
							<option label="1954" value="1954">1954</option>
							<option label="1953" value="1953">1953</option>
							<option label="1952" value="1952">1952</option>
							<option label="1951" value="1951">1951</option>
							<option label="1950" value="1950">1950</option>
							<option label="1949" value="1949">1949</option>
							<option label="1948" value="1948">1948</option>
							<option label="1947" value="1947">1947</option>
							<option label="1946" value="1946">1946</option>
							<option label="1945" value="1945">1945</option>
							<option label="1944" value="1944">1944</option>
							<option label="1943" value="1943">1943</option>
							<option label="1942" value="1942">1942</option>
							<option label="1941" value="1941">1941</option>
							<option label="1940" value="1940">1940</option>
							<option label="1939" value="1939">1939</option>
							<option label="1938" value="1938">1938</option>
							<option label="1937" value="1937">1937</option>
							<option label="1936" value="1936">1936</option>
							<option label="1935" value="1935">1935</option>
							<option label="1934" value="1934">1934</option>
							<option label="1933" value="1933">1933</option>
							<option label="1932" value="1932">1932</option>
							<option label="1931" value="1931">1931</option>
							<option label="1930" value="1930">1930</option>
							<option label="1929" value="1929">1929</option>
							<option label="1928" value="1928">1928</option>
							<option label="1927" value="1927">1927</option>
							<option label="1926" value="1926">1926</option>
							<option label="1925" value="1925">1925</option>
							<option label="1924" value="1924">1924</option>
							<option label="1923" value="1923">1923</option>
							<option label="1922" value="1922">1922</option>
							<option label="1921" value="1921">1921</option>
							<option label="1920" value="1920">1920</option>
							<option label="1919" value="1919">1919</option>
							<option label="1918" value="1918">1918</option>
							<option label="1917" value="1917">1917</option>
							<option label="1916" value="1916">1916</option>
							<option label="1915" value="1915">1915</option>
							<option label="1914" value="1914">1914</option>
							<option label="1913" value="1913">1913</option>
							<option label="1912" value="1912">1912</option>
							<option label="1911" value="1911">1911</option>
							<option label="1910" value="1910">1910</option>
							<option label="1909" value="1909">1909</option>
							<option label="1908" value="1908">1908</option>
							<option label="1907" value="1907">1907</option>
							<option label="1906" value="1906">1906</option>
							<option label="1905" value="1905">1905</option>
							<option label="1904" value="1904">1904</option>
							<option label="1903" value="1903">1903</option>
							<option label="1902" value="1902">1902</option>
							<option label="1901" value="1901">1901</option>
							<option label="1900" value="1900">1900</option>
					</select><em>年</em> <select name="birthday_m" id="birthday_m" class="tgray">
							<option selected value="0"></option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07" selected="selected">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <em>月</em> <select name="birthday_d" id="birthday_d" class="tgray">
							<option selected value="0"></option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19" selected="selected">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select><em>日</em></td>

					<td><select class="tgray2">
							<option value="3" selected>公开,完整显示</option>
							<option value="2">只显示星座</option>
							<option value="1">只显示月日</option>
							<option value="0">保密</option>
					</select></td>
				</tr>
				<tr>
					<td>血型:</td>
					<td><select name="bloodType" id="bloodType" class="tgray">
							<option value=""></option>
							<option value="A">A型</option>
							<option value="B">B型</option>
							<option value="AB">AB型</option>
							<option selected value="O">O型</option>
					</select></td>
					<td><select class="tgray2">
							<option value="2">所有人可见</option>
							<option value="1" selected>我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>博客地址:</td>
					<td class="tfont"><input type="text" id="blogUrl"
						name="blogUrl" value="${ userinfos.userinfoBlogurl }" class="tgray1" />
						<p>还没有博客？
						<a href="http://control.blog.sina.com.cn/reg/reg_blog.php?version=7">立即开通</a>
						</p></td>
					<td><select class="tgray2">
							<option value="2" selected>所有人可见</option>
							<option value="1">我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>联系邮箱:</td>
					<td class="tfont">
							<input type="text" id="email" name="email" value="${ userinfos.userinfoEmail}" class="tgray1">
						</td>
					<td><select class="tgray2">
							<option value="2">所有人可见</option>
							<option value="1" selected>我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>QQ:</td>
					<td class="tfont"><input type="text" id="qqNumber"
						name="qqNumber" value="${ userinfos.userinfoQqnumber}" class="tgray1">
					</td>
					<td><select class="tgray2">
							<option value="2">所有人可见</option>
							<option value="1" selected>我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>MSN:</td>
					<td class="tfont"><input type="text" id="messenger"
						name="messenger" value="${ userinfos.userinfoMessenger }" class="tgray1">
					</td>
					<td><select class="tgray2">
							<option value="2">所有人可见</option>
							<option value="1" selected>我关注的人可见</option>
							<option value="0">仅自己可见</option>
					</select></td>
				</tr>
				<tr>
					<td>一句话介绍:</td>
					<td class="tfont"><textarea name="intro" id="intro"
							class="tgray">${ userinfos.userinfoIntro }</textarea>
					</td>
					<td id="red_mydesc"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				<tr>
				<tr>
					<td><input type="submit" value="保存" class="btn" />
					</td>
					<td>&nbsp;</td>
				</tr>	
    		</table>
    		<input type="hidden" id="userinfoId" value="${userinfos.userinfoId}" /> 
    		<input type="hidden" id="usersId" value="${user.usersId}" /> 
    		<input type="hidden" id="passWord" value="${user.usersPassword}" />
    		<input type="hidden" id="time" value="${user.usersTime}" /> 
    		<input type="hidden" id="status" value="${user.usersStatus}" />
    	</form>
    </div>
  </body>
</html>
