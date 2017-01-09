var post_param = {};
var dg_param = {};
$(function() {
	setObjName('Atusers');
	setCombobox([ "users", "messages" ]);
	post_param = {};

	/* $("#s_id").numberbox(); */

	/*
	 * var messagestype = [{ type : "原创", typevalue : "原创" }, { type : "转发",
	 * typevalue : "转发" }];
	 * 
	 * $("#s_type").combobox({ valueField : 'type', textField : 'typevalue',
	 * data : messagestype });
	 */
	/*
	 * $("#s_users_email").bind("blur",function(){ alert($(this).val()); });
	 */

	openSearch([ "s_messages_info", "s_users_email" ]);
	/* dg_param = {columns:""}; */
	dg_param = {
		columns : [ [ {
			checkbox : true
		}, {
			field : 'atusersId',
			title : 'At用户ID',
			width : 100,
			align : 'center'
		}, {
			field : 'atusersTime',
			title : 'At时间',
			width : 160,
			align : 'center',
			formatter : function(value, rowData, rowIndex) {

				if (value == null) {
					return "";
				} else {
					var str = value.replace("T", " ");
					return str;
				}

			},
			editor : {
				type : createDatetimebox("time"),
				options : {
					editable : false,
					required : true
				}
			}
		}, {
			field : "users",
			title : '被At用户',
			width : 100,
			align : 'center',
			editor : {
				type : createCombobox("users"),
				options : {
					required : true,
					editable : false
				}
			}
		}, {
			field : "messages",
			title : '微博',
			width : 100,
			align : 'center',
			editor : {
				type : createCombobox("messages"),
				options : {
					required : true,
					editable : false
				}
			}
		} ] ]
	};

	initDg(post_param, dg_param);
});
