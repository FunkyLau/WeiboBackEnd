$(document).ready(function() {
    $(".closeDiv").mouseover(function() {
        $(this).css({
            "background-position" : "0px -92px",
            "cursor" : "pointer"
        }).click(function() {
            $(".prompt_bgcolor").hide();
            $(".prompt_div").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "-17px -92px");
    });
    $(".closeAtt").mouseover(function() {
        $(this).css({
            "background-position" : "0px -92px",
            "cursor" : "pointer"
        }).click(function() {
            $(".prompt_cancelAtt").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "-17px -92px");
    });

    $(".closeNote").mouseover(function() {
        $(this).css({
            "background-position" : "0px -92px",
            "cursor" : "pointer"
        }).click(function() {
            $(".prompt_note").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "-17px -92px");
    });
    
    $(".closeFans").mouseover(function() {
        $(this).css({
            "background-position" : "0px -92px",
            "cursor" : "pointer"
        }).click(function() {
            $(".prompt_removeFans").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "-17px -92px");
    });
    
    
    $(".prompt_save").mouseover(function() {
        $(this).css({
            "background-position" : "0px -46px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px 0px");
    });

    $(".prompt_close").mouseover(function() {
        $(this).css({
            "background-position" : "0px -69px",
            "cursor" : "pointer"
        }).click(function() {
           $(".prompt_bgcolor").hide();
            $(".prompt_div").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px -23px");
    });
    $(".prompt_closeAtt").mouseover(function() {
        $(this).css({
            "background-position" : "0px -69px",
            "cursor" : "pointer"
        }).click(function() {
           $(".prompt_cancelAtt").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px -23px");
    });

    $(".prompt_closeNote").mouseover(function() {
        $(this).css({
            "background-position" : "0px -69px",
            "cursor" : "pointer"
        }).click(function() {
           $(".prompt_note").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px -23px");
    });
    
    $(".prompt_closeFans").mouseover(function() {
        $(this).css({
            "background-position" : "0px -69px",
            "cursor" : "pointer"
        }).click(function() {
           $(".prompt_removeFans").hide();
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px -23px");
    });
    
    if ($("#searchFlag").val() == "secret") {
        $(".content_div_left_div").each(function(i) {
            $("#div_secret").css("background-color", "");
        });
        $("#div_secret").css("background-color", "#fafafa");
        $(".left_text").css({
            "font-weight" : "normal"
        });
        $("#div_secret").find(".left_text").css({
            "font-weight" : "bold"
        });
        $("#left_attentions_ico").css("background-position", "0px 0px");
        $("#left_secret_ico").css("background-position", "0px -48px");
        $("#left_fance_ico").css("background-position", "0px -24px");
        $("#left_finduser_ico").css("background-position", "0px -100px");
        $("#left_guess_ico").css("background-position", "0px -124px");
        $("#div_secret").find("#left_secret_ico").css("background-position", "-25px -48px");

        $("#attentions_group").hide();
    } else if ($("#searchFlag").val() == "fans") {
        $(".content_div_left_div").each(function(i) {
            $("#div_fans").css("background-color", "");
        });
        $("#div_fans").css("background-color", "#fafafa");
        $(".left_text").css({
            "font-weight" : "normal"
        });
        $("#div_fans").find(".left_text").css({
            "font-weight" : "bold"
        });
        $("#left_attentions_ico").css("background-position", "0px 0px");
        $("#left_secret_ico").css("background-position", "0px -48px");
        $("#left_fance_ico").css("background-position", "0px -24px");
        $("#left_finduser_ico").css("background-position", "0px -100px");
        $("#left_guess_ico").css("background-position", "0px -124px");
        $("#div_fans").find("#left_fance_ico").css("background-position", "-25px -24px");

        $("#attentions_group").hide();
    } else if ($("#searchFlag").val() == "searchUsers") {
        $(".content_div_left_div").each(function(i) {
            $("#div_finduser").css("background-color", "");
        });
        $("#div_finduser").css("background-color", "#fafafa");
        $(".left_text").css({
            "font-weight" : "normal"
        });
        $("#div_finduser").find(".left_text").css({
            "font-weight" : "bold"
        });
        $("#left_attentions_ico").css("background-position", "0px 0px");
        $("#left_secret_ico").css("background-position", "0px -48px");
        $("#left_fance_ico").css("background-position", "0px -24px");
        $("#left_finduser_ico").css("background-position", "0px -100px");
        $("#left_guess_ico").css("background-position", "0px -124px");
        $("#div_finduser").find("#left_finduser_ico").css("background-position", "-25px -100px");

        $("#attentions_group").hide();
    }else {
        if (($("#searchFlag").val() == "all") || ($("#searchFlag").val() == "special") || ($("#searchFlag").val() == "star") || ($("#searchFlag").val() == "friend") || ($("#searchFlag").val() == "schoolmate") || ($("#searchFlag").val() == "colleague") || ($("#searchFlag").val() == "family") || ($("#searchFlag").val() == "secret")) {
            $(".content_div_left_div").each(function(i) {
                $("#div_all").css("background-color", "");
            });
            $("#div_all").css("background-color", "#fafafa");
            $(".left_text").css({
                "font-weight" : "normal"
            });
            $("#div_all").find(".left_text").css({
                "font-weight" : "bold"
            });
            $("#left_attentions_ico").css("background-position", "0px 0px");
            $("#left_secret_ico").css("background-position", "0px -48px");
            $("#left_fance_ico").css("background-position", "0px -24px");
            $("#left_finduser_ico").css("background-position", "0px -100px");
            $("#left_guess_ico").css("background-position", "0px -124px");
            $("#div_all").find("#left_attentions_ico").css("background-position", "-25px 0px");

            $("#attentions_group").hide();
        }

        if ($("#searchFlag").val() == "all") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#all").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
            
        } else if ($("#searchFlag").val() == "special") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#special").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
            
        } else if ($("#searchFlag").val() == "star") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#star").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
        } else if ($("#searchFlag").val() == "friend") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#friend").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
        } else if ($("#searchFlag").val() == "schoolmate") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#schoolmate").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
        } else if ($("#searchFlag").val() == "colleague") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#colleague").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
        } else if ($("#searchFlag").val() == "family") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#family").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
        } else if ($("#searchFlag").val() == "secret") {
            $(".attentions_group_div").each(function(i) {
                $(this).css("background-color", "");
            });
            $("#secret").css("background-color", "#E5E5E5");
            $(".group_div").css("height", "30px");
        }
        $("#attentions_group").show();
        /*
        $(".attentions_group_div").each(function(i) {
                    $(this).css("background-color", "");
               });
                $("#attentions_group").show();
                $(this).css("background-color", "#E5E5E5");
                $(".group_div").css("height", "30px");*/
        
    }
    //$("#attentions_group").hide();
    $(".div_left_div").mouseover(function() {
        $(this).css({
            "background-color" : "#E5E5E5",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css({
            "background-color" : "",
            "cursor" : "pointer"
        });
    });
    $(".content_div_left_div").click(function() {
        $(".content_div_left_div").each(function(i) {
            $(this).css("background-color", "");
        });
        $(this).css("background-color", "#fafafa");
        $(".left_text").css({
            "font-weight" : "normal"
        });
        $(this).find(".left_text").css({
            "font-weight" : "bold"
        });

        if ($(this).find("#left_attentions_ico").size() > 0) {
            $("#right_top_titile")[0].innerHTML = "全部关注";
        }
        if ($(this).find("#left_secret_ico").size() > 0) {
            $("#right_top_titile")[0].innerHTML = "悄悄关注";
        }
        if ($(this).find("#left_fance_ico").size() > 0) {
            $("#right_top_titile")[0].innerHTML = "粉丝";
        }
        if ($(this).find("#left_finduser_ico").size() > 0) {
            $("#right_top_titile")[0].innerHTML = "找人";
        }
        if ($(this).find("#left_guess_ico").size() > 0) {
            $("#right_top_titile")[0].innerHTML = "猜你喜欢";
        }

        $("#left_attentions_ico").css("background-position", "0px 0px");
        $("#left_secret_ico").css("background-position", "0px -48px");
        $("#left_fance_ico").css("background-position", "0px -24px");
        $("#left_finduser_ico").css("background-position", "0px -100px");
        $("#left_guess_ico").css("background-position", "0px -124px");
        $(this).find("#left_attentions_ico").css("background-position", "-25px 0px");
        $(this).find("#left_secret_ico").css("background-position", "-25px -48px");
        $(this).find("#left_fance_ico").css("background-position", "-25px -24px");
        $(this).find("#left_finduser_ico").css("background-position", "-25px -100px");
        $(this).find("#left_guess_ico").css("background-position", "-25px -124px");

    });

    $(".group_div").mouseover(function() {
        $(this).css({
            "background-color" : "#E5E5E5",
            "cursor" : "pointer"
        }).click(function() {
            $(".group_text").css({
                "font-weight" : "normal"
            });
            $(this).find(".group_text").css({
                "font-weight" : "bold"
            });
        });
    }).mouseout(function() {
        $(this).css({
            "background-color" : "",
            "cursor" : "pointer"
        });
    });

    $(".attentions_group_div").click(function() {
        $(".attentions_group_div").each(function(i) {
            $(this).css("background-color", "");
        });
        $(this).css("background-color", "#E5E5E5");
    });

    $(".user_id").hide();
    $(".userinfo_operate").hide();
    $(".attention_userinfo").mouseover(function() {
        $(this).css({
            "width" : "248px",
            "height" : "98px",
            "border" : "#FFA10D solid 2px",
            "cursor" : "pointer"
        });
        $(this).find(".userinfo_operate").show();
        $(this).find(".userinfo_intro").hide();
        if (userInfoDivStr.indexOf($(this).find(".user_id input").attr("value")) == -1) {
            $(this).find(".select_gif").attr("value", "selected").css("background", "url(./images/select.gif)");
        } else {
            $(this).find(".select_gif").attr("value", "selected").css("background", "url(./images/selected.gif)");
        }

    }).mouseout(function() {
        $(this).css({
            "width" : "250px",
            "height" : "100px",
            "border" : "#E6E6E6 solid 1px"
        });
        $(this).find(".userinfo_operate").hide();
        $(this).find(".userinfo_intro").show();
        if (userInfoDivStr.indexOf($(this).find(".user_id input").attr("value")) == -1) {
            $(this).children(".select_gif").css("background", "#fafafa");
        } else {
            $(this).find(".select_gif").attr("value", "selected").css("background", "url(./images/selected.gif)");
        }
    });

});
function showPrompt(obj) {
    $(".pdiv_center_center")[0].innerHTML = "为"+$(obj).parent().find("input").val()+"选择分组";
    $("#prompt_userId").attr("value",$(obj).parent().parent().parent().find(".user_id input").val());
    
    $(".prompt_bgcolor").show();
    $(".prompt_div").show();
}
function showCancelAtt(obj) {
    $(".cancelAtt_center")[0].innerHTML = "确定要取消对"+$(obj).parent().find("input").val()+"的关注吗？";
    $("#cancelAtt_userId").attr("value",$(obj).parent().parent().parent().find(".user_id input").val());
    $(".prompt_cancelAtt").show();
}
function showNote(obj) {
    //$(".cancelAtt_center")[0].innerHTML = "确定要取消对"+$(obj).parent().find("input").val()+"的关注吗？";
    $("#Note_userId").attr("value",$(obj).parent().parent().parent().find(".user_id input").val());
    $(".prompt_note").show();
}
function removeFans(obj) {
    $(".removeFans_center")[0].innerHTML = "确定要移除"+$(obj).parent().find("input").val()+"粉丝吗？";
    $("#removeFans_userId").attr("value",$(obj).parent().parent().parent().find(".user_id input").val());
    $(".prompt_removeFans").show();
}
var userInfoDivStr = "";
function userInfoDivClick(obj) {
    var userIdValue = $(obj).find(".user_id input").attr("value");
    if (userInfoDivStr.indexOf(userIdValue) == -1) {
        userInfoDivStr += userIdValue + ",";
        $(obj).find(".select_gif").attr("value", "selected").css("background", "url(./images/selected.gif)");
    } else {
        userInfoDivStr = userInfoDivStr.replace(userIdValue + ",", "");
        $(obj).find(".select_gif").attr("value", "selected").css("background", "url(./images/select.gif)");
    }
    $("#chooseUsersIds").attr("value", userInfoDivStr);
    //alert(userInfoDivStr);
}

function groupShow() {

    if ($("#searchFlag").val() != "fans" || $("#searchFlag").val() != "secret") {
        $("#attentions_group").show();
        $(".group_div").css("height", "30px");
    } else {
        $("#attentions_group").hide();
    }
}

function groupHide() {
    $("#attentions_group").hide();
}

function searchUsers() {
    $("#searchA").attr("href", './UsersAction_searchUsers.action?searchKey=searchUsers&searchValue=' + $("#search_input").val());
}
