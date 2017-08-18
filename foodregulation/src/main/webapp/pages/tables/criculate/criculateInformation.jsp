<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
    	$(function(){
    		/*
    		if(${groupid eq 1})
    		{
    			$(":input[readonly]").removeAttr("readonly");
    			$("#textarea").removeAttr("readonly");
    			$("#selectId").removeAttr("disabled");
    		}*/
    	});
    	
    	function sumbit_sure(id){
    		confirmMessage('con_punishBasis','确定要修改吗',{width:300,height:150,sure:callBack}); 
    		function callBack(){
    			$.ajax({
    				url:"${pageContext.request.contextPath }/servlet/CriculateServlet1",
    				type:"post",
    				dataType:"json",
    				data:$('#submitForm').serialize(),
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
                  <h3>食品流通企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form id="deleteForm" action="" method="post">
                	<input type="hidden" name="method" value="delete">
                	<input type="hidden" name="id" value="${criculate.id }">
                	<input type="hidden" name="pageCode" value="${pageCode }">
                </form>
                
                <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/servlet/CriculateServlet1" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="id" value="${criculate.id }">
                </form>
                
                <form id="submitForm" action="javascript:void(0)" method="post" onsubmit="return sumbit_sure()" >
                	<input type="hidden" name="method" value="update">
                	<input type="hidden" name="id" value="${criculate.id }">
                	<label id="amend" class="pull-left">最后修改人: ${criculate.amend }</label>
                		 
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        <td ><b>一、基本情况</b></td>                 
                     </tr>
					 <tr>
								 <td>企业名称</td>
		                         <td><input id="qyname" type="text" style="width:280px" name="qyname" value="${criculate.qyname }"/></td>
								 <td>所属行政区域</td>
		                         <td >
		                         	<select id="address" style="width:280px" name="address">
		                         			<option value="0">请选择</option>
                 			  			<c:forEach items="${addressList}" var="addressLis">
                  		         			 <option  value="${addressLis.tDictionaryCode }" <c:if test="${criculate.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                 			 			 </c:forEach>	
                          			 </select>
		                         </td>
							 </tr>
							 
							 <tr>
                        		<td>经营场所(具体到门牌号)</td>
                        		<td><input id="scaddress" type="text" style="width:280px" name="scaddress" value="${criculate.scaddress }" onblur="searchAddress('crlongitude','crlatitude')"/>
                        		</td>
                        		<td>邮政编码</td>
                        		<td><input id="ems" type="text" style="width:280px" name="ems" value="${criculate.ems }"/></td>                   
                      		</tr>
                      		
                      		 <tr>
		                        <td>法定代表人</td>
		                        <td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" value="${criculate.fddelegate }"/></td>
								<td>电话(手机)号</td>
		                        <td><input id="fdphone" type="text" style="width:280px" name="fdphone" class="" value="${criculate.fdphone }"/></td>
		                      </tr>
		                     <tr>
		                        <td>负责人</td>
		                        <td><input id="qydelegate" type="text" style="width:280px" value="${criculate.qydelegate }" name="qydelegate" /></td>
								<td>电话(手机)号</td>
		                        <td><input id="qyphone" type="text" style="width:280px" value="${criculate.qyphone }" name="qyphone" /></td>
		                     </tr>
							 <tr>
								 <td>经济类型</td>
                        			<td> <select id="" style="width:280px" name="jjtype">
			                  		            <option value="">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode }" <c:if test="${criculate.jjtype eq economicType.tDictionaryCode }">selected='selected'</c:if>>${economicType.tDictionaryName }</option>
                 			  </c:forEach>	
                          			 	</select>
                        			</td>
								 <td>电子邮箱</td>
		                         <td ><input id="email" type="text" style="width:280px" value="${criculate.email }" name="email" /></td>
							 </tr>
		                     <tr>
		                        <td>登记机关</td>
		                        <td><input id="gsorganization" type="text" style="width:280px" value="${criculate.gsorganization }" name="gsorganization" /></td>
								<td>注册号/统一社会信用代码</td>
		                        <td><input id="zzcode" type="text" style="width:280px" value="${criculate.zzcode }" name="zzcode" /></td>
		                     </tr>
							 <tr>
								 <td>成立日期</td>
		                         <td><input id="cldate" type="text" style="width:280px" value="${criculate.cldate }" name="cldate" /></td>
								 <td>年销售额(万元)</td>
		                         <td ><input id="nzyield" type="text" style="width:280px" value="${criculate.nzyield }" name="nzyield" /></td>
							 </tr>
		                     <tr>
		                        <td>经营面积(平方米)</td>
		                        <td><input id="jyArea" type="text" style="width:280px" value="${criculate.jyArea }" name="jyArea" /></td>
								<td>产权人</td>
		                        <td><input id="propertyOwner" type="text" style="width:280px" value="${criculate.propertyOwner }" name="propertyOwner" /></td>
		                     </tr>
							 <tr>
								 <td>房屋使用期限</td>
		                         <td><input id="fangWuDate" type="text" style="width:280px" value="${criculate.fangWuDate }" name="fangWuDate" /></td>
								 <td>房屋使用方式</td>
		                         <td >
	                         		<select style="width:280px" id="fangWuWay" name="fangWuWay">
	                         			<option value="">请选择</option>
	                         			<option value="自有" <c:if test="${criculate.fangWuWay eq '自有' }">selected='selected'</c:if>>自有</option>
	                         			<option value="租赁" <c:if test="${criculate.fangWuWay eq '租赁' }">selected='selected'</c:if>>租赁</option>
	                         			<option value="无偿使用" <c:if test="${criculate.fangWuWay eq '无偿使用' }">selected='selected'</c:if>>无偿使用</option>
	                         		</select>
		                         </td>
							 </tr>
		                     <tr>
                        		<td>监管单位</td>
                      			<td><select style="width:280px" id="department" name="department">
                      					<option value="0">请选择</option>
                      					<c:forEach items="${unitList}" var="list">
                        					<option value="${list.tDictionaryCode }" <c:if test="${criculate.department eq list.tDictionaryCode }">selected='selected'</c:if> >${list.tDictionaryName }</option>
                        				</c:forEach>
                           		 	</select>
                        		</td>
								<td>监管人员</td>
                        		<td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" value="${criculate.spdelegate }"/></td>
                      		</tr>
                      		
                      		<tr>
                        		<td>监督人员</td>
                        		<td><input id="jiandurenyuan" type="text" style="width:280px" value="${criculate.jiandurenyuan }" name="jiandurenyuan" /></td>
								<td>协管人员</td>
                        		<td><input id="xieguanrenyuan" type="text" style="width:280px" value="${criculate.xieguanrenyuan }" name="xieguanrenyuan" /></td>
                      		</tr>
                      		
							 <tr>
								 <td>食品经营许可证编号</td>
		                         <td><input id="scpermit" type="text" style="width:280px" class="" name="scpermit" value="${criculate.scpermit }"/></td>
								 <td>发证机关</td>
		                         <td ><input id="fazhengjiguan" type="text" style="width:280px" class="" name="fazhengjiguan" value="${criculate.fazhengjiguan }"/></td>
							 </tr>
							 
							 <tr>
                        		<td>发证日期</td>
                        		<td><input id="fazhengriqi" type="text" style="width:280px" class="" name="fazhengriqi" value="${criculate.fazhengriqi }"/></td>
								<td>有效日期</td>
                        		<td><input id="youxiaodate" type="text" style="width:280px" class="" name="youxiaodate" value="${criculate.youxiaodate }"/></td>
                      		</tr>
                      		
                      		<tr>
                       			<td>经度</td>
                        		<td><input id="crlongitude" type="text" style="width:280px" class="" name="longitude" value="${criculate.longitude }"/></td>
								<td>纬度</td>
                        		<td><input id="crlatitude" type="text" style="width:280px" class="" name="latitude" value="${criculate.latitude }"/></td>
                      		</tr>
							 
							<tr>
                        		<td><b>二、业态类别</b></td>
                     		</tr>
                     		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="食品集中交易市场" name="foodMarket" <c:if test="${criculate.foodMarket eq '食品集中交易市场' }">checked='checked'</c:if>>
                       					&nbsp&nbsp&nbsp食品集中交易市场</td>
                        		<td><input id="superMarket" type="checkbox" value="商场超市" name="superMarket" 
                        			<c:if test="${criculate.superMarket eq '商场超市' }">checked='checked'</c:if>>&nbsp&nbsp&nbsp商场超市</td>
                        		<td><input id="cvs" type="checkbox" value="便利店" name="cvs" <c:if test="${criculate.cvs eq '便利店' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp便利店</td>
                        		<td><input id="store" type="checkbox" value="食杂店" name="store" <c:if test="${criculate.store eq '食杂店' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp食杂点</td>
                      		</tr>
                      		<tr>
                       			<td><input id="foodTrade" type="checkbox" value="食品贸易商" name="foodTrade" <c:if test="${criculate.foodTrade eq '食品贸易商' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp食品贸易商</td>
                        		<td><input id="foodLogistics" type="checkbox" value="食品物流配送" name="foodLogistics" <c:if test="${criculate.foodLogistics eq '食品物流配送' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp食品物流配送</td>
                        		<td><input id="nonStoreFoodBusiness" type="checkbox" value="无店铺食品经营" name="nonStoreFoodBusiness" <c:if test="${criculate.nonStoreFoodBusiness eq '无店铺食品经营' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp无店铺食品经营</td>
                        		<td></td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td><b>三、无店铺经营方式</b></td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="onlineShop" type="checkbox" value="网上商店" name="onlineShop" <c:if test="${criculate.onlineShop eq '网上商店' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp网上商店</td>
                        		<td><input id="mailOrder" type="checkbox" value="邮购" name="mailOrder" <c:if test="${criculate.mailOrder eq '邮购' }">checked='checked'</c:if> >
                        			&nbsp&nbsp&nbsp邮购</td>
                        		<td><input id="televisedShopping" type="checkbox" value="电视电话购物" name="televisedShopping" <c:if test="${criculate.televisedShopping eq '电视电话购物' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp电视电话购物</td>
                        		<td><input id="automat" type="checkbox" value="自动售货机" name="automat" <c:if test="${criculate.automat eq '自动售货机' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp自动售货机</td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td><b>四、许可范围</b></td>
                     		</tr>
                     		<tr>
                        		<td>(1)	经营方式：	
                        		<input id="piFa" type="checkbox" value="批发" name="piFa" <c:if test="${criculate.piFa eq '批发' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp批发</td>
                        		<td></td>
                        		<td></td>
                     		</tr>
                     		
                     		<tr>
                        		<td>经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="packFood" type="checkbox" value="预包装食品" name="packFood" <c:if test="${criculate.packFood eq '预包装食品' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp预包装食品</td>
                        		<td><input id="bulkFood" type="checkbox" value="散装食品" name="bulkFood" <c:if test="${criculate.bulkFood eq '散装食品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp散装食品</td>
                        		<td><input id="dairyProduct" type="checkbox" value="乳制品" name="dairyProduct" <c:if test="${criculate.dairyProduct eq '乳制品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp乳制品</td>
                        		<td><input id="hanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="hanBaby" <c:if test="${criculate.hanBaby eq '含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp含婴幼儿配方乳粉</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="noBody" type="checkbox" value="不含婴幼儿配方乳粉" name="noBody" <c:if test="${criculate.noBody eq '不含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp不含婴幼儿配方乳粉</td>
                        		<td><input id="foodProduct" type="checkbox" value="食用农产品" name="foodProduct" <c:if test="${criculate.foodProduct eq '食用农产品' }">checked='checked'</c:if> >
                        			&nbsp&nbsp&nbsp食用农产品</td>
                        		<td><input id="waterProduct" type="checkbox" value="含水产品" name="waterProduct" <c:if test="${criculate.waterProduct eq '含水产品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp含水产品</td>
                        		<td><input id="freshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="freshAnimalProduct" <c:if test="${criculate.freshAnimalProduct eq '含冷鲜畜禽产品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp含冷鲜畜禽产品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td><input id="healthProduct" type="checkbox" value="保健食品" name="healthProduct" <c:if test="${criculate.healthProduct eq '保健食品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp保健食品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td>(2)	经营方式：	
                        		<input id="retail" type="checkbox" value="零售" name="retail" <c:if test="${criculate.retail eq '零售' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp零售</td>
                        		<td></td>
                        		<td></td>
                     		</tr>
                     		
                     		<tr>
                        		<td>经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="lsPackFood" type="checkbox" value="预包装食品" name="lsPackFood" <c:if test="${criculate.lsPackFood eq '预包装食品' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp预包装食品</td>
                        		<td><input id="lsBulkFood" type="checkbox" value="散装食品" name="lsBulkFood" <c:if test="${criculate.lsBulkFood eq '散装食品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp散装食品</td>
                        		<td><input id="cookedFood" type="checkbox" value="含熟食" name="cookedFood" <c:if test="${criculate.cookedFood eq '含熟食' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp含熟食</td>
                        		<td><input id="noCookedFood" type="checkbox" value="不含熟食" name="noCookedFood" <c:if test="${criculate.noCookedFood eq '不含熟食' }">checked='checked'</c:if> >
                        			&nbsp&nbsp&nbsp不含熟食</td>
                      		</tr>
                      		<tr>
                       			<td><input id="lsDairyProduct" type="checkbox" value="乳制品" name="lsDairyProduct" <c:if test="${criculate.lsDairyProduct eq '乳制品' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp乳制品</td>
                        		<td><input id="lsHanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="lsHanBaby" <c:if test="${criculate.lsHanBaby eq '含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp含婴幼儿配方乳粉</td>
                        		<td><input id="lsNoBody" type="checkbox" value="不含婴幼儿配方乳粉" name="lsNoBody" <c:if test="${criculate.lsNoBody eq '不含婴幼儿配方乳粉' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp不含婴幼儿配方乳粉</td>
                        		<td><input id="lsFoodProduct" type="checkbox" value="食用农产品" name="lsFoodProduct" <c:if test="${criculate.lsFoodProduct eq '食用农产品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp食用农产品</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="lsWaterProduct" type="checkbox" value="含水产品" name="lsWaterProduct" <c:if test="${criculate.lsWaterProduct eq '含水产品' }">checked='checked'</c:if>>
                       				&nbsp&nbsp&nbsp含水产品</td>
                        		<td><input id="lsFreshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="lsFreshAnimalProduct" <c:if test="${criculate.lsFreshAnimalProduct eq '含冷鲜畜禽产品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp含冷鲜畜禽产品</td>
                        		<td><input id="lsHealthProduct" type="checkbox" value="保健食品" name="lsHealthProduct" <c:if test="${criculate.lsHealthProduct eq '保健食品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp保健食品</td>
                        		<td><input id="scene" type="checkbox" value="食用农产品" name="scene" <c:if test="${criculate.scene eq '食用农产品' }">checked='checked'</c:if>>
                        			&nbsp&nbsp&nbsp现场制售</td>
                      		</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit" class="btn btn-primary"  width="30px" value="修改"/></td>
						<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>							
                     </tr>	
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
    </script>
