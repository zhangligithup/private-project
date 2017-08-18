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
    <div style="font-weight:normal;font-size:13px;color:#999; line-height:30px;"><span><font style="color:red;">温馨提示：未点击完成离开此页面，此次答题将为0分</font></span><span>答题时间：<font style="color:red;">${totalTime/60}</font>分钟</span><span style="padding-left:10px;">剩余时间：</span><span id='tickTime'></span></div>
</h1>

<div class="qs_txt">
</div>
 <div class="qs_box">
 <form id="data">
 <input type="hidden" id="hipersonId" name="personId" value="${personId}">
 <input type="hidden" id="hiexaminationId" name="examinationId" value="${examinationId}">
 <input type="hidden" id="hitype" name="type" value="${type}">
 <input type="hidden" id="totalTime" value="${totalTime}">
 	  <c:forEach var="data" items="${dataList}" varStatus="dd">
	 	  <c:if test="${data.exType=='选择题'}"> 
		     <div class="qs_title">
		        ${dd.index+1}.${data.title}<span class="qs_red">*</span>
		     </div>
		     <ul class="qs_Answer">
		         <li>
		             <input type="radio" name="${data.id}" id="${dd.index+1}1" value="A"><label for="${dd.index+1}1">A.${fn:split(data.content,",")[0]}</label>
		         </li>
		         <li>
		             <input type="radio" name="${data.id}" id="${dd.index+1}2" value="B"><label for="${dd.index+1}2">B.${fn:split(data.content,",")[1]}</label>
		         </li>
		         <li>
		             <input type="radio" name="${data.id}" id="${dd.index+1}3" value="C"><label for="${dd.index+1}3">C.${fn:split(data.content,",")[2]}</label>
		         </li>
		         <li>
		             <input type="radio" name="${data.id}" id="${dd.index+1}4" value="D"><label for="${dd.index+1}4">D.${fn:split(data.content,",")[3]}</label>
		         </li>
		     </ul>     
		  </c:if> 
		   <c:if test="${data.exType=='判断题'}"> 
		     <div class="qs_title">
		        ${dd.index+1}.${data.title}<span class="qs_red">*</span>
		     </div>
		     <ul class="qs_Answer">
		         <li>
		             <input type="radio" name="${data.id}" id="${dd.index+1}1" value="A"><label for="${dd.index+1}1">A.对</label>
		         </li>
		         <li>
		             <input type="radio" name="${data.id}" id="${dd.index+1}2" value="B"><label for="${dd.index+1}2">B.错</label>
		         </li>
		     </ul>     
		  </c:if> 
		   <c:if test="${data.exType=='填空题'}"> 
		     <div class="qs_title">
		        ${dd.index+1}.${data.title}<span class="qs_red">*</span><input type="text" name="${data.id}">  
		     </div>
		  </c:if> 
      </c:forEach>
 </form>
 </div>
<div class="qs_btn_box" id="savenBtn">
    <a href="#" class="qs_btn" onclick="save()">完成</a>
</div>
<script type="text/javascript">
var flag = true;
//自动提交空白卷，防止重复答题
$(function(){
	$.ajax({
        url:"${pageContext.request.contextPath}/app/isAnswerExam.do",
        type:"post",
        async: false,
        dataType:"text",
        data:{
        	examinationId:$("#hiexaminationId").val(),
        	personId:$("#hipersonId").val(),
        	type:$("#hitype").val()
        },
        success : function(data) {
        	if(data>0){
        		$("#savenBtn").hide();
                flag = false;
                alertEase("不能重复答卷",2);
        	}else{
        		  $.ajax({
        		        url:"${pageContext.request.contextPath}/app/answer.do",
        		        type:"post",
        		        async: false,
        		        data:$("#data").serialize(),
        		        success : function(msg) {
        		        }
        		    });
        	}
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
        }
    });
});

function save(){
  if(flag){
	  $.ajax({
	        url:"${pageContext.request.contextPath}/app/answer.do",
	        type:"post",
	        data:$("#data").serialize(),
	        success : function(msg) {
	          $("#savenBtn").hide();
	          alertEase(msg,1);
	          flag = false;
	        },
	        error:function(){
	        	alert("错误");
	        }
	    });
  }
}
$(function(){
	var myTime=$("#totalTime").val();
	setTimeout(function(){
		if(myTime>0){
			if(flag){
			  alertEase("答题时间到，试卷将自动提交",1);
			  save();
			}
		 }
	},myTime*1000);
	var oTickTime=document.getElementById('tickTime');
	getTickTime(myTime,oTickTime);
	
});
function getTickTime(iS,oDom){
  //  var iS=iM*60;
    var ihh=Math.floor(iS/3600);
    var imm=Math.floor(iS%3600/60);
    var iss=iS%3600%60;
    oDom.innerHTML='<font style="color:red;">'+toDou(ihh)+'</font>小时<font style="color:red;">'+toDou(imm)+'</font>分钟<font style="color:red;">'+toDou(iss)+'</font>秒';
    var timerTick=null;
    clearInterval(timerTick);
    timerTick=setInterval(function(){
        if(iS==0){
            clearInterval(timerTick);
        }else{
            iS--;
            var ihh=Math.floor(iS/3600);
            var imm=Math.floor(iS%3600/60);
            var iss=iS%3600%60;
            oDom.innerHTML='<font style="color:red;">'+toDou(ihh)+'</font>小时<font style="color:red;">'+toDou(imm)+'</font>分钟<font style="color:red;">'+toDou(iss)+'</font>秒';
        }
    },1000);
}
function toDou(iNum){
	return iNum<10? '0'+iNum:''+iNum;
}
</script>
</body>
</html>
