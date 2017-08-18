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
                    		<tr><td colspan="4" align="center"><b>食品流通企业信用档案</b></td></tr>
							 <tr>
		                        <td colspan="4"><b>一、基本情况</b></td>
		                     </tr>
							 <tr>
								 <td>企业名称</td>
		                         <td></td>
								 <td>所属行政区域</td>
		                         <td ></td>
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
		                        <td>负责人</td>
		                        <td></td>
								<td>电话(手机)号</td>
		                        <td></td>
		                     </tr>
							 <tr>
								 <td>经济类型</td><td></td>
								 <td>电子邮箱</td>
		                         <td ></td>
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
								 <td>年销售额(万元)</td>
		                         <td></td>
							 </tr>
		                     <tr>
		                        <td>经营面积(平方米)</td>
		                        <td></td>
								<td>产权人</td>
		                        <td></td>
		                     </tr>
							 <tr>
								 <td>房屋使用期限</td>
		                         <td></td>
								 <td>房屋使用方式</td>
		                         <td ></td>
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
                        		<td colspan="4"><b>二、业态类别</b></td>
                     		</tr>
                     		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="食品集中交易市场" name="foodMarket">食品集中交易市场</td>
                        		<td><input id="superMarket" type="checkbox" value="商场超市" name="superMarket">商场超市</td>
                        		<td><input id="cvs" type="checkbox" value="便利店" name="cvs">便利店</td>
                        		<td><input id="store" type="checkbox" value="食杂店" name="store">食杂店</td>
                      		</tr>
                      		<tr>
                       			<td><input id="foodTrade" type="checkbox" value="食品贸易商" name="foodTrade">食品贸易商</td>
                        		<td><input id="foodLogistics" type="checkbox" value="食品物流配送" name="foodLogistics">食品物流配送</td>
                        		<td colspan="2"><input id="nonStoreFoodBusiness" type="checkbox" value="无店铺食品经营" name="nonStoreFoodBusiness">无店铺食品经营</td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td colspan="4"><b>三、无店铺经营方式</b></td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="onlineShop" type="checkbox" value="网上商店" name="onlineShop">网上商店</td>
                        		<td><input id="mailOrder" type="checkbox" value="邮购" name="mailOrder">邮购</td>
                        		<td><input id="televisedShopping" type="checkbox" value="电视电话购物" name="televisedShopping">电视电话购物</td>
                        		<td><input id="automat" type="checkbox" value="自动售货机" name="automat">自动售货机</td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td colspan="4"><b>四、许可范围</b></td>
                     		</tr>
                     		<tr>
                        		<td colspan="4">(1)	经营方式：	
                        		<input id="piFa" type="checkbox" value="批发" name="piFa">批发</td>
                     		</tr>
                     		
                     		<tr>
                        		<td colspan="4">经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="packFood" type="checkbox" value="预包装食品" name="packFood">预包装食品</td>
                        		<td><input id="bulkFood" type="checkbox" value="散装食品" name="bulkFood">散装食品</td>
                        		<td><input id="dairyProduct" type="checkbox" value="乳制品" name="dairyProduct">乳制品</td>
                        		<td><input id="hanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="hanBaby">含婴幼儿配方乳粉</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="noBody" type="checkbox" value="不含婴幼儿配方乳粉" name="noBody">不含婴幼儿配方乳粉</td>
                        		<td><input id="foodProduct" type="checkbox" value="食用农产品" name="foodProduct">食用农产品</td>
                        		<td><input id="waterProduct" type="checkbox" value="含水产品" name="waterProduct">含水产品</td>
                        		<td><input id="freshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="freshAnimalProduct">含冷鲜畜禽产品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4"><input id="healthProduct" type="checkbox" value="保健食品" name="healthProduct">保健食品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4">(2)	经营方式：	
                        		<input id="retail" type="checkbox" value="零售" name="retail">零售</td>
                     		</tr>
                     		
                     		<tr>
                        		<td colspan="4">经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="lsPackFood" type="checkbox" value="预包装食品" name="lsPackFood">预包装食品</td>
                        		<td><input id="lsBulkFood" type="checkbox" value="散装食品" name="lsBulkFood">散装食品</td>
                        		<td><input id="cookedFood" type="checkbox" value="含熟食" name="cookedFood">含熟食</td>
                        		<td><input id="noCookedFood" type="checkbox" value="不含熟食" name="noCookedFood">不含熟食</td>
                      		</tr>
                      		<tr>
                       			<td><input id="lsDairyProduct" type="checkbox" value="乳制品" name="lsDairyProduct">乳制品</td>
                        		<td><input id="lsHanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="lsHanBaby">含婴幼儿配方乳粉</td>
                        		<td><input id="lsNoBody" type="checkbox" value="不含婴幼儿配方乳粉" name="lsNoBody">不含婴幼儿配方乳粉</td>
                        		<td><input id="lsFoodProduct" type="checkbox" value="食用农产品" name="lsFoodProduct">食用农产品</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="lsWaterProduct" type="checkbox" value="含水产品" name="lsWaterProduct">含水产品</td>
                        		<td><input id="lsFreshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="lsFreshAnimalProduct">含冷鲜畜禽产品</td>
                        		<td><input id="lsHealthProduct" type="checkbox" value="保健食品" name="lsHealthProduct">保健食品</td>
                        		<td><input id="scene" type="checkbox" value="食用农产品" name="scene">现场制售</td>
                      		</tr>
		                     
		                 </tbody>	
                       </table>
                       </div>
                       <br>
                       <br>
                       <input type="button" onclick="print()" value="打印"/>
                 
  </body>
</html>
