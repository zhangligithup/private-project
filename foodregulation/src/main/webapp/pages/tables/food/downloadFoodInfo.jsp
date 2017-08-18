<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
                  <table id="" border="1" class="table table-condensed" >                   
                    <tbody>
                    <tr>
                        <td colspan="4" align="center"><b>食品餐饮企业信用档案</b></td>                 
                     </tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>                 
                     </tr>
					 <tr>
								<td>企业名称</td>
		                    	<td>${food.qyname }</td>
								<td>所属行政区域</td>
		                   		 <td >${food.address }</td>
							</tr>
							 
							 <tr>
                        		<td>经营场所(具体到门牌号)</td>
                        		<td>${food.scaddress }</td>
                        		<td>邮政编码</td>
                        		<td>${food.ems }</td>                   
                      		</tr>
                      			
                      		 <tr>
		                        <td>法定代表人</td>
		                        <td>${food.fddelegate }</td>
								<td>电话(手机)号</td>
		                        <td>${food.fdphone }</td>
		                      </tr>
		                     <tr>
		                        <td>负责人</td>
		                        <td>${food.qydelegate }</td>
								<td>电话(手机)号</td>
		                        <td>${food.qyphone }</td>
		                     </tr>
							 <tr>
								 <td>经济类型</td>
								 <td>${food.jjtype }</td>
								 <td>电子邮箱</td>
		                         <td >${food.email }</td>
							 </tr>
		                     <tr>
		                        <td>登记机关</td>
		                        <td>${food.gsorganization }</td>
								<td>注册号/统一社会信用代码</td>
		                        <td>${food.zzcode }</td>
		                     </tr>
							 <tr>
								 <td>成立日期</td>
		                         <td>${food.cldate }</td>
								 <td>年销售额(万元)</td>
		                         <td >${food.nzyield }</td>
							 </tr>
		                     <tr>
		                        <td>从业人员数</td>
		                        <td>${food.cyNum }</td>
								<td>就餐座位数</td>
		                        <td>${food.seats }</td>
		                     </tr>
							 <tr>
								 <td>加工经营场所面积</td>
		                         <td>${food.jyArea }</td>
								 <td>持健康证人数</td>
		                         <td>${food.healthNum }</td>
							 </tr>
		                     <tr>
                        		<td>监管单位</td>
                      			<td>${food.department }</td>
								<td>监管人员</td>
                        		<td>${food.spdelegate }</td>
                      		</tr>
                      		
                      		<tr>
                        		<td>监督人员</td>
                        		<td>${food.jiandurenyuan }</td>
								<td>协管人员</td>
                        		<td>${food.xieguanrenyuan }</td>
                      		</tr>
                      		
							 <tr>
								 <td>食品经营许可证编号</td>
		                         <td>${food.scpermit }</td>
								 <td>发证机关</td>
		                         <td >${food.fazhengjiguan }</td>
							 </tr>
							 
							 <tr>
                        		<td>发证日期</td>
                        		<td>${food.fazhengriqi }</td>
								<td>有效日期</td>
                        		<td>${food.youxiaodate }</td>
                      		</tr>
                      		
                      		<tr>
                       			<td>经度</td>
                        		<td>${food.longitude }</td>
								<td>纬度</td>
                        		<td>${food.latitude }</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4"><b>二、许可项目</b></td>
                     		</tr>
                     		
                     		<tr>
                        		<td colspan="4">类型：</td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="type" type="checkbox" value="特大型餐馆" name="type"
                       			<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '特大型餐馆' }">checked='checked'</c:if>
                        		</c:forEach>>特大型餐馆</td>
                        		<td><input id="superMarket" type="checkbox" value="大型餐馆" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '大型餐馆' }">checked='checked'</c:if>
                        		</c:forEach>>大型餐馆</td>
                        		<td><input id="cvs" type="checkbox" value="中型餐馆" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '中型餐馆' }">checked='checked'</c:if>
                        		</c:forEach>>中型餐馆</td>
                        		<td><input id="store" type="checkbox" value="小型餐馆" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '小型餐馆' }">checked='checked'</c:if>
                        		</c:forEach>>小型餐馆</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="快餐店" name="type"
                       			<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '快餐店' }">checked='checked'</c:if>
                        		</c:forEach>>快餐店</td>
                        		<td><input id="superMarket" type="checkbox" value="小吃店" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '小吃店' }">checked='checked'</c:if>
                        		</c:forEach>>小吃店</td>
                        		<td><input id="cvs" type="checkbox" value="饮品店" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '饮品店' }">checked='checked'</c:if>
                        		</c:forEach>>饮品店</td>
                        		<td><input id="store" type="checkbox" value="食堂" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '食堂' }">checked='checked'</c:if>
                        		</c:forEach>>食堂</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="集体用餐配送单位" name="type"
                       			<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '集体用餐配送单位' }">checked='checked'</c:if>
                        		</c:forEach>>集体用餐配送单位</td>
                        		<td colspan="3"><input id="superMarket" type="checkbox" value="其他" name="type"
                        		<c:forEach items="${arrType}" var="type">
                        			 <c:if test="${type eq '其他' }">checked='checked'</c:if>
                        		</c:forEach>>其他</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4">备注：</td>
                     		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="单纯火锅" name="remark"
                       			<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '单纯火锅' }">checked='checked'</c:if>
                        		</c:forEach>>单纯火锅</td>
                        		<td><input id="superMarket" type="checkbox" value="单纯烧烤" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '单纯烧烤' }">checked='checked'</c:if>
                        		</c:forEach>>单纯烧烤</td>
                        		<td><input id="cvs" type="checkbox" value="全部使用半成品加工" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '全部使用半成品加工' }">checked='checked'</c:if>
                        		</c:forEach>>全部使用半成品加工</td>
                        		<td><input id="store" type="checkbox" value="中餐类制售" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '中餐类制售' }">checked='checked'</c:if>
                        		</c:forEach>>中餐类制售</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="西餐类制售" name="remark"
                       			<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '西餐类制售' }">checked='checked'</c:if>
                        		</c:forEach>>西餐类制售</td>
                        		<td><input id="superMarket" type="checkbox" value="日餐类制售" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '日餐类制售' }">checked='checked'</c:if>
                        		</c:forEach>>日餐类制售</td>
                        		<td><input id="cvs" type="checkbox" value="韩餐类制售" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '韩餐类制售' }">checked='checked'</c:if>
                        		</c:forEach>>韩餐类制售</td>
                        		<td><input id="store" type="checkbox" value="工地食堂" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '工地食堂' }">checked='checked'</c:if>
                        		</c:forEach>>工地食堂</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="学院食堂" name="remark"
                       			<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '学院食堂' }">checked='checked'</c:if>
                        		</c:forEach>>学院食堂</td>
                        		<td><input id="superMarket" type="checkbox" value="幼儿园食堂" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '幼儿园食堂' }">checked='checked'</c:if>
                        		</c:forEach>>幼儿园食堂</td>
                        		<td><input id="cvs" type="checkbox" value="企事业单位机关食堂" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '企事业单位机关食堂' }">checked='checked'</c:if>
                        		</c:forEach>>企事业单位机关食堂</td>
                        		<td><input id="store" type="checkbox" value="含裱花蛋糕" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '含裱花蛋糕' }">checked='checked'</c:if>
                        		</c:forEach>>含裱花蛋糕</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="含凉菜" name="remark"
                       			<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '含凉菜' }">checked='checked'</c:if>
                        		</c:forEach>>含凉菜</td>
                        		<td><input id="superMarket" type="checkbox" value="含生食海产品" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '含生食海产品' }">checked='checked'</c:if>
                        		</c:forEach>>含生食海产品</td>
                        		<td><input id="cvs" type="checkbox" value="冷热饮品制售" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '冷热饮品制售' }">checked='checked'</c:if>
                        		</c:forEach>>冷热饮品制售</td>
                        		<td><input id="store" type="checkbox" value="其他" name="remark"
                        		<c:forEach items="${arrRemark}" var="remark">
                        			 <c:if test="${remark eq '其他' }">checked='checked'</c:if>
                        		</c:forEach>>其他</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4">须知：</td>
                     		</tr>
                     		<tr>
                       			<td colspan="4">
                       				特大型餐馆：经营场所使用面积＞3000㎡，或就餐座位数＞1000座的餐馆
                       			</td>
                      		</tr>
                      		<tr>
                       			<td colspan="4">
                       				大型餐馆：500㎡＜经营场所面积≤3000㎡，或250座＜就餐座位数＜1000座的餐馆
                       			</td>
                      		</tr>
                      		<tr>
                       			<td colspan="4">
                       				中型餐馆：150㎡＜经营场所面积≤500㎡，或75座＜就餐座位数＜250座的餐馆
                       			</td>
                      		</tr>
                      		<tr>
                       			<td colspan="4">
                       				小型餐馆：经营场所面积≤150㎡，或就餐座位数＜75座的餐馆
                       			</td>
                      		</tr>
                   </table>
                  </div>
                  <br/>
                 <br/>
                 <div align="center">
                 <input type="button" onclick="print()" width="50px" value="打印"/></div>
  </body>
</html>
