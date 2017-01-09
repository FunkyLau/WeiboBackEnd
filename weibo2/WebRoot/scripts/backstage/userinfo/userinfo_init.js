var post_param = {};
var dg_param = {};
$(function() {
	setObjName('Userinfo');
	post_param = {};

	/* setCombobox([ 'obj1','obj2'... ]); */
	setCombobox([ "users" ]);

	var booldTypeData = [ {
		id : 'A型',
		val : 'A型'
	}, {
		id : 'B型',
		val : 'B型'
	}, {
		id : 'AB型',
		val : 'AB型'
	}, {
		id : 'O型',
		val : 'O型'
	} ];
	
	var sexData = [ {
		id : '男',
		val : '男'
	}, {
		id : '女',
		val : '女'
	}];
	
	$("#s_bloodType").combobox({
		data:booldTypeData,
		panelHeight : 'auto',
		valueField : 'id',
		textField : 'val'	
	});
	
	$("#s_sex").combobox({
		data:sexData,
		panelHeight : 'auto',
		valueField : 'id',
		textField : 'val'	
	});
	
	/* openSearch(['s_searchField1','s_searchField2','s_searchField3[istype]']) */
	openSearch([ 's_trueName','s_sex[iscombobox]' ,'s_sexUal', 's_bloodType[iscombobox]' ]);

	/* dg_param = {columns:""}; */
	dg_param = {
		columns : [ [ {
			checkbox : true
		}, {
			field : 'userinfoId',
			title : 'ID',
			width : 100,
			align : 'center'
		}, {
			field : 'userinfoTruename',
			title : '真实姓名',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : 'userinfoAddress',
			title : '用户住址',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : 'userinfoSex',
			title : '性别',
			width : 100,
			align : 'center',
			editor : {
				type : "combobox",
				options : {
					data : sexData,
					panelHeight : 'auto',
					valueField : 'id',
					textField : 'val',
					editable : false,
					required : true
				}
			}
		}, {
			field : 'userinfoSexual',
			title : '性取向',
			width : 100,
			align : 'center',
			editor : {
				type : "combobox",
				options : {
					data : [ {
						id : '男,女',
						val : '男,女'
					}, {
						id : '男',
						val : '男'
					}, {
						id : '女',
						val : '女'
					} ],
					panelHeight : 'auto',
					valueField : 'id',
					textField : 'val',
					editable : false,
					required : false
				}
			}
		}, {
			field : 'userinfoFeeling',
			title : '感情状况',
			width : 100,
			align : 'center',
			editor : {
				type : "combobox",
				options : {
                    data : [ {
                        id : '单身',
                        val : '单身'
                    }, {
                        id : '暗恋中',
                        val : '暗恋中'
                    }, {
                        id : '恋爱中',
                        val : '恋爱中'
                    } , {
                        id : '已婚',
                        val : '已婚'
                    } , {
                        id : '离异',
                        val : '离异'
                    } ],
                    panelHeight : 'auto',
                    valueField : 'id',
                    textField : 'val',
                    editable : false,
                    required : false
				}
			}
		}, {
			field : 'userinfoBirthday',
			title : '出生日期',
			width : 100,
			align : 'center',
			editor : {
				type : "datebox",
				options : {
                    required : true,
                    editable : false
                }
			}
		}, {
			field : 'userinfoBloodtype',
			title : '血型',
			width : 100,
			align : 'center',
			editor : {
				type : "combobox",
				options : {
					data : booldTypeData,
					panelHeight : 'auto',
					valueField : 'id',
					textField : 'val',
					editable : false,
					required : false
				}
			}
		}, {
			field : 'userinfoBlogurl',
			title : '微博路径',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : 'userinfoRealname',
			title : '个性域名',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : 'userinfoIntro',
			title : '个人简介',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : 'userinfoEmail',
			title : '用户邮箱',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {
					ajaxCheck : "email",

					validateRule : {
						validType : [ "cemail" ]
					},
					myRules : {
						type : "cemail",
						rege : /^[a-zA-Z0-9]{2,}@(qq|sina|163|gmail|139|126)\.(com|cn)$/,
						message : '邮箱格式不正确，请使用qq,sina,163,gmail,139,126邮箱'
					}

				}
			}
		}, {
			field : 'userinfoQqnumber',
			title : 'QQ',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {
					validateRule : {
						validType : [ "qqNumber" ]
					},
					myRules : {
						type : "qqNumber",
						rege : /^[0-9]{5,11}$/,
						message : 'QQ号码为5到11位数字'
					}
				}
			}
		}, {
			field : 'userinfoMessenger',
			title : 'MSN',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {
					
				}
			}
		}, {
			field : 'userinfoProfession',
			title : '职业',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : 'userinfoLabel',
			title : '标签',
			width : 100,
			align : 'center',
			editor : {
				type : createEdit(),
				options : {

				}
			}
		}, {
			field : "users",
			title : '对应用户',
			width : 100,
			align : 'center',
			editor : {
				type : createCombobox("users"),
				options : {
					required : true,
					editable : false
				}
			}
		} ] ]
	};
	initDg(post_param, dg_param);
});