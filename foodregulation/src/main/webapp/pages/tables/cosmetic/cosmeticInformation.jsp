<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
    	
    	$(function(){
    		//$("tbody>tr>td>input").attr("readonly", readonly);
    		/*if(${groupid eq 1})
    		{
    			$(":input[readonly]").removeAttr("readonly");
    			$("#textarea").removeAttr("readonly");
    			$("#selectId").removeAttr("disabled");
    			$(":checkbox").removeAttr("disabled");
    		}*/
    		//循环遍历type选中项
	   		var type = '${health.jyType}';
	           var arr = new Array();
	           arr = type.split(",");
	           $("input:checkbox[name='jyType']").each(function() {
	           	for(j=0;j<arr.length;j++){
	           		if(arr[j] == $(this).val()){
	           			$(this).attr("checked",true);
	           			continue;
	           		}
	           	}
			});
			
			//循环遍历manage选中项
			var manage = '${health.manage}';
               var arrManage = new Array();
               arrManage = manage.split(",");
               $("input:checkbox[name='manage']").each(function() {
               	for(j=0;j<arrManage.length;j++){
               		if(arrManage[j] == $(this).val()){
               			$(this).attr("checked",true);
               			continue;
               		}
               	}
			});
			
    	});
    	//打印
    	function print(){
    		$("#printForm").submit();
    	}
    	
    </script>
        <section class="content">
		
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3>化妆品经营企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form id="deleteForm" action="" method="post">
                	<input type="hidden" name="method" value="delete">
                	<input type="hidden" name="id" value="${health.id }">
                	<input type="hidden" name="pageCode" value="${pageCode }">
                </form>
                
                <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/CosmeticServlet" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="idI" value="${health.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbit_sure()" id="CosmeticForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="idH" value="${health.id}">
                  <label class="pull-left">最后修改人: ${health.amend }</label>
                  
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        <td ><b>一、基本情况</b></td>
                         <td></td>
                        <td></td>
                        <td align="right"><font color="red" size="0.8e"></font></td>                 
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" value="${health.qyname }"/></td>
						<td>所属行政区域</td>
                        <td>
                        	<select id="address" style="width:280px" name="address">
                        		<option value="0">请选择</option>
                 			  <c:forEach items="${addressList}" var="addressLis">
                  		          <option  value="${addressLis.tDictionaryCode }" <c:if test="${health.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                       </td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" value="${health.scaddress }" onblur="searchAddress('colongitude','colatitude')"/>
                        </td>
                        <td>邮政编码</td>
                        <td><input id="ems" type="text" style="width:280px" name="ems" value="${health.ems }"/></td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td><input id="phone" type="text" style="width:280px" name="phone" value="${health.phone }"/></td>
						<td>传    真</td>
                        <td><input id="fax" type="text" style="width:280px" name="fax" value="${health.fax }"/></td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td><input id="email" type="text" style="width:280px" name="email" value="${health.email }"/></td>
						<td>经济类型</td>
                        <td> <select id="" style="width:280px" name="jjtype">
                  		          <option value="">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode }" <c:if test="${health.jjtype eq economicType.tDictionaryCode }">selected='selected'</c:if>>${economicType.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                        </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td><input id="gsorganization" type="text" style="width:280px" name="gsorganization" value="${health.gsorganization }"/></td>
                        <td>注册号/统一社会信用代码</td>
                        <td><input id="zzcode" type="text" style="width:280px" name="zzcode" value="${health.zzcode }"/></td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" value="${health.fddelegate }"/></td>
						<td>电话(手机)号</td>
                        <td><input id="fdphone" type="text" style="width:280px" name="fdphone" value="${health.fdphone }"/></td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" value="${health.qydelegate }"/></td>
						<td>电话(手机)号</td>
                        <td><input id="qyphone" type="text" style="width:280px" name="qyphone" value="${health.qyphone }"/></td>
                      </tr>
                      
                      <tr>
                        <td>监管单位</td>
                      	<td><select style="width:280px" id="department" name="department">
                      			<option value="0">请选择</option>
                      			<c:forEach items="${unitList}" var="list">
                        			<option value="${list.tDictionaryCode }" <c:if test="${health.department eq list.tDictionaryCode }">selected='selected'</c:if>>${list.tDictionaryName }</option>
                        		</c:forEach>
                            </select>
                        </td>
						<td>监管人员</td>
                        <td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" value="${health.spdelegate }"/></td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td><input id="jiandurenyuan" type="text" style="width:280px" class="" name="jiandurenyuan" value="${health.jiandurenyuan }"/></td>
						<td>协管人员</td>
                        <td><input id="xieguanrenyuan" type="text" style="width:280px" class="" name="xieguanrenyuan" value="${health.xieguanrenyuan }"/></td>
                      </tr>
                      
                      <tr>
                        <td>营业面积</td>
                        <td><input id="jyArea" type="text" style="width:280px" name="jyArea" value="${health.jyArea }"/></td>
						 <td>经营品种个数</td>
                        <td><input id="jyNum" type="text" style="width:280px" name="jyNum" value="${health.jyNum }"/></td>
                      </tr>
                      
                      <tr>
                       <td>许可证编号</td>
                        <td><input id="scpermit" type="text" style="width:280px" name="scpermit" value="${health.scpermit }"/></td>
						<td>发证机关</td>
                        <td><input id="fazhengjiguan" type="text" style="width:280px" class="" name="fazhengjiguan" value="${health.fazhengjiguan }"/></td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td><input id="fazhengriqi" type="text" style="width:280px" class="" name="fazhengriqi" value="${health.fazhengriqi }"/></td>
						<td>有效日期</td>
                        <td><input id="youxiaodate" type="text" style="width:280px" class="" name="youxiaodate" value="${health.youxiaodate }"/></td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td><input id="colongitude" type="text" style="width:280px" class="" name="longitude" value="${health.longitude }"/></td>
						<td>纬度</td>
                        <td><input id="colatitude" type="text" style="width:280px" class="" name="latitude" value="${health.latitude }"/></td>
                      </tr>
					 
					  <tr>
                        <td><b>二、经营方式</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="批发" name="jyType">&nbsp&nbsp&nbsp批发</td>
                        <td><input id="hacccpapprove" type="checkbox" value="零售" name="jyType">&nbsp&nbsp&nbsp零售</td>
                        <td><input id="wghapprove" type="checkbox" value="主营" name="jyType">&nbsp&nbsp&nbsp主营</td>                        
                      </tr>
					  <tr>
                        <td><input id="lsapprove" type="checkbox" value="兼营" name="jyType">&nbsp&nbsp&nbsp兼营</td>
						<td><input id="yjapprove" type="checkbox" value="其他" name="jyType">&nbsp&nbsp&nbsp其他</td>
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
                        <td><b>三、人员情况</b></td>                 
                      </tr>
					  <tr>
                        <td>从业人数</td>
                        <td><input id="cyNum" type="text" style="width:280px" class="" name="cyNum" value="${health.cyNum }"/></td>
						<td>中专及其以下人数</td>
                        <td><input id="graduateNum" type="text" style="width:280px" class="" name="graduateNum" value="${health.graduateNum }"/></td>
                      </tr>
                      
                      <tr>
                        <td>大专及其以上人数</td>
                        <td><input id="juniorNum" type="text" style="width:280px" class="" name="juniorNum" value="${health.juniorNum }"/></td>
                      </tr>
					  
					  
					  <tr>
                        <td><b>四、管理情况</b></td>                 
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="供货商资质档案" name="manage">
                        	&nbsp&nbsp&nbsp供货商资质档案</td>
                        <td><input id="manage" type="checkbox" value="化妆品批准证书" name="manage">
                       		 &nbsp&nbsp&nbsp化妆品批准证书</td> 
                        <td><input id="manage" type="checkbox" value="化妆品存储设备" name="manage">
                      	  	&nbsp&nbsp&nbsp化妆品存储设备</td>
                        <td><input id="manage" type="checkbox" value="购进验收记录出入台账" name="manage">
                      	  	&nbsp&nbsp&nbsp购进验收记录出入台账</td>                           
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="从业人员健康证" name="manage">
                        		&nbsp&nbsp&nbsp从业人员健康证</td>
                        <td><input id="manage" type="checkbox" value="人员培训记录" name="manage">
                        		&nbsp&nbsp&nbsp人员培训记录</td>                        
                      </tr>
                      
						<tr>
						<td colspan="2" align="right"><input type="submit" class="btn btn-primary"  width="30px" value="修改"/></td>
						<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>							
                     </tr>											  
                    </tfoot>
                  </table>	
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
            </div><!-- /.col -->
			
          </div><!-- /.row -->
        </section><!-- /.content -->
    <script>
      $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
          "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false
        });
      });
      function sumbit_sure(){
    	  confirmMessage('con_punishBasis','确定要修改吗',{width:300,height:150,sure:callBack}); 
  		function callBack(){
  			$.ajax({
  				url:"${pageContext.request.contextPath }/CosmeticServlet",
  				type:"post",
  				dataType:"json",
  				data:$('#CosmeticForm').serialize(),
  				success : function(data) {
  					if(data>0){
  						alertEase("修改成功",'alert_succ');
  					}else{
  						alertEase("修改失败",'alert_err');
  					}
  				}
  			}); 
  		}
	 }
    </script>
