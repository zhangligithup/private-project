<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
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
                  	<table border="1" id="" class="table table-condensed" >                   
                    	<tbody>
                    		<tr><td colspan="4" align="center"><b>食用农产品经营户信用档案</b></td></tr>
							 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>
                     </tr>
					 <tr>
						<td>经营户名称</td>
                        <td></td>
						<td>所属行政区域</td>
                        <td>
                        	
                       </td>
					 </tr>
					  <tr>
                        <td>经营场所地址(具体到摊位号)</td>
                        <td>
                        </td>
                        <td>负责人</td>
                        <td></td>                   
                      </tr>
					  <tr>
                        <td>联系电话</td>
                        <td></td>
						<td>注册号/统一社会信用代码</td>
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
                        <td>食品经营许可证</td>
                        <td></td>
						<td>经度</td>
                        <td></td>
                      </tr>
                      
                       <tr>                        
						<td>纬度</td>
                        <td colspan="3" align="left"></td>
                      </tr>
                      
					 
					  <tr>
                        <td colspan="4"><b>二、经营方式</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="批发" name="jyType"
                        >&nbsp&nbsp&nbsp批发</td>
                        <td><input id="hacccpapprove" type="checkbox" value="零售" name="jyType"
                        >&nbsp&nbsp&nbsp零售</td>
                        <td colspan="2"><input id="wghapprove" type="checkbox" value="批发兼零售" name="jyType"
                        >&nbsp&nbsp&nbsp批发兼零售</td>                        
                      </tr>
                      
                      
                       <tr>
                        <td colspan="4"><b>三、经营项目</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="预包装食品" name="itemsOfBusiness"
                       >&nbsp&nbsp&nbsp预包装食品</td>
                        <td><input id="hacccpapprove" type="checkbox" value="散装食品" name="itemsOfBusiness"
                        >&nbsp&nbsp&nbsp散装食品</td>
                        <td><input id="wghapprove" type="checkbox" value="熟食" name="itemsOfBusiness"
                        >&nbsp&nbsp&nbsp熟食</td> 
                        <td colspan="2"><input id="lsapprove" type="checkbox" value="乳制品" name="itemsOfBusiness"
                        >&nbsp&nbsp&nbsp乳制品</td>                       
                      </tr>
					  <tr>
						<td><input id="yjapprove" type="checkbox" value="食用农产品" name="itemsOfBusiness"
						>&nbsp&nbsp&nbsp食用农产品</td>
						<td><input id="lsapprove" type="checkbox" value="水产品" name="itemsOfBusiness"
						>&nbsp&nbsp&nbsp水产品</td>
						<td colspan="2"><input id="yjapprove" type="checkbox" value="冷鲜畜禽产品" name=itemsOfBusiness
						>&nbsp&nbsp&nbsp冷鲜畜禽产品</td>
                      </tr>
                      
                      <tr>
                        <td><input id="lsapprove" type="checkbox" value="保健食品" name="itemsOfBusiness"
                        >&nbsp&nbsp&nbsp保健食品</td>
						<td colspan="3" align="left"><input id="yjapprove" type="checkbox" value="现场制售" name="itemsOfBusiness"
						>&nbsp&nbsp&nbsp现场制售</td>
                      </tr>
		                     
		                 </tbody>	
                       </table>
                       </div>
                       <br>
                       <br>
                       <input type="button" onclick="print()" value="打印"/>
                 
  </body>
</html>
