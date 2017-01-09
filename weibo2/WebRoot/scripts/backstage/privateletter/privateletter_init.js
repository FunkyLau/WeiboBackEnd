var post_param = {};
var dg_param = {};
$(function() {
	setObjName('Privateletter');
	post_param = {};

	setCombobox(["susers","reusers"]);


var infoStatus = [{
		type : "1",
		typevalue : "已读"
	}, {
		type : "0",
		typevalue : "未读"
	}];

	$("#s_infostatus").combobox({
		valueField : 'type',
		textField : 'typevalue',
		data : infoStatus
	});
	openSearch(["s_infostatus[iscombobox]", "s_susers_email", "s_reusers_email","s_info"]);
	
	dg_param = {
		columns : [[{
			checkbox : true
		}, {
			field : 'privateletterId',
			title : 'ID',
			width : 100,
			align : 'center'
		}, {
			field : 'privateletterInfo',
			title : '私信内容',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {
					validateRule : {
						required : true,
						validType : ["length[1,300]"]
					}
				}
			}
		},{
			field : 'privateletterTime',
			title : '发送时间',
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
				type : createDatetimebox("privateletterTime"),
				options : {
					required : true,
					editable : false
				}
			}
		}, {
			field : 'privateletterInfostatus',
			width : 200,
			title : '私信状态',
			formatter:function(value,row,index){
				if(value!=null){
					if(value==1){
						return "已读";
					}else{
						return "未读";
					}
				}
				return "";
			},
			editor : {
				type : 'combobox',
				options : {
					valueField : 'type',
					textField : 'typevalue',
					editable : false,
					data : infoStatus,
					required : true
				}
			}
		}, {
			field : "usersByUsersSid",
			title : '发送用户',
			width : 200,
			align : 'center',
			editor : {
				type : createCombobox("usersByUsersSid"),
				options : {
					required : true,
					editable : false
				}
			}
		},{
			field : "usersByUsersReid",
			title : '接收用户',
			width : 200,
			align : 'center',
			editor : {
				type : createCombobox("usersByUsersReid"),
				options : {
					required : true,
					editable : false
				}
			}
		}]]
	};

	initDg(post_param, dg_param);
});
