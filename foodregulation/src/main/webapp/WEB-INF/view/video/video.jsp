<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">
    <title>视频厨房</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common1.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5.css" />
    <script src="${pageContext.request.contextPath}/js/allmain.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://open.ys7.com/sdk/js/1.3/ezuikit.js"></script>
</head>
<body>
<div>
    <header class="sel_banner">
        <img class="sel_banImg" src="${pageContext.request.contextPath}/images/sel_banner.jpg" alt="" />
        <div class="sel_banSer clearfix">
            <input class="sel_banSerInp fl" type="text" id="name"/>
            <div class="sel_banSerBtn fl" onclick="getVidelList()"></div>
        </div>
    </header>
    <section class="sel_sect">
        <ul class="sel_sectUl" id="videoList">
        </ul>
    </section>
</div>
<div class="mask" id="videoPop">
    <div class="popBox">
        <div class="popTitle">
           <div class="titleText" id="videoName"></div>
            <a href="javascript:void(0)" class="popClose" onclick="closePOP('videoPop')"></a>
        </div>
        <div class="videoBox" id="video">
        </div>
    </div>
</div>
</body>
</html>
<script>
    function showVido(liveAddress,rtmp,name){
        var oVideo=document.getElementById('videoPop');
        $("#videoName").html(name);
        var divhtml = "<video class=\"popBox-video\" id='myPlayer' poster='' controls playsInline webkit-playsinline [autoplay]>"
                    + "<source src='"+rtmp+"' type='rtmp/flv' />"
                    + "<source src='"+liveAddress+"' type='application/x-mpegURL' />"
                    + "</video>";
        $("#video").html(divhtml);
        oVideo.style.display='block';
        var player = new EZUIPlayer('myPlayer');
    }
    function closePOP(videoPop){
        var oVideo=document.getElementById(videoPop);
        $("#video").html("");
        oVideo.style.display='none';
    }
    function getVidelList() {
            $("#loading").html("加载中......");
            $.ajax({
                        url : "${pageContext.request.contextPath}/video/getVidelList.do",
                        type : "POST",
                        dataType : "json", //指定服务器返回的数据类型
                        data : {
                        	tag:$("#tag").val(),
                            likeName : $("#name").val()
                        },
                        success : function(result) {
                        	for(var o in json){
                        		alert(o);
                        	}
                            if (result.length > 0) {
                                var divStr = "";
                                for (var i = 0; i < result.length; i++) {
                                divStr = divStr+"<li class=\"sel_sectUli clearfix\" onclick=\"showVido('"+result[i].liveAddress+"','"+result[i].rtmp+"','"+result[i].name+"')\">"
                                   +"<span class=\"fl\">"+result[i].name+"</span>"
                                   +"<i class=\"fr\"></i>"
                                   +"</li>";
                                }
                                $("#videoList").html(divStr);
                            }
                        }
                    });
        }
        getVidelList();
</script>