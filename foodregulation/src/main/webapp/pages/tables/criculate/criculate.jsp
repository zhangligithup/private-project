2<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
		
		//打印
    	function print(){
    		location.href="${pageContext.request.contextPath }/pages/tables/criculate/downloadCriculate.jsp";
    	}
    	function save3(){
    		if(_submit()){
	    		$.ajax({
					url:"${pageContext.request.contextPath }/servlet/CriculateServlet1",
					type:"post",
					dataType:"json",
					data:$('#formValidate3').serialize(),
					success : function(data) {
						if(data>0){
							alertEase("添加成功",'alert_succ');
							queryEnterprise();
						}else{
							alertEase("添加失败",'alert_err');
						}
					}
				}); 
    		}
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
                
                <form id="formValidate3" action="javascript:void(0)" method="post">
               		 <input type="hidden" name="method" value="add">
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
		                         <td><input id="qyname" type="text" style="width:280px" class="" name="qyname" /></td>
								 <td>所属行政区域</td>
		                         <td >
		                         	<select id="address" style="width:280px" name="address">
		                         		<option value="0">请选择</option>
                 			  			<c:forEach items="${addressList}" var="addressLis">
                  		          <option  value="${addressLis.tDictionaryCode}" >${addressLis.tDictionaryName}</option>
                 			 			 </c:forEach>	
                          			 </select>
		                         </td>
							 </tr>
							 
							 <tr>
                        		<td>经营场所(具体到门牌号)</td>
                        		<td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('crlongitude','crlatitude')"/>
                        		</td>
                        		<td>邮政编码</td>
                        		<td><input id="ems" type="text" style="width:280px" name="ems" class=""/></td>                   
                      		</tr>
                      		 <tr>
                        		<td>法定代表人</td>
                        		<td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" class=""/></td>
								<td>电话(手机)号</td>
                        		<td><input id="fdphone" type="text" style="width:280px" name="fdphone" class=""/></td>
                      		</tr>
		                     <tr>
		                        <td>负责人</td>
		                        <td><input id="qydelegate" type="text" style="width:280px" class="" name="qydelegate" /></td>
								<td>电话(手机)号</td>
		                        <td><input id="qyphone" type="text" style="width:280px" class="" name="qyphone" /></td>
		                     </tr>
							 <tr>
								 <td>经济类型</td>
                        			<td> <select id="" style="width:280px" name="jjtype">
			                  		          <option value="0">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode}" >${economicType.tDictionaryName}</option>
                 			  </c:forEach>	
                           				</select>
                        		   </td>
								 <td>电子邮箱</td>
		                         <td ><input id="email" type="text" style="width:280px" class="" name="email" /></td>
							 </tr>
		                     <tr>
		                        <td>登记机关</td>
		                        <td><input id="gsorganization" type="text" style="width:280px" class="" name="gsorganization" /></td>
								<td>注册号/统一社会信用代码</td>
		                        <td><input id="zzcode" type="text" style="width:280px" class="" name="zzcode" /></td>
		                     </tr>
							 <tr>
								 <td>成立日期</td>
		                         <td>
		                         <div id="cldateBox1" style="position:relative">
		                         	<input id="cldate" type="text" style="width:280px" class="" name="cldate" />
		                         </div>
		                         </td>
								 <td>年销售额(万元)</td>
		                         <td ><input id="nzyield" type="text" style="width:280px" class="" name="nzyield" /></td>
							 </tr>
		                     <tr>
		                        <td>经营面积(平方米)</td>
		                        <td><input id="jyArea" type="text" style="width:280px" class="" name="jyArea" /></td>
								<td>产权人</td>
		                        <td><input id="propertyOwner" type="text" style="width:280px" class="" name="propertyOwner" /></td>
		                     </tr>
							 <tr>
								 <td>房屋使用期限</td>
		                         <td><input id="fangWuDate" type="text" style="width:280px" class="" name="fangWuDate" /></td>
								 <td>房屋使用方式</td>
		                         <td >
	                         		<select style="width:280px" id="fangWuWay" name="fangWuWay">
	                         			<option value="">请选择</option>
	                         			<option value="自有">自有</option>
	                         			<option value="租赁">租赁</option>
	                         			<option value="无偿使用">无偿使用</option>
	                         		</select>
		                         </td>
							 </tr>
		                     <tr>
                        		<td>监管单位</td>
                      			<td><select style="width:280px" id="department" name="department">
                      					<option value="0">请选择</option>
                      					<c:forEach items="${unitList}" var="list">
                        					<option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                        				</c:forEach>
                           		 	</select>
                        		</td>
								<td>监管人员</td>
                        		<td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" class=""/></td>
                      		</tr>
                      		
                      		<tr>
                        		<td>监督人员</td>
                        		<td><input id="jiandurenyuan" type="text" style="width:280px" class="" name="jiandurenyuan" /></td>
								<td>协管人员</td>
                        		<td><input id="xieguanrenyuan" type="text" style="width:280px" class="" name="xieguanrenyuan" /></td>
                      		</tr>
                      		
							 <tr>
								 <td>食品经营许可证编号</td>
		                         <td><input id="scpermit" type="text" style="width:280px" class="" name="scpermit" /></td>
								 <td>发证机关</td>
		                         <td ><input id="fazhengjiguan" type="text" style="width:280px" class="" name="fazhengjiguan" /></td>
							 </tr>
							 
							<tr>
		                        <td>发证日期</td>
		                        <td>
		                        	<div id="fazhengriqiBox1" style="position:relative">
		                        	<input id="fazhengriqi" type="text" style="width:280px" class="" name="fazhengriqi" />
		                        	</div>
		                        </td>
								<td>有效日期</td>
		                        <td>
		                        	<div id="youxiaodateBox1" style="position:relative">
		                        	<input id="youxiaodate" type="text" style="width:280px" class="" name="youxiaodate" />
		                        	</div>
		                        </td>
                      		</tr>
                      		
                      		<tr>
                       			<td>经度</td>
                        		<td><input id="crlongitude" type="text" style="width:280px" class="" name="longitude" /></td>
								<td>纬度</td>
                        		<td><input id="crlatitude" type="text" style="width:280px" class="" name="latitude" /></td>
                      		</tr>
							 
							<tr>
                        		<td><b>二、业态类别</b></td>
                     		</tr>
                     		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="食品集中交易市场" name="foodMarket">&nbsp;&nbsp;&nbsp;食品集中交易市场</td>
                        		<td><input id="superMarket" type="checkbox" value="商场超市" name="superMarket">&nbsp;&nbsp;&nbsp;商场超市</td>
                        		<td><input id="cvs" type="checkbox" value="便利店" name="cvs">&nbsp;&nbsp;&nbsp;便利店</td>
                        		<td><input id="store" type="checkbox" value="食杂店" name="store">&nbsp;&nbsp;&nbsp;食杂店</td>
                      		</tr>
                      		<tr>
                       			<td><input id="foodTrade" type="checkbox" value="食品贸易商" name="foodTrade">&nbsp;&nbsp;&nbsp;食品贸易商</td>
                        		<td><input id="foodLogistics" type="checkbox" value="食品物流配送" name="foodLogistics">&nbsp;&nbsp;&nbsp;食品物流配送</td>
                        		<td><input id="nonStoreFoodBusiness" type="checkbox" value="无店铺食品经营" name="nonStoreFoodBusiness">&nbsp;&nbsp;&nbsp;无店铺食品经营</td>
                        		<td></td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td><b>三、无店铺经营方式</b></td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="onlineShop" type="checkbox" value="网上商店" name="onlineShop">&nbsp;&nbsp;&nbsp;网上商店</td>
                        		<td><input id="mailOrder" type="checkbox" value="邮购" name="mailOrder">&nbsp;&nbsp;&nbsp;邮购</td>
                        		<td><input id="televisedShopping" type="checkbox" value="电视电话购物" name="televisedShopping">&nbsp;&nbsp;&nbsp;电视电话购物</td>
                        		<td><input id="automat" type="checkbox" value="自动售货机" name="automat">&nbsp;&nbsp;&nbsp;自动售货机</td>
                      		</tr>
                      		
                      		
                      		<tr>
                        		<td><b>四、许可范围</b></td>
                     		</tr>
                     		<tr>
                        		<td>(1)	经营方式：	
                        		<input id="piFa" type="checkbox" value="批发" name="piFa">&nbsp;&nbsp;&nbsp;批发</td>
                        		<td></td>
                        		<td></td>
                     		</tr>
                     		
                     		<tr>
                        		<td>经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="packFood" type="checkbox" value="预包装食品" name="packFood">&nbsp;&nbsp;&nbsp;预包装食品</td>
                        		<td><input id="bulkFood" type="checkbox" value="散装食品" name="bulkFood">&nbsp;&nbsp;&nbsp;散装食品</td>
                        		<td><input id="dairyProduct" type="checkbox" value="乳制品" name="dairyProduct">&nbsp;&nbsp;&nbsp;乳制品</td>
                        		<td><input id="hanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="hanBaby">&nbsp;&nbsp;&nbsp;p含婴幼儿配方乳粉</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="noBody" type="checkbox" value="不含婴幼儿配方乳粉" name="noBody">&nbsp;&nbsp;&nbsp;不含婴幼儿配方乳粉</td>
                        		<td><input id="foodProduct" type="checkbox" value="食用农产品" name="foodProduct">&nbsp;&nbsp;&nbsp;食用农产品</td>
                        		<td><input id="waterProduct" type="checkbox" value="含水产品" name="waterProduct">&nbsp;&nbsp;&nbsp;含水产品</td>
                        		<td><input id="freshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="freshAnimalProduct">&nbsp;&nbsp;&nbsp;含冷鲜畜禽产品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td><input id="healthProduct" type="checkbox" value="保健食品" name="healthProduct">&nbsp;&nbsp;&nbsp;保健食品</td>
                      		</tr>
                      		
                      		<tr>
                        		<td>(2)	经营方式：	
                        		<input id="retail" type="checkbox" value="零售" name="retail">&nbsp;&nbsp;&nbsp;零售</td>
                        		<td></td>
                        		<td></td>
                     		</tr>
                     		
                     		<tr>
                        		<td>经营项目</td>
                     		</tr>
                     		<tr>
                       			<td><input id="lsPackFood" type="checkbox" value="预包装食品" name="lsPackFood">&nbsp;&nbsp;&nbsp;预包装食品</td>
                        		<td><input id="lsBulkFood" type="checkbox" value="散装食品" name="lsBulkFood">&nbsp;&nbsp;&nbsp;散装食品</td>
                        		<td><input id="cookedFood" type="checkbox" value="含熟食" name="cookedFood">&nbsp;&nbsp;&nbsp;含熟食</td>
                        		<td><input id="noCookedFood" type="checkbox" value="不含熟食" name="noCookedFood">&nbsp;&nbsp;&nbsp;不含熟食</td>
                      		</tr>
                      		<tr>
                       			<td><input id="lsDairyProduct" type="checkbox" value="乳制品" name="lsDairyProduct">&nbsp;&nbsp;&nbsp;乳制品</td>
                        		<td><input id="lsHanBaby" type="checkbox" value="含婴幼儿配方乳粉" name="lsHanBaby">&nbsp;&nbsp;&nbsp;含婴幼儿配方乳粉</td>
                        		<td><input id="lsNoBody" type="checkbox" value="不含婴幼儿配方乳粉" name="lsNoBody">&nbsp;&nbsp;&nbsp;不含婴幼儿配方乳粉</td>
                        		<td><input id="lsFoodProduct" type="checkbox" value="食用农产品" name="lsFoodProduct">&nbsp;&nbsp;&nbsp;食用农产品</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="lsWaterProduct" type="checkbox" value="含水产品" name="lsWaterProduct">&nbsp;&nbsp;&nbsp;含水产品</td>
                        		<td><input id="lsFreshAnimalProduct" type="checkbox" value="含冷鲜畜禽产品" name="lsFreshAnimalProduct">&nbsp;&nbsp;&nbsp;含冷鲜畜禽产品</td>
                        		<td><input id="lsHealthProduct" type="checkbox" value="保健食品" name="lsHealthProduct">&nbsp;&nbsp;&nbsp;保健食品</td>
                        		<td><input id="scene" type="checkbox" value="食用农产品" name="scene">&nbsp;&nbsp;&nbsp;现场制售</td>
                      		</tr>
							 
		                     
		                     
		                     
		                     
							<tr>
								<td colspan="2" align="right"><input type="button" onclick="save3()" class="btn btn-primary" width="30px" value="保存"/></td>	
								<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>					
		                     </tr>
		                 </tbody>	
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
      $(function(){
  	    $('#fazhengriqi').datetimepicker({
  	        container:'#fazhengriqiBox1',
  	        weekStart: 1,
  	        todayBtn:  1,
  	        autoclose: 1,
  	        todayHighlight: 1,
  	        startView: 2,
  	        minView: 2,
  	        forceParse: 0,
  		    format:'yyyy-mm-dd'
  	    });
  	    $('#youxiaodate').datetimepicker({
  	        container:'#youxiaodateBox1',
  	        weekStart: 1,
  	        todayBtn:  1,
  	        autoclose: 1,
  	        todayHighlight: 1,
  	        startView: 2,
  	        minView: 2,
  	        forceParse: 0,
  		    format:'yyyy-mm-dd'
  	    });
  	    $('#cldate').datetimepicker({
  	        container:'#cldateBox1',
  	        weekStart: 1,
  	        todayBtn:  1,
  	        autoclose: 1,
  	        todayHighlight: 1,
  	        startView: 2,
  	        minView: 2,
  	        forceParse: 0,
  		    format:'yyyy-mm-dd'
  	    });
  	});
    </script>
