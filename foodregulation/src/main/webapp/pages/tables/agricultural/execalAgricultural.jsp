<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition","inline;filename=" + "excel.xls");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <script language="javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
  <script language="javascript" src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
  <script type="text/javascript">
  		
  </script>
  
  <body>
  <div id="ddd" class="tablec">
		<table id="" border="1" cellpadding="0" cellspacing="0" >
			<tr><td colspan="15" align="center"><font size="6"><b>食用农产品经营户信用档案</b></font></td></tr>
			<tr>
				<td><font size="4" >经营户名称</font></td>
				<td><font size="4" >所属行政区域</font> </td>
				<td><font size="4" >经营场所(具体到门牌号)</font> </td>
				<td><font size="4" >负责人</font> </td>
				<td><font size="4" >联系电话</font> </td>
				<td><font size="4" >注册号/统一社会信用代码</font> </td>
				<td><font size="4" >监管单位</font> </td>
				<td><font size="4" >监管人员</font> </td>
				<td><font size="4" >监督人员</font> </td>
				<td><font size="4" >协管人员</font> </td>
				<td><font size="4" >食品经营许可证</font> </td>
				<td><font size="4" >经度 </font></td>
				<td><font size="4" >纬度 </font></td>
				<td><font size="4" >经营方式</font></td>
				<td><font size="4" >经营项目</font> </td>
			</tr>
			
			<c:forEach items="${list }" var="lis">
				<tr>
				<td>${lis.qyname }</td>
				<td>${lis.address }</td>
				<td>${lis.scaddress }</td>
				<td>${lis.qydelegate }</td>
				<td>${lis.qyphone }</td>
				<td>${lis.zzcode }</td>
				<td>${lis.department}</td>
				<td>${lis.spdelegate }</td>
				<td>${lis.jiandurenyuan }</td>
				<td>${lis.xieguanrenyuan }</td>
				<td>${lis.scpermit}</td>
				<td>${lis.longitude}</td>
				<td>${lis.latitude }</td>
				
				<td>${lis.jyType }</td>
				<td>${lis.itemsOfBusiness }</td>
				</tr>
			</c:forEach>
			
			
		
		</table>
  </div>
							
  </body>
</html>



