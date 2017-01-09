var post_param = {};
var dg_param = {};
$(function() {
	setObjName('Admins');
	post_param = {};
	

	$("#s_id").numberbox();
	
	var admintype = [ {
		type : "高级管理员",
		typevalue : "高级管理员"
	}, {
		type : "普通管理员",
		typevalue : "普通管理员"
	} ];

	$("#s_type").combobox({
		valueField : 'adminsType',
		textField : 'typevalue',
		data : admintype
	});

	
	openSearch([ "s_id", "s_name", "s_type[iscombobox]" ]);

	
	/* dg_param = {columns:""}; */
	dg_param = {
		columns : [ [
				{
					checkbox : true
				},
				{
					field : 'adminsId',
					title : 'ID',
					width : 100,
					align : 'center'
				},
				{
					field : 'adminsName',
					title : '管理员账号',
					width : 100,
					align : 'center',
					editor : {
						type : createEdit(),
						options : {
							validateRule : {
								required : true,
								validType : ["name"]
							},
							ajaxCheck : "name",
							myRules : {
								type : "name",
								rege : new RegExp(
										"^[a-zA-Z0-9][a-zA-Z0-9_]{5,19}$"),
								message : '用户名6-20位只能包含英文、字母或下划线且不能以下划线开头'
							}
						}
					}
				},
				{
					field : 'adminsPass',
					title : '密码',
					width : 100,
					align : 'center',
					editor : {
						type : createEdit(),
						options : {
							validateRule : {
								required : true,
								validType : [ "length[6,20]" ]
							}
						}
					}
				},
				{
					field : 'adminsType',
					title : '管理员类型',
					width : 100,
					align : 'center',
					editor : {
						type : 'combobox',
						options : {
							valueField : 'type',
							textField : 'typevalue',
							editable : false,
							data : admintype,
							required : true
						}
					}
				}
				 ] ]
	};

	initDg(post_param, dg_param);
});

/*
 * editor : { type : createEdit("name"), options : { validateRule : { required :
 * true,
 * 
 * //validType可以只有一个参数 validType : "name" // 也可以穿多个参数 validType :
 * ["name","newRule"]
 * 
 * //可以不传myRules，使用validatebox自带的验证方法，如 validType:"email"
 * 
 * validType : ["name","newRule"] },
 * 
 * //文本框点击事件
 * 
 * inputClick : function(){}
 * 
 * //文本框是否为只读
 * 
 * inputEdit : true; //
 * 
 * myRules : {
 * 
 * //可以只传3个属性type,rege,message
 * 
 * type : "name", rege : new RegExp( "^[a-zA-Z0-9][a-zA-Z0-9_]{6,20}$"), message :
 * '用户名6-20位只能包含英文、字母或下划线且不能以下划线开头',
 * 
 * //可以自定义一个方法或者不定义
 * 
 * //value为输入框中的内容 , param为验证时传入的属性
 * 
 * //validType ："RuleName['abc']" ---param="abc"---
 * 
 * newRule : { RuleName : { validator : function( value, param) { return false; },
 * message : "It is always wrong!" } } } } }
 */

