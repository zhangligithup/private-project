<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">电子地图</a></li>
            <li class="active">执法终端跟踪</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <table class="table search_box marb10 ">
        <thead>
        <tr>
             <th colspan="5" class=" text-left notopborder">
                <span class=" marr10 " > 监管单位</span>
                <select class="select_style1  width220 marr10" id="unit" onchange="showAll()">
                    <option value="" selected>所有</option>
                    <c:forEach items="${unitList}" var="list">
                        <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                    </c:forEach>
                </select>
            </th>
            <th colspan="5" class=" text-left notopborder">
                <span class=" marr10 " >选择执法人员</span>
                <select class="select_style1  width220 marr10" id="mapPerson" onchange="theLocation(this)">
                </select>
            </th>
        </tr>
        
        </thead>
    </table>
    <div id="cityMap" style="height:700px;width:100%;"></div>
</div>
<script>
var map = new BMap.Map("cityMap");
$(function (){
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			map.centerAndZoom('曹妃甸');
			map.enableScrollWheelZoom(true);
			//向地图中添加缩放控件  
	        var ctrlNav = new window.BMap.NavigationControl({  
	            anchor: BMAP_ANCHOR_TOP_LEFT,  
	            type: BMAP_NAVIGATION_CONTROL_LARGE  
	        });  
	        map.addControl(ctrlNav);  

	        //向地图中添加缩略图控件  
	        var ctrlOve = new window.BMap.OverviewMapControl({  
	            anchor: BMAP_ANCHOR_BOTTOM_RIGHT,  
	            isOpen: 1  
	        });  
	        map.addControl(ctrlOve);  

	        //向地图中添加比例尺控件  
	        var ctrlSca = new window.BMap.ScaleControl({  
	            anchor: BMAP_ANCHOR_BOTTOM_LEFT  
	        });  
	        map.addControl(ctrlSca); 
			showAll();
		}
	},{enableHighAccuracy: true})
});
var createMark = function(point, info_html) {  
    var _marker = new BMap.Marker(point);  
    _marker.addEventListener("mouseover", function(e) {  
    	this.openInfoWindow(new BMap.InfoWindow(info_html));  
    });  
    return _marker;  
};
//展示所有人员
function showAll(){
	map.clearOverlays();
	$.ajax({
		url:"${pageContext.request.contextPath }/map/getNowLocation.do",
		type:"post",
		dataType:"json",
		async:false,
		data:{unit:$("#unit").val()},
		success:function(data){
			$("#mapPerson").html("");
			$("#mapPerson").append("<option value ='' selected>所有</option>");
			
			for(var i=0;i<data.length;i++){
			(function (i){
				var p0 = data[i].longitude; //  
                var p1 = data[i].latitude; //按照原数组的point格式将地图点坐标的经纬度分别提出来  
                var point; //循环生成新的地图点  
                var longitude = data[i].longitude;
                var latitude = data[i].latitude;
                var personName = data[i].personName;
                var timestamp = data[i].timestamp;
                var perosnTel = data[i].perosnTel;
                
                var convertor = new BMap.Convertor();//将GPS坐标转化为百度坐标
                var pointArr = [];
                pointArr.push(new BMap.Point(p0, p1));
                convertor.translate(pointArr, 1, 5, function(points){
                    if(points.status === 0) {
                        point = points.points[0];
                        var label = new BMap.Label(personName, { offset: new BMap.Size(20, -10)});  
                        label.setStyle({
                            border: "0px",
                        });
                        var info = "<p style=’font-size:12px;lineheight:1.8em;’>姓名：" + personName + "</br>位置时间：" + timestamp + "</br> 电话：" + perosnTel + "</br></p>"; // 创建信息窗口对象  
                        var marker = createMark(point,info);
                        marker.setLabel(label);
                        map.centerAndZoom('曹妃甸');
                        map.addOverlay(marker);
                        $("#mapPerson").append("<option value='"+longitude+","+latitude+","+personName+","+timestamp+","+perosnTel+"'>"+personName+"</option>");
                    }
                });
			})(i);
	            
			}
		}
	});
}

// 用经纬度设置地图中心点
function theLocation(ele){
	map.clearOverlays();
	if(ele.value==""){
		showAll();
	}else{
		var longitude = ele.value.split(",")[0];
		var latitude = ele.value.split(",")[1];
		var personName = ele.value.split(",")[2];
		var timestamp = ele.value.split(",")[3];
		var perosnTel = ele.value.split(",")[4];
		if(longitude!= "" && latitude!= ""){
			var new_point;
			var convertor = new BMap.Convertor();//将GPS坐标转化为百度坐标
            var pointArr = [];
            pointArr.push(new BMap.Point(longitude,latitude));
            convertor.translate(pointArr, 1, 5, function(data){
            	if(data.status === 0) {
            		new_point = data.points[0];
            		var label = new BMap.Label(personName, { offset: new BMap.Size(20, -10)});  
                    label.setStyle({
                        border: "0px",
                    });
                    var info = "<p style=’font-size:12px;lineheight:1.8em;’>姓名：" + personName + "</br>位置时间：" + timestamp + "</br> 电话：" + perosnTel + "</br></p>"; // 创建信息窗口对象  
                    var marker = createMark(new_point,info);  // 创建标注
                    marker.setLabel(label);
	    			map.addOverlay(marker);              // 将标注添加到地图中
	    			map.panTo(new_point);
            	}
            })
		}
	}
}
</script>
