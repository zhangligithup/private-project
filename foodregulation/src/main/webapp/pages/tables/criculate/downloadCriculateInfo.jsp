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
  <script type="text/javascript">
  	
    	
    	$(function(){
			$("#ddd").jqprint();
    	});
    	
	   function print(){ $("#ddd").jqprint();
	   }

    	
    </script>
  </head>
  <body>
  
		 <a class="pull-right" href="javascript:" onclick="history.back(); ">返回上一页</a>
		 <br>
		 <br>
  <div id="ddd" class="tablec">
                  <table border="1" id="" class="table table-condensed" >                   
                    <tbody>
                    	<tr><td colspan="4" align="center"><b>食品流通企业信用档案</b></td></tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>                 
                     </tr>
					 <tr>
								 <td>企业名称</td>
		                         <td>${criculate.qyname }</td>
								 <td>所属行政区域</td>
		                         <td>${criculate.address }</td>
							 </tr>
							 
							 <tr>
                        		<td>经营场所(具体到门牌号)</td>
                        		<td>${criculate.scaddress }</td>
                        		<td>邮政编码</td>
                        		<td>${criculate.ems }</td>                   
                      		</tr>
                      		
                      		 <tr>
		                        <td>法定代表人</td>
		                        <td>${criculate.fddelegate }</td>
								<td>电话(手机)号</td>
		                        <td>${criculate.fdphone }</td>
		                      </tr>
		                     <tr>
		                        <td>负责人</td>
		                        <td>${criculate.qydelegate }</td>
								<td>电话(手机)号</td>
		                        <td>${criculate.qyphone }</td>
		                     </tr>
							 <tr>
								 <td>经济类型</td>
                        			<td>${criculate.jjtype }</td>
								 <td>电子邮箱</td>
		                         <td >${criculate.email }</td>
							 </tr>
		                     <tr>
		                        <td>登记机关</td>
		                        <td>${criculate.gsorganization }</td>
								<td>注册号/统一社会信用代码</td>
		                        <td>${criculate.zzcode }</td>
		                     </tr>
							 <tr>
								 <td>成立日期</td>
		                         <td>${criculate.cldate }</td>
								 <td>年销售额(万元)</td>
		                         <td>${criculate.nzyield }</td>
							 </tr>
		                     <tr>
		                        <td>经营面积(平方米)</td>
		                        <td>${criculate.jyArea }</td>
								<td>产权人</td>
		                        <td>${criculate.propertyOwner }</td>
		                     </tr>
							 <tr>
								 <td>房屋使用期限</td>
		                         <td>${criculate.fangWuDate }</td>
								 <td>房屋使用方式</td>
		                         <td>${criculate.fangWuWay}</td>
							 </tr>
		                     <tr>
                        		<td>监管单位</td>
                      			<td>${criculate.department}</td>
								<td>监管人员</td>
                        		<td>${criculate.spdelegate }</td>
                      		</tr>
                      		
                      		<tr>
                        		<td>监督人员</td>
                        		<td>${criculate.jiandurenyuan }</td>
								<td>协管人员</td>
                        		<td>${criculate.xieguanrenyuan }</td>
                      		</tr>
                      		
							 <tr>
								 <td>食品经营许可证编号</td>
		                         <td>${criculate.scpermit }</td>
								 <td>发证机关</td>
		                         <td >${criculate.fazhengjiguan }</td>
							 </tr>
							 
							 <tr>
                        		<td>发证日期</td>
                        		<td>${criculate.fazhengriqi }</td>
								<td>有效日期</td>
                        		<td>${criculate.youxiaodate }</td>
                      		</tr>
                      		
                      		<tr>
                       			<td>经度</td>
                        		<td>${criculate.longitude }</td>
								<td>纬度</td>
                        		<td>${criculate.latitude }</td>
                      		</tr>
							 
							<tr>
                        		<td colspan="4"><b>二、业态类别</b></td>
                     		</tr>
                     		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="食品集中交易市场" name="foodMarket" <c:if test="${criculate.foodMarket eq '食品集中交易市场' }">checked='checked'</c:if>>
                       					食品集中交易市场</td>
                        		<td><input id="superMarket" type="checkbox" value="商场超市" name="superMarket" 
                        			<c:if test="${criculate.superMarket eq '商场超市' }">checked='checked'</c:if>>商场超市</td>
                        		<td><input id="cvs" type="checkbox" value="便利店" name="cvs" <c:if test="${criculate.cvs eq '便利店' }">checked='checked'</c:if>>
                        			便利店</td>
                        		<td><input id="store" type="checkbox" value="食杂店" name="store" <c:if test="${criculate.store eq '食杂店' }">checked='checked'</c:if>>
                        			食杂点</td>
                      		</tr>
                      		<tr>
                       			<td><input id="foodTrade" type="checkbox" value="食品贸易商" name="foodTrade" <c:if test="${criculate.foodTrade eq '食品贸易商' }">checked='checked'</c:if>>
                       				食品贸易商</td>
                        		<td><input id="foodLogistics" type="checkbox" value="食品物流配送" name="foodLogistics" <c:if test="${criculate.foodLogistics eq '食品物流配送' }">checked='checked'</c:if>>
                        			食品物流配送</td>
                        		<td colspan="2"><input id="nonStoreFoodBusiness" type="checkbox" value="无店铺食品经营" name="nonStoreFoodBusiness" <c:if test="${criculate.nonStoreFoodBusiness eq '无店铺食品经营' }">checked='checked'</c:if>>
                        			无店铺食品经营</td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td colspan="4"><b>三、无店铺经营方式</b></td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="onlineShop" type="checkbox" value="网上商店" name="onlineShop" <c:if test="${criculate.onlineShop eq '网上商店' }">checked='checked'</c:if>>
                       				网上商店</td>
                        		<td><input id="mailOrder" type="checkbox" value="邮购" name="mailOrder" <c:if test="${criculate.mailOrder eq '邮购' }">checked='checked'</c:if> >
                        			邮购</td>
                        		<td><input id="televisedShopping" type="checkbox" value="电视电话购物" name="televisedShopping" <c:if test="${criculate.televisedShopping eq '电视电话购物' }">checked='checked'</c:if>>
                        			电视电话购物</td>
                        		<td><input id="automat" type="checkbox" value="自动售货机" name="automat" <c:if test="${criculate.automat eq '自动售货机' }">checked='checked'</c:if>>
                        			自动售货机</td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td colspan="4"><b>四、许可范围</b></td>
                     		</tr>
                     		<tr>
                        		<td colspan="4">(1)	经营方式：	
                        		<input id="piFa" type="checkbox" value="批发" name="piFa" <c:if test="${criculate.piFa eq '批发' }">checked='checked'</c:if>>
                        			批发</td>
                     		</tr>
                     		
                     		<tr>
                        		<td colspan="4">经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="packFood" type="checkbox" value="预包装食品" name="packFood" <c:if test="${criculate.packFood eq '预包装食品' }">checked='checked'</c:if>>
                       				预包装食品</td>
                        		<td><input id="bulkFood" type="checkbox" value="散装食品" name="bulkFood" <c:if test="${criculate.bulkFood eq '散装食品' }">checked='checked'</c:if>>
                        			散装食品</td>
                        		<td><input id="dairyProduct" type="checkbox" value="乳制品" name="dairyProduct" <c:if test="${criculate.dairyProduct eq '乳制品' }">checked='checked'</c:if>>
                        			乳制品</td>
                        		<td><input id="hanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="hanBaby" <c:if test="${criculate.hanBaby eq '含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                        			含婴幼儿配方乳粉</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="noBody" type="checkbox" value="不含婴幼儿配方乳粉" name="noBody" <c:if test="${criculate.noBody eq '不含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                       				不含婴幼儿配方乳粉</td>
                        		<td><input id="foodProduct" type="checkbox" value="食用农产品" name="foodProduct" <c:if test="${criculate.foodProduct eq '食用农产品' }">checked='checked'</c:if> >
                        			食用农产品</td>
                        		<td><input id="waterProduct" type="checkbox" value="含水产品" name="waterProduct" <c:if test="${criculate.waterProduct eq '含水产品' }">checked='checked'</c:if>>
                        			含水产品</td>
                        		<td><input id="freshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="freshAnimalProduct" <c:if test="${criculate.freshAnimalProduct eq '含冷鲜畜禽产品' }">checked='checked'</c:if>>
                        			含冷鲜畜禽产品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4"><input id="healthProduct" type="checkbox" value="保健食品" name="healthProduct" <c:if test="${criculate.healthProduct eq '保健食品' }">checked='checked'</c:if>>
                        			保健食品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4">(2)	经营方式：	
                        		<input id="retail" type="checkbox" value="零售" name="retail" <c:if test="${criculate.retail eq '零售' }">checked='checked'</c:if>>
                        			零售</td>
                     		</tr>
                     		
                     		<tr>
                        		<td colspan="4">经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="lsPackFood" type="checkbox" value="预包装食品" name="lsPackFood" <c:if test="${criculate.lsPackFood eq '预包装食品' }">checked='checked'</c:if>>
                       				预包装食品</td>
                        		<td><input id="lsBulkFood" type="checkbox" value="散装食品" name="lsBulkFood" <c:if test="${criculate.lsBulkFood eq '散装食品' }">checked='checked'</c:if>>
                        			散装食品</td>
                        		<td><input id="cookedFood" type="checkbox" value="含熟食" name="cookedFood" <c:if test="${criculate.cookedFood eq '含熟食' }">checked='checked'</c:if>>
                        			含熟食</td>
                        		<td><input id="noCookedFood" type="checkbox" value="不含熟食" name="noCookedFood" <c:if test="${criculate.noCookedFood eq '不含熟食' }">checked='checked'</c:if> >
                        			不含熟食</td>
                      		</tr>
                      		<tr>
                       			<td><input id="lsDairyProduct" type="checkbox" value="乳制品" name="lsDairyProduct" <c:if test="${criculate.lsDairyProduct eq '乳制品' }">checked='checked'</c:if>>
                       				乳制品</td>
                        		<td><input id="lsHanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="lsHanBaby" <c:if test="${criculate.lsHanBaby eq '含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                        			含婴幼儿配方乳粉</td>
                        		<td><input id="lsNoBody" type="checkbox" value="不含婴幼儿配方乳粉" name="lsNoBody" <c:if test="${criculate.lsNoBody eq '不含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                        			不含婴幼儿配方乳粉</td>
                        		<td><input id="lsFoodProduct" type="checkbox" value="食用农产品" name="lsFoodProduct" <c:if test="${criculate.lsFoodProduct eq '食用农产品' }">checked='checked'</c:if>>
                        			食用农产品</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="lsWaterProduct" type="checkbox" value="含水产品" name="lsWaterProduct" <c:if test="${criculate.lsWaterProduct eq '含水产品' }">checked='checked'</c:if>>
                       				含水产品</td>
                        		<td><input id="lsFreshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="lsFreshAnimalProduct" <c:if test="${criculate.lsFreshAnimalProduct eq '含冷鲜畜禽产品' }">checked='checked'</c:if>>
                        			含冷鲜畜禽产品</td>
                        		<td><input id="lsHealthProduct" type="checkbox" value="保健食品" name="lsHealthProduct" <c:if test="${criculate.lsHealthProduct eq '保健食品' }">checked='checked'</c:if>>
                        			保健食品</td>
                        		<td><input id="scene" type="checkbox" value="食用农产品" name="scene" <c:if test="${criculate.scene eq '食用农产品' }">checked='checked'</c:if>>
                        			现场制售</td>
                        			</tr>
                  </table>
                  </div>
                  <br/>
                 <br/>
                 <div align="center">
                 <input type="button" onclick="print()" width="50px" value="打印"/></div>
                  
  </body>
</html>
