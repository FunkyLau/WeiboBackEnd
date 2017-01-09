/**
 * index.jsp的js文件
 */
$(function() {
	$(".left_menu_span").mouseover(function() {
		$(this).css({
			"background-color" : "rgb(215,235,240)"
		});
	}).mouseout(function() {
		$(this).css({
			"background-color" : ""
		});
	});

	$("#left_grouping .left_menu_span").mouseover(function() {
		$(this).children(".grouping_setting").css("display", "block");
	}).mouseout(function() {
		$(this).children(".grouping_setting").css("display", "none");
	});
	$(".grouping_setting").mouseover(function() {
		$(this).css({
			'background-position' : '-100px -50px'
		});
	}).mouseout(function() {
		$(this).css({
			'background-position' : '-75px -50px'
		});
	}).click(function() {
		return false;
	});

	$("#left_grouping").mouseover(function() {
		$(".left_menu_hidebtn").css("display", "block");
	}).mouseout(function() {
		$(".left_menu_hidebtn").css("display", "none");
	});

	$(".left_menu_hidebtn").mouseover(
			function() {
				$(".left_menu_hidebtn").css("background-image",
						"url('./images/left_manager_over.png')");
			}).mouseout(
			function() {
				$(".left_menu_hidebtn").css("background-image",
						"url('./images/left_manager_show.png')");
			});

	$("#right_template").mouseover(function() {
		$(this).css("background-position", "-280px -25px");
	}).mouseout(function() {
		$(this).css("background-position", "-280px 0");
	});

	$("#center_weibo_content").focus(function() {
		$("#center_weibo_corner").css("background-position", " 0 -101px");
		$(this).css("border-color", "rgb(255,185,65)");
		$("#center_hot").show();
		$("#conter_weibo_wn").text(140 - $(this).val().length);
		if ($.trim($(this).val()) == "" || $(this).val().length > 140) {
			$("#center_sendweibo").css("background-position", "-50px -131px");
		} else {
			$("#center_sendweibo").css("background-position", "-133px -131px");
		}
	}).blur(function() {
		$("#center_weibo_corner").css("background-position", " 0 -120px");
		$(this).css("border-color", "rgb(204, 204, 204)");
		if ($(this).val() == "") {
			$("#center_hot").hide();
		}
		if ($.trim($(this).val()) == "" || $(this).val().length > 140) {
			$("#center_sendweibo").css("background-position", "-50px -131px");
		} else {
			$("#center_sendweibo").css("background-position", "-133px -131px");
		}
		$("#conter_weibo_wn").text(140 - $(this).val().length);
	}).keydown(function() {
		if ($.trim($(this).val()) != "") {
			$("#conter_weibo_wn").text(140 - $(this).val().length);
		}
		$("#center_hot").show();
		if ($.trim($(this).val()) == "" || $(this).val().length > 140) {
			$("#center_sendweibo").css("background-position", "-50px -131px");
		} else {
			$("#center_sendweibo").css("background-position", "-133px -131px");
		}
	}).keyup(function() {
		if ($.trim($(this).val()) != "") {
			$("#conter_weibo_wn").text(140 - $(this).val().length);
		}
		$("#center_hot").show();
		if ($.trim($(this).val()) == "" || $(this).val().length > 140) {
			$("#center_sendweibo").css("background-position", "-50px -131px");
		} else {
			$("#center_sendweibo").css("background-position", "-133px -131px");
		}
		if ($(this).val().length > 140) {
			$("#center_replace").text("已经超过");
		} else {
			$("#center_replace").text("还可以输入");
		}
	}).keypress(function() {
		if ($.trim($(this).val()) != "") {
			$("#center_weibo_wn").text(140 - $(this).val().length + "字");
		}
		$("#center_weibo_corner").css("background-position", " 0 -101px");
		$(this).css("border-color", "rgb(255,185,65)");
	});
	$("#center_sendweibo").click(
			function() {
				if ($.trim($("#center_weibo_content").val()) == ""
						|| $("#center_weibo_content").val().length > 140) {
					$("#send_weibo_error").fadeIn(150, function() {
						$("#send_weibo_error").fadeOut(150, function() {
							$("#send_weibo_error").fadeIn(150, function() {
								$("#send_weibo_error").fadeOut(150);
							});
						});
					});
				} else {
					var messages_text = $("#center_weibo_content").val();
					
					while (messages_text.indexOf("\n") != -1) {
						messages_text = messages_text.replace("\n", "<br/>");
					}
					$.post("./MessagesAction_saveOrUpdateObject.action", {
						"messages.messagesInfo" : messages_text,
						"messages.messagesType" : "原创"
					}, function(data) {
						if (data) {
							queryMessages("1");
							$("#send_weibo_success").show();
							$("#send_weibo_success").fadeOut(1500);
						}
					}, "json");
					$("#center_weibo_content").val("");
					$("#center_hot").hide();
					$(this).css("background-position", "-50px -131px");
				}
			});
	$("#chose_weibo").click(function() {
		$(this).css('font-weight', 'bold');
		$("#chose_trends").css('font-weight', 'normal');
		$("#chose_bg").css({
			"left" : "0"
		});
		$("#weibo_classes").show();
		$("#weibo_content").show();
	});

	$("#chose_trends").click(function() {
		$(this).css('font-weight', 'bold');
		$("#chose_weibo").css('font-weight', 'normal');
		$("#chose_bg").css({
			"left" : "50px"
		});
		$("#weibo_classes").hide();
		$("#weibo_content").hide();
	});
	$("#weibo_classes a:first span").css({
		"background-color" : "rgb(230,230,230)"
	});
	$("#weibo_classes span").click(function() {
		$("#weibo_classes span").css({
			"background-color" : ""
		});
		$(this).css({
			"background-color" : "rgb(230,230,230)"
		});
	});

	$("#right_user").mouseover(function() {
		$(this).css("color", "rgb(75,170,220)");
	}).mouseout(function() {
		$(this).css("color", "black");
	});

	queryMessages("1");

	setInterval(function() {
		if (lastMessages != null) {
			
			lastMessages = lastMessages.replace("T", " ");
			//alert(lastMessages);
			$.post("./MessagesAction_queryNewMessages.action?nowtime="
					+ new Date().getTime(), {
				lastMessages : lastMessages
			}, function(data) {
				if (data > 0) {
					$("#weibo_new_receive").css("display", "block");
					$("#weibo_new_number").text(data);
				}
				if (data == 0) {
					$("#weibo_new_receive").hide();
				}
			}, "json");
		}
		$(".weibo_receive_time").each(
				function() {
					if ($(this).text().indexOf("秒前") != -1) {
						var ss = $(this).text().substring(0,
								$(this).text().indexOf("秒前"));
						if (eval(ss + "+" + 10) < 60) {
							$(this).text(eval(ss + "+" + 10) + "秒前");
						} else {
							$(this).text("1分钟前");
						}
					}
				});
	}, 10000);

	setInterval(function() {
		$(".weibo_receive_time").each(
				function() {
					if ($(this).text().indexOf("分钟前") != -1) {
						var mm = $(this).text().substring(0,
								$(this).text().indexOf("分钟前"));
						if (eval(mm + "+" + 1) < 60) {
							$(this).text(eval(mm + "+" + 1) + "分钟前");
						} else {
							var nt = new Date();
							var nd = nt.getHours() - 1;
							var nm = nt.getMinutes();
							nm = nm < 10 ? "0" + nm : nm;
							if (nd > 0) {
								nd = nd < 10 ? "0" + nd : nd;
								$(this).text("今天 " + nd + ":" + nm);
							} else {
								$(this).text("1小时前");
							}
							;
						}
					}
				});
	}, 60000);

	$("#weibo_new_receive").click(function() {
		queryMessages("1");
		$(this).hide();
	});

});
var a_nowpage = 0;
var lastMessages = "";

