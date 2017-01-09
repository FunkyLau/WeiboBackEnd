$(document).ready(function() {
    $("#blockjb_info_edit").hide();
    $('#info_show_button_div').mouseover(function() {
        $(this).css({
            "background-position" : "0px -23px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px 0px");
    });

    //返回顶部的实现
    var navH = $("#page_anchor").offset().top;
    $(window).scroll(function() {
        var scroH = $(this).scrollTop();
        if (scroH > navH) {
            $("#page_anchor").show();
        } else {
            $("#page_anchor").hide();
        }
    });

    $("#page_anchor").mouseover(function() {
        $(this).css({
            "background-position" : "-81px 0px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "-56px 0px");
    });
    //头像部分
    $("#headphoto_top").mouseover(function() {
        $("#headphoto_change").show().mouseover(function() {
            $(this).show().css({
                "background-position" : "0px -116px",
                "cursor" : "pointer"
            });
        }).mouseout(function() {
            $(this).show().css({
                "background-position" : "0px -93px"
            });
        });
    }).mouseout(function() {
        $("#headphoto_change").hide();
    });

    $('#headphoto_top2').mouseover(function() {
        $("#headphoto_change").show().mouseover(function() {
            $(this).show().css({
                "background-position" : "0px -116px",
                "cursor" : "pointer"
            });
        }).mouseout(function() {
            $(this).show().css({
                "background-position" : "0px -93px"
            });
        });
    }).mouseout(function() {
        $("#headphoto_change").hide();
    });

    $("#pagediv_prev").mouseover(function() {
        $(this).css({
            "background-position" : "0px -23px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px 0px");
    });

    $("#pagediv_next").mouseover(function() {
        $(this).css({
            "background-position" : "0px -69px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "0px -46px");
    });

    blogtitleclick();

    $("#blogtitle_bottom div").click(function() {
        $("#blogtitle_bottom div").each(function(i) {
            $(this).css("background-color", "#fafafa").children("a").css("color", "#0a8cd2");
        });
        $(this).css({
            "background-color" : "#e6e6e6"
        }).children("a").css("color", "#000");

    });

    $(".rightdiv_agreelabel").click(function() {
        $(this).css("background-position", "-100px 0px");
    });

    $(".rightdiv_hidediv").hide();
    $(".content_div_bloginfo").mouseover(function() {
        $(this).find(".rightdiv_hidediv").show();
    }).mouseout(function() {
        $(this).find(".rightdiv_hidediv").hide();
    });
    $(".content_div_blogat").mouseover(function() {
        $(this).find(".rightdiv_hidediv").show();
    }).mouseout(function() {
        $(this).find(".rightdiv_hidediv").hide();
    });

    navigation();
    $("#pageflag").hide();

    $(".editico").mouseover(function() {
        $(this).css("background-position", "-100px -147px");
    }).mouseout(function() {
        $(this).css("background-position", "-75px -147px");
    });

    $("#maindiv_blockjb_edit").hide();
    $("#savebtn_jb").mouseover(function() {
        $(this).css({
            "background-position" : "-47px 32px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "-47px 1px");
    });

    $("#maindiv_blocklx_edit").hide();
    $("#savebtn_lx").mouseover(function() {
        $(this).css({
            "background-position" : "-47px 32px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "-47px 1px");
    });

    $("#maindiv_blockzy_edit").hide();
    $("#savebtn_zy").mouseover(function() {
        $(this).css({
            "background-position" : "-47px 32px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "-47px 1px");
    });
    $("#maindiv_blockjy_edit").hide();
    $("#savebtn_jy").mouseover(function() {
        $(this).css({
            "background-position" : "-47px 32px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "-47px 1px");
    });
    $("#maindiv_blockbq_edit").hide();
    $("#savebtn_bq").mouseover(function() {
        $(this).css({
            "background-position" : "-47px 32px",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $(this).css("background-position", "-47px 1px");
    });

    $("#province").hide();
    $("#city").hide();
    $("#uiAddress").click(function() {
        $("#province").show();
        $("#city").show();
        $(this).hide();
    });

    //$("#txtName").attr("value",new Date().toLocaleString());
    $("input.date").jSelectDate({
        css : "date",
        yearBeign : 1900,
        disabled : false
    });
    $("#signInput").hide();
    var signInputValue=$("#signInput").val();
    if(signInputValue!=null){
        var signSplit=signInputValue.split("-");
        $("#signText")[0].text=getAstro(signSplit[1],signSplit[2])+"座";
    }
    
    
    
    
});

function checkValue(){
    var qqValue=document.getElementById("checkQQ");
       if(isNaN(qqValue.value)){
           qqValue.value.replace(/[^0-9]+/,'');
       }
   
}
function getAstro(month,day){    
    var s="魔羯水瓶双鱼牡羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    var arr=[20,19,21,21,21,22,23,23,23,23,22,22];
    return (s.substr(month*2-(day<arr[month-1]?2:0),2));
}


$(this).jSelectDate;
function changeAddress() {
    $("#uiAddress").attr("value", $("#province").val() + " " + $("#city").val());
}

function blogtitleclick() {
    $("#top_all_ico").css({
        "width" : "42px",
        "height" : "16px",
        "border" : "0px",
        "background-color" : "#fafafa",
        "background-image" : "url(./images/icon.png)",
        "background-position" : "-501px -141.5px"
    });
    $("#blogtitle_top_weibo").mouseover(function() {
        $("#top_weibo_text").css({
            "color" : "#0a8cd2",
            "cursor" : "pointer"
        });
    }).mouseout(function() {
        $("#top_weibo_text").css({
            "color" : "#000000"
        });
    }).click(function() {
        $("#top_weibo_text").css({
            "width" : "42px",
            "height" : "15px",
            "font-size" : "13px",
            "font-weight" : "bold",
            "text-align" : "center",
            "background-color" : "#fafafa"
        });

        $("#top_weibo_ico").css({
            "width" : "44px",
            "height" : "16px",
            "border" : "0px",
            "background-image" : "url(./images/icon.png)",
            "background-position" : "-501px -141.5px"
        });

        $("#top_weibo_ico").show();
        $("#top_all_ico").hide();

        $("#blogtitle_top_all").css({
            "width" : "42px",
            "height" : "15px",
            "background-color" : "#fafafa"
        });

        $("#top_all_text").css({
            "width" : "42px",
            "height" : "15px",
            "font-size" : "13px",
            "font-weight" : "normal",
            "text-align" : "center",
            "background-color" : "#fafafa"
        }).mouseover(function() {
            $("#top_all_text").css({
                "color" : "#0a8cd2",
                "cursor" : "pointer"
            });
        }).mouseout(function() {
            $("#top_all_text").css({
                "color" : "#000000"
            });
        });
    });
    //blogtitle_top_all
    $("#blogtitle_top_all").click(function() {
        $("#top_all_text").css({
            "width" : "42px",
            "height" : "15px",
            "font-size" : "13px",
            "font-weight" : "bold",
            "text-align" : "center",
            "background-color" : "#fafafa"
        });

        $("#top_weibo_ico").hide();
        $("#top_all_ico").show();

        $("#blogtitle_top_weibo").css({
            "width" : "42px",
            "height" : "15px",
            "background-color" : "#fafafa"
        });

        $("#top_weibo_text").css({
            "width" : "42px",
            "height" : "15px",
            "font-size" : "13px",
            "font-weight" : "normal",
            "text-align" : "center",
            "background-color" : "#fafafa"
        }).mouseover(function() {
            $("#top_weibo_text").css({
                "color" : "#0a8cd2",
                "cursor" : "pointer"
            });
        }).mouseout(function() {
            $("#top_weibo_text").css({
                "color" : "#000000"
            });
        });
    });
}

function navigation() {
    var pageFlagValue = $("#pageflag").attr("value");

    if (pageFlagValue == "userinfo") {
        $("#navigation_userinfo").css({
            "height" : "54px",
            "background-color" : "#fafafa",
            "border-bottom" : "0px"
        });
        userinfoClick();
    }
    $("#navigation_index").mouseover(function() {
        $(this).css("cursor", "pointer").click(function() {
            $(this).css({
                "height" : "54px",
                "background-color" : "#fafafa",
                "border-bottom" : "0px"
            });
            indexClick();

        });
    });
    $("#navigation_userinfo").mouseover(function() {
        $(this).css("cursor", "pointer").click(function() {
            $(this).css({
                "height" : "54px",
                "background-color" : "#fafafa",
                "border-bottom" : "0px"
            });
            userinfoClick();
        });
    });
    $("#navigation_fance").mouseover(function() {
        $(this).css("cursor", "pointer").click(function() {
            $(this).css({
                "height" : "54px",
                "background-color" : "#fafafa",
                "border-bottom" : "0px"
            });
            fanceClick();

        });
    });
    $("#navigation_photos").mouseover(function() {
        $(this).css("cursor", "pointer").click(function() {
            $(this).css({
                "height" : "54px",
                "background-color" : "#fafafa",
                "border-bottom" : "0px"
            });
            photosClick();

        });
    });
}

function indexClick() {
    $("#navigation_index_showdiv").show();
    $("#userinfo_showdiv_maindiv").hide();
    $("#fance_showdiv_maindiv").hide();
    $("#photos_showdiv_maindiv").hide();
    $("#navigation_userinfo").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_fance").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_photos").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#index_bg").css("background-position", "-48px 0px");
    $("#index_ico").css("background-position", "0px 0px");
    $("#userinfo_bg").css("background-position", "0px 0px");
    $("#userinfo_ico").css("background-position", "0px -25px");
    $("#fance_bg").css("background-position", "0px 0px");
    $("#fance_ico").css("background-position", "0px -50px");
    $("#photos_bg").css("background-position", "0px 0px");
    $("#photos_ico").css("background-position", "0px -75px");
}

function userinfoClick() {
    $("#navigation_index_showdiv").hide();
    $("#userinfo_showdiv_maindiv").show();

    $(".tool_btn_jb").mouseover(function() {
        $(this).css({
            "cursor" : "pointer",
            "background-position" : "0px 30px"
        }).click(function() {
            $("#maindiv_blockjb").hide();
            $("#maindiv_blockjb_edit").show();
        });
    }).mouseout(function() {
        $(this).css({
            "background-position" : "0px 1px"
        });
    });

    $(".tool_btn_lx").mouseover(function() {
        $(this).css({
            "cursor" : "pointer",
            "background-position" : "0px 30px"
        }).click(function() {
            $("#maindiv_blocklx").hide();
            $("#maindiv_blocklx_edit").show();
        });
    }).mouseout(function() {
        $(this).css({
            "background-position" : "0px 1px"
        });
    });

    $(".tool_btn_zy").mouseover(function() {
        $(this).css({
            "cursor" : "pointer",
            "background-position" : "0px 30px"
        }).click(function() {
            $("#maindiv_blockzy").hide();
            $("#maindiv_blockzy_edit").show();
        });
    }).mouseout(function() {
        $(this).css({
            "background-position" : "0px 1px"
        });
    });

    $(".tool_btn_jy").mouseover(function() {
        $(this).css({
            "cursor" : "pointer",
            "background-position" : "0px 30px"
        }).click(function() {
            $("#maindiv_blockjy").hide();
            $("#maindiv_blockjy_edit").show();
        });
    }).mouseout(function() {
        $(this).css({
            "background-position" : "0px 1px"
        });
    });

    $(".tool_btn_bq").mouseover(function() {
        $(this).css({
            "cursor" : "pointer",
            "background-position" : "0px 30px"
        }).click(function() {
            $("#maindiv_blockbq").hide();
            $("#maindiv_blockbq_edit").show();
        });
    }).mouseout(function() {
        $(this).css({
            "background-position" : "0px 1px"
        });
    });

    $("#fance_showdiv_maindiv").hide();
    $("#photos_showdiv_maindiv").hide();

    $("#navigation_index").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_fance").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_photos").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });

    $("#index_bg").css("background-position", "0px 0px");
    $("#index_ico").css("background-position", "-2px 0px");
    $("#userinfo_bg").css("background-position", "-48px 0px");
    $("#userinfo_ico").css("background-position", "2px -25px");
    $("#fance_bg").css("background-position", "0px 0px");
    $("#fance_ico").css("background-position", "0px -50px");
    $("#photos_bg").css("background-position", "0px 0px");
    $("#photos_ico").css("background-position", "0px -75px");
}

function fanceClick() {
    $("#navigation_index_showdiv").hide();
    $("#userinfo_showdiv_maindiv").hide();
    $("#fance_showdiv_maindiv").show();
    $("#photos_showdiv_maindiv").hide();
    $("#navigation_index").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_userinfo").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_photos").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#index_bg").css("background-position", "0px 0px");
    $("#index_ico").css("background-position", "-2px 0px");
    $("#userinfo_bg").css("background-position", "0px 0px");
    $("#userinfo_ico").css("background-position", "0px -25px");
    $("#fance_bg").css("background-position", "-48px 0px");
    $("#fance_ico").css("background-position", "2px -50px");
    $("#photos_bg").css("background-position", "0px 0px");
    $("#photos_ico").css("background-position", "0px -75px");
}

function photosClick() {
    $("#navigation_index_showdiv").hide();
    $("#userinfo_showdiv_maindiv").hide();
    $("#fance_showdiv_maindiv").hide();
    $("#photos_showdiv_maindiv").show();
    $("#navigation_index").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_userinfo").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });
    $("#navigation_fance").css({
        "height" : "53px",
        "background-color" : "#f2f2f2",
        "border-bottom" : "1px"
    });

    $("#index_bg").css("background-position", "0px 0px");
    $("#index_ico").css("background-position", "-2px 0px");
    $("#userinfo_bg").css("background-position", "0px 0px");
    $("#userinfo_ico").css("background-position", "0px -25px");
    $("#fance_bg").css("background-position", "0px 0px");
    $("#fance_ico").css("background-position", "0px -50px");
    $("#photos_bg").css("background-position", "-48px 0px");
    $("#photos_ico").css("background-position", "2px -75px");
}
function searchUsers() {
    $("#searchA").attr("href", './UsersAction_searchUsers.action?searchKey=searchUsers&searchValue=' + $("#search_input").val());
}