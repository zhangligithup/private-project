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
</head>
<body class="menuBoxbody">

    <img src="${pageContext.request.contextPath}/images/topPic.jpg" alt="" class="menuTop">

<ul class="menuBox">
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=0">
            <img src="${pageContext.request.contextPath}/images/1.png" class="icon-btn">
            <div class="textBox">幼儿园</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=1">
            <img src="${pageContext.request.contextPath}/images/2.png" class="icon-btn">
            <div class="textBox">小学</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=2">
            <img src="${pageContext.request.contextPath}/images/3.png" class="icon-btn">
            <div class="textBox">中学</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=3">
            <img src="${pageContext.request.contextPath}/images/4.png" class="icon-btn">
            <div class="textBox">大学</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=4">
            <img src="${pageContext.request.contextPath}/images/8.png" class="icon-btn">
            <div class="textBox">餐饮单位</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=8">
            <img src="${pageContext.request.contextPath}/images/9.png" class="icon-btn">
            <div class="textBox">其它</div>
        </a>
    </li>
</ul>
<ul class="menuBox">
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=5">
            <img src="${pageContext.request.contextPath}/images/5.png" class="icon-btn">
            <div class="textBox">介绍</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=6">
            <img src="${pageContext.request.contextPath}/images/6.png" class="icon-btn">
            <div class="textBox">规章制度</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/video/videoShow.do?tag=7">
            <img src="${pageContext.request.contextPath}/images/7.png" class="icon-btn">
            <div class="textBox">投诉举报</div>
        </a>
    </li>
</ul>
<div class="menuText">
    食美药安曹妃甸   携手共创文明城
</div>
</body>
</html>