function queryMessages(nowpage) {
	$(".weibo_receive").remove();
	$("#weibo_page").remove();
	$("#weibo_new_receive").hide();
	$.post("./MessagesAction_queryMessages.action?nowtime="+ new Date().getTime(),
					{
						'showMessages.nowpage' : nowpage
					},
					function(data) {
						data = data.showMessages;
						//var obj = JSON.stringify(data);
						//alert(obj);
						//成功获取json字符串
						a_nowpage = data.nowpage;
						lastMessages = data.lastMessages;
						if (data.messages == "" && a_nowpage != 1) {
							queryMessages(a_nowpage - 1);
							return;
						}
						for (var i = 0; i < data.messages.length; i++) {
							weibolist(data.messages[i], data.headphotos,data.nowtime);
						}
						chosenowpage(data.nowpage, data.total);
						
						$(".weibo_receive").mouseover(function() {
							if ($(this).find(".weibo_delete").text() == "删除") {
								$(this).find(".weibo_delete").show();
							}
						}).mouseout(function() {
							$(this).find(".weibo_delete").hide();
						});

						$(".weibo_delete").click(
								function() {
									$(this).parent().next(".suretodelete").css(
											"display", "block");
									$(this).parent().next(".suretodelete")
											.find(".sure_delete").focus();
								});

						$(".sure_delete").mouseover(function() {
									$(this).children("span").css({
										"background-color" : "rgb(255,177,53)"
									});
								}).mouseout(function() {
									$(this).children("span").css({
										"background-color" : "rgb(255,160,10)"
									});
								}).click(function() {
											$(this).closest(".suretodelete").hide();
											var weibo_ct = $(this).closest(".weibo_receive");
											$(".weibo_rwcomm").hide();
											weibo_ct.hide(400,function() {
																weibo_ct.contents().hide();
																weibo_ct.remove();
																if ($(".weibo_receive").length == 0) {
																	queryMessages(a_nowpage);
																}
															});
											$.post("./MessagesAction_deleteObject.action",
											{
												ids : weibo_ct.attr("id").substring(6)
											},function(deletedata) {
																if (deletedata) {
																	alert();
																	$("#right_user_weibo").text(eval($("#right_user_weibo").text()+ "-"+ 1));
																}
															}, "json");
											});

						$(".cancel_delete").mouseover(
										function() {
											$(this).css("background-color",
													"rgb(255,160,10)");
											$(this).children("span").css(
											{
												"background-color" : "rgb(255,177,53)",
												"color" : "white"
											});
										}).mouseout(
										function() {
											$(this).css("background-color",
													"rgb(204,204,204)");
											$(this)
													.children("span")
													.css({
														"background-color" : "rgb(242,242,242)",
														"color" : "rgb(51,51,51)"
													});
										}).click(function() {
											$(this).parent().parent(".suretodelete").fadeOut(500);
										});

						if (data.agreeMessages != "") {
							$(".weibo_receive").each(function() {
												$(this).attr("id").substring(6);
												for (var z = 0; z < data.agreeMessages.length; z++) {
													if ($(this).attr("id").substring(6) == data.agreeMessages[z].messages.messagesId) {
														$(this).find(".weibo_agreeicon")
																.css("background-position","-100px 0").parent().parent("a").attr("title","取消赞")
																.attr("href","cancel");
													}
												}
											});
						}

						$(".weibo_agree").click(function() {
											var _tpa = $(this).parent("a");
											var _tpah = $(this).parent("a")
													.attr("href");
											var _anum = $(this)
													.children(".weibo_agreenum")
													.text()
													.substring(1,$(this).text().length - 1);
											if (_tpah.substring(
													_tpah.length - 6,
													_tpah.length) == "cancel") {
												$(_tpa).attr("href", "_agree")
														.attr("title", "赞一个");
												$(this)
														.children(".weibo_agreenum")
														.text("("+ eval(_anum+ "-"+ 1)+ ")");
												$(this).children(".weibo_agreeicon").css(
																"background-position",
																"-75px 0");
											}

											if (_tpah.substring(
													_tpah.length - 6,
													_tpah.length) == "_agree") {
												$(_tpa).attr("href", "cancel")
														.attr("title", "取消赞");
												$(this).children(".weibo_agreenum")
														.text("("+ eval(_anum+ "+"+ 1) + ")");
												$(this).children(".weibo_agreeicon").css(
																"background-position","-100px 0");
											}

											var agree_weiboid = $(this).closest(".weibo_receive").attr("id").substring(6);
											$.post("./MessagesAction_updateAgreeNum.action?nowtime="+ new Date().getTime(),
															{
																"messages.messagesId" : agree_weiboid
															}, function(agreedata) {
															}, "json");

											return false;
										});

						$(".show_comment").click(
										function() {
											var weibo_comment_show = $(this)
													.closest(".weibo_receive")
													.find(".weibo_rwcomm");
											if (weibo_comment_show
													.css("display") == "none") {
												weibo_comment_show.show();
												loadcomment(this);
											} else {
												weibo_comment_show.hide();
											}

										});

						$(".send_comment").click(function() {
											var comment_text = $(this).closest(
													".weibo_comment_my")
													.children(".comment_text");
											var comments_messagesid = $(this)
													.closest(".weibo_receive")
													.attr("id").substring(6);
											if ($.trim($(comment_text).val()) == "" || $(comment_text).val().length > 100) {
												var i = 0;
												var nosend = "";
												nosend = setInterval(
														function() {
															if (i == 0 || i == 4 || i == 6 || i == 10) {
																$(comment_text).css(
																				"background-color",
																				"rgb(255,210,210)");
															}
															if (i == 1 || i == 3 || i == 7 || i == 9) {
																$(comment_text).css(
																				"background-color",
																				"rgb(255,200,200)");
															}
															if (i == 2 || i == 8) {
																$(comment_text).css(
																				"background-color",
																				"rgb(255,190,190)");
															}
															if (i == 5 || i == 11) {
																$(comment_text).css(
																				"background-color","");
															}
															i++;
															if (i > 11) {
																clearInterval(nosend);
															}
														}, 70);
											} else {
												var cominfo = $(comment_text).val();
												while (cominfo.indexOf("\n") != -1) {
													cominfo = cominfo.replace("\n", "<br/>");
												}
												_this = this;
												$.post("./MessagesAction_updateComments.action",
																{
																	"messages.messagesId" : comments_messagesid,
																	"comments.commentsInfo" : cominfo
																},
																function(data) {
																	if (data) {
																		
																		loadcomment(_this);
																	} else {
																		alert("您要评论的微博已被删除");
																		queryMessages(a_nowpage);
																	}
																}, "json");
											}
										});

						$(".comment_text").keydown(
										function() {
											var browser_u = navigator.userAgent.toLowerCase();
											var isie = browser_u.indexOf("msie") != -1 ? true : false;
											if (isie) {
												this.style.height = this.scrollHeight + 4 + "px";
											} else {
												$(this).css("height", "23px");
												this.style.height = this.scrollHeight + 1 + "px";
											}
										}).keyup(function() {
											var browser_u = navigator.userAgent.toLowerCase();
											var isie = browser_u.indexOf("msie") != -1 ? true : false;
											if (isie) {
												this.style.height = this.scrollHeight + 4 + "px";
											} else {
												$(this).css("height", "23px");
												this.style.height = this.scrollHeight + 1 + "px";
											}
										}).focus(function() {
									$(this).css({
										"border" : "solid rgb(255,185,65) 1px",
										"color" : "rgb(51,51,51)"
									});
								}).blur(
										function() {
											$(this).css({"border" : "solid rgb(204,204,204) 1px",
														"color" : "rgb(204,204,204)"});
										});

						$(".send_comment_div").mouseover(function() {
							$(this).css("background-color", "rgb(255,177,53)");
						}).mouseout(function() {
							$(this).css("background-color", "rgb(255,155,0)");
						});

						$(".comment_trans_text").click(
								function() {
									$(this).parent().children(".comment_trans").click();
								});

						$("#right_user_attention").text(data.attentionsNum);
						$("#right_user_fans").text(data.fansNum);
						$("#right_user_weibo").text(data.myMessagesNum);
					}, "json");
}

