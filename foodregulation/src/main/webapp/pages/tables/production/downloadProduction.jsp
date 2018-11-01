<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>食品药品动态监管系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
    <script language="javascript" src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
  </head>
  
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
	 <div id="ddd">
                  <table border="1" >                   
                    <tbody>
                    <tr><td colspan="4" align="center">食品生产企业信用档案</td></tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>
                     </tr>
					 <tr>
						 <td width="25%">企业名称</td>
                        <td width="25%"> </td>
						<td width="25%">所属行政区域</td>
                        <td width="25%"></td>
					 </tr>
					  <tr>
                        <td>生产地址(具体到门牌号)</td>
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
                        <td>成立日期</td>
                        <td></td>
						<td>年总产值(万元)</td>
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
                        <td>从业人员数量</td>
                        <td></td>
						 <td>化验人员数量</td>
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
					 
					  <tr>
                        <td colspan="4"><b>二、企业管理认证情况</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="isoapprove" type="checkbox" value="ISO质量体系认证" name="isoapprove">ISO质量体系认证</td>
                        <td><input id="hacccpapprove" type="checkbox" value="HACCP认证" name="hacccpapprove">HACCP认证</td>
                        <td colspan="2"><input id="wghapprove" type="checkbox" value="无公害食品认证" name="wghapprove">无公害食品认证</td>                        
                      </tr>
					  <tr>
                        <td><input id="lsapprove" type="checkbox" value="绿色食品认证" name="lsapprove">绿色食品认证</td>
						<td><input id="yjapprove" type="checkbox" value="有机食品认证" name="yjapprove">有机食品认证</td>
						<td colspan="2"><input id="capprove" type="checkbox" value="标志认证" name="capprove">标志认证</td>                   
                      </tr>
                      </tbody>
                      </table>
					  
					  <table border="1">
					  <tr>
                        <td colspan="5"><b>三、产品执行标准</b></td>
                      </tr>
                      <tr>
			      			 		<td width="20%">序号</td> 
			    				    <td width="20%">产品名称</td> 
			    	       	 		<td width="20%">执行标准名称</td>  
			    	      	 		<td width="20%">执行标准编号</td>
			    	      	 		<td width="20%">是否备案</td> 
		    	    			</tr>
		    	    			<tr>
			      			 		<td style="width:140px">1</td> 
			    				    <td style="width:140px"></td>  
			    	       	 		<td style="width:140px"></td>   
			    	      	 		<td style="width:140px"></td> 
			    	      	 		<td style="width:140px"></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>2</td> 
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
		    	    			</tr>  
	         				</table>
                      <table border="1">
                      <tr>
                        <td colspan="4"><b>四、产品明细</b></td>
                      </tr>
                      <tr>
			      			 		<td>序号</td> 
			      			 		<td>产品名称</td>
			    				    <td>规格</td> 
			    	       	 		<td>年产量</td>  
		    	    			</tr>     
								<tr>
			      			 		<td style="width:80px">1</td> 
			    				    <td style="width:210px"></td>  
			    	       	 		<td style="width:210px"></td>   
			    	      	 		<td style="width:210px"></td> 
		    	    			</tr>
		    	    			<tr>
			      			 		<td>2</td> 
			    				    <td></td>  
			    	       	 		<td></td>   
			    	      	 		<td></td> 
		    	    			</tr>
		    	    			<tr>
			      			 		<td>3</td> 
			    				    <td></td>  
			    	       	 		<td></td>   
			    	      	 		<td></td> 
		    	    			</tr>
	         				</table>
	         				
                      <table border="1">
                      <tr>
                        <td colspan="6"><b>五、食品添加剂使用情况</b></td>
                      </tr>
                      
                      <tr>
      			 		<td>序号</td> 
    				    <td>添加剂名称</td> 
    	       	 		<td>添加剂主要成分</td>  
    	      	 		<td>需要添加食品名称</td>
    	      	 		<td>标准规格最大使用量(g/kg)</td>
    	      	 		<td>实际用量(g/kg)</td>
   	    			</tr>
		    	    			<tr>
			      			 		<td>1</td> 
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
		    	    			</tr> 
		    	    			<tr>
			      			 		<td>3</td> 
			    				   <td></td>  
			    	       	 		<td></td>   
			    	      	 		<td></td> 
			    	      			<td></td> 
			    	      			<td></td> 
		    	    			</tr>   
                      </table>
                      <table border="1">
                      <tr>
                        <td colspan="4"><b>六、委托加工备案情况</b></td>
                      </tr>
                      <tr>
                      	<td width="25%">产品类别</td>
                        <td width="25%"></td>
						<td width="25%">委托加工产品名称</td>
                        <td width="25%"></td>
                      </tr>
                      
                      <tr>
                      	<td style="width:180px">委托方企业名称</td>
                        <td style="width:180px"></td>
						<td style="width:180px">生产地址</td>
                        <td style="width:180px"></td>
                      </tr>
                      
                      <tr>
                      	<td>委托方联系人</td>
                        <td></td>
						<td>联系电话</td>
                        <td></td>
                      </tr>
                      
                      <tr>
                      	<td>被委托方企业名称</td>
                        <td></td>
						<td>生产地址</td>
                        <td></td>
                      </tr>
                      
                      <tr>
                      	<td>被委托方联系人</td>
                        <td></td>
						<td>联系电话</td>
                        <td></td>
                      </tr>
                      
                      <tr>
                      	<td>合同生效日期</td>
                        <td></td>
						<td>委托合同期限</td>
                        <td></td>
                      </tr>
                  </table>	
                  
                  
                  <br/>
                 <br/>
                </div>
                 <div align="center">
                 <input type="button" onclick="print()" width="50px" value="打印"/></div>
                 
  </body>
</html>
