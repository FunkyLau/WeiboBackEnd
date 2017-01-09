var _queryurl = "";
var _sortOrder = "asc";
var _sortText = "升序排列";
var _beforeRowData = "";
var _afterRowData = "";
var _DataArray = [];
var _comboboxfield = [];
var _post_param = "";
var _dg_param = "";
var _isEditRowId = "";
var _beforeSave = "";
var _beforeCancel = "";
var _beforeDelete = "";
var _beforeErrorData = "";
var _onCancel = "";
var _getSave = "";
var _beforeUpdate = "";
function initDg(post_param, dg_param) {
    _post_param = post_param;
    _dg_param = dg_param;
    _pushAction(dg_param);
    //增加操作
    _formatterField(dg_param);
    $('#dg').datagrid({
        queryParams : _post_param,
        loadMsg : '正在加载数据...',
        singleSelect : false,
        rownumbers : true,
        pagination : true,
        sortName : 'id',
        sortOrder : _sortOrder,
        loadFilter : function(data) {
            return data.pagination;
        },
        url : _queryurl,
        columns : dg_param.columns,
        onBeforeEdit : function(index, row) {
            _beforeRowData = row;
            row.editing = true;
            updateActions(index);
        },
        onAfterEdit : function(index, row) {
            _afterRowData = row;
            row.editing = false;
            updateActions(index);
        },
        onCancelEdit : function(index, row) {
            row.editing = false;
            updateActions(index);
        },
        onUnselectAll : function(rows) {
            for (var i = 0; i < rows.length; i++) {
                var r_i = rows[i];
                if (r_i.id == undefined) {
                    $('#dg').datagrid('deleteRow', getRowIndex(r_i));
                }
                ;
                $('#dg').datagrid('cancelEdit', getRowIndex(r_i));
            }
        },
        onUnselect : function(rowIndex, rowData) {
            if (rowData.id == undefined) {
                $('#dg').datagrid('deleteRow', rowIndex);
            }
            $('#dg').datagrid('cancelEdit', rowIndex);
        },
        onDblClickCell : function(index, field, value) {
            if (field != 'undefined' && $('#dg').datagrid('getColumnOption', field).editor != undefined) {
                $('#dg').datagrid('unselectAll');
                $('#dg').datagrid('selectRow', index);
                _isEditRowId = $('#dg').datagrid('getSelected').id;
                $(this).datagrid('beginEdit', index);
                var ed = $(this).datagrid('getEditor', {
                    index : index,
                    field : field
                });
                $(ed.target).focus();
            }
        },
        onBeforeLoad : function(data) {
            _DataArray = [];
            if (_comboboxfield.length > 0) {
                for (var i = 0; i < _comboboxfield.length; i++) {
                    _getAjaxData(_comboboxfield[i]);
                }
            }
        },
        onLoadSuccess : function(data) {
            _post_param = {};
        }
    });
    var pager = $('#dg').datagrid('getPager');
    pager.pagination({
        buttons : [{
            iconCls : 'icon-add',
            text : '添加',
            handler : function() {
                insert();
            }
        }, "-", {
            iconCls : 'icon-remove',
            text : '删除',
            handler : function() {

                deleteAll();
            }
        }, "-", {
            text : _sortText,
            handler : function() {
                _sortBtn = $(this);
                if (_sortOrder == "asc") {
                    _sortText = "降序排列";
                    _sortOrder = "desc";
                    initDg(_post_param, _dg_param);
                } else {
                    _sortText = "升序排列";
                    _sortOrder = "asc";
                    initDg(_post_param, _dg_param);
                }
            }
        }]
    });
}

var _obj = "";
var _actionName = "";
var _delurl = "";
var _saveorupdateurl = "";
function setObjName(obj) {
    _obj = obj.substring(0, 1).toLowerCase() + obj.substring(1);
    _actionName = obj.substring(0, 1).toUpperCase() + obj.substring(1) + "Action";
    _delurl = "./" + _actionName + "_deleteObject.action";
    _saveorupdateurl = "./" + _actionName + "_saveOrUpdateObject.action";
    _queryurl = "./" + _actionName + "_query.action?nowtime=" + new Date().getTime();
}

var _searchField = "";

var _ispush = false;

