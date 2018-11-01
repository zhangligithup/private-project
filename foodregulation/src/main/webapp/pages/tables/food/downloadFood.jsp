<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
                    <tr>
                        <td colspan="4" align="center"><b>食品餐饮企业信用档案</b></td></tr>
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
								 <td>经济类型</td>
                        			<td> </td>
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
		                         <td ></td>
							 </tr>
		                     <tr>
		                        <td>从业人员数</td>
		                        <td></td>
								<td>就餐座位数</td>
		                        <td></td>
		                     </tr>
							 <tr>
								 <td>加工经营场所面积</td>
		                         <td></td>
								 <td>持健康证人数</td>
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
		                         <td ></td>
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
                        		<td colspan="4"><b>二、许可项目</b></td>
                     		</tr>
                     		
                     		<tr>
                        		<td colspan="4">类型：</td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="type" type="checkbox" value="特大型餐馆" name="type">特大型餐馆</td>
                        		<td><input id="superMarket" type="checkbox" value="大型餐馆" name="type">大型餐馆</td>
                        		<td><input id="cvs" type="checkbox" value="中型餐馆" name="type">中型餐馆</td>
                        		<td><input id="store" type="checkbox" value="小型餐馆" name="type">小型餐馆</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="快餐店" name="type">快餐店</td>
                        		<td><input id="superMarket" type="checkbox" value="小吃店" name="type">小吃店</td>
                        		<td><input id="cvs" type="checkbox" value="饮品店" name="type">饮品店</td>
                        		<td><input id="store" type="checkbox" value="食堂" name="type">食堂</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="集体用餐配送单位" name="type">集体用餐配送单位</td>
                        		<td colspan="3"><input id="superMarket" type="checkbox" value="其他" name="type">其他</td>
                      		</tr>
                      		
                      		<tr>
                        		<td colspan="4">备注：</td>
                     		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="单纯火锅" name="remark">单纯火锅</td>
                        		<td><input id="superMarket" type="checkbox" value="单纯烧烤" name="remark">单纯烧烤</td>
                        		<td><input id="cvs" type="checkbox" value="全部使用半成品加工" name="remark">全部使用半成品加工</td>
                        		<td><input id="store" type="checkbox" value="中餐类制售" name="store">中餐类制售</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="西餐类制售" name="remark">西餐类制售</td>
                        		<td><input id="superMarket" type="checkbox" value="日餐类制售" name="remark">日餐类制售</td>
                        		<td><input id="cvs" type="checkbox" value="韩餐类制售" name="remark">韩餐类制售</td>
                        		<td><input id="store" type="checkbox" value="工地食堂" name="store">工地食堂</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="学院食堂" name="remark">学院食堂</td>
                        		<td><input id="superMarket" type="checkbox" value="幼儿园食堂" name="remark">幼儿园食堂</td>
                        		<td><input id="cvs" type="checkbox" value="企事业单位机关食堂" name="remark">企事业单位机关食堂</td>
                        		<td><input id="store" type="checkbox" value="含裱花蛋糕" name="store">含裱花蛋糕</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="含凉菜" name="remark">含凉菜</td>
                        		<td><input id="superMarket" type="checkbox" value="含生食海产品" name="remark">含生食海产品</td>
                        		<td><input id="cvs" type="checkbox" value="冷热饮品制售" name="remark">冷热饮品制售</td>
                        		<td><input id="store" type="checkbox" value="其他" name="remark">其他</td>
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
                    </tfoot>
                  </table>
		</div>                  
                 <br/>
                 <br/>
                 <div align="center">
                 <input type="button" onclick="print()" width="50px" value="打印"/></div>
  </body>
</html>
