$(document).ready(function() {
	updateUser();
	$(".click").click(function(){
		$(".hidden").hide();
		$(".left").show();
	});
});
function updateUser() {
	$('label').remove();

	$("#update").validate(
			{
				rules : {
					newEmail : {
						required : true,
						email : true
					},
					oldEmail : {
						required : true,
						email : true,
						remote : {
							url : "./UsersAction_checkEmails.action?time="
									+ new Date().getTime(),
							type : "post",
							datatype : "json",
							data : {
								"users.usersId" : function() {
									return $("#uid").val();
								},
								"users.usersEmail" : function() {
									return $("#oldEmail").val();
								}
							}
						}
					},
					password : {
						required : true,
						rangelength : [ 6, 16 ],
						remote : {
							url : "./UsersAction_checkPass.action?time="
									+ new Date().getTime(),
							type : "post",
							datatype : "json",
							data : {
								"users.usersId" : function() {
									return $("#uid").val();
								},
								"users.usersPassword" : function() {
									return $("#password").val();
								}
							}
						}
					}
				},
				messages : {
					newEmail : {
						required : "请填写新邮箱",
						email : "请输入正确的邮箱"
					},
					oldEmail : {
						required : "请填写当前邮箱",
						email : "请输入正确的邮箱",
						remote : "输入的当前邮箱不存在"
					},
					password : {
						required : "确认新密码",
						rangelength : "密码的长度为6-16位",
						remote : "输入的微博密码错误"
					}
				},
				submitHandler : function(form) {
	
					$.post("./UsersAction_updateEmail.action?time="
							+ new Date().getTime(), {
						'users.usersId' : $("#uid").val(),
						'users.usersEmail' : $("#newEmail").val()
					}, function(data) {
						if (data) {
							alert("邮箱修改成功！");
							parent.document.location.href="./frontstage/login.jsp";
						} else {
							alert("邮箱修改失败！");
						}
					}, "json");
				}
			});
}