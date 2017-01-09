/**
 * this通常指向的是我们正在执行的函数本身，或者指向该函数所属的对象（运行时）。
 */
 $(function(){
 	$("#logo_img").mouseover(function(){
 		$(this).css("background-position","0 -39px");
 		
 	}).mouseout(function(){
 		$(this).css("background-position","0 0");
 	});
 	var ctimeout = null;
 	var _this = null;
 	$("#user_vip,#user_setting,#user_message,#user_login,#bar_app,#bar_weiba,#bar_game,#bar_index").mouseover(function(){
 		if(!$(this).hasClass("topbar_nowpage")){
 			$(this).addClass("topbar_mouseover");
 		}
 	}).mouseout(function(){
 		if(!$(this).hasClass("topbar_nowpage")){
 			$(this).removeClass("topbar_mouseover");
 		}
 	});
 	$("#user_weibo").mouseover(function(){
 		if($("#weibo_show").css("display")=='none'){
 			$(this).addClass("topbar_mouseover");
 		}
 	}).mouseout(function(){
 		$(this).removeClass("topbar_mouseover");
 	});
 	$(document).click(function(){
 		$("#user_weibo").children().children().children("ico").css("background-position","-48px 1px");
 		$("#weibo_show").hide();
 	});
 	$("#user_weibo").click(function(e){
 		$("#user_weibo").children().children().children("ico").css("background-position","-48px -24px");
 		$("#weibo_show").show();
 		e.stopPropagation();
 	});
 	
 	$("#bar_app,#bar_weiba,#bar_game").mouseenter(function(){
 		//当鼠标进入某个控件的区域，自动获取这个控件对象的指针为this（动态）
 		_this = $(this);
 		
 		ctimeout = setTimeout(function(){
 			_this.css({
 				"background-color":"white",
 				"height":"41px",
 				"background-position":"-86px -349px",
 				"border-right":"solid black 1px",
 				"width":"67px",
 				"border-left":"solid black 1px",
 				"opacity":"1"
 			});
 			_this.children().children("span").css("color","black");
 			_this.children("div").show();
 		},500);//setTimeout(指定要执行的method,指定的等候时间);
 	}).mouseleave(function(){
 		clearTimeout(ctimeout);
 		_this=$(this);
 		_this.css({
 			"background-color":"",
 			"height":"37px",
 			"width":"69px",
 			"background-position":"-86px -376px",
 			"border":"none",
 			"opacity":"0.9"
 		});
 		_this.children().children("span").css("color","white");
 		_this.children("div").hide();
 	});
 	
 	$("#user_vip,#user_setting,#user_message").mouseenter(function(){
 	
 		_this = $(this);
 		if(!_this.hasClass("ico")){
 		
 			ctimeout = setTimeout(function(){
 				_this.css({
 					"background-color":"white",
 					"height":"39px",
 					"width":"42px",
 					"opacity":"1",
 					"border-right":"solid black 1px",
 					"border-left":"solid black 1px"
 				});
 				_this.children("div").show();
 				if(_this.attr("id") == "user_message"){
 					_this.children().chrilren().children(".ico").css(
 					"background-position","-48px -74px"
 					);
 				}
 				if(_this.attr("id")=="user_setting"){
 					_this.children().children().children(".ico").css("background-position","-48px -125px");
 				}
 				if(_this.attr("id")=="user_vip"){
 					_this.children().children().children(".ico").css("background-position","-48px -199px");
 				}
 			},500);
 		}
 	}).mouseleave(function(){
 		clearTimeout(ctimeout);
 		_this = $(this);
 		
 		_this.css({
 			"background-color":"white",
 					"height":"39px",
 					"width":"42px",
 					"opacity":"1",
 					"border":"none"
 		});
 		_this.children("div").hide();
 		
 		if(_this.attr("id") == "user_message"){
 			if($("#new_msg").css("display")!="none"){
 				$("#user_message").children().children().children(".ico").css("background-position","-48px -149px");
 			}else{
 				_this.children().children().children(".ico").css("background-position","-48px -49px");
 			}
 		}
 		if(_this.attr("id") == "user_setting"){
 			_this.children().children().children(".ico").css("background-position","-48px -100px");
 		}
 		if(_this.attr("id") == "user_vip"){
 			_this.children().children().children(".ico").css("background-position","-48px -174px");
 		}
 	});
 	$("#search_input").val("搜索微博、找人");
 	$("#top_search,#search_btn").mouseover(function(){
 		if($("#search_input").val() == "搜索微博、找人"){
 			$("#top_search").css("background-position","-237px -5px");
 			$("#search_input").css("background-color","white");
 		}
 	}).mouseout(function(){
 		if($("#search_input").val=="搜索微博、找人"){
 			$("#top_search").css("background-position","0 -5px");
 			$("#search_input").css("background-color","rgb(235,240,240)");
 		}
 	});
 	$("#search_input").focus(function(){
 		if($(this).val() == "搜索微博、找人"){
 			$(this).val("");
 		}
 		$("#search_btn").css({
 			"background-image":'url("./images/bg_line.png")',
 			"background-position":"-740px -5px"
 		}).mouseover(function(){
 			$(this).css("background-position","-718px -5px");
 		}).mouseout(function(){
 			$("#search_btn").css("background-position","-740px -5px");
 		});
 	
 	$("#top_search").css("background-position","-474px -5px");
 	$(this).css({
 		"background-color":"white",
 		"color":"#333"
 	});
 }).blur(function(e){
 	if("" == $.trim($("#search_input").val())){
 		$("#search_input").val("搜索微博、找人");
 	}
 	$("#search_btn").css("background-image",'url("")');
 	$("#top_search").css("background-position","0 -5px");
 	$(this).css({
 		"background-color":"rgb(235,240,240)",
 		"color":"#777"
 	});
 }).keyup(function(e){
 	if(e.keyCode==13){
 		$("#search_btn").click();
 	}
 });
 
 /**
  * username
  * 
  */
 var _testCn = new RegExp("[\u4e00-\u9fa5]+");
 var _uname;
 var uname_num = 0;
 for(var i=0;i<10;i++){
 	_uname=$("#user_name").text().substring(i,i+1);
 	if(_testCn.test(_uname)){
 		uname_num++;
 	}
 }
 uname_num = 10-uname_num/2;
 if($("#user_name").text().length>uname_num){
 	$("#user_name").text($("#user_name").text().substring(0,uname_num)+"...");
 }
 
// new_msg显示方法
// $("#new_msg").show(0,function(){
// 	$("#user_message").children().children().children(".ico").css(
// 		"background-position","-48px -149px"
// 	);
// });

 
});