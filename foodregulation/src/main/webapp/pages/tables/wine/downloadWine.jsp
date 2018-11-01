<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
											<td colspan="4" ><b>一、基本情况</b></td>
											
										</tr>
										<tr>
											<td>经营单位名称</td>
											<td></td>
											<td>所属行政区域</td>
											<td></td>
										</tr>
										<tr>
											<td>经营场所(具体到门牌号)</td>
											<td></td>
											<td>邮政编码</td>
											<td></td>
										</tr>
										<tr>
											<td>法定代表人</td>
											<td></td>
											<td>电话(手机)号</td>
											<td></td>
										</tr>
										<tr>
											<td>企业负责人</td>
											<td></td>
											<td>电话(手机)号</td>
											<td></td>
										</tr>
										<tr>
											<td>注册号/统一社会信用代码</td>
											<td></td>
											<td>成立日期</td>
											<td></td>
										</tr>
										<tr>
											<td>监管单位</td>
											<td></td>
											<td>监管人员</td>
											<td></td>
										</tr>
										<tr>
											<td>监督人员</td>
											<td></td>
											<td>协管人员</td>
											<td></td>
										</tr>
										<tr>
											<td>食品经营许可证编号</td>
											<td></td>
											<td>发证机关</td>
											<td></td>
										</tr>
										<tr>
											<td>发证日期</td>
											<td></td>
											<td>有效日期</td>
											<td></td>
										</tr>
										<tr>
											<td>经度</td>
											<td></td>
											<td>纬度</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="4" ><b>二、许可范围</b></td>
										</tr>

										<tr>
											<td colspan="4" >经营类型</td>
										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox"
												value="酒类生产企业" name="type">酒类生产企业</td>
											<td><input id="hacccpapprove" type="checkbox"
												value="白酒生产作坊" name="type">白酒生产作坊</td>
											<td><input id="wghapprove" type="checkbox"
												value="酒类销售企业" name="type">酒类销售企业</td>
											<td><input id="wghapprove" type="checkbox" value="个体工商户"
												name="type">个体工商户</td>

										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox"
												value="批发（含批零兼营）" name="type">批发（含批零兼营）</td>
											<td><input id="hacccpapprove" type="checkbox" value="零售"
												name="type">零售</td>
											<td><input id="hacccpapprove" type="checkbox" value="餐饮"
												name="type">餐饮</td>
											<td><input id="wghapprove" type="checkbox"
												value="酒吧等娱乐场所" name="type">酒吧等娱乐场所</td>
										</tr>
										<tr>
											<td colspan="4" ><input id="wghapprove" type="checkbox" value="其他"
												name="type">其他</td>
										</tr>
										<tr>
											<td colspan="4" >经营范围</td>
										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox" value="白酒"
												name="range">白酒</td>
											<td><input id="hacccpapprove" type="checkbox" value="啤酒"
												name="range">啤酒</td>
											<td><input id="wghapprove" type="checkbox" value="葡萄酒"
												name="range">葡萄酒</td>
											<td><input id="wghapprove" type="checkbox" value="果酒"
												name="range">果酒</td>
										</tr>
										<tr>
											<td><input id="wghapprove" type="checkbox" value="黄酒"
												name="range">黄酒</td>
											<td><input id="wghapprove" type="checkbox" value="配制酒"
												name="range">配制酒</td>
											<td><input id="isoapprove" type="checkbox" value="进口酒"
												name="range">进口酒</td>
											<td><input id="hacccpapprove" type="checkbox"
												value="酒精度（alcohol）大于0.5%Vol的含酒精饮料" name="range">酒精度（alcohol）大于0.5%Vol的含酒精饮料</td>
										</tr>
										
									</tbody>
								</table>
							</div>
						<br/>
                 <br/>
                 <div align="center">
                 <input type="button" onclick="print()" width="50px" value="打印"/></div>
							
  </body>
</html>


