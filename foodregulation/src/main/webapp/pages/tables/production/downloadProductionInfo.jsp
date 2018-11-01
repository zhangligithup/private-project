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
                  <table border="1" id="" class="table table-condensed" >
                    <tbody>
                    <tr><td colspan="4" align="center">食品生产企业信用档案</td></tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>
                     </tr>
					 <tr>
						 <td>企业名称</td>
                        <td>${production.qyname }"/></td>
						<td>所属行政区域</td>
                        <td>${production.address }</td>
					 </tr>
					  <tr>
                        <td>生产地址(具体到门牌号)</td>
                        <td>${production.scaddress }</td>
                        <td>邮政编码</td>
                        <td>${production.ems }</td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td>${production.phone }</td>
						<td>传    真</td>
                        <td>${production.fax }</td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td>${production.email }</td>
						<td>经济类型</td>
                        <td>${production.jjtype } </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td>${production.gsorganization }</td>
                        <td>注册号/统一社会信用代码</td>
                        <td>${production.zzcode }</td>
                      </tr>
                      
                      
                      
                      <tr>
                        <td>成立日期</td>
                        <td>${production.cldate }</td>
						<td>年总产值(万元)</td>
                        <td>${production.nzyield }</td>
                      </tr>
                      <tr>
                        <td>法定代表人</td>
                        <td>${production.fddelegate }</td>
						<td>电话(手机)号</td>
                        <td>${production.fdphone }</td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td>${production.qydelegate }</td>
						<td>电话(手机)号</td>
                        <td>${production.qyphone }</td>
                      </tr>
                      <tr>
                        <td>从业人员数量</td>
                        <td>${production.cynumber }</td>
						 <td>化验人员数量</td>
                        <td>${production.assay }</td>
                      </tr>
                      <tr>
                        <td>监管单位</td>
                      	<td>${production.department }</td>
						<td>监管人员</td>
                        <td>${production.spdelegate }</td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td>${production.jiandurenyuan }</td>
						<td>协管人员</td>
                        <td>${production.xieguanrenyuan }</td>
                      </tr>
                      <tr>
                       <td>许可证编号</td>
                        <td>${production.scpermit }</td>
						<td>发证机关</td>
                        <td>${production.fazhengjiguan }</td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td>${production.fazhengriqi }</td>
						<td>有效日期</td>
                        <td>${production.youxiaodate }</td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td>${production.longitude }</td>
						<td>纬度</td>
                        <td>${production.latitude }</td>
                      </tr>
					 
					  <tr>
                        <td colspan="4"><b>二、企业管理认证情况</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="isoapprove" type="checkbox" value="ISO质量体系认证" name="isoapprove" <c:if test="${production.isoapprove eq 'ISO质量体系认证' }">checked='checked'</c:if>>
                        	质量体系认证</td>
                        <td><input id="hacccpapprove" type="checkbox" value="HACCP认证" name="hacccpapprove" <c:if test="${production.hacccpapprove eq 'HACCP认证' }">checked='checked'</c:if>>
                        	认证</td>
                        <td colspan="2"><input id="wghapprove" type="checkbox" value="无公害食品认证" name="wghapprove" <c:if test="${production.wghapprove eq '无公害食品认证' }">checked='checked'</c:if>>
                        	无公害食品认证</td>                        
                      </tr>
					  <tr>
                        <td><input id="lsapprove" type="checkbox" value="绿色食品认证" name="lsapprove" <c:if test="${production.lsapprove eq '绿色食品认证' }">checked='checked'</c:if>>
                        	绿色食品认证</td>
						<td><input id="yjapprove" type="checkbox" value="有机食品认证" name="yjapprove" <c:if test="${production.yjapprove eq '有机食品认证' }">checked='checked'</c:if>>
							有机食品认证</td>
						<td colspan="2"><input id="capprove" type="checkbox" value="标志认证" name="capprove" <c:if test="${production.capprove eq '标志认证' }">checked='checked'</c:if>>
							标志认证</td>                   
                      </tr>
					  
					  <tr>
                        <td colspan="4"><b>三、产品执行标准</b></td>
                      </tr>
                      <tr>
                      	<td colspan="4">
	                      	<table border="1" class="table table-condensed"  id="table1">    
								<tr>
			    				    <td style="width:80px">产品名称</td> 
			    	       	 		<td style="width:210px">执行标准名称</td>  
			    	      	 		<td style="width:210px">执行标准编号</td>
			    	      	 		<td style="width:210px">是否备案</td> 
		    	    			</tr>
		    	    			<c:forEach items="${standardArr}" var="standard" varStatus="status">
		    	    				<c:if test="${status.count eq 1 || (status.count - 1) % 4 eq 0}">
        								<tr>
    								</c:if>
    										
    										
		    	    						<td>
		    	    							${standard }
		    	    						</td>
			    	    			<c:if test="${status.count%4 eq  0 || status.count eq 4}">
	        								</tr>
	    							</c:if>
		    	    			</c:forEach> 
	         				</table>
         				</td>
                      </tr>
                      
                      <tr>
                        <td align="left" colspan="4"><b>四、产品明细</b></td>
                      </tr>
                      <tr>
                      	<td colspan="4">
	                      	<table border="1" class="table table-condensed"  id="table2">    
								<tr>
			      			 		<td style="width:210px">产品名称</td>
			    				    <td style="width:210px">规格</td> 
			    	       	 		<td style="width:210px">年产量</td>  
		    	    			</tr>
		    	    			
		    	    			
		    	    			<c:forEach items="${detailsArr}" var="details" varStatus="status">
		    	    				<c:if test="${status.count eq 1 || (status.count - 1) % 3 eq 0}">
        								<tr>
    								</c:if>
    										
    										
		    	    						<td>
		    	    							${details }
		    	    						</td>
			    	    			<c:if test="${status.count%3eq  0 || status.count eq 3}">
	        								</tr>
	    							</c:if>
		    	    			</c:forEach>  
	         				</table>
         				</td>
                      </tr>
                      
                      <tr>
                        <td colspan="4"><b>五、食品添加剂使用情况</b></td>
                      </tr>
                      <tr>
                      	<td colspan="4">
	                      	<table border="1" class="table table-condensed" width="100%" cellspacing="1" id="table3">    
								<tr>
			    				    <td width="15%">添加剂名称</td> 
			    	       	 		<td width="15%">添加剂主要成分</td>  
			    	      	 		<td width="15%">需要添加食品名称</td>
			    	      	 		<td width="15%">标准规格最大使用量(g/kg)</td>
			    	      	 		<td width="10%">实际用量(g/kg)</td>
			    	      	 		<td width="10%">操作者</td> 
		    	    			</tr>
		    	    			
		    	    			<c:forEach items="${conditionArr}" var="condition" varStatus="status">
		    	    				<c:if test="${status.count eq 1 || (status.count - 1) % 6 eq 0}">
        								<tr>
    								</c:if>
    										
    										
		    	    						<td>
		    	    							${condition }
		    	    						</td>
			    	    			<c:if test="${status.count%6 eq  0 || status.count eq 6}">
	        								</tr>
	    							</c:if>
		    	    			</c:forEach>
	         				</table>
         				</td>
                      </tr>
                      
                      
                      <tr>
                        <td colspan="4"><b>六、委托加工备案情况</b></td>
                      </tr>
                      <tr>
                      	<td>产品类别</td>
                        <td>${production.chanPinLeiBie }</td>
						<td>委托加工产品名称</td>
                        <td>${production.wtChanPinName }</td>
                      </tr>
                      
                      <tr>
                      	<td>委托方企业名称</td>
                        <td>${production.wtQyName }</td>
						<td>生产地址</td>
                        <td>${production.wtScAddress }</td>
                      </tr>
                      
                      <tr>
                      	<td>委托方联系人</td>
                        <td>${production.wtLinkman }</td>
						<td>联系电话</td>
                        <td>${production.wtTel }</td>
                      </tr>
                      
                      <tr>
                      	<td>被委托方企业名称</td>
                        <td>${production.bwtQyName }</td>
						<td>生产地址</td>
                        <td>${production.bwtScAddress }</td>
                      </tr>
                      
                      <tr>
                      	<td>被委托方联系人</td>
                        <td>${production.bwtLinkName }</td>
						<td>联系电话</td>
                        <td>${production.bwtTel }</td>
                      </tr>
                      
                      <tr>
                      	<td>合同生效日期</td>
                        <td>${production.htSxDate }</td>
						<td>委托合同期限</td>
                        <td>${production.wtHtDate}</td>
                      </tr>
                    </tfoot>
                  </table>	
             </div>
                 <br/>
                 <br/>
                 <input type="button" onclick="print()" width="50px" value="打印"/>
  </body>
</html>
