<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>食品药品动态监管系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap.js"></script>
    <style type="text/css">
    
    footer{  
    position: absolute;  
    left: 0;  
    bottom: 0;  
    width:100%;
    } 
    </style>
</head>
<body style="height:100%">
<div class="container-fluid">
  <div class="row"><img src="${pageContext.request.contextPath}/forCode/626558045347725222_01.jpg" class="img-responsive carousel-inner img-rounded"  alt="Responsive image" style="max-height:200px"></div>
  <div class="row">
  <table class="table"> 
            <tbody > 
              <tr > 
                <th width="40%" >经营qweqe户名称：</th>  
                <td > 
                  <label>${agricultural.qyname}</label> 
                </td> 
              </tr>  
              <tr > 
                <th >经营场所地址：</th>  
                <td > 
                  <label >${agricultural.scaddress}</label> 
                </td> 
              </tr>  
              <tr > 
                <th >负责人：</th>  
                <td > 
                  <label >${agricultural.qydelegate}</label> 
                </td> 
              </tr>  
              <tr > 
                <th >联系电话：</th>  
                <td > 
                  <label >${agricultural.qyphone}</label> 
                </td> 
              </tr>  
              <tr > 
                <th >注册号/统一社会信用代码：</th>  
                <td > 
                  <label >${agricultural.zzcode}</label> 
                </td> 
              </tr>  
              <tr > 
                <th >经营方式：</th>  
                <td > 
                  <label >${agricultural.jyType}</label> 
                </td> 
              </tr>  
              <tr > 
                <th >经营项目：</th>  
                <td > 
                  <label >${agricultural.itemsOfBusiness}</label> 
                </td> 
              </tr> 
            </tbody> 
          </table> 
  </div>
  <footer><img src="${pageContext.request.contextPath}/forCode/626558045347725222_03.jpg" class="img-responsive carousel-inner img-rounded" alt="Responsive image" style="max-height:150px"></foot>
</div>
</body>
</html>