function weibolist(messages, headphotos, nowtime) {
	var weibo = "";
	var _headphoto = "";
	if (headphotos[0] != undefined) {
		for (var k = 0; k < headphotos.length; k++) {
			if (messages.users.usersNikename == headphotos[k].users.usersNikename) {
				//alert(headphotos[k].picturesUrl);
				_headphoto = "./uploadImages" + headphotos[k].picturesUrl;
			}
		}
	}
	if (_headphoto == "") {
		if (messages.users.userinfos[0] != undefined) {
			if (messages.users.userinfos[0].userinfoSex == '男') {
				_headphoto = "./images/1.gif";
			}
			if (messages.users.userinfos[0].userinfoSex == '女') {
				_headphoto = "./images/0.gif";
			}
		} else {
			_headphoto = "./images/1.gif";
		}
	}
	weibo = $('<div class="weibo_receive" id="weibo_'
			+ messages.messagesId
			+ '"><div class="weibo_headphoto"><img src="'
			+ _headphoto
			+ '" width="50" height="50">'
			+ '</div><div class="weibo_receive_content"><span class="weibo_user">'
			+ messages.users.usersNikename
			+ '</span><span class="weibo_user_v"></span>'
			+ '<span class="weibo_text">'
			+ messages.messagesInfo
			+ '</span><span class="weibo_pic"></span><span class="weibo_bottom_left">'
			+ '<a href="javascript:void(0);" class="weibo_b_l_a"><span class="weibo_receive_time">'
			+ formatterTime(messages.messagesTime, nowtime)
			+ '</span></a><span class="weibo_receive_from">来自</span>'
			+ '<a href="javascript:void(0);" class="weibo_b_l_a"><span class="weibo_receive_where">新浪微博</span></a>'
			+ '<a href="javascript:void(0);" class="weibo_b_r_a"><span class="weibo_report"></span></a></span><span class="weibo_bottom_right">'
			+ '<a href="javascript:void(0);" class="weibo_b_r_a"><span class="weibo_delete"></span></a><span class="suretodelete"><span class="sure_ico"></span><span class="sure_text">确定要删除这条微博吗？</span>'
			+ '<a href="javascript:void(0);" class="weibo_delete_a"><span class="sure_delete"><span>确定</span></span></a><a href="javascript:void(0);" class="weibo_delete_a"><span class="cancel_delete"><span>取消</span></span></a></span>'
			+ '<a href="_agree" title="赞一个" class="weibo_b_r_a"><span class="weibo_agree"><span class="weibo_agreeicon"></span><span class="weibo_agreenum">('
			+ messages.messagesAgreenum
			+ ')</span></span></a>&nbsp;|&nbsp;<a href="javascript:void(0);" class="weibo_b_r_a" style="margin-left:3px;margin-right:3px;"><span>转发('
			+ messages.messagesTranspondnum
			+ ')</span></a>&nbsp;|&nbsp;'
			+ '<a href="javascript:void(0);" class="weibo_b_r_a" style="margin-left:3px;margin-right:3px;"><span>'
			+ '收藏'
			+ '</span></a>&nbsp;|&nbsp;'
			+ '<a href="javascript:void(0);" class="weibo_b_r_a"  style="margin-left:3px;margin-right:3px;"><span class="show_comment">评论('
			+ '<span>'
			+ messages.messagesCommentnum
			+ '</span>'
			+ ')</span></a>'
			+ '</span></div>'
			+ '<div class="weibo_rwcomm">'
			+ '<div class="weibo_comment_main"><div class="commment_direct">◆<span>◆</span></div>'
			+ '<div class="weibo_comment_content">'
			+ '<div class="weibo_comment_my"><textarea class="comment_text"></textarea><div class="send_comment_bar"><a class="center_face_a" href="javascript:void(0);" title="表情"><span class="center_face"></span></a><input type="checkbox" class="comment_trans"/><span class="comment_trans_text">同时转发到我的微博</span><div class="send_comment_div"><a href="javascript:void(0);"><span class="send_comment">评论</span></a></div></div></div>'
			+ '<div class="weibo_comment_all">' + '</div></div></div></div>'
			+ '</div>');
	$("#weibo_content").append(weibo);
	if (messages.users.usersNikename == $("#right_user").text()) {
		$(weibo).find(".weibo_delete").text("删除");
	} else {
		$(weibo).find(".suretodelete").remove();
	}

}

