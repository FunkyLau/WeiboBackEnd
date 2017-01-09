var post_param = {};
var dg_param = {};
$(function() {
    setObjName('Users');
    post_param = {};
    /* dg_param = {columns:""}; */

    $("#s_status").combobox({
        data : [{
            id : 0,
            val : '未验证'
        }, {
            id : 1,
            val : '已验证'
        }],
        panelHeight : 'auto',
        valueField : 'id',
        textField : 'val'
    });

    openSearch(['s_email', 's_nikeName', 's_status[iscombobox]']);
    dg_param = {
        columns : [[{
            checkbox : true
        }, {
            field : 'usersId',
            title : 'ID',
            width : 100,
            align : 'center'
        }, {
            field : 'usersEmail',
            title : '邮箱',
            width : 220,
            align : 'center',
            editor : {
                type : createEdit(),
                options : {
                    ajaxCheck : "usersEmail",

                    validateRule : {
                        required : true,
                        validType : ["cemail"]
                    },
                    myRules : {
                        type : "cemail",
                        rege : /^[a-zA-Z0-9]{2,}@(qq|sina|163|gmail|139|126)\.(com|cn)$/,
                        message : '邮箱格式不正确，请使用qq,sina,163,gmail,139,126邮箱'
                    }

                }
            }
        }, {
            field : 'usersPassword',
            title : '密码',
            width : 120,
            align : 'center',
            editor : {
                type : createEdit(),
                options : {
                    validateRule : {
                        required : true,
                        validType : ["length[6,20]"]
                    }
                }
            }
        }, {
            field : 'usersNikename',
            title : '昵称',
            width : 100,
            align : 'center',
            editor : {
                type : createEdit(),
                options : {
                    validateRule : {
                        required : true,
                        validType : ["usersNikename"]
                    },
                    ajaxCheck : "usersNikename",
                    myRules : {
                        type : "usersNikename",
                        rege : /.{1,20}/,
                        message : '昵称至少为1个字符，最多20个字符或10个中文'
                    }
                }
            }
        }, {
            field : 'usersTime',
            title : '注册时间',
            width : 150,
            align : 'center',
            formatter : function(value, row, index) {
                if (value != null) {
                    return value.replace("T", " ");
                }
                return "";
            },
            editor : {

                type : createDatetimebox("usersTime"),
                options : {
                    required : true,
                    editable : false
                }
            }
        }, {
            field : 'usersStatus',
            title : '邮箱是否验证',
            width : 100,
            align : 'center',
            formatter : function(value, row, index) {
                if (value != "") {
                    if (value == 1) {
                        return "已验证";
                    } else {
                        return "未验证";
                    }
                }
                return "未验证";
            },
            editor : {
                type : 'checkbox',
                options : {
                    on : 1,
                    off : 0
                }
            }

        }]]
    };

    initDg(post_param, dg_param);
}); 