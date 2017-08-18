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
<div align="center">现场检查笔录</div>
<div align="right">第&nbsp;&nbsp;页共&nbsp;&nbsp;页</div>

<hr style="height:2px;border:none;border-top:2px ridge black;"/>

被检查单位(人)：<input type="text" value="${inspectionRecord.company }">陪同人员 ：<input type="text" value="${inspectionRecord.accompanyPerson }"><br>                          
检查现场：<input type="text" value="${inspectionRecord.checkScene }"><br>                                                                      
法定代表人（负责人）：<input type="text" value="${inspectionRecord.legalPerson }">联系方式：<input type="text" value="${inspectionRecord.tel }"><br>             
检查人：<input type="text" value="${inspectionRecord.personName }">记录人：<input type="text" value="${inspectionRecord.recordPerson }">监督检查类别：<input type="text" value="${inspectionRecord.type }"><br>              
检查时间：<input type="text" value="${inspectionRecord.year }">年 <input type="text" value="${inspectionRecord.mouth }">月<input type="text" value="${inspectionRecord.day }">日
<input type="text" value="${inspectionRecord.startHour }">时<input type="text" value="${inspectionRecord.startMinute }">分至<input type="text" value="${inspectionRecord.endHour }">时<input type="text" value="${inspectionRecord.endMinute }">分<br>

<hr style="height:2px;border:none;border-top:2px ridge black;"/> 
      
&nbsp;&nbsp;我们是<input type="text" value="${inspectionRecord.personCompany}">的执法人员   <input type="text" value="${inspectionRecord.personName }"><br>
执法证件名称、编号是：<input type="text" value="${inspectionRecord.perosnLawCard }">请你确认。<br>
我们依法就<input type="text" value=" ${inspectionRecord.content }">有关问题，进行
现场检查，请予配合。根据《中华人民共和国行政处罚法》第三十七条第三款的规定，如果你认为检查人员与当事人有直接利害关系的，你有申请检查人员回避的权利。
问：你是否申请检查人员回避？
答：

现场检查记录：
   <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  
  
                    






  




 

 


注：本文书一式二联，第一联存档，第二联交被检查单位。被检查人在检查笔录上逐页签字，在修改处签字或者按指纹，并在笔录终了处注明对笔录真实性的意见；检查人应在笔录终了处签字。 
被检查人签字：                             


<script>
function printt(){
	 document.getElementById("printdiv").style.display = "none";
	window.print(); 
}
</script>
</body>
</html>

