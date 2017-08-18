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
	 <br>
	 <br>
  <div id="ddd" class="tablec">
								<table id="" border="1" cellpadding="0" cellspacing="0" >
									<tbody>
									<tr><td colspan="4" align="center">酒类销售企业备案登记表</td></tr>
										<tr>
											<td colspan="4"><b>一、基本情况</b></td>
											
										</tr>
										<tr>
											<td>经营单位名称</td>
											<td>${wine.qyname}</td>
											<td>所属行政区域</td>
											<td>
													${ wine.address}
											</td>
										</tr>
										<tr>
											<td>经营场所(具体到门牌号)</td>
											<td>${wine.scaddress}
											</td>
											<td>邮政编码</td>
											<td>${wine.ems}</td>
										</tr>
										<tr>
											<td>法定代表人</td>
											<td>${wine.lerepre}</td>
											<td>电话(手机)号</td>
											<td>${wine.lephone}</td>
										</tr>
										<tr>
											<td>企业负责人</td>
											<td>${wine.qydelegate}</td>
											<td>电话(手机)号</td>
											<td>${wine.qyphone}</td>
										</tr>
										<tr>
											<td>注册号/统一社会信用代码</td>
											<td>${wine.zzcode}</td>
											<td>成立日期</td>
											<td>${wine.cldate}</td>
										</tr>
										<tr>
											<td>监管单位</td>
											<td>${wine.department}</td>
											<td>监管人员</td>
											<td>${wine.spdelegate}</td>
										</tr>
										<tr>
											<td>监督人员</td>
											<td>${wine.jiandurenyuan}</td>
											<td>协管人员</td>
											<td>${wine.xieguanrenyuan}
											</td>
										</tr>
										<tr>
											<td>食品经营许可证编号</td>
											<td>${wine.scpermit}</td>
											<td>发证机关</td>
											<td>${wine.fazhengjiguan}</td>
										</tr>
										<tr>
											<td>发证日期</td>
											<td>${wine.fazhengriqi}</td>
											<td>有效日期</td>
											<td>${wine.youxiaodate}</td>
										</tr>
										<tr>
											<td>经度</td>
											<td>${wine.longitude}</td>
											<td>纬度</td>
											<td>${wine.latitude}</td>
										</tr>
										<tr>
											<td colspan="4"><b>二、许可范围</b></td>
										</tr>

										<tr>
											<td colspan="4">经营类型</td>
										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox"
												value="酒类生产企业" name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '酒类生产企业' }">checked='checked'</c:if>
                        		</c:forEach>>酒类生产企业</td>
											<td><input id="hacccpapprove" type="checkbox"
												value="白酒生产作坊" name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '白酒生产作坊' }">checked='checked'</c:if>
                        		</c:forEach>>白酒生产作坊</td>
											<td><input id="wghapprove" type="checkbox"
												value="酒类销售企业" name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '酒类销售企业' }">checked='checked'</c:if>
                        		</c:forEach>>酒类销售企业</td>
											<td><input id="wghapprove" type="checkbox" value="个体工商户"
												name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '个体工商户' }">checked='checked'</c:if>
                        		</c:forEach>>个体工商户</td>

										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox"
												value="批发（含批零兼营）" name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '批发（含批零兼营）' }">checked='checked'</c:if>
                        		</c:forEach>>批发（含批零兼营）</td>
											<td><input id="hacccpapprove" type="checkbox" value="零售"
												name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '零售' }">checked='checked'</c:if>
                        		</c:forEach>>零售</td>
											<td><input id="hacccpapprove" type="checkbox" value="餐饮"
												name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '餐饮' }">checked='checked'</c:if>
                        		</c:forEach>>餐饮</td>
											<td><input id="wghapprove" type="checkbox"
												value="酒吧等娱乐场所" name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '酒吧等娱乐场所' }">checked='checked'</c:if>
                        		</c:forEach>>酒吧等娱乐场所</td>
										</tr>
										<tr>
											<td colspan="4"><input id="wghapprove" type="checkbox" value="其他"
												name="type" <c:forEach items="${type}" var="one">
                        			 <c:if test="${one eq '其他' }">checked='checked'</c:if>
                        		</c:forEach>>其他</td>
										</tr>
										<tr>
											<td>经营范围</td>
										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox" value="白酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '白酒' }">checked='checked'</c:if>
                        		</c:forEach>>白酒</td>
											<td><input id="hacccpapprove" type="checkbox" value="啤酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '啤酒' }">checked='checked'</c:if>
                        		</c:forEach>>啤酒</td>
											<td><input id="wghapprove" type="checkbox" value="葡萄酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '葡萄酒' }">checked='checked'</c:if>
                        		</c:forEach>>葡萄酒</td>
											<td><input id="wghapprove" type="checkbox" value="果酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '果酒' }">checked='checked'</c:if>
                        		</c:forEach>>果酒</td>
										</tr>
										<tr>
											<td><input id="wghapprove" type="checkbox" value="黄酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '黄酒' }">checked='checked'</c:if>
                        		</c:forEach>>黄酒</td>
											<td><input id="wghapprove" type="checkbox" value="配制酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '配制酒' }">checked='checked'</c:if>
                        		</c:forEach>>配制酒</td>
											<td><input id="isoapprove" type="checkbox" value="进口酒"
												name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '进口酒' }">checked='checked'</c:if>
                        		</c:forEach>>进口酒</td>
											<td><input id="hacccpapprove" type="checkbox"
												value="酒精度（alcohol）大于0.5%Vol的含酒精饮料" name="range" <c:forEach items="${range}" var="one">
                        			 <c:if test="${one eq '酒精度（alcohol）大于0.5%Vol的含酒精饮料' }">checked='checked'</c:if>
                        		</c:forEach>>酒精度（alcohol）大于0.5%Vol的含酒精饮料</td>
										</tr>
									</tbody>
								</table>
							</div>
							<br>
	 <br>
	 <div align="center">
						<input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></div>
							
  </body>
</html>