function commentlist(target, comment, headphotos, nowtime) {
	var delornot = "";
	if (comment.users.usersNikename == $("#right_user").text()) {
		delornot = '<a href="javascript:void(0);" id="comment_'
				+ comment.commentsId
				+ '" class="comment_delete">删除</a><span style="color:rgb(197,197,197)">|</span>';
	}

	var _headphoto = "";
	if (headphotos[0] != undefined) {
		for (var k = 0; k < headphotos.length; k++) {
			if (comment.users.usersNikename == headphotos[k].users.usersNikename) {
				_headphoto = "./uploadImages" + headphotos[k].picturesUrl;
			}
		}
	}
	if (_headphoto == "") {
		if (comment.users.userinfos[0] != undefined) {
			if (comment.users.userinfos[0].userinfoSex == '男') {
				_headphoto = "./images/1.gif";
			}
			if (comment.users.userinfos[0].userinfoSex == '女') {
				_headphoto = "./images/0.gif";
			}
		} else {
			_headphoto = "./images/1.gif";
		}
	}

	var comment_arow = $('<div class="weibo_comment_arow"><div class="weibo_comment_headphoto"><img src="'
			+ _headphoto
			+ '" width="30" height="30"></div><div class="weibo_comment_arow_content"><a href="javascript:void(0);" class="weibo_comment_user_a"><span class="weibo_comment_user">'
			+ comment.users.usersNikename
			+ ":"
			+ '</span></a><span class="weibo_comment_text">'
			+ comment.commentsInfo
			+ ' ('
			+ formatterTime(comment.commentsTime, nowtime)
			+ ')'
			+ '</span></div><div class="comment_dorc">'
			+ delornot
			+ '<a href="javascript:void(0);">回复</a></div></div>');
	target.closest(".weibo_receive").find(".weibo_comment_all").append(
			comment_arow);
}

