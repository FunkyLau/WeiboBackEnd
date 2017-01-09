var post_param = {};
var dg_param = {};
$(function() {
    setObjName('Relation');
    post_param = {};
    setCombobox(["usersByUsersId", "usersByUsersByid"]);

    $.post('./RelationAction_getAllUsers.action?relationTime=' + new Date().getTime(), "", function(data) {
        $("#tuserid").combobox({
            data : data,
            valueField : 'id',
            textField : 'text',
            editable : false
        });
    }, 'json');
    $.post('./RelationAction_getAllUsers.action?relationTime=' + new Date().getTime(), "", function(data) {
        $("#byuserid").combobox({
            data : data,
            valueField : 'id',
            textField : 'text',
            editable : false
        });
    }, 'json');

    $('#bedate').datetimebox({
        // value : new Date().toLocaleString(),
        editable : false,
        showSeconds : true
    });
    $('#afdate').datetimebox({
        // value : new Date().toLocaleString(),
        editable : false,
        showSeconds : true
    });

    $("#searchBtn").bind("click", function() {
        var uid = $("#tuserid").combobox("getValue");
        var byid = $("#byuserid").combobox("getValue");
        var bedate = $("#bedate").datetimebox("getValue");
        var afdate = $("#afdate").datetimebox("getValue");
        post_param = {
            "usersByUsersId.usersId" : uid,
            "usersByUsersByid.usersId" : byid,
            "bedate" : bedate,
            "afdate" : afdate
        };
        $("#tuserid").combobox("setValue", "");
        $("#byuserid").combobox("setValue", "");
        $("#bedate").datetimebox("setValue", "");
        $("#afdate").datetimebox("setValue", "");
        initDg(post_param, dg_param);
    });

    dg_param = {
        columns : [[{
            checkbox : true
        }, {
            field : 'relationId',
            title : 'ID',
            width : 60,
            align : 'center'
        }, {
            //field : 'usersByUsersId.usersEmail',
        	field : 'usersByUsersId.usersEmail',
            title : '用户Email',
            width : 120,
            align : 'center',
            editor : {
                type : createCombobox("usersEmail"),
                options : {
                    required : true
                }
            }
        }, {
            field : 'usersByUsersByid.usersEmail',
            title : '被关注用户Email',
            width : 120,
            align : 'center',
            editor : {
                type : createCombobox("usersEmail"),
                options : {
                    required : true
                }

            }
        }, {
            field : 'relationTime',
            title : '关注时间',
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
                type : createDatetimebox("relationTime"),
                options : {
                    required : true,
                    editable : false
                }
            }
            /*editor : {
             type : 'datetimebox',
             options : {

             }

             }*/
        }, {
            field : 'relationNote',
            title : '关系备注',
            width : 100,
            align : 'center',
            editor : {
                type : createEdit(),
                options : {
                    validateRule : {
                        required : true,
                        validType : "noteval"
                    },
                    myRules : {
                        type : "noteval",
                        rege : new RegExp("^.{1,20}$"),
                        message : '关系备注至多6个汉字或20个英文字符'
                    }
                }
            }
        }, {
            field : 'relationGroupname',
            title : '关系组名',
            width : 100,
            align : 'center',
            editor : {
                type : createEdit(),
                options : {
                    validateRule : {
                        required : true,
                        validType : "groupval"
                    },
                    myRules : {
                        type : "groupval",
                        rege : new RegExp("^.{1,20}$"),
                        message : '关系组名至多6个汉字或20个英文字符'
                    }
                }
            }
        }]]
    };

    initDg(post_param, dg_param);
});
