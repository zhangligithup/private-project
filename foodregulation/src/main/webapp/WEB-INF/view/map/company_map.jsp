<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">电子地图</a></li>
            <li class="active">企业位置分布</li>
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
            <th class="noborder">企业类别</th>
            <th class="noborder">
                <select class="select_style1" id="enterpriseTypeMap">
                        <option value="" selected>请选择</option>
                        <c:forEach  items="${enterpriseTypeList}" var="enterpriseType">
                              <option  value="${enterpriseType.tDictionaryCode}" >${enterpriseType.tDictionaryName}</option>
                         </c:forEach >  
                </select>
            </th>
            <th class="noborder">监管单位</th>
            <th class="noborder">
                <select class="select_style1" id="checkUnitCodeMap">
                    <option value="">请选择</option>
                    <c:forEach items="${unitList}" var="list">
                        <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                    </c:forEach>
                </select>
            </th>
            <th class="noborder">行政区域</th>
            <th class="noborder">
                <select class="select_style1" id="addressMap">
                    <option value="" selected>请选择</option>
                  <c:forEach  items="${addressList}" var="addressLis">
                          <option  value="${addressLis.tDictionaryCode}" >${addressLis.tDictionaryName}</option>
                  </c:forEach > 
                </select>
            </th>
            <th class="noborder"><a class="form_btn" href="#" onclick="queryMapEnterprise()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <div id="ccityMap" style="height:700px;width:100%;"></div>
</div>
<script>
var cmap = new BMap.Map("ccityMap");
$(function (){
var cgeolocation = new BMap.Geolocation();
cgeolocation.getCurrentPosition(function(r){
    if(this.getStatus() == BMAP_STATUS_SUCCESS){
        cmap.centerAndZoom('曹妃甸');
        cmap.enableScrollWheelZoom(true);
        //向地图中添加缩放控件  
        var ctrlNav = new window.BMap.NavigationControl({  
            anchor: BMAP_ANCHOR_TOP_LEFT,  
            type: BMAP_NAVIGATION_CONTROL_LARGE  
        });  
        cmap.addControl(ctrlNav);  

        //向地图中添加缩略图控件  
        var ctrlOve = new window.BMap.OverviewMapControl({  
            anchor: BMAP_ANCHOR_BOTTOM_RIGHT,  
            isOpen: 1  
        });  
        cmap.addControl(ctrlOve);  

        //向地图中添加比例尺控件  
        var ctrlSca = new window.BMap.ScaleControl({  
            anchor: BMAP_ANCHOR_BOTTOM_LEFT  
        });  
        cmap.addControl(ctrlSca); 
    }
},{enableHighAccuracy: true})
});
var createMark = function(lng, lat, info_html) {  
    var _marker = new BMap.Marker(new BMap.Point(lng, lat));  
    _marker.addEventListener("mouseover", function(e) {  
        this.openInfoWindow(new BMap.InfoWindow(info_html));  
    });  
    return _marker;  
};
function queryMapEnterprise(){
    var enterpriseType=$("#enterpriseTypeMap").val();
    var checkUnitCode=$("#checkUnitCodeMap").val();
    var address=$("#addressMap").val();
    $.ajax({
        url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
        type:"post",
        dataType:"json",
        data:{
            enterpriseType:enterpriseType,
            checkUnitCode:checkUnitCode,
            address:address,
            islola:0
        },
        success : function(data) {
            cmap.clearOverlays();
            for (var i = 0; i < data.length; i++) {  
                var p0 = data[i].longitude; //  
                var p1 = data[i].latitude; //按照原数组的point格式将地图点坐标的经纬度分别提出来  
                var point = new BMap.Point(p0, p1); //循环生成新的地图点  
                var label = new BMap.Label(data[i].qyname, { offset: new BMap.Size(20, -10)});  
                label.setStyle({
                    border: "0px",
                });
                var info = "<p style=’font-size:12px;lineheight:1.8em;’>" + data[i].qyname + "</br>地址：" + data[i].scaddress + "</br> 电话：" + data[i].qyphone + "</br></p>"; // 创建信息窗口对象  
                var marker = createMark(p0,p1,info);
                marker.setLabel(label);
                cmap.centerAndZoom('曹妃甸');
                cmap.addOverlay(marker);  
            }  
        }
    }); 
}
</script>