function loadcomment(target) {
	var weibo_receive = $(target).closest(".weibo_receive");
	var show_comment = weibo_receive.find(".show_comment");
	var comments_messagesid = weibo_receive.attr("id").substring(6);
	var comnum = show_comment.children("span");
	var comment_text = weibo_receive.find(".comment_text");

	$.post("./MessagesAction_queryComments.action?nowtime="
			+ new Date().getTime(), {
		"messages.messagesId" : comments_messagesid
	}, function(data) {
		weibo_receive.find(".weibo_comment_arow").remove();
		data = data.showComments;
		comnum.text(data.total);
		$(comment_text).val("");
		$(comment_text).css("height", "22px");
		if (data.comments != null) {
			for (var q = 0; q < data.comments.length; q++) {
				commentlist(show_comment, data.comments[q], data.headphotos,data.nowtime);
			}
		}
		// commentlist(this,data);
		$(".comment_delete").click(function() {
			var del_com = confirm("确定要删除吗?");
			var del_id = $(this).attr("id").substring(8);
			if (del_com) {
				$.post("./MessagesAction_deleteComments.action", {
					"comments.commentsId" : del_id
				}, function(data) {
					if (data) {
						loadcomment(target);
					} else {
						alert("您用评论的微博已被删除！");
					}
				}, "json");
			}
		});
	}, "json");
}