//增加操作方法
function _pushAction(param) {
    if (!_ispush) {
        param.columns[0].push({
            field : 'action',
            title : '操作',
            width : 80,
            align : 'center',
            formatter : function(value, row, index) {
                if (row.editing) {
                    var s = '<a href="javascript:void(0);" onclick="saverow(this)">保存</a> ';
                    var c = '<a href="javascript:void(0);" onclick="cancelrow(this)">取消</a>';
                    return s + c;
                } else {
                    var e = '<a href="javascript:void(0);" onclick="editrow(this)">编辑</a> ';
                    var d = '<a href="javascript:void(0);" onclick="deleterow(this)">删除</a>';
                    /*屏蔽的删除方法 deleterow(this)*/
                    return e + d;
                }
            }
        });
        _ispush = true;
    }
}

function openSearch(searchField) {
    _searchField = searchField;
    var _searchwhere = "";
    $("#s_searchBtn").click(function() {
        _searchwhere = "";
        var _fieldName = "";
        var _istype = "";
        var _thisid = "";
        var _searchFieldValue = "";
        var _postFN = "";
        if (_searchField.length > 0) {
            for (var i = 0; i < _searchField.length; i++) {
                _postFN = _searchField[i].substring(0, 2);
                if (_postFN == "s_") {
                    if (_searchField[i].indexOf("[") == -1) {
                        _searchFieldValue = $("#" + _searchField[i]).val();
                        if (_searchFieldValue == "")
                            continue;

                        _fieldName = _obj + "." + _searchField[i].substring(2);
                        if (_searchField[i].substring(2).indexOf("_") != -1) {
                            _fieldName = _fieldName.replace("_", ".");
                        }
                        _searchwhere += "'" + _fieldName + "':'" + _searchFieldValue + "',";
                    } else {
                        _istype = _searchField[i].substring(_searchField[i].indexOf("[") + 1, _searchField[i].indexOf("]"));
                        _thisid = _searchField[i].substring(0, _searchField[i].indexOf("["));
                        _fieldName = _obj + "." + _thisid.substring(2);
                        if (_istype == "iscombobox") {
                            _searchFieldValue = ($("#" + _thisid).combobox("getValue"));
                            if (_searchFieldValue == "")
                                continue;
                            if (_fieldName.indexOf("_") != -1) {
                                _fieldName = _fieldName.replace("_", ".");
                            }
                            _searchwhere += "'" + _fieldName + "':'" + _searchFieldValue + "',";
                        }
                        if (_istype == "isdatetimebox") {
                            _searchFieldValue = ($("#" + _thisid).datetimebox("getValue"));
                            if (_searchFieldValue == "")
                                continue;
                            if (_fieldName.indexOf("_") != -1) {
                                _fieldName = _fieldName.replace("_", ".");
                            }
                            _searchwhere += "'" + _fieldName + "':'" + _searchFieldValue + "',";
                        }
                    }
                }
            }
            _searchwhere = "{" + _searchwhere.substring(0, _searchwhere.length - 1) + "}";
        }
        initDg(eval("(" + _searchwhere + ")"), _dg_param);
    });
}

function _getObjData(obj) {
    if (_DataArray.length != 0) {
        for (var i = 0; i < _DataArray.length; i++) {
            if (eval("(_DataArray[" + i + "]." + obj + ")") != null) {
                return eval("(_DataArray[" + i + "]." + obj + ")");
            }
        }
    }
    return [];
}

function setCombobox(comboboxarray) {
    _comboboxfield = comboboxarray;
}

//获取combobox所需要的值
function beforeSave(fun) {
    _beforeSave = fun;
}
function beforeCancel(fun) {
    _beforeCancel = fun;
}

function beforeDelete(fun) {
    _beforeDelete = fun;
}
function beforeErrorData(fun) {
    _beforeErrorData = fun;
}

function onCancel(fun) {
    _onCancel = fun;
}

function _formatterField(param) {
    if (_comboboxfield.length > 0) {
        var _gobj = "";
        for (var j = 0; j < _comboboxfield.length; j++) {
            _gobj = _comboboxfield[j];
            for (var i = 0; i < param.columns[0].length; i++) {
                if (_comboboxfield[j] == param.columns[0][i]['field']) {
                    eval("var _ffun = function(value, row, index) {" + "	if (value != null) {" + "var _objdate = _getObjData('" + _comboboxfield[j] + "');" + "for ( var i = 0; i < _objdate.length; i++) {" + "if (value.id == _objdate[i].id) {" + "return _objdate[i].text;" + "}}}return '';};");
                    param.columns[0][i]['formatter'] = _ffun;
                }
            }
        }
    }
}

function _getComboboxData(obj) {
    var _ajaxan = "getAll" + obj.substring(0, 1).toUpperCase() + obj.substring(1);
    return "./" + _actionName + "_" + _ajaxan + ".action?nowtime=" + new Date().getTime();
}

