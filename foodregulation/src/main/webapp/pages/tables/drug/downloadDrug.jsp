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
                    <tr><td colspan="4" align="center">药品零售企业信用档案</td></tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td></td>
						<td>所属行政区域</td>
                        <td>
                        	
                       </td>
					 </tr>
					  <tr>
                        <td>企业地址(具体到门牌号)</td>
                        <td></td>
                        <td>邮政编码</td>
                        <td></td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td></td>
						<td>传    真</td>
                        <td></td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td></td>
						<td>经济类型</td>
                        <td>
                        </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td></td>
                        <td>注册号/统一社会信用代码</td>
                        <td></td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td></td>
						<td>学历</td>
                        <td></td>
                        </tr>
                      <tr>
                        <td colspan="4">执业药师或技术职称</td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td></td>
						<td>学历</td>
                        <td></td>
                        </tr>
                      <tr>
                        <td colspan="4">执业药师或技术职称</td>
                      </tr>
                      <tr>
                        <td>质量负责人</td>
                        <td></td>
						<td>学历</td>
                        <td></td>
                       </tr>
                      <tr>
                        <td colspan="4">执业药师或技术职称</td>
                        
                      </tr>
                      <tr>
                        <td>中药饮品质量负责人</td>
                        <td></td>
						<td>学历</td>
                        <td></td>
                        </tr>
                      <tr>
                        <td colspan="4">执业药师或技术职称</td>
                                          
                      </tr>                    
                      <tr>
                       <td>许可证编号</td>
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
                       <td>GSP证书编号</td>
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
                        <td>监管单位</td>
                      	<td>
                        </td>
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
                        <td>经度</td>
                        <td></td>
						<td>纬度</td>
                        <td></td>
                      </tr>
                   
					  <tr>
                        <td colspan="4"><b>二、经营范围</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyrange" type="checkbox" value="处方药" name="jyrange">&nbsp&nbsp&nbsp处方药</td>
                        <td><input id="jyrange" type="checkbox" value="非处方药" name="jyrange">&nbsp&nbsp&nbsp非处方药</td>
                        <td><input id="jyrange" type="checkbox" value="中药饮片" name="jyrange">&nbsp&nbsp&nbsp中药饮片</td>
                        <td><input id="jyrange" type="checkbox" value="中成药" name="jyrange">&nbsp&nbsp&nbsp中成药</td>
                      </tr>
					  <tr>
					    <td><input id="jyrange" type="checkbox" value="化学药制剂" name="jyrange">&nbsp&nbsp&nbsp化学药制剂</td>
                        <td><input id="jyrange" type="checkbox" value="抗生素制剂" name="jyrange">&nbsp&nbsp&nbsp抗生素制剂</td>
						<td><input id="jyrange" type="checkbox" value="生化药品" name="jyrange">&nbsp&nbsp&nbsp生化药品</td>
						<td><input id="jyrange" type="checkbox" value="生物制品" name="jyrange">&nbsp&nbsp&nbsp生物制品</td>
                      </tr>
                     <tr>
                      <td><input id="jyrange" type="checkbox" value="其他" name="jyrange">&nbsp&nbsp&nbsp其他</td>
                       </tr>
                      <tr>
                        <td colspan="4"><b>三、仓贮情况</b></td>                 
                      </tr>
                     
                        <tr>
                          <td colspan="4" align="center">药品仓库面积(m<sup>2</sup>)</td>
                        </tr>
						<tr>
								<td >总面积</td>
								<td></td>
								<td>常温库</td>
								<td></td>
								</tr>
								<td >阴凉库</td>
								<td></td>

								<td >冷库</td>
								<td></td>
								</tr>
                      
																  
                    </tfoot>
                  </table>
							</div>
							<br>
							<br>
							<div align="center">
						<input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/>
						</div>
							
  </body>
</html>
