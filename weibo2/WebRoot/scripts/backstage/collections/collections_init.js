var post_param = {};
var dg_param = {};
$(function() {
	setObjName('Collections');
	post_param = {};

	setCombobox([ "users", "messages" ]);

	var collectionStatus = [ {
		val : "2",
		valtext : "赞"
	}, {
		val : "1",
		valtext : "已收藏"
	}, {
		val : "0",
		valtext : "未收藏"
	},{
		val : "P",
		valtext:""
	} ];

	$("#s_status").combobox({
		valueField : 'type',
		textField : 'typevalue',
		data : collectionStatus
	});
	openSearch([ "s_status[iscombobox]", "s_users_email", "s_messages_info" ]);
	dg_param = {
		columns : [ [ {
			checkbox : true
		}, {
			field : 'collectionsId',
			title : 'ID',
			width : 100,
			align : 'center'
		}, {
			field : 'collectionsTime',
			title : '收藏时间',
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
					required : true,
					editable : false
				}
			}
		}, {
			field : 'collectionsStatus',
			width : 200,
			title : '收藏状态',
			formatter : function(value, row, index) {
				if (value != null) {
					if (value == 1) {
						return "已收藏";
					} else if (value == 0) {
						return "未收藏";
					} else if (value == 2) {
						return "赞";
					}
				}
				return "";
			},
			editor : {
				type : 'combobox',
				options : {
					data : collectionStatus,
					valueField : 'val',
					textField : 'valtext',
					editable : false,
					required : true
				}
			}
		}, {
			field : "users",
			title : '微博用户',
			width : 200,
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
			title : '微博信息',
			width : 200,
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