function _getAjaxData(obj) {

    var _ajaxan = "getAll" + obj.substring(0, 1).toUpperCase() + obj.substring(1);
    _comboboxurl = "./" + _actionName + "_" + _ajaxan + ".action?nowtime=" + new Date().getTime();
    /*
     * $.post(_comboboxurl, {}, function(data) { eval("(" + obj + "={" + obj +
     * ":data})"); _DataArray.push(eval("(" + obj + ")")); }, 'json');
     */
    $.ajax({
        url : _comboboxurl,
        dataType : "json",
        data : {},
        async : false,
        cache : false,
        type : "post",
        success : function(data) {
            eval("(" + obj + "={" + obj + ":data})");
            _DataArray.push(eval("(" + obj + ")"));
        }
    });
}

function updateActions(index) {
    $('#dg').datagrid('updateRow', {
        index : index,
        row : {}
    });
}

function getRowIndex(target) {
    var return_tr;
    if (target == "javascript:void(0);") {
        var tr = $(target).closest('tr.datagrid-row');
        return_tr = parseInt(tr.attr('datagrid-row-index'));
    } else {
        return_tr = $('#dg').datagrid("getRowIndex", target);
    }
    return return_tr;
}

function editrow(target) {
    $('#dg').datagrid('unselectAll');
    $('#dg').datagrid('selectRow', getRowIndex(target));
    _isEditRowId = $('#dg').datagrid('getSelected').id;
    $('#dg').datagrid('beginEdit', getRowIndex(target));

}

function deleterow(target) {
    $('#dg').datagrid('unselectAll');
    var ids = [];
    if (target != "javascript:void(0);") {
        ids.push(target.id);
        $('#dg').datagrid('selectRow', getRowIndex(target));
    }

    $.messager.confirm('删除', '确定要删除吗?', function(r) {
        if (target == "javascript:void(0);") {
            ids.push($('#dg').datagrid('getSelected').id);
        }
        ids = ids.join(",");
        if (_beforeDelete != "") {
            _beforeDelete();
        }
        if (r) {
            $.post(_delurl, {
                ids : ids
            }, function(data) {
                if (data) {
                    /* $('#dg').datagrid('deleteRow', getRowIndex(target)); */
                    initDg(_post_param, _dg_param);
                    showMsg("删除成功！");
                } else {
                    showMsg("删除失败！");
                }
            }, 'json');
        }
    });
}

function deleteAll() {
    var del_rows = $('#dg').datagrid('getSelections');
    var ids = [];
    if (del_rows.length > 0 && del_rows[0].id == undefined) {
        $('#dg').datagrid('unselectRow', getRowIndex(del_rows[0]));
        deleteAll();
    } else if (del_rows.length > 1) {
        $(del_rows).each(function(i) {
            ids.push(this.id);
        });
        ids = ids.join(",");
        $.messager.confirm('删除', '确定要全部删除吗?', function(r) {
            
            if (r) {
                $.post(_delurl, {
                    ids : ids
                }, function(data) {
                    if (data) {
                        /*
                         * $('#dg').datagrid('deleteRow',
                         * getRowIndex(del_rows[0]));
                         */
                        initDg(_post_param, _dg_param);
                        showMsg("删除成功！");
                    } else {
                        showMsg("删除失败！");
                    }
                }, 'json');
            }
        });

    } else if (del_rows.length == 1) {
        deleterow(del_rows[0]);
    } else {
        showMsg("请选择要删除的数据");
    }
}

function saverow(target) {
    var dg_select = $('#dg').datagrid('getSelections');
    for (var i = 0; i < dg_select.length; i++) {
        var r_i = dg_select[i];
        if (getRowIndex(r_i) != getRowIndex(target)) {
            $('#dg').datagrid('unselectRow', getRowIndex(r_i));
        }
    }
    $('#dg').datagrid('selectRow', getRowIndex(target));

    if (_beforeSave != "") {
        var flag = _beforeSave();
        if (flag != undefined) {
            if (!flag) {
                return;
            }
        }
    }

    $('#dg').datagrid('endEdit', getRowIndex(target));

    if (!$('#dg').datagrid('validateRow', getRowIndex(target))) {
        if(_beforeErrorData!=""){
            _beforeErrorData();
        }
        showMsg("数据验证错误！");
    } else {
        saveorupdate();
    }
}

function getSave(fun) {
    _getSave = fun;
}
function beforeUpdate(fun) {
    _beforeUpdate = fun;
}

