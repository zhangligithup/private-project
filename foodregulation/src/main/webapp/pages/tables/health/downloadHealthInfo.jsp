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
                  <table border="1" id="" class="table table-condensed" >                   
                    <tbody>
                    <tr>
                        <td colspan="4" align="center"><b>保健食品经营企业信用档案</b></td>
                     </tr>
					 <tr>
                        <td colspan="4"><b>基本情况</b></td>
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td>${health.qyname }</td>
						<td>所属行政区域</td>
                        <td>${health.address }</td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
                        <td>${health.scaddress }</td>
                        <td>邮政编码</td>
                        <td>${health.ems }</td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td>${health.phone }</td>
						<td>传    真</td>
                        <td>${health.fax }</td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td>${health.email }</td>
						<td>经济类型</td>
                        <td>${health.jjtype }</td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td>${health.gsorganization }</td>
                        <td>注册号/统一社会信用代码</td>
                        <td>${health.zzcode }</td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td>${health.fddelegate }</td>
						<td>电话(手机)号</td>
                        <td>${health.fdphone }</td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td>${health.qydelegate }</td>
						<td>电话(手机)号</td>
                        <td>${health.qyphone }</td>
                      </tr>
                      
                      <tr>
                        <td>监管单位</td>
                      	<td>${health.department }</td>
						<td>监管人员</td>
                        <td>${health.spdelegate }</td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td>${health.jiandurenyuan }</td>
						<td>协管人员</td>
                        <td>${health.xieguanrenyuan }</td>
                      </tr>
                      
                      <tr>
                        <td>营业面积</td>
                        <td>${health.jyArea }</td>
						 <td>经营品种个数</td>
                        <td>${health.jyNum }</td>
                      </tr>
                      
                      <tr>
                       <td>许可证编号</td>
                        <td>${health.scpermit }</td>
						<td>发证机关</td>
                        <td>${health.fazhengjiguan }</td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td>${health.fazhengriqi }</td>
						<td>有效日期</td>
                        <td>${health.youxiaodate }</td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td>${health.longitude }</td>
						<td>纬度</td>
                        <td>${health.latitude }</td>
                      </tr>
					 
					  <tr>
                        <td colspan="4"><b>二、经营方式</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="批发" name="jyType"
                        <c:forEach items="${arrJyType}" var="jyType">
                        			 <c:if test="${jyType eq '批发' }">checked='checked'</c:if>
                        		</c:forEach>>批发</td>
                        <td><input id="hacccpapprove" type="checkbox" value="零售" name="jyType"
                        <c:forEach items="${arrJyType}" var="jyType">
                        			 <c:if test="${jyType eq '零售' }">checked='checked'</c:if>
                        		</c:forEach>>零售</td>
                        <td colspan="2"><input id="wghapprove" type="checkbox" value="主营" name="jyType"
                        <c:forEach items="${arrJyType}" var="jyType">
                        			 <c:if test="${jyType eq '主营' }">checked='checked'</c:if>
                        		</c:forEach>>主营</td>                        
                      </tr>
					  <tr>
                        <td><input id="lsapprove" type="checkbox" value="兼营" name="jyType"
                        <c:forEach items="${arrJyType}" var="jyType">
                        			 <c:if test="${jyType eq '兼营' }">checked='checked'</c:if>
                        		</c:forEach>>兼营</td>
						<td colspan="3"><input id="yjapprove" type="checkbox" value="其他" name="jyType"
						<c:forEach items="${arrJyType}" var="jyType">
                        			 <c:if test="${jyType eq '其他' }">checked='checked'</c:if>
                        		</c:forEach>>其他</td>
                      </tr>
                      
                      <!--  
                      <tr>
                        <td><b>三、经营类别</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="healthFood" type="checkbox" value="保健食品" name="healthFood" <c:if test="${health.healthFood eq '保健食品' }">checked='checked'</c:if>>
                        		&nbsp&nbsp&nbsp保健食品</td>
                        <td><input id="cosmetic" type="checkbox" value="化妆品" name="cosmetic" <c:if test="${health.cosmetic eq '化妆品' }">checked='checked'</c:if>>
                        		&nbsp&nbsp&nbsp化妆品</td>                        
                      </tr>
                      -->
                      
                      <tr>
                        <td colspan="4"><b>三、人员情况</b></td>                 
                      </tr>
					  <tr>
                        <td>从业人数</td>
                        <td>${health.cyNum }</td>
						<td>中专及其以下人数</td>
                        <td>${health.graduateNum }</td>
                      </tr>
                      
                      <tr>
                        <td>大专及其以上人数</td>
                        <td colspan="3">${health.juniorNum }</td>
                      </tr>
					  
					  
					  <tr>
                        <td colspan="4"><b>四、管理情况</b></td>                 
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="供货商资质档案" name="manage"
                        <c:forEach items="${arrManage}" var="manage">
                        			 <c:if test="${manage eq '供货商资质档案' }">checked='checked'</c:if>
                        		</c:forEach>>供货商资质档案</td>
                        <td><input id="manage" type="checkbox" value="保健食品批准证书" name="manage"
                        <c:forEach items="${arrManage}" var="manage">
                        			 <c:if test="${manage eq '保健食品批准证书' }">checked='checked'</c:if>
                        		</c:forEach>>
                       		 保健食品批准证书</td> 
                        <td><input id="manage" type="checkbox" value="保健食品存储设备" name="manage"
                        <c:forEach items="${arrManage}" var="manage">
                        			 <c:if test="${manage eq '保健食品存储设备' }">checked='checked'</c:if>
                        		</c:forEach>>
                      	  	保健食品存储设备</td>
                        <td><input id="manage" type="checkbox" value="购进验收记录出入台账" name="manage"
                        <c:forEach items="${arrManage}" var="manage">
                        			 <c:if test="${manage eq '购进验收记录出入台账' }">checked='checked'</c:if>
                        		</c:forEach>>
                      	  	购进验收记录出入台账</td>                           
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="从业人员健康证" name="manage"
                        <c:forEach items="${arrManage}" var="manage">
                        			 <c:if test="${manage eq '从业人员健康证' }">checked='checked'</c:if>
                        		</c:forEach>>
                        		从业人员健康证</td>
                        <td><input id="manage" type="checkbox" value="人员培训记录" name="manage"
                        <c:forEach items="${arrManage}" var="manage">
                        			 <c:if test="${manage eq '人员培训记录' }">checked='checked'</c:if>
                        		</c:forEach>>
                        		人员培训记录</td>                        
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
