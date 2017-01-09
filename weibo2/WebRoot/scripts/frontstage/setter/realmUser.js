var cutX;
var cutY;
var cutW;
var cutH;
var imgWidth;
var imgHeight;
function fileChange(imgSrc) {
    $("#target").attr("src", "../../images/nohead.png");
    var filepath = $("#uploadFile").val();
    var extStart = filepath.lastIndexOf(".");
    var ext = filepath.substring(extStart, filepath.length).toUpperCase();
    if (ext != ".JPG") {
        alert("请选择为(.jpg)的图片文件！");
        //$("#target").attr("src", "../../images/nohead.png");
    } else {
        $("#uploadHeadImg").form("submit", {
            url : "./PicturesAction_upload.action?picturesTime=" + new Date().getTime(),
            onSubmit : function(param) {
            },
            success : function(data) {
                var returnUrl = data.substring(2, data.length - 1);
                
                //var randomNum = Math.floor(Math.random() * 10000000);//+'?randomNum='+ randomNum;
                var showImgUrl = "./uploadImages" + returnUrl;
                
                $("#target").attr("src", showImgUrl);
                
                $("#target").load(function() {
                    imgWidth = $("#target").width();
                    imgHeight = $("#target").height();
                    if (imgWidth > imgHeight) {
                        var showH = Math.round(imgHeight * 350 / imgWidth) + "px";
                        $("#target").css({
                            "width" : "350px",
                            "height" : showH
                        });
                    } else if (imgWidth < imgHeight) {
                        var showW = Math.round(imgWidth * 350 / imgHeight) + "px";
                        $("#target").css({
                            "width" : showW,
                            "height" : "350px"
                        });
                    } else {
                        $("#target").css({
                            "width" : imgWidth,
                            "height" : imgHeight
                        });
                    }
                    
                    $("#crop_preview").attr("src", showImgUrl);
                    jcropImg();
                });

            }
        });
    }

}
//function loadImage(src){
//	var render = new FileReader();
//	reader.onload = function(e){
//		render(e.target.result);
//	};
//	render.readAsDataURL(src);
//}
function jcropImg() {
    $("#target").Jcrop({
        onChange : showPreview,
        onSelect : showPreview,
        bgColor : "black", //选择后，背景颜色
        bgOpacity : 0.4, //背景透明度
        setSelect : [0, 0, 180, 180], //默认选择坐标位置。
        aspectRatio : 1
    });
    function showPreview(coords) {
        if (parseInt(coords.w) > 0) {
            //计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
            var rx = $("#preview_box").width() / coords.w;
            var ry = $("#preview_box").height() / coords.h;
            //通过比例值控制图片的样式与显示
            $("#crop_preview").css({
                width : Math.round(rx * $("#target").width()) + "px", //预览图片宽度为计算比例值与原图片宽度的乘积
                height : Math.round(rx * $("#target").height()) + "px", //预览图片高度为计算比例值与原图片高度的乘积
                marginLeft : "-" + Math.round(rx * coords.x) + "px",
                marginTop : "-" + Math.round(ry * coords.y) + "px"
            });
            //alert(coords.x+"-"+coords.y+"-"+coords.x2+"-"+coords.y2+"-"+coords.w+"-"+coords.h);

            var picW = imgWidth;
            var picH = imgHeight;
            if (picW > picH) {
                cutX = Math.round(picW * coords.x / 350);
                cutY = Math.round(picW * coords.y / 350);
                cutW = Math.round(picW * coords.w / 350);
                cutH = Math.round(picW * coords.h / 350);
            } else if (picW < picH) {
                cutX = Math.round(picH * coords.x / 350);
                cutY = Math.round(picH * coords.y / 350);
                cutW = Math.round(picH * coords.w / 350);
                cutH = Math.round(picH * coords.h / 350);
            } else {
                cutX = coords.x;
                cutY = coords.y;
                cutW = coords.w;
                cutH = coords.h;
            }
        }

    }

}

function cutImgBtn() {
    var cutImgUrl = $("#target").attr("src");
    //alert(cutX + "--" + cutY + "--" + cutW + "--" + cutH + "--" + cutImgUrl);
    $.post("./PicturesAction_cutImg.action?picturesTime=" + new Date().getTime(), {
        cutImgX : cutX,
        cutImgY : cutY,
        cutImgW : cutW,
        cutImgH : cutH,
        cutImgPath : cutImgUrl
    }, function(data) {
        var deleteImgUrl = cutImgUrl.substring(15, cutImgUrl.length);
        alert(deleteImgUrl);
        $.post("./PicturesAction_deletePictures.action?picturesTime=" + new Date().getTime(), {
            delPicURL : deleteImgUrl
        }, function(data) {
        }, "json");

        if (data) {
            alert("头像保存成功！");
        } else {
            alert("头像保存失败！");
        }
    }, "json");
}

