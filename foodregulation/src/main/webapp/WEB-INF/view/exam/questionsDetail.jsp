<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<title></title>
    <style>
        *{
            padding:0;
            margin:0;
        }
        html{
            font-size: 20px;
            color:#666;
        }
        .qs_h1{
            font-size:1rem ;
            color:#444;
            line-height: 3rem;
            text-align: center;
        }
        .qs_txt{
            font-size: 0.7rem;
            color: #666;
            line-height: 1.2rem;
            padding:0  0.75rem  0.75rem  0.75rem;
        }
        .qs_box{
            margin-bottom: 3rem;
            overflow: hidden;
        }
        .qs_title{
            line-height: 1.4rem;
            background:#f1f1f1;
            font-size: 0.7rem;
            color: #666;
            padding-left: 0.75rem;
            margin-bottom: 1rem;
        }
        .qs_Answer{
            list-style: none;
        }
        .qs_Answer li{
            list-style: none;
            margin:0 0 0.75rem 0.75rem ;
            line-height: 1rem;
            font-size: 0.7rem;
        }
        .qs_Answer li input{
            margin-right: 0.3rem;
            margin-top: 0.2rem;
            float:left;
        }
        .qs_btn_box{
            height: 2rem;
            padding-top: 0.5rem;
            padding-bottom:0.5rem;
            text-align:center;
            position: fixed;
            bottom: 0;
            background: #fff;
            text-align: center;
            width: 100%;
        }
        .qs_btn{
            color:#fff;
            font-size: 0.8rem;
            width: 6.5rem;
            text-align:center;
            line-height: 2rem;
            display: inline-block;
            background: #738ffe;
            border: 1px solid #4e6cef;
            text-decoration: none;
        }
        .qs_red{
            color: red;
            padding-left: 0.2rem;
        }
    </style>
</head>
<body>
<h1 class="qs_h1">
    ${templateName}
</h1>
<h1 class="qs_h1">
    总分：${score}
</h1>

<div class="qs_txt">
</div>
 <div class="qs_box">
 <form id="data">
 <input type="hidden" name="personId" value="${personId}">
 <input type="hidden" name="examinationId" value="${examinationId}">
 	  <c:forEach var="data" items="${dataList}" varStatus="dd">
	 	  <c:if test="${data.exType=='选择题'}"> 
		     <div class="qs_title">
		        ${dd.index+1}.${data.title}<span class="qs_red">*</span>
		     </div>
		     <ul class="qs_Answer">
		         <li>
		         <c:if test="${data.answer=='A'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}1" value="A" checked readonly><label for="${dd.index+1}1">A.${fn:split(data.content,",")[0]}</label>
		         </c:if> 
		         <c:if test="${data.answer!='A'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}1" value="A" readonly><label for="${dd.index+1}1">A.${fn:split(data.content,",")[0]}</label>
		         </c:if>
		         </li>
		         <li>
		         <c:if test="${data.answer=='B'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}2" value="B" readonly><label for="${dd.index+1}2">B.${fn:split(data.content,",")[1]}</label>
		         </c:if> 
		         <c:if test="${data.answer!='B'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}2" value="B" readonly><label for="${dd.index+1}2">B.${fn:split(data.content,",")[1]}</label>
		         </c:if>
		         </li>
		         <li>
		         <c:if test="${data.answer=='C'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}3" value="C" readonly><label for="${dd.index+1}3">C.${fn:split(data.content,",")[2]}</label>
		         </c:if> 
		         <c:if test="${data.answer!='C'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}3" value="C" readonly><label for="${dd.index+1}3">C.${fn:split(data.content,",")[2]}</label>
		         </c:if>
		         </li>
		         <li>
		         <c:if test="${data.answer=='D'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}4" value="D" checked readonly><label for="${dd.index+1}4">D.${fn:split(data.content,",")[3]}</label>
		         </c:if> 
		         <c:if test="${data.answer!='D'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}4" value="D" readonly><label for="${dd.index+1}4">D.${fn:split(data.content,",")[3]}</label>
		         </c:if>
		         </li>
		     </ul>     
		  </c:if> 
		   <c:if test="${data.exType=='判断题'}"> 
		     <div class="qs_title">
		        ${dd.index+1}.${data.title}<span class="qs_red">*</span>
		     </div>
		     <ul class="qs_Answer">
		         <li>
		         <c:if test="${data.answer=='A'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}1" value="A" checked readonly><label for="${dd.index+1}1">A.对</label>
		         </c:if> 
		         <c:if test="${data.answer!='A'}"> 
		         	 <input type="radio" name="${data.id}" id="${dd.index+1}1" value="A" readonly><label for="${dd.index+1}1">A.对</label>
		         </c:if>
		         </li>
		         <li>
		         <c:if test="${data.answer=='B'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}2" value="B" checked readonly><label for="${dd.index+1}2">B.错</label>
		         </c:if> 
		         <c:if test="${data.answer!='B'}"> 
		             <input type="radio" name="${data.id}" id="${dd.index+1}2" value="B" readonly><label for="${dd.index+1}2">B.错</label>
		         </c:if>
		         </li>
		     </ul>     
		  </c:if> 
		   <c:if test="${data.exType=='填空题'}"> 
		     <div class="qs_title">
		        ${dd.index+1}.${data.title}<span class="qs_red">*</span><input type="text" name="${data.id}" value="${data.answer}" readonly>  
		     </div>
		  </c:if> 
      </c:forEach>
 </form>
 </div>
</body>
</html>