function saveorupdate() {
    var saveorupdate_str = "";
    var _fields = $('#dg').datagrid('getColumnFields');
    var _data_id = $('#dg').datagrid('getSelected').id;
    var _issave = true;
    if (_data_id != undefined) {
        saveorupdate_str = "'" + _obj + "." + _fields[1] + "':" + _data_id + "";
        _issave = false;
    }

    for (var i = 2; i < _fields.length - 1; i++) {
        var data = '$("#dg").datagrid("getSelected").' + _fields[i];
        var _fieldisobj = false;
        for (var m = 0; m < _comboboxfield.length; m++) {
            if (_fields[i] == _comboboxfield[m]) {
                _fieldisobj = true;
            };
        }
        if (_fieldisobj) {

            if (eval(data).id == "") {
                continue;
            }
            if (!isNaN(eval(data).id)) {
                saveorupdate_str += ",'" + _obj + "." + _fields[i] + ".id':" + data + ".id";
            } else {
                showMsg("操作有误，保存失败！");
                cancelrow($('#dg').datagrid('getSelected'));
                // initDg(_post_param, _dg_param);
                $('#dg').datagrid('reload');
                return false;
            };
        } else {
        	if(eval(data)==""){
        		continue;
        	}
            saveorupdate_str += ",'" + _obj + "." + _fields[i] + "':" + data + "";
        };
    }
    if (_data_id == undefined) {
        saveorupdate_str = saveorupdate_str.substring(1);
    }
    saveorupdate_str = "{" + saveorupdate_str + "}";
    var param = eval("(" + saveorupdate_str + ")");

    if (_getSave != "") {
        _getSave(param);
    }

    $.post(_saveorupdateurl, param, function(data) {

        if (data) {
            if (_issave) {
                initDg(_post_param, _dg_param);
                showMsg("添加成功");
            } else {
                 if (_beforeUpdate != "") {
                    _beforeUpdate(param);
                }
                showMsg("更新成功");
            }
        } else {
            showMsg("操作失败");
        }
    }, 'json');

}

function cancelrow(target) {
    if (_onCancel != "") {
        _onCancel();
    }
    if (_beforeCancel != "") {
            _beforeCancel();
    }
    $('#dg').datagrid('unselectRow', getRowIndex(target));
    $('#dg').datagrid('cancelEdit', getRowIndex(target));
}

function insert() {
    _isEditRowId = "";
    for (var i = 0; i < $('#dg').datagrid('getSelections').length; i++) {
        var r_i = $('#dg').datagrid('getSelections')[i];
        $('#dg').datagrid('cancelEdit', getRowIndex(r_i));
    }
    $('#dg').datagrid('unselectAll');
    $('#dg').datagrid('insertRow', {
        index : 0,
        row : {
            status : 'P'
        }
    });
    $('#dg').datagrid('selectRow', 0);
    $('#dg').datagrid('beginEdit', 0);
}

var checkname = false;
function createEdit() {
    var obj = {
        init : function(container, options) {
            var input = $('<input type="text" class="datagrid-editable-input">').appendTo(container);
            if (options.myRules != null) {
                if (options.myRules.type != null && options.myRules.rege != null && options.myRules.message != null) {
                    var type = options.myRules.type;
                    var rule = {
                        validator : function(value, param) {
                            var validflag = false;
                            if (options.myRules.rege.test(value)) {
                                validflag = true;
                            }
                            return validflag;
                        },
                        message : options.myRules.message
                    };
                    $.extend($.fn.validatebox.defaults.rules, eval("({" + type + ":rule})"));
                }
                if (options.myRules.newRule != null) {
                    $.extend($.fn.validatebox.defaults.rules, options.myRules.newRule);
                }

            }
            if (options.ajaxCheck != null) {
                var _checkFieldName = options.ajaxCheck.substring(0, 1).toUpperCase() + options.ajaxCheck.substring(1);
                var _checkParam = "";
                $(input).blur(function() {
                    var _this = $(this);
                    _checkParam = "";
                    _checkParam = "'" + _obj + ".id':'" + _isEditRowId + "'";
                    _checkParam += ",'" + _obj + "." + options.ajaxCheck + "':'" + $(_this).val() + "'";

                    _checkParam = eval("({" + _checkParam + "})");

                    $.post("./" + _actionName + "_check" + _checkFieldName + ".action", _checkParam, function(data) {
                        if (options.validateRule != null) {
                            if (options.validateRule.validType != null) {
                                options.validateRule.validType.push('ajaxRule');
                                $(_this).validatebox({
                                    validType : options.validateRule.validType
                                })
                            } else {
                                $(_this).validatebox({
                                    validType : 'ajaxRule'
                                });
                            }
                        } else {
                            $(_this).validatebox({
                                validType : 'ajaxRule'
                            });
                        }

                        $.extend($.fn.validatebox.defaults.rules, {
                            ajaxRule : {
                                validator : function(value, param) {
                                    return data;
                                },
                                message : '该项是唯一的！'
                            }
                        });
                        $(_this).validatebox("validate");
                    }, 'json');

                });

            }
            if (options.inputClick != null) {
                $(input).click(options.inputClick);
            }

            /*
             * if (options.inputReady != null) {
             * $(input).ready(options.inputReady); }
             */
             if (options.inputEdit != null) { if (options.inputEdit) {
              $(input).attr("readOnly", false); } else {
              $(input).attr("readOnly", true); } }
             
            $(input).validatebox(options.validateRule);
            $(input).validatebox({
                tipPosition : "bottom"
            });
            return input;
        },
        getValue : function(target) {
            return $(target).val();
        },
        setValue : function(target, value) {
            $(target).val(value);
        },
        resize : function(target, width) {
            var input = $(target);
            if ($.boxModel == true) {
                input.width(width - (input.outerWidth() - input.width()) - 5);
            } else {
                input.width(width - 5);
            }
        }
    };
    $.extend($.fn.datagrid.defaults.editors, eval("({_newEditor:obj})"));
    return "_newEditor";
}

