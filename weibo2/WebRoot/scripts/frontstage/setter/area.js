function Area() {
    var areaArray = new Array();
    /**
     * 初始化合集,在每次new出对象后,应当调用此方法
     * @param xml   要读取的地区xml文档路径
     * @param flag  是否要读取未开通的省市,如果为空,则只读取要开通的省市,不为空,读取所有省市
     */
    this.init = function(xml, flag) {
        var doc = this.loadxml(xml);
        //获取地区集合
        var properties = doc.getElementsByTagName("a");
        var count = 0;
        for (var i = 0; i < properties.length; i++) {
            var id = properties[i].getAttribute("i");
            var name = properties[i].getAttribute("n");
            var pid = properties[i].getAttribute("p");
            //如果当前标志不为空,则代表获取所有省份与地区,否则只获取开通的省份
            if (flag != null) {
                areaArray[i] = [id,name,pid];
            } else {
                var state = properties[i].getAttribute("s");
                if (state == "true") {
                    areaArray[count] = [id,name,pid];
                    count++;
                }
            }
        }
    };
    /**
     * 发送请求,获取xml文档,兼容FF与IE,一般外部不需要调用
     * @param xml
     */
    this.loadxml = function(xml) {
        var xmlDoc;
        if (window.ActiveXObject) {
            xmlDoc = new ActiveXObject('Microsoft.XMLDOM');
            xmlDoc.async = false;
            xmlDoc.load(xml);
        } else if (document.implementation && document.implementation.createDocument) {
//          try{
//            xmlDoc = document.implementation.createDocument('', '', null);
//            xmlDoc.async = false;
//            xmlDoc.load(xml);
//            
//          }catch(e){
          	var xmlHttp = new window.XMLHttpRequest();
          	xmlHttp.open("GET","./frontstage/setter/xml/area.xml",false);
          	xmlHttp.send(null);
          	xmlDoc = xmlHttp.responseXML.documentElement;
//          }
        } else {
        	alert("load data error");
            return null;
        }

        return xmlDoc;
    };
    /**
     * 获取每一级的下一级下拉列表,如获取省级下拉列表,则pid为""
     * @param pid  父级ID,如要获取市级,则传入的PID为省份ID
     * @param selectId 如果要使下级列表自动选中某个列表,则直接传入要选中的ID ,否则设为NULL值
     */
    this.getNextOption = function(pid, selectId) {
        var options = "";
        for (var i = 0; i < areaArray.length; i++) {
            if (areaArray[i][2] == pid) {
                if (selectId != null || selectId != "") {
                    if (selectId == areaArray[i][0]) {
                        options += "<option value=" + areaArray[i][0] + " selected>" + areaArray[i][1] + "</option>";
                    } else {
                        options += "<option value=" + areaArray[i][0] + ">" + areaArray[i][1] + "</option>";
                    }
                } else {
                    options += "<option value=" + areaArray[i][0] + ">" + areaArray[i][1] + "</option>";
                }
            }
        }
        return options;
    };
    /*
     //i当前省市ID  p 当前省市父级ID 如:0为省份  S是否开通标志
     <a i="107" n="安徽省" p="0" s="false"/>
*/
}
