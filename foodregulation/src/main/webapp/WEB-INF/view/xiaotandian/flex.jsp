<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0061)http://sjz.ycfoodsafety.cn/index.php/spe/publicity/spe_cfnqfn -->
<html lang="zh-cn">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>食用农产品二维码溯源管理系统|信息公示</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/flex.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/amazeui.swiper.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/flexible.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <div class="navbar">
        <div class="navbar-title">
            <a href="javascript: history.back();"><div class="back-btn"><i class="icon-back"></i></div></a>
            <div class="title"><p>经营资质</p></div>
        </div>
    </div>
    <div class="page-content">
        <div class="page-warper">
            <div class="photos">
                <div class="photos-bg"></div>
                <div class="swiper-container swiper-container-horizontal" id="swiper1">
                    <div class="swiper-wrapper">
                       <c:choose>
						   <c:when test="${businessLicense== '' || businessLicense== 'null'}">  
						         <div class="swiper-slide">
                                    <div class="no-img">暂无图片</div>                              
                                 </div>       
						   </c:when>
						   <c:otherwise> 
						         <div class="swiper-slide swiper-slide-prev" >
                                    <img class="swiper-lazy swiper-lazy-loaded" src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${businessLicense}">     
                                 </div>
						   </c:otherwise>
						</c:choose>
						<c:choose>
                           <c:when test="${smallStallregistrationCard== '' || smallStallregistrationCard== 'null'}">  
                                 <div class="swiper-slide">
                                    <div class="no-img">暂无图片</div>                              
                                 </div>       
                           </c:when>
                           <c:otherwise> 
                                 <div class="swiper-slide swiper-slide-prev" >
                                    <img class="swiper-lazy swiper-lazy-loaded" src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${smallStallregistrationCard}">     
                                 </div>
                           </c:otherwise>
                        </c:choose>
                        <c:choose>
                           <c:when test="${healthCertificate== '' || healthCertificate== 'null'}">  
                                 <div class="swiper-slide">
                                    <div class="no-img">暂无图片</div>                              
                                 </div>       
                           </c:when>
                           <c:otherwise> 
                                 <div class="swiper-slide swiper-slide-prev" >
                                    <img class="swiper-lazy swiper-lazy-loaded" src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${healthCertificate}">     
                                 </div>
                           </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/amazeui.swiper.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function() {
        $('#swiper1').swiper({
            pagination: '#swiper1 .swiper-pagination',
            paginationClickable: true,
            autoplay: 3000,
            preloadImages: false,
            lazyLoading: true
        });
    });
</script>

</body></html>