function chosenowpage(nowpage, total) {
	var page = "";
	page = $('<div id="weibo_page"><div id="weibo_pageup"><a href="javascript:void(0);"><span>上一页</span></a></div><div id="weibo_nowpage">'
			+ '<a href="javascript:void(0);">第<span>'
			+ nowpage
			+ '</span>页</a><div id="weibo_selectpage"><div id="weibo_selectpage_height">'
			+ '</div></div></div><div id="weibo_pagedown"><a href="javascript:void(0);"><span>下一页</span></a></div></div>');
	$("#weibo_content").append(page);
	var allpage = Math.floor(total / 10) + 1;

	if (total % 10 == 0) {
		allpage = total / 10;
	}

	for (var j = 1; j <= allpage; j++) {
		var chosepage = "";
		chosepage = $('<div id="page_' + j + '" class="page_how">第' + j
				+ '页</div>');
		chosepage.css("bottom", (j - 1) * 25 + "px");
		if (j != nowpage) {
			chosepage.mouseover(function() {
				$(this).css({
					'background-color' : 'rgb(231,231,231)'
				});
			}).mouseout(function() {
				$(this).css('background-color', '');
			}).click(function() {
				queryMessages($(this).attr("id").substring(5));
			});
		} else {
			$(chosepage).css({
				"color" : "rgb(190,190,190)",
				'cursor' : 'default'
			}).focus();
		}
		$("#weibo_selectpage_height").append(chosepage);
	}

	$("#weibo_selectpage_height").css("height", allpage * 25 + "px");
	if (allpage * 25 > 250) {
		$("#weibo_selectpage").css("height", "250px");
		$(".page_how").css("width", "65px");
	} else {
		$(".page_how").css("width", "75px");
	}

	if (nowpage == "1") {
		$("#weibo_pageup").hide();
	}

	if (nowpage == total / 10) {
		if (nowpage != "1") {
			$("#weibo_pagedown").hide();
		} else {
			$("#weibo_pagedown a span").css({
				"color" : "gray",
				'cursor' : 'default'
			});
		}
	}

	if (nowpage == Math.floor(total / 10) + 1) {
		if (nowpage != "1") {
			$("#weibo_pagedown").hide();
		} else {
			$("#weibo_pagedown a span").css({
				"color" : "gray",
				'cursor' : 'default'
			});
		}
	}

	$("#weibo_pageup").click(function() {
		$("#weibo_new_receive").hide();
		queryMessages(nowpage - 1);
	}).mouseover(function() {
		$(this).css("background-color", "rgb(250,250,250)");
	}).mouseout(function() {
		$(this).css("background-color", "rgb(242,242,242)");
	});

	if (total / 10 != 1 && Math.floor(total / 10) + 1 != 1) {
		$("#weibo_pagedown").click(function() {
			$("#weibo_new_receive").hide();
			queryMessages(nowpage + 1);
		}).mouseover(function() {
			$(this).css("background-color", "rgb(250,250,250)");
		}).mouseout(function() {
			$(this).css("background-color", "rgb(242,242,242)");
		});
	}
	var hidetime = "";
	$("#weibo_nowpage").mouseover(function() {
		clearTimeout(hidetime);
		$("#weibo_selectpage").show();
	}).mouseout(function() {
		hidetime = setTimeout(function() {
			$("#weibo_selectpage").hide();
		}, 500);
	});
}

