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
			<tr><td colspan="22" align="center"><font size="6"><b>化妆品经营企业信用档案</b></font></td></tr>
			<tr>
				<td><font size="4" >企业名称</font></td>
				<td><font size="4" >所属行政区域</font> </td>
				<td><font size="4" >经营场所(具体到门牌号)</font> </td>
				<td><font size="4" >邮政编码	</font> </td>
				<td><font size="4" >法定代表人</font> </td>
				<td><font size="4" >电话(手机)号</font> </td>
				<td><font size="4" >负责人</font> </td>
				<td><font size="4" >电话(手机)号</font> </td>
				<td><font size="4" >经济类型</font> </td>
				<td><font size="4" >电子邮箱</font> </td>
				<td><font size="4" >登记机关</font> </td>
				<td><font size="4" >注册号/统一社会信用代码 </font></td>
				<td><font size="4" >成立日期 </font></td>
				<td><font size="4" >年销售额(万元) </font></td>
				<td><font size="4" >经营面积(平方米)</font> </td>
				<td><font size="4" >产权人</font></td>
				<td><font size="4" >房屋使用期限 </font></td>
				<td><font size="4" >房屋使用方式</font></td>
				<td><font size="4" >监管单位</font> </td>
				<td><font size="4" >监管人员 </font></td>
				<td><font size="4" >监督人员</font> </td>
				<td><font size="4" >协管人员</font> </td>
				
				<td><font size="4" >食品经营许可证编号 </font></td>
				<td><font size="4" >发证机关</font> </td>
				<td><font size="4" >发证日期 </font></td>
				<td><font size="4" >有效日期 </font></td>
				<td><font size="4" >经度</font> </td>
				<td><font size="4" >纬度</font> </td>
				
				<td><font size="4" >业态类别</font> </td>
				<td><font size="4" >无店铺经营方式</font> </td>
				
				<td><font size="4" >经营方式</font> </td>
				<td><font size="4" >经营项目 </font></td>
			</tr>
			
			<c:forEach items="${list }" var="lis">
				<tr>
				<td>${lis.qyname }</td>
				<td>${lis.address }</td>
				<td>${lis.scaddress }</td>
				<td>${lis.ems }</td>
				<td>${lis.qydelegate }</td>
				<td>${lis.qyphone }</td>
				<td>${lis.fddelegate }</td>
				<td>${lis.fdphone }</td>
				<td>${lis.jjtype }</td>
				<td>${lis.email }</td>
				<td>${lis.gsorganization }</td>
				<td>${lis.zzcode }</td>
				<td>${lis.cldate }</td>
				<td>${lis.nzyield }</td>
				<td>${lis.jyArea }</td>
				<td>${lis.propertyOwner }</td>
				<td>${lis.fangWuDate }</td>
				<td>${lis.fangWuWay }</td>
				<td>${lis.department}</td>
				<td>${lis.spdelegate }</td>
				<td>${lis.jiandurenyuan }</td>
				<td>${lis.xieguanrenyuan }</td>
				
				<td>${lis.scpermit}</td>
				<td>${lis.fazhengjiguan }</td>
				<td>${lis.fazhengriqi }</td>
				<td>${lis.youxiaodate}</td>
				<td>${lis.longitude}</td>
				<td>${lis.latitude }</td>
				<td>${lis.foodMarket },${lis.superMarket },${lis.cvs },${lis.store },${lis.foodTrade },${lis.foodLogistics },${lis.nonStoreFoodBusiness }</td>
				<td>${lis.onlineShop },${lis.mailOrder },${lis.televisedShopping },${lis.automat }</td>
				<td>${lis.piFa },${lis.retail }</td>
				
				<td>
					${lis.packFood},${lis.bulkFood },${lis.dairyProduct },${lis.hanBaby },${lis.noBody },${lis.foodProduct },${lis.waterProduct },${lis.freshAnimalProduct },
					${lis.healthProduct},${lis.retail },${lis.lsPackFood },${lis.lsBulkFood },${lis.cookedFood },${lis.noCookedFood },${lis.lsDairyProduct },${lis.lsHanBaby },
					${lis.lsNoBody},${lis.lsFoodProduct },${lis.lsWaterProduct },${lis.lsFreshAnimalProduct },${lis.lsHealthProduct },${lis.scene }
				</td>
				</tr>
			</c:forEach>
			
			
		
		</table>
  </div>
							
  </body>
</html>



