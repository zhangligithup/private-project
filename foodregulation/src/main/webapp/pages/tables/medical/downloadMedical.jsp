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
					<table border="1"  >                  
                    <tr><td colspan="4" align="center">医疗器械销售企业信用档案</td></tr>
                     <tr>
                        <td colspan="4">一、基本情况</td>
                                      
                     </tr>
					 <tr>
						<td width="25%">企业名称</td>
                        <td width="25%"></td>
						<td width="25%">所属行政区域</td>
                        <td width="25%"></td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
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
                        <td></td>
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
                        <td>经营范围</td>
                        <td></td>
						 <td>使用单位类别</td>
                        <td></td>
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
                        <td>经度</td>
                        <td></td>
						<td>纬度</td>
                        <td></td>
                      </tr>
                      
                  </table>
                  <table border="1">
                      <tr>
                        <td colspan="7"><b>二、医疗器械使用情况明细</b></td>                 
                      </tr>
					   <tr>
	      			 		<td width="5%">序号</td> 
	    				    <td width="15%">医疗器械名称</td> 
	    	       	 		<td width="15%">生产厂家</td>  
	    	      	 		<td width="15%">规格型号</td>
	    	      	 		<td width="15%">产品注册证号</td>
	    	      	 		<td width="10%">供货单位</td>
	    	      	 		<td width="10%">购进时间</td> 
		    	       </tr>
    	    			<tr>
	      			 		<td>1</td> 
	    				    <td></td>  
	    	       	 		<td></td>   
	    	      	 		<td></td>
	    	      	 		<td></td>
	    	      	 		<td></td>
	    	      	 		<td></td> 
	    	      			
    	    			</tr>
    	    			<tr>
	      			 		<td>2</td> 
	    				    <td></td>  
	    	       	 		<td></td>   
	    	      	 		<td></td>
	    	      	 		<td></td>
	    	      	 		<td></td>
	    	      	 		<td></td>  
    	    			</tr> 
    	    			<tr>
	      			 		<td>3</td> 
	    				    <td></td>  
	    	       	 		<td></td>   
	    	      	 		<td></td>
	    	      	 		<td></td>
	    	      	 		<td></td>
	    	      	 		<td></td> 
    	    			</tr>   
                   </table>
							</div>
							<br>
							<br/>
							<div align="center">
						<input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/>
							</div>
  </body>
</html>
                    