function formatterTime(time, nowt) {
	var rd = new Date(time.substring(0, 4), time.substring(5, 7) - 1, time
			.substring(8, 10), time.substring(11, 13), time.substring(14, 16),
			time.substring(17, 19));
	var nt = new Date(nowt.substring(0, 4), nowt.substring(5, 7) - 1, nowt
			.substring(8, 10), nowt.substring(11, 13), nowt.substring(14, 16),
			nowt.substring(17, 19));

	var howlangms = nt.getTime() - rd.getTime();

	if (howlangms / 1000 < 60) {
		return Math.floor(howlangms / 1000) + "秒前";
	}

	if (howlangms / 1000 / 60 < 60) {
		return Math.floor(howlangms / 1000 / 60) + "分钟前";
	}

	if (rd.getFullYear() == nt.getFullYear() && rd.getMonth() == nt.getMonth()
			&& rd.getDate() == nt.getDate()) {
		return "今天 " + time.substring(11, 16);
	}

	if (rd.getFullYear() != nt.getFullYear()) {
		return rd.getFullYear() + "年" + eval(rd.getMonth() + "+" + 1) + "月"
				+ rd.getDate() + "日  ";
	}

	return eval(rd.getMonth() + "+" + 1) + "月" + rd.getDate() + "日  "
			+ time.substring(11, 16);

}

function logout(){
	//$("#logout").attr("href",'./UsersAction_logout.action');
	$("#user_vip").click(function(){
		$("#logout").attr("href",'./UsersAction_logout.action');
		
	});
}

function searchUsers() {
	$("#searchA").attr("href",
			'./UsersAction_searchUsers.action?searchKey=searchUsers&searchValue='
					+ $("#search_input").val());
}