function showMsg(addmsg) {
    $.messager.show({
        title : '消息提示',
        msg : addmsg,
        showType : 'show',
        timeout : 1500,
        style : {
            right : '',
            top : document.body.scrollTop + document.documentElement.scrollTop,
            bottom : ''
        }
    });
}

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
function createCombobox(obj) {
    var _comobj = {
        init : function(_5f1, _5f2) {
            var _5f3 = $("<input type=\"text\">").appendTo(_5f1);
            _5f3.combobox({
                data : _getObjData(obj),
                valueField : 'id',
                textField : 'text'
            });
            _5f3.combobox(_5f2 || {});
            _5f3.combobox('reload', _getComboboxData(obj));
            return _5f3;
        },
        destroy : function(_5f4) {
            $(_5f4).combobox("destroy");
        },
        getValue : function(_5f5) {
            return {
                id : $(_5f5).combobox("getValue")
            };
        },
        setValue : function(_5f6, _5f7) {
            if (_5f7 != null) {
                $(_5f6).combobox("setValue", _5f7.id);
            } else {
                $(_5f6).combobox("setValue", "");
            }
        },
        resize : function(_5f8, _5f9) {
            $(_5f8).combobox("resize", _5f9);
        }
    };
    $.extend($.fn.datagrid.defaults.editors, eval("({" + "_newcombobox_" + obj + ":_comobj})"));
    return "_newcombobox_" + obj;
}

function createDatetimebox(obj) {
    $.extend($.fn.datagrid.defaults.editors, {
        datetimebox : {
            init : function(_5e8, _5e9) {
                var _5ea = $("<input type=\"text\">").appendTo(_5e8);
                _5ea.datetimebox(_5e9);
                return _5ea;
            },
            destroy : function(_5eb) {
                $(_5eb).datebox("destroy");
            },
            getValue : function(_5ec) {
                return $(_5ec).datebox("getValue").replace("T", " ");
            },
            setValue : function(_5ed, _5ee) {
                if (_5ee != undefined) {
                    $(_5ed).datebox("setValue", _5ee.replace("T", " "));
                } else {
                    $(_5ed).datebox("setValue", "");
                }
            },
            resize : function(_5ef, _5f0) {
                $(_5ef).datebox("resize", _5f0);
            }
        }
    });
    return "datetimebox";
}

function createFile(formId, fileName) {
    $.extend($.fn.datagrid.defaults.editors, {
        fileName : {
            init : function(_5e8, _5e9) {
                var _5ea = $("<form action='' enctype='multipart/form-data'>" + "<input type=\"file\">" + "</form>").appendTo(_5e8);
                _5ea.datetimebox(_5e9);
                return _5ea;
            },
            destroy : function(_5eb) {
                $(_5eb).datebox("destroy");
            },
            getValue : function(_5ec) {
                return $(_5ec).datebox("getValue").replace("T", " ");
            },
            setValue : function(_5ed, _5ee) {
                if (_5ee != undefined) {
                    $(_5ed).datebox("setValue", _5ee.replace("T", " "));
                } else {
                    $(_5ed).datebox("setValue", "");
                }
            },
            resize : function(_5ef, _5f0) {
                $(_5ef).datebox("resize", _5f0);
            }
        }
    });
    return "file";
}
