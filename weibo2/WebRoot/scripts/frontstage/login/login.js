/**
 * 登录界面的脚本
 */
$(document).ready(function(){
	$(".lefttop div").mouseover(function(){
		$(this).css({
			"background-position":"0px-192px",
			"cursor":"pointer"
		});
	}).mouseout(function() {
		$(this).css("background-position","0px -150px");
		});
	$("#emaildiv input").val("邮箱/会员帐号");
	$("#emaildiv input").focus(function(){
		if($(this).val()=="邮箱/会员帐号"){
			$(this).val("");
		}
		$("emaildiv").css("background-position","1px -83px");
	}).blur(function(){
		if($(this).val().trim() == ""){
			$(this).val("邮箱/会员帐号");
		}
		$("#emaildiv").css("background-positon","0px -0px");
	});
	$("#passdiv input").val("请输入密码").css("color","#808080");
	$("#passdiv input").focus(function() {
		if($(this).val()=="请输入密码"){
			$(this).val("").attr("type","password").css("color","#333");
		}
		$("#passdiv").css("background-position","1px -122px");
		}).blur(function(){
			if($(this).val().trim()==""){
				$(this).val("请输入密码").css("color","#808080").attr("type","text");
			}
			$("#passdiv").css("background-position","0px -45px");
		});
	$("#utsdiv").hide();
	$("#emaildiv input").focus(function(){
		$("#utsdiv").hide();
	});
});

function checkLogin(){
	if($("#emaildiv input").val()=="邮箱/会员帐号"){
	$("#utsdiv").css({
		"background-image":"url(./images/cloinfo.png)",
		"background-position":"0px 0px",
		"margin-top":"-36px"
	}).show();
	return false;
	}
	if($("#emaildiv input").val()!="邮箱/会员帐号" && $("#passdiv input").val()=="请输入密码"){
		$("#utsdiv").css({
			"background-image":"url(./images/cloinfo.png)",
			"background-position":"0px -48px",
			"margin-top":"16px"
		}).show();
		return false;
		
	}
}