<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
textarea, input {
   border-left: 0;
   border-right: 0;
   border-top: 0;
   border-bottom: 1px solid #000000;
}
</style>
<body>
<div id="printdiv"><a href="#" onclick="printt()">打印</a></div>
<div align="center">责令改正通知书</div>
<div align="right">（     ）&nbsp;&nbsp;责改通〔       〕&nbsp;&nbsp; 号</div>

<hr style="height:2px;border:none;border-top:2px ridge black;"/>
<input type="text" value="${notice.company }"><br>
&nbsp;&nbsp;你（单位）<input type="text" value="${notice.illegalActivities }">的行为 ，<br>                          
违反了<input type="text" value="${notice.illegalcontents }"> 的规定。 <br>  
&nbsp;&nbsp;根据《中华人民共和国行政处罚法》第二十三条之规定，责令你（单位）于<input type="text" value="${notice.year }">年<br>                          
<input type="text" value="${notice.mouth }">月 <input type="text" value="${notice.day }">日前改正。改正内容及要求如下：<br>              
${notice.content }                        
<br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  
<div align="right">（公    章）</div><br>

                                                       <div align="right">&nbsp;&nbsp;年 &nbsp;&nbsp;月&nbsp;&nbsp;日 </div>

<hr style="height:2px;border:none;border-top:2px ridge black;"/> 
      
本通知书于____年 __月__日__时__分收到。 <br>
                                               <div align="right"> 接收人签字：____________  </div>           

<hr style="height:2px;border:none;border-top:2px ridge black;"/> 
备注：本意见书一式两联，第一联留存卷宗备查，第二联交被监督单位（人）。 

<script>
function printt(){
	 document.getElementById("printdiv").style.display = "none";
	window.print(); 
}
</script>
</body>
</html>

