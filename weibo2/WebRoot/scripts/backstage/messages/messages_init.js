var post_param = {};
var dg_param = {};
$(function() {
	setObjName('Messages');
	setCombobox(["users"]);
	post_param = {};

	/*$("#s_id").numberbox();*/

	var messagestype = [{
		type : "原创",
		typevalue : "原创"
	}, {
		type : "转发",
		typevalue : "转发"
	}, {
		type : "分享",
		typevalue : "分享"
	}, {
		type : "图片",
		typevalue : "图片"
	}, {
		type : "视频",
		typevalue : "视频"
	}, {
		type : "音乐",
		typevalue : "音乐"
	}, {
		type : "标签",
		typevalue : "标签"
	}, {
		type : "心情",
		typevalue : "心情"
	}];

	$("#s_type").combobox({
		//valueField : 'type',
		valueField : 'messagestype',
		textField : 'typevalue',
		data : messagestype
	});
	/*
	 $("#s_users_email").bind("blur",function(){
	 alert($(this).val());
	 });*/

	openSearch(["s_info", "s_type[iscombobox]", "s_label", "s_users_email"]);

	/* dg_param = {columns:""}; */
	dg_param = {
		columns : [[{
			checkbox : true
		}, {
			field : 'messagesId',
			title : '微博ID',
			width : 100,
			align : 'center'
		}, {
			field : 'messagesInfo',
			title : '微博内容',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {
					validateRule : {
						required : true,
						validType : ["length[1,100]"]
					}
				}
			}
		}, {
			field : 'messagesType',
			title : '微博类型',
			width : 100,
			align : 'center',
			editor : {
				type : 'combobox',
				options : {
					valueField : 'messagestype',
					textField : 'typevalue',
					editable : false,
					data : messagestype,
					required : true
				}
			}
		}, {
			field : 'messagesTime',
			title : '发表时间',
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
				type : createDatetimebox("messagesTime"),
				options : {
					required : true,
					editable : false
				}
			}
		}, {
			field : 'messagesCollectnum',
			title : '收藏次数'
		}, {
			field : 'messagesCommentnum',
			title : '评论次数'
		}, {
			field : 'messagesTranspondnum',
			title : '转发次数'
		}, {
			field : 'messagesAgreenum',
			title : '赞次数'
		}, {
			field : 'messagesReadnum',
			title : '阅读次数'
		}, {
			field : 'messagesLabel',
			title : '微博标签',
			editor : {
				type : createEdit(),
				options : {
					validateRule : {
						required : true,
						validType : ["length[2,20]"]
					}
				}
			}
		}, {
			field : "users",
			title : '微博用户',
			width : 100,
			align : 'center',
			editor : {
				type : createCombobox("users"),
				options : {
					required : true,
					editable : false
				}
			}
		}]]
	};

	initDg(post_param, dg_param);
});
