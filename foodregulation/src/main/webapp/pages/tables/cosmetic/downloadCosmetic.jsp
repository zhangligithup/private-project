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
                        <td colspan="4" align="center"><b>化妆品经营企业信用档案</b></td>
                     </tr>
					 <tr>
                        <td colspan="4"><b>一、基本情况</b></td>
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td></td>
						<td>所属行政区域</td>
                        <td></td>
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
                        <td> </td>
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
                        <td>营业面积</td>
                        <td></td>
						 <td>经营品种个数</td>
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
                        <td colspan="4"><b>二、经营方式</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="批发" name="jyType">批发</td>
                        <td><input id="hacccpapprove" type="checkbox" value="零售" name="jyType">零售</td>
                        <td colspan="2"><input id="wghapprove" type="checkbox" value="主营" name="jyType">主营</td>                        
                      </tr>
					  <tr>
                        <td><input id="lsapprove" type="checkbox" value="兼营" name="jyType">兼营</td>
						<td colspan="3"><input id="yjapprove" type="checkbox" value="其他" name="jyType">其他</td>
                      </tr>
                      
                      <!--
                      <tr>
                        <td><b>三、经营类别</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="healthFood" type="checkbox" value="保健食品" name="healthFood">&nbsp&nbsp&nbsp保健食品</td>
                        <td><input id="cosmetic" type="checkbox" value="化妆品" name="cosmetic">&nbsp&nbsp&nbsp化妆品</td>                        
                      </tr>
                       -->
                      
                      <tr>
                        <td colspan="4"><b>三、人员情况</b></td>                 
                      </tr>
					  <tr>
                        <td>从业人数</td>
                        <td></td>
						<td>中专及其以下人数</td>
                        <td></td>
                      </tr>
                      
                      <tr>
                        <td>大专及其以上人数</td>
                        <td colspan="3"></td>
                      </tr>
					  
					  
					  <tr>
                        <td colspan="4"><b>四、管理情况</b></td>                 
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="供货商资质档案" name="manage">供货商资质档案</td>
                        <td><input id="manage" type="checkbox" value="保健食品批准证书" name="manage">保健食品批准证书</td> 
                        <td><input id="manage" type="checkbox" value="保健食品存储设备" name="manage">保健食品存储设备</td>
                        <td><input id="manage" type="checkbox" value="购进验收记录出入台账" name="cosmetic">购进验收记录出入台账</td>                           
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="从业人员健康证" name="manage">从业人员健康证</td>
                        <td colspan="3"><input id="manage" type="checkbox" value="人员培训记录" name="cosmetic"/>人员培训记录</td>                        
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
