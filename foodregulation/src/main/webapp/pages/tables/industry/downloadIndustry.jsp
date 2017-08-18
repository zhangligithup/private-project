<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
                  <table border="1" cellpadding="0" cellspacing="0">    
                    <tbody>
                    <tr><td colspan="4" align="center"> 五小行业信息登记表</td></tr>
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
						 <td>从业人员数</td>
                         <td></td>
						 <td>持健康证人数</td>
                         <td></td>
					  </tr>
                      <tr>
                        <td>所在区域</td>
                        <td>
                        	
                        </td>
						 <td>生产经营场所性质</td>
                        <td>
                        	
                        </td>
                      </tr>
                      <tr>
                        <td>经营时间</td>
                        <td>
                        	
                        </td>
                        <td>生产经营场所面积</td>
                        <td>
                        	
                        </td>
                      </tr>
                      <tr>
                        <td>食品处理区面积</td>
                        <td>
                        	
                        </td>
						<td>销售方式</td>
                        <td>
                        	
                        </td>
                      </tr>
                       <tr>
                        <td>就餐座位数</td>
                        <td>
                        	
                        </td>
						<td>是否送餐</td>
                        <td>
                        	
                        </td>
                      </tr>
                      
                      <tr>
                        <td>生产经营时段性质</td>
                        <td>
                        	
                        </td>
						<td>小餐桌就餐学生数</td>
                        <td>
                        	
                        </td>
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
                    	<td colspan="4"><b>二、食品业态</b></td>
                 	  </tr>
                    		
            		  <tr>
              			<td><input id="type" type="checkbox" >食品生产加工小作坊</td>
                		<td><input id="superMarket" type="checkbox" >小食杂店</td>
                		<td><input id="cvs" type="checkbox" >小餐饮店</td>
                		<td><input id="store" type="checkbox" >餐馆</td>
             		 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" >快餐店</td>
                		<td><input id="superMarket" type="checkbox" >小吃店</td>
                		<td><input id="cvs" type="checkbox" >饮品店</td>
                		<td><input id="store" type="checkbox" >小餐桌</td>
             		 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="食品摊贩" name="everyOne">食品摊贩</td>
              			<td><input id="foodMarket" type="checkbox" value="销售固定" name="everyOne">食品销售摊贩(固定)</td>
                		<td><input id="superMarket" type="checkbox" value="销售流动" name="everyOne">食品销售摊贩(流动)</td>
                		<td><input id="cvs" type="checkbox" value="服务固定" name="everyOne">食品服务摊贩(固定)</td>
             		 </tr>
             		
             		 <tr>
              			
                		<td><input id="store" type="checkbox" value="服务流动" name="everyOne">食品服务摊贩(流动)</td>
                		<td><input id="foodMarket" type="checkbox" value="其他1" name="everyOne">其他</td>
                		<td></td>
                		<td></td>
             		 </tr>
             		
             		<tr>
                    	<td colspan="4"><b>三、主体资格性质</b></td>
                 	 </tr>
             		
             		 <tr>
              			<td><input id="c" type="checkbox"  value="有营业执照" name="everyOne">有营业执照</td>
                		<td><input id="c1" type="checkbox" onclick="check();" value="企业" name="everyOne">企业</td>
                		<td><input id="c2" type="checkbox" onclick="check();" value="个体" name="everyOne">个体</td>
                		<td><input id="c3" type="checkbox" onclick="check();" value="其他2" name="everyOne">其他</td>
             		 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="无营业执照" name="everyOne">无营业执照</td>
                		<td><input id="superMarket" type="checkbox" value="单位" name="everyOne">单位</td>
                		<td><input id="cvs" type="checkbox" value="无个人" name="everyOne">个人</td>
                		<td></td>
             		 </tr>
             		
             		<tr>
                    	<td colspan="4"><b>三、主体资格性质</b></td>
                 	 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" >批发市场</td>
                		<td><input id="superMarket" type="checkbox" value="集贸市场" name="everyOne">集贸市场</td>
                		<td><input id="cvs" type="checkbox" value="社区菜市场" name="everyOne">社区菜市场</td>
                		<td><input id="store" type="checkbox" value="集市" name="everyOne">集市</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="夜市" name="everyOne">夜市</td>
                		<td><input id="superMarket" type="checkbox" value="社区大排档" name="everyOne">社区大排档</td>
                		<td><input id="cvs" type="checkbox" value="景区" name="everyOne">景区</td>
                		<td><input id="store" type="checkbox" value="商场超市" name="everyOne">商场超市</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="学校及周边" name="everyOne">学校及周边</td>
                		<td><input id="store" type="checkbox" value="其他3" name="everyOne">其他</td>
                		<td></td>
                		<td></td>
             		 </tr>
					 
					<tr>
                    	<td colspan="4"><b>四、生产经营品种</b></td>
                 	 </tr>
                 	 
                 	 <tr>
                    	<td colspan="4">食品生产加工小作坊</td>
                 	 </tr>
                 	 
                 	 <tr>
              			<td><input id="foodMarket" type="checkbox" value="粮食加工品" name="everyOne">粮食加工品</td>
                		<td><input id="superMarket" type="checkbox" value="食用油油脂及其制品" name="everyOne">食用油、油脂及其制品</td>
                		<td><input id="cvs" type="checkbox" value="调味品" name="everyOne">调味品</td>
                		<td><input id="store" type="checkbox" value="肉制品" name="everyOne">肉制品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="乳制品" name="everyOne">乳制品</td>
                		<td><input id="superMarket" type="checkbox" value="饮料" name="everyOne">饮料</td>
                		<td><input id="cvs" type="checkbox" value="方便食品" name="everyOne">方便食品</td>
                		<td><input id="store" type="checkbox" value="饼干" name=everyOne>饼干</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="罐头" name="everyOne">罐头</td>
                		<td><input id="store" type="checkbox" value="冷冻饮品" name="everyOne">冷冻饮品</td>
                		<td><input id="foodMarket" type="checkbox" value="速冻食品" name="everyOne">速冻食品</td>
                		<td><input id="store" type="checkbox" value="薯类和膨化食品" name="everyOne">薯类和膨化食品</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value=糖果制品 name="everyOne">糖果制品</td>
                		<td><input id="superMarket" type="checkbox" value="茶叶及相关制品" name="everyOne">茶叶及相关制品</td>
                		<td><input id="cvs" type="checkbox" value="酒类" name="everyOne">酒类</td>
                		<td><input id="store" type="checkbox" value="蔬菜制品" name="everyOne">蔬菜制品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="水果制品" name="everyOne">水果制品</td>
                		<td><input id="superMarket" type="checkbox" value="炒货食品及坚果制品" name="everyOne">炒货食品及坚果制品</td>
                		<td><input id="cvs" type="checkbox" value="蛋制品" name="everyOne">蛋制品</td>
                		<td><input id="store" type="checkbox" value="可可及烘烤咖啡制品" name="everyOne">可可及烘烤咖啡制品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="食堂" name="everyOne">食堂</td>
                		<td><input id="store" type="checkbox" value="水产制品" name="everyOne">水产制品</td>
                		<td><input id="foodMarket" type="checkbox" value="速冻食品" name="everyOne">速冻食品</td>
                		<td><input id="store" type="checkbox" value="淀粉及淀粉制品" name="everyOne">淀粉及淀粉制品</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="糕点" name="everyOne">糕点</td>
                		<td><input id="superMarket" type="checkbox" value="豆制品" name="everyOne">豆制品</td>
                		<td><input id="cvs" type="checkbox" value="蜂产品" name="everyOne">蜂产品</td>
                		<td><input id="store" type="checkbox" value="保健食品" name="everyOne">保健食品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="特殊医学用途配方食品" name="everyOne">特殊医学用途配方食品</td>
                		<td><input id="superMarket" type="checkbox" value="婴幼儿配方食品" name="everyOne">婴幼儿配方食品</td>
                		<td><input id="cvs" type="checkbox" value="特殊膳食食品" name="everyOne">特殊膳食食品</td>
                		<td><input id="store" type="checkbox" value="其他食品" name="everyOne">其他食品</td>
             		 </tr>
             		 
             		 <tr>
                    	<td colspan="4">小食杂店、小餐饮店、小餐桌、食品摊贩</td>
                 	 </tr>
                 	
                 	  <tr>
              			<td><input id="foodMarket" type="checkbox" value="食用农产品" name="everyOne">食用农产品</td>
                		<td><input id="superMarket" type="checkbox" value="食用添加剂" name="everyOne">食用添加剂</td>
                		<td><input id="cvs" type="checkbox" value="热食类食品制售" name="everyOne">热食类食品制售</td>
                		<td><input id="store" type="checkbox" value="冷食类食品制售" name="everyOne">冷食类食品制售</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="生食类食品制售" name="everyOne">生食类食品制售</td>
                		<td><input id="superMarket" type="checkbox" value="糕点类食品制售" name="everyOne">糕点类食品制售</td>
                		<td colspan="2"><input id="cvs" type="checkbox" value="自制饮品制售" name="everyOne">自制饮品制售</td>
                		
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="预包装食品销售" name="everyOne">预包装食品销售</td>
                		<td><input id="superMarket" type="checkbox" value="含冷藏冷冻食品" name="everyOne">含冷藏冷冻食品</td>
                		<td colspan="2"><input id="cvs" type="checkbox" value="不含冷藏冷冻食品" name="everyOne">不含冷藏冷冻食品</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="散装食品销售" name="everyOne">散装食品销售</td>
                		<td><input id="superMarket" type="checkbox" value="散含冷藏冷冻食品" name="everyOne">含冷藏冷冻食品</td>
                		<td><input id="cvs" type="checkbox" value="散不含冷藏冷冻食品" name="everyOne">不含冷藏冷冻食品</td>
                		<td><input id="store" type="checkbox" value="含熟食" name="everyOne">含熟食</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="不含熟食" name="everyOne">不含熟食</td>
                		<td><input id="superMarket" type="checkbox" value="含散装酒" name="everyOne">含散装酒</td>
                		<td><input id="cvs" type="checkbox" value="不含散装酒" name="everyOne">不含散装酒</td>
                		<td></td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="特殊食品销售" name="everyOne">特殊食品销售</td>
                		<td><input id="superMarket" type="checkbox" value="保健食品销售" name="everyOne">保健食品销售</td>
                		<td><input id="cvs" type="checkbox" value="特殊医学用途配方食品销售" name="everyOne">特殊医学用途配方食品销售</td>
                		<td><input id="cvs" type="checkbox" value="婴幼儿配方乳粉销售" name="everyOne">婴幼儿配方乳粉销售</td>
             		 </tr>
             		 
             		 <tr>
              			<td colspan="2"><input id="foodMarket" type="checkbox" value="其他婴幼儿配方食品销售" name="everyOne">其他婴幼儿配方食品销售</td>
              			<td  colspan="2"><input id="foodMarket" type="checkbox" value="其他类食品" name="everyOne">其他类食品制(销)售</td>
             		
             		 </tr>
             		 
             		 
             		 <tr>
                    	<td colspan="4">其他食品业态</td>
                 	 </tr>
                 	 <tr>
              			<td><input id="foodMarket" type="checkbox" value="农家乐" name="everyOne">农家乐</td>
                		<td><input id="superMarket" type="checkbox" value="私人会所" name="everyOne">私人会所</td>
                		<td colspan="2"><input id="cvs" type="checkbox" value="豆芽生产" name="everyOne">豆芽生产</td>
                		
                		
             		 </tr>
             		 
             		 <tr>
             		 	<td colspan="2"><input id="cvs" type="checkbox" value="食用初级" name="everyOne">食用初级农产品去籽、净化、剥皮、腿毛、沤软及包装等</td>
              			<td  colspan="2"><input id="foodMarket" type="checkbox" value="其他4" name="everyOne">其他</td>
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

