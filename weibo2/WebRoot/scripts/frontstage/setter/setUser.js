$(function() {

	var i = 0;

	$("#ld1 dt").click(function() {
		if (i == 0) {
			$("#ld1 dd").hide();
			$("#i1").attr("src","./images/arrow_on_off_1.png");
			i = 1;
		} else {
			$("#ld1 dd").show();
			$("#i1").attr("src", "./images/arrow_on_off_2.png");
			i = 0;
		}
	});
	$("#ld3 dt").click(function() {
		if (i == 0) {
			$("#ld3 dd").show();
			$("#i2").attr("src", "./images/arrow_on_off_2.png");
			i = 1;
		} else {
			$("#ld3 dd").hide();
			$("#i2").attr("src", "./images/arrow_on_off_1.png");
			i = 0;
		}
	});
	$("#ld5 dt").click(function() {
		if (i == 0) {
			$("#ld5 dd").show();
			$("#i3").attr("src", "./images/arrow_on_off_2.png");
			i = 1;
		} else {
			$("#ld5 dd").hide();
			$("#i3").attr("src", "./images/arrow_on_off_1.png");
			i = 0;
		}
	});
	
});
