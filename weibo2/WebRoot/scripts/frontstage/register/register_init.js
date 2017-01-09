/**
 * 
 */
 $(function(){
 	//bind() 方法为被选元素添加一个或多个事件处理程序，并规定事件发生时运行的函数。
 	$("#email").bind("focus",function(){
 		if($(this).val() == "请输入您的常用邮箱"){
 			$(this).val("");
 		}
 	});
 	$("#email").bind("blur",function(){
 		if($(this).val() == ""){
 			$(this).val("请输入您的常用邮箱");
 		}
 	});
 	$(".qyreg").bind("focus",function(){
 		$(this).css({
 			"background-color":"red"
 		});
 	});
 	var checkStr = ["您填写的邮箱作为微博登录名","6-20位字符","请输入图片中的数字验证码"];
 	var $checks = $(".check");
 	$(".ch").each(function(i){
 		$(this).bind("focus",function(){
 			$checks.each(function(y){
 				if(i==y){
 					$(this).empty();
 					$(this).append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
 							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+checkStr[i]);
 				}
 			});
 		});
 		$(this).bind("blur",function(){
 			$checks.each(function(y){
 				if(i==y){
 					$(this).empty();
 				}
 			});
 		});
 		
 	});
 	$("#register").validate({
 		rules:{
 			email:{
 				required:true,
 				email:true,
 				remote:{
 					url:"./UsersAction_checkEmail.action?time="+new Date().getTime(),
 					type:"post",
 					dataType:"json",
 					data:{
 						"users.usersEmail":function(){
 							return $("#email").val();
 						}
 					}
 				}
 			},
 			pass:{
 				required:true,
 				minlength:6,
 				maxlength:20
 			},
 			name:{
 				required:true,
 				minlength:2,
 				maxlength:20,
 				remote:{
 					url:"./UsersAction_checkNikeName.action?time="+new Date().getTime(),
 					type:"post",
 					dataType:"json",
 					data:{
 						"users.usersNikename":function(){
 							return $("#name").val();
 						}
 					}
 				}
 			},
 			checkimg:{
 				required:true,
 				minlength:4,
 				maxlength:4,
 				remote:{
 					url:"./UsersAction_checkCode.action?time=" + new Date().getTime(),
 					type:"post",
 					dataType:"json",
 					data:{
 						"code":function(){
 							return $("#checkimg").val();
 							
 						}
 					}
 				}
 			}
 		},
 			messages:{
 				email:{
 					required:'邮箱不能为空',
 					email:'请输入正确的邮箱格式',
 					remote:'此邮箱已被注册'
 				},
 				pass:{
 					required:'密码不能为空',
 					minlength:'密码长度不能少于6位字符',
 					maxlength:'密码长度不能大于20位字符'
 				},
 				name:{
 					required:'昵称不能为空',
 					minlength:'昵称长度不能少于2位字符',
 					maxlength:'昵称长度不能大于20位字符',
 					remote:'该昵称已被注册'
 				},
 				checkimg:{
 					required:'验证码不能为空',
 					minlength:'验证码长度只能是4位',
 					maxlength:'验证码长度只能是4位',
 					remote:'验证码不正确'
 				}
 			}
 		
 	});
 	
 	
 });