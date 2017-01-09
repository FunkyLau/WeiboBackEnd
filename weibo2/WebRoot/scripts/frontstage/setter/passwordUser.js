$(document).ready(function() {
	updateUser();
	$("#newPass").bind("change", function() {
		var value = $(this).val();
		if (value.length < 6) {
			$("#imgps").attr("src", "./images/pwd_no.gif");
		}
		if (value.length >= 6) {
			$("#imgps").attr("id", "imgps");
			$("#imgps").attr("src", "./images/pwd_simple.gif");
		}
		if (value.length >= 9) {
			$("#imgps").attr("id", "imgps");
			$("#imgps").attr("src", "./images/pwd_middle.gif");
		}
		if (value.length >= 11) {
			$("#imgps").attr("id", "imgps");
			$("#imgps").attr("src", "./images/pwd_strong.gif");
		}

	});
});
function updateUser() {
	$('label').remove();

	$("#update").validate({
		rules : {
			oldPass : {
				required : true,
				rangelength : [6, 16],
				remote : {
					url : "./UsersAction_checkPass.action?time=" + new Date().getTime(),
					type : "post",
					datatype : "json",
					data : {
						"users.usersId" : function() {
							return $("#uid").val();
						},
						"users.usersPassword" : function() {
							return $("#oldPass").val();
						}
					}
				}
			},
			newPass : {
				required : true,
				rangelength : [6, 16]
			},
			confirmPass : {
				required : true,
				rangelength : [6, 16],
				equalTo : "#newPass"
			}
		},
		messages : {
			oldPass : {
				required : "请填写当前密码",
				rangelength : "当前密码的长度为6-16位",
				remote : "输入的当前密码不存在"
			},
			newPass : {
				required : "请填写新密码",
				rangelength : "新密码的长度为6-16位",
			},
			confirmPass : {
				required : "确认新密码",
				rangelength : "密码的长度为6-16位",
				equalTo : "两次输入的密码不一致"
			}
		},
		submitHandler : function(form) {
			
			$.post("./UsersAction_updatePassword.action?time=" + new Date().getTime(), {
				'users.usersId' : $("#uid").val(),
				'users.usersPassword' : $("#newPass").val()
			}, function(data) {
				if (data) {
					alert("密码修改成功！");
					parent.document.location.href="./frontstage/login.jsp";
				} else {
					alert("密码修改失败！");
				}
			}, "json");
		}
	});
}