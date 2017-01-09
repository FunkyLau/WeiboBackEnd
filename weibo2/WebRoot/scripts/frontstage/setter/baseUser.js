$(document).ready(function() {

	//保存，验证
	addUser();

	$(".tgray1").focus(function() {
		$(this).fadeIn(4000).css({
			border : "1px solid #666666",
			height : "27px",
			width : "240px",
			background : "#FFFFCC"
		});
	});
	$(".tgray1").blur(function() {
		$(this).fadeIn(4000).css({
			border : "0",
			height : "27px",
			width : "240px",
			background : "#FFFFFF"
		});
	});

	$(".tgray2").hide();
	$(".s").mouseover(function() {
		$(".tgray2").show();
		$(this).hide();
	});

	$(".tgray2").focus(function() {
		$(this).show();
		$(this).fadeIn(4000).css({
			border : "1px solid #666666",
			background : "#CCCCFF"
		});
	});
	$(".tgray2").blur(function() {
		$(this).fadeIn(4000).css({
			border : "0",
			background : "#FFFFFF"
		});
	});

});
function addUser() {

	$('label').remove();

	$("#addUser").validate({
		rules : {
			usersNikename : {
				required : true,
				rangelength : [4, 30]
			},
			userinfoSex:{
				required : true
			},
			userinfoBlogurl : {
				url : true
			},
			userinfoEmail : {
				email : true
			},
			userinfoQqnumber : {
				number : true,
				digits : true,
				rangelength : [6, 11]
			},
			userinfoMessenger : {
				email : true
			},
			userinfoIntro : {
				rangelength : [0, 70]
			}
		},
		messages : {
			nikename : {
				required : "请输入昵称",
				rangelength : "昵称只能4-30个字符"
			},
			userinfoSex : {
				required:"请选择性别"
			},
			userinfoBlogurl : {
				url : "请输入正确的博客格式"
			},
			userinfoEmail : {
				email : "请输入正确的邮箱"
			},
			userinfoQqnumber : {
				number : "qq号只能是数字",
				digits : "qq号不能是负数",
				rangelength : "qq号只能是6到11位"
			},
			userinfoMessenger : {
				email : "请输入正确的msn账号"
			},
			userinfoIntro : {
				rangelength : "自我评价字数限制在0到70之间"
			}
		},
		submitHandler : function(form) {

			$.post("./UserinfoAction_update.action?time=" + new Date().getTime(), {           
             'users.usersId':$("#usersId").val(),
             'users.usersEmail':$("#uemail").val(),
             'users.usersPassword':$("#passWord").val(),
             'users.usersNikename':$("#nickname").val(),
             'users.usersTime':$("#time").val(),
             'users.usersStatus':$("#status").val(),
             
             'userinfo.userinfoId':$("#userinfoId").val(),
             'userinfo.userinfoTruename':$("#trueName").val(),
             'userinfo.userinfoSex':$("#sex input:checked").val(),
             'userinfo.userinfoSexual':$("#sexUal input:checked").val(),
             'userinfo.userinfoFeeling':$("#feeling").val(),
             'userinfo.userinfoBloodtype':$("#bloodType").val(),
             'userinfo.userinfoBlogurl':$("#blogUrl").val(),
             'userinfo.userinfoEmail':$("#email").val(),
             'userinfo.userinfoQqnumber':$("#qqNumber").val(),
             'userinfo.userinfoMessenger':$("#messenger").val(),
             'userinfo.userinfoIntro':$("#intro").val(),             
             'birthday':$("#birthday_y").val()+$("#birthday_m").val()+$("#birthday_d").val()          
			}, function(data) {
				if (data) {					
					alert("保存成功！");
					document.location.reload();
				} else {
					alert("保存失败！");
				}
			}, "json");
		}
	});
}
