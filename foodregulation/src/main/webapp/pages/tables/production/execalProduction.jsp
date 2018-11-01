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
			<tr><td colspan="22" align="center"><font size="6"><b>医疗器械使用企业信用档案</b></font></td></tr>
			<tr>
				<td><font size="4" >企业名称</font></td>
				<td><font size="4" >所属行政区域</font> </td>
				<td><font size="4" >经营场所(具体到门牌号)</font> </td>
				<td><font size="4" >邮政编码</font> </td>
				<td><font size="4" >固定电话	</font> </td>
				<td><font size="4" >传 真</font> </td>
				<td><font size="4" >电子邮箱</font> </td>
				<td><font size="4" >经济类型</font> </td>
				<td><font size="4" >登记机关</font> </td>
				<td><font size="4" >注册号/统一社会信用代码</font> </td>
				
				<td><font size="4" >成立日期</font> </td>
				<td><font size="4" >年总产值(万元)</font> </td>
				<td><font size="4" >法定代表人</font></td>
				<td><font size="4" >电话(手机)号</font></td>
				<td><font size="4" >企业负责人</font></td>
				<td><font size="4" >电话(手机)号</font> </td>
				<td><font size="4" >从业人员数量</font></td>
				<td><font size="4" >化验人员数量</font></td>
				
				<td><font size="4" >监管单位</font></td>
				<td><font size="4" >监管人员</font> </td>
				<td><font size="4" >监督人员 </font></td>
				<td><font size="4" >协管人员</font> </td>
				<td><font size="4" >许可证编号 </font></td>
				<td><font size="4" >发证机关</font> </td>
				<td><font size="4" >发证日期</font></td>
				
				<td><font size="4" >有效日期 </font></td>
				<td><font size="4" >经度</font> </td>
				<td><font size="4" >纬度 </font></td>
				<td><font size="4" >企业管理认证情况</font> </td>
				
				<td><font size="4" >产品执行标准(产品名称)</font></td>
				<td><font size="4" >执行标准名称 </font></td>
				<td><font size="4" >执行标准编号</font></td>
				<td><font size="4" >是否备案</font> </td>
				
				<td><font size="4" >产品明细(产品名称) </font></td>
				<td><font size="4" >规格</font> </td>
				<td><font size="4" >年产量</font> </td>
				
				<td><font size="4" >食品添加剂使用情况(添加剂名称)</font></td>
				<td><font size="4" >添加剂主要成分</font></td>
				<td><font size="4" >需要添加食品名称</font></td>
				<td><font size="4" >标准规格最大使用量(g/kg)</font></td>
				<td><font size="4" >实际用量(g/kg)</font></td>
				<td><font size="4" >操作者</font></td>
				
				<td><font size="4" >委托加工备案情况(产品类别)</font></td>
				<td><font size="4" >委托加工产品名称</font></td>
				<td><font size="4" >委托方企业名称</font></td>
				<td><font size="4" >生产地址</font></td>
				<td><font size="4" >委托方联系人</font></td>
				<td><font size="4" >联系电话</font></td>
				<td><font size="4" >被委托方企业名称</font></td>
				<td><font size="4" >生产地址</font></td>
				<td><font size="4" >被委托方联系人</font></td>
				<td><font size="4" >联系电话</font></td>
				<td><font size="4" >合同生效日期</font></td>
				<td><font size="4" >委托合同期限</font></td>
				
			</tr>
			
			<c:forEach items="${list }" var="lis">
				<tr>
				<td>${lis.qyname }</td>
				<td>${lis.address }</td>
				<td>${lis.scaddress }</td>
				<td>${lis.ems }</td>
				<td>${lis.phone }</td>
				<td>${lis.fax }</td>
				<td>${lis.email }</td>
				<td>${lis.jjtype }</td>
				<td>${lis.gsorganization }</td>
				<td>${lis.zzcode }</td>
				
				<td>${lis.cldate }</td>
				<td>${lis.nzyield }</td>
				<td>${lis.fddelegate }</td>
				<td>${lis.fdphone }</td>
				<td>${lis.qydelegate }</td>
				<td>${lis.qyphone }</td>
				<td>${lis.cynumber }</td>
				<td>${lis.assay }</td>
				
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
				
				<td>${lis.isoapprove},${lis.hacccpapprove},${lis.wghapprove},${lis.lsapprove},${lis.yjapprove},${lis.capprove}</td>
				
				
				<td>${lis.chanpinName }</td>
				<td>${lis.zxbzName }</td>
				<td>${lis.zxbzCode }</td>
				<td>${lis.beian }</td>
				<td>${lis.cpName }</td>
				<td>${lis.guiGe }</td>
				<td>${lis.nianChanLiang }</td>
				<td>${lis.additive }</td>
				
				<td>${lis.additiveComposition}</td>
				<td>${lis.addFoodName }</td>
				<td>${lis.maxAmount }</td>
				<td>${lis.amount }</td>
				<td>${lis.handlers}</td>
				
				<td>${lis.bwtQyName }</td>
				<td>${lis.bwtScAddress }</td>
				<td>${lis.bwtLinkName}</td>
				<td>${lis.bwtTel}</td>
				<td>${lis.htSxDate }</td>
				<td>${lis.wtHtDate }</td>
				
				<td>${lis.chanPinLeiBie }</td>
				<td>${lis.wtChanPinName }</td>
				<td>${lis.wtQyName}</td>
				<td>${lis.wtScAddress}</td>
				<td>${lis.wtLinkman }</td>
				<td>${lis.wtTel }</td>
				
				
				</tr>
			</c:forEach>
			
			
		
		</table>
  </div>
							
  </body>
</html>



