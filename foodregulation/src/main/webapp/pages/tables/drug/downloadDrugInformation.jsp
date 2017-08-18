<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  		$(function(){
			$("#ddd").jqprint();
		});  
		function print(){
    		$("#ddd").jqprint();
    	}  
  </script>
   <body>
	 <a class="pull-right" href="javascript:" onclick="history.back(); ">返回上一页</a>
	 <br/>
	 <br/>
  <div id="ddd" class="tablec">
<table id="" border="1" cellpadding="0" cellspacing="0" >
									<tbody>
									<tr><td colspan="4" align="center">药品零售企业信用档案</td></tr>
									<tr>
                        <td ><b>一、基本情况</b></td>
                         <td></td>
                        <td></td>
                        <td align="right"></td>                 
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td>${drug.qyname}</td>
						<td>所属行政区域</td>
                        <td>
                        	${drug.address}
                       </td>
					 </tr>
					  <tr>
                        <td>企业地址(具体到门牌号)</td>
                        <td>${drug.scaddress} </td>
                        <td>邮政编码</td>
                        <td>${drug.ems}</td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td>${drug.phone}</td>
						<td>传    真</td>
                        <td>${drug.fax}</td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td>${drug.email}</td>
						<td>经济类型</td>
                        <td>${drug.jjtype}
                        </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td>${drug.gsorganization}</td>
                        <td>注册号/统一社会信用代码</td>
                        <td>${drug.zzcode}</td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td>${drug.fddelegate}</td>
						<td>学历</td>
                        <td>${drug.fdeduc}</td>
                        </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td colspan="3">${drug.fdprofess}</td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td>${drug.qydelegate}</td>
						<td>学历</td>
                        <td>${drug.qyeduc}</td>
                        </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td colspan="3">${drug.qyprofess}</td>
                      </tr>
                      <tr>
                        <td>质量负责人</td>
                        <td>${drug.zldelegate}</td>
						<td>学历</td>
                        <td>${drug.zleduc}</td>
                       </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td colspan="3">${drug.zlprofess}</td>
                      </tr>
                      <tr>
                        <td>中药饮品质量负责人</td>
                        <td>${drug.zydelegate}</td>
						<td>学历</td>
                        <td>${drug.zyeduc}</td>
                        </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td colspan="3">${drug.zyprofess}</td>              
                      </tr>                    
                      <tr>
                       <td>许可证编号</td>
                        <td>${drug.scpermit}</td>
						<td>发证机关</td>
                        <td>${drug.fazhengjiguan}</td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td>${drug.fazhengriqi}</td>
						<td>有效日期</td>
                        <td>${drug.youxiaodate}</td>
                      </tr>
                       <tr>
                       <td>GSP证书编号</td>
                        <td>${drug.gsppermit}</td>
						<td>发证机关</td>
                        <td>${drug.gspfazhengjiguan}</td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td>${drug.gspfazhengriqi}</td>
						<td>有效日期</td>
                        <td>${drug.gspyouxiaodate}</td>
                      </tr>
                        <td>监管单位</td>
                      	<td>${drug.department}
                        </td>
						<td>监管人员</td>
                        <td>${drug.spdelegate}</td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td>${drug.jiandurenyuan}</td>
						<td>协管人员</td>
                        <td>${drug.xieguanrenyuan}</td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td>${drug.longitude}</td>
						<td>纬度</td>
                        <td>${drug.latitude}</td>
                      </tr>
                   
					  <tr>
                        <td><b>二、经营范围</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyrange" type="checkbox" value="处方药" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '处方药' }">checked='checked'</c:if>
                        		</c:forEach>>处方药</td>
                        <td><input id="jyrange" type="checkbox" value="非处方药" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '非处方药' }">checked='checked'</c:if>
                        		</c:forEach>>非处方药</td>
                        <td><input id="jyrange" type="checkbox" value="中药饮片" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '中药饮片' }">checked='checked'</c:if>
                        		</c:forEach>>中药饮片</td>
                        <td><input id="jyrange" type="checkbox" value="中成药" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '中成药' }">checked='checked'</c:if>
                        		</c:forEach>>中成药</td>
                      </tr>
					  <tr>
					    <td><input id="jyrange" type="checkbox" value="化学药制剂" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '化学药制剂' }">checked='checked'</c:if>
                        		</c:forEach>>化学药制剂</td>
                        <td><input id="jyrange" type="checkbox" value="抗生素制剂" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '抗生素制剂' }">checked='checked'</c:if>
                        		</c:forEach>>抗生素制剂</td>
						<td><input id="jyrange" type="checkbox" value="生化药品" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '生化药品' }">checked='checked'</c:if>
                        		</c:forEach>>生化药品</td>
						<td><input id="jyrange" type="checkbox" value="生物制品" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '生物制品' }">checked='checked'</c:if>
                        		</c:forEach>>生物制品</td>
                      </tr>
                     <tr>
                      <td colspan="4"><input id="jyrange" type="checkbox" value="其他" name="jyrange" <c:forEach items="${jyrange}" var="one">
                        			 <c:if test="${one eq '其他' }">checked='checked'</c:if>
                        		</c:forEach>>其他</td>
                       </tr>
                      <tr>
                        <td colspan="4"><b>三、仓贮情况</b></td>                 
                      </tr>
                      
                        <tr>
                          <td colspan="4" align="center">药品仓库面积(m<sup>2</sup>)</td>
                        </tr>
                        <tr>
                          <td align="center">总面积</td>
                          <td align="center">常温库</td>
                          <td align="center">阴凉库</td>
                          <td align="center">冷库</td>
                        </tr>
                        <tr>
                          <td>${drug.zhongarea}</td>
                          <td>${drug.changarea}</td>
                          <td>${drug.yinarea}</td>
                          <td>${drug.lengarea}</td>
                        </tr>
                      
                      										  
                    </tfoot>
                    </table>
							</div>
							<br>
							<br/>
							<div align="center">
						<input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/>
						</div>
							
  </body>
</html>
                    