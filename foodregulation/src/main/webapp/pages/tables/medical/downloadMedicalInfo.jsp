<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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

      
      
    

     		<a href="javascript:" onclick="history.back(); ">返回上一页</a>
     		
     		<br/>
     		<br/>

				<div id="ddd">
                  
                  <table id="" border="1"  >
                    <tbody>
                    <tr>
                    	<td align="center" colspan="4">
                    		医疗器械使用企业信用档案
                    	</td>
                    </tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td>${medical.qyname }</td>
						<td>所属行政区域</td>
                        <td>
                        	${medical.address }
                       </td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
                        <td>${medical.scaddress }</td>
                        <td>邮政编码</td>
                        <td>${medical.ems }</td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td>${medical.phone }</td>
						<td>传    真</td>
                        <td>${medical.fax }</td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td>${medical.email }</td>
						<td>经济类型</td>
                        <td> ${medical.jjtype}</td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td>${medical.gsorganization }</td>
                        <td>注册号</td>
                        <td>${medical.zzcode }</td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td>${medical.fddelegate }</td>
						<td>电话(手机)号</td>
                        <td>${medical.fdphone }</td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td>${medical.qydelegate }</td>
						<td>电话(手机)号</td>
                        <td>${medical.qyphone }</td>
                      </tr>
                      
                      <tr>
                        <td>监管单位</td>
                      	<td>${medical.department }
                        </td>
						<td>监管人员</td>
                        <td>${medical.spdelegate }</td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td>${medical.jiandurenyuan }</td>
						<td>协管人员</td>
                        <td>${medical.xieguanrenyuan }</td>
                      </tr>
                      
                      <tr>
                        <td>经营范围</td>
                        <td>${medical.jyArea }</td>
						 <td>使用单位类别</td>
                        <td>${medical.useCategory }</td>
                      </tr>
                      
                      <tr>
                       <td>许可证编号</td>
                        <td>${medical.scpermit }</td>
						<td>发证机关</td>
                        <td>${medical.fazhengjiguan }</td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td>${medical.fazhengriqi }</td>
						<td>有效日期</td>
                        <td>${medical.youxiaodate }</td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td>${medical.longitude }</td>
						<td>纬度</td>
                        <td>${medical.latitude }</td>
                      </tr>
					 
					 <!--  
					  <tr>
                        <td><b>二、企业类别</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="销售" name="market" <c:if test="${medical.market eq '销售' }">checked='checked'</c:if>>
                        		&nbsp&nbsp&nbsp医疗器械销售企业</td>
                        <td><input id="hacccpapprove" type="checkbox" value="使用" name="useEnterprise" <c:if test="${medical.useEnterprise eq '使用' }">checked='checked'</c:if>>
                        		&nbsp&nbsp&nbsp医疗器械使用企业</td>
                      </tr>
                      -->
                      
                      <tr>
                        <td colspan="4"><b>二、医疗器械使用情况明细</b></td>                 
                      </tr>
					   <tr>
                      	<td colspan="4">
	                      	<table border="1">    
								<tr>
			    				    <td width="20%">医疗器械名称</td> 
			    	       	 		<td width="20%">生产厂家</td>  
			    	      	 		<td width="15%">规格型号</td>
			    	      	 		<td width="15%">产品注册证号</td>
			    	      	 		<td width="15%">供货单位</td>
			    	      	 		<td width="15%">购进时间</td> 
		    	    			</tr>
		    	    			<c:forEach items="${array}" var="arr" varStatus="status">
		    	    				<c:if test="${status.count eq 1 || (status.count - 1) % 6 eq 0}">
        								<tr>
    								</c:if>
    										
    										
		    	    						<td>
		    	    							${arr }
		    	    						</td>
			    	    			<c:if test="${status.count%6 eq  0 || status.count eq 6}">
	        								</tr>
	    							</c:if>
		    	    			</c:forEach>
	         				</table>
         				</td>
         				
                      </tr>
                    </tfoot>
                  </table>	
                 </div>
                 <br/>
                 <br/>
                 <input type="button" onclick="print()" width="50px" value="打印"/>
  </body>
</html>
