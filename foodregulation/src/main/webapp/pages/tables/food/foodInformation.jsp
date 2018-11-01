<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
    	$(function(){
    		/*
    		if(${groupidF eq 1})
    		{	
    			$(":input[readonly]").removeAttr("readonly");
    			$("#textarea").removeAttr("readonly");
    			$("#selectId").removeAttr("disabled");
    		}*/
    		
    		//循环遍历type选中项
    		var type = '${food.type}';
               var arr = new Array();
               arr = type.split(",");
               $("input:checkbox[name='type']").each(function() {
               	for(j=0;j<arr.length;j++){
               		if(arr[j] == $(this).val()){
               			$(this).attr("checked",true);
               			continue;
               		}
               	}
			});
			//循环遍历remark选中项
			var remark = '${food.remark}';
               var arrRemark = new Array();
               arrRemark = remark.split(",");
               $("input:checkbox[name='remark']").each(function() {
               	for(j=0;j<arrRemark.length;j++){
               		if(arrRemark[j] == $(this).val()){
               			$(this).attr("checked",true);
               			continue;
               		}
               	}
			});
    		
    	});
    	
    	
    	
    	function sumbit_sure(){
    		confirmMessage('con_punishBasis','确定要修改吗',{width:300,height:150,sure:callBack}); 
    		function callBack(){
    			$.ajax({
    				url:"${pageContext.request.contextPath }/FoodServlet",
    				type:"post",
    				dataType:"json",
    				data:$('#foodUpdateForm').serialize(),
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
                  <h3>食品餐饮企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form id="deleteForm" action="" method="post">
                	<input type="hidden" name="method" value="delete">
                	<input type="hidden" name="idF" value="${food.id }">
                </form>
                
                 <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/FoodServlet" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="id" value="${food.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbit_sure()" id="foodUpdateForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="id" value="${food.id }">
                   <label class="pull-left">最后修改人: ${food.amend }</label>
                   
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        <td ><b>一、基本情况</b></td>                 
                     </tr>
					 <tr>
								<td>企业名称</td>
		                    	<td><input id="qyname" type="text" style="width:280px" class="" value="${food.qyname }" name="qyname" /></td>
								<td>所属行政区域</td>
		                   		 <td >
	                         		<select id="address" style="width:280px" name="address">
	                         				<option value="0">请选择</option>
                			  			<c:forEach items="${addressList}" var="addressLis">
                 		         			<option  value="${addressLis.tDictionaryCode }" <c:if test="${food.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                			 			 </c:forEach>	
                         			</select>
		                     	</td>
							</tr>
							 
							 <tr>
                        		<td>经营场所(具体到门牌号)</td>
                        		<td><input id="scaddress" type="text" style="width:280px" value="${food.scaddress }" name="scaddress" class="" onblur="searchAddress('folongitude','folatitude')"/>
                        		</td>
                        		<td>邮政编码</td>
                        		<td><input id="ems" type="text" style="width:280px" value="${food.ems }" name="ems" class=""/></td>                   
                      		</tr>
                      			
                      		 <tr>
		                        <td>法定代表人</td>
		                        <td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" value="${food.fddelegate }"/></td>
								<td>电话(手机)号</td>
		                        <td><input id="fdphone" type="text" style="width:280px" name="fdphone" class="" value="${food.fdphone }"/></td>
		                      </tr>
		                     <tr>
		                        <td>负责人</td>
		                        <td><input id="qydelegate" type="text" style="width:280px" value="${food.qydelegate }" class="" name="qydelegate" /></td>
								<td>电话(手机)号</td>
		                        <td><input id="qyphone" type="text" style="width:280px" class="" value="${food.qyphone }"  name="qyphone" /></td>
		                     </tr>
							 <tr>
								 <td>经济类型</td>
                        			<td> <select id="" style="width:280px" name="jjtype">
			                  		            <option value="">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode }" <c:if test="${food.jjtype eq economicType.tDictionaryCode }">selected='selected'</c:if>>${economicType.tDictionaryName }</option>
                 			  </c:forEach>	
                           				</select>
                        		</td>
								 <td>电子邮箱</td>
		                         <td ><input id="email" type="text" style="width:280px" class="" value="${food.email }" name="email" /></td>
							 </tr>
		                     <tr>
		                        <td>登记机关</td>
		                        <td><input id="gsorganization" type="text" style="width:280px" value="${food.gsorganization }" name="gsorganization" /></td>
								<td>注册号/统一社会信用代码</td>
		                        <td><input id="zzcode" type="text" style="width:280px" class="" name="zzcode" value="${food.zzcode }"/></td>
		                     </tr>
							 <tr>
								 <td>成立日期</td>
		                         <td><input id="cldate" type="text" style="width:280px" class="" name="cldate" value="${food.cldate }"/></td>
								 <td>年销售额(万元)</td>
		                         <td ><input id="nzyield" type="text" style="width:280px" class="" name="nzyield" value="${food.nzyield }"/></td>
							 </tr>
		                     <tr>
		                        <td>从业人员数</td>
		                        <td><input id="cyNum" type="text" style="width:280px" class="" name="cyNum" value="${food.cyNum }"/></td>
								<td>就餐座位数</td>
		                        <td><input id="seats" type="text" style="width:280px" class="" name="seats" value="${food.seats }"/></td>
		                     </tr>
							 <tr>
								 <td>加工经营场所面积</td>
		                         <td><input id="jyArea" type="text" style="width:280px" class="" name="jyArea" value="${food.jyArea }"/></td>
								 <td>持健康证人数</td>
		                         <td><input id="healthNum" type="text" style="width:280px" class="" name="healthNum" value="${food.healthNum }"/></td>
							 </tr>
		                     <tr>
                        		<td>监管单位</td>
                      			<td><select style="width:280px" id="department" name="department">
                      					<option value="0">请选择</option>
                      					<c:forEach items="${unitList}" var="list">
                        					<option value="${list.tDictionaryCode }" <c:if test="${food.department eq list.tDictionaryCode }">selected='selected'</c:if> >${list.tDictionaryName }</option>
                        				</c:forEach>
                           		 	</select>
                        		</td>
								<td>监管人员</td>
                        		<td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" value="${food.spdelegate }"/></td>
                      		</tr>
                      		
                      		<tr>
                        		<td>监督人员</td>
                        		<td><input id="jiandurenyuan" type="text" style="width:280px" class="" name="jiandurenyuan" value="${food.jiandurenyuan }"/></td>
								<td>协管人员</td>
                        		<td><input id="xieguanrenyuan" type="text" style="width:280px" class="" name="xieguanrenyuan" value="${food.xieguanrenyuan }"/></td>
                      		</tr>
                      		
							 <tr>
								 <td>食品经营许可证编号</td>
		                         <td><input id="scpermit" type="text" style="width:280px" class="" name="scpermit" value="${food.scpermit }"/></td>
								 <td>发证机关</td>
		                         <td ><input id="fazhengjiguan" type="text" style="width:280px" class="" name="fazhengjiguan" value="${food.fazhengjiguan }"/></td>
							 </tr>
							 
							 <tr>
                        		<td>发证日期</td>
                        		<td><input id="fazhengriqi" type="text" style="width:280px" class="" name="fazhengriqi" value="${food.fazhengriqi }"/></td>
								<td>有效日期</td>
                        		<td><input id="youxiaodate" type="text" style="width:280px" class="" name="youxiaodate" value="${food.youxiaodate }"/></td>
                      		</tr>
                      		
                      		<tr>
                       			<td>经度</td>
                        		<td><input id="folongitude" type="text" style="width:280px" class="" name="longitude" value="${food.longitude }"/></td>
								<td>纬度</td>
                        		<td><input id="folatitude" type="text" style="width:280px" class="" name="latitude" value="${food.latitude }"/></td>
                      		</tr>
                      		
                      		<tr>
                        		<td><b>二、许可项目</b></td>
                     		</tr>
                     		
                     		<tr>
                        		<td>类型：</td>
                     		</tr>
                     		
                     		<tr>
                       			<td><input id="type" type="checkbox" value="特大型餐馆" name="type">&nbsp&nbsp&nbsp特大型餐馆</td>
                        		<td><input id="superMarket" type="checkbox" value="大型餐馆" name="type">&nbsp&nbsp&nbsp大型餐馆</td>
                        		<td><input id="cvs" type="checkbox" value="中型餐馆" name="type">&nbsp&nbsp&nbsp中型餐馆</td>
                        		<td><input id="store" type="checkbox" value="小型餐馆" name="type">&nbsp&nbsp&nbsp小型餐馆</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="快餐店" name="type">&nbsp&nbsp&nbsp快餐店</td>
                        		<td><input id="superMarket" type="checkbox" value="小吃店" name="type">&nbsp&nbsp&nbsp小吃店</td>
                        		<td><input id="cvs" type="checkbox" value="饮品店" name="type">&nbsp&nbsp&nbsp饮品店</td>
                        		<td><input id="store" type="checkbox" value="食堂" name="type">&nbsp&nbsp&nbsp食堂</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="集体用餐配送单位" name="type">&nbsp&nbsp&nbsp集体用餐配送单位</td>
                        		<td><input id="superMarket" type="checkbox" value="其他" name="type">&nbsp&nbsp&nbsp其他</td>
                      		</tr>
                      		
                      		<tr>
                        		<td>备注：</td>
                     		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="单纯火锅" name="remark">&nbsp&nbsp&nbsp单纯火锅</td>
                        		<td><input id="superMarket" type="checkbox" value="单纯烧烤" name="remark">&nbsp&nbsp&nbsp单纯烧烤</td>
                        		<td><input id="cvs" type="checkbox" value="全部使用半成品加工" name="remark">&nbsp&nbsp&nbsp全部使用半成品加工</td>
                        		<td><input id="store" type="checkbox" value="中餐类制售" name="remark">&nbsp&nbsp&nbsp中餐类制售</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="西餐类制售" name="remark">&nbsp&nbsp&nbsp西餐类制售</td>
                        		<td><input id="superMarket" type="checkbox" value="日餐类制售" name="remark">&nbsp&nbsp&nbsp日餐类制售</td>
                        		<td><input id="cvs" type="checkbox" value="韩餐类制售" name="remark">&nbsp&nbsp&nbsp韩餐类制售</td>
                        		<td><input id="store" type="checkbox" value="工地食堂" name="remark">&nbsp&nbsp&nbsp工地食堂</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="学院食堂" name="remark">&nbsp&nbsp&nbsp学院食堂</td>
                        		<td><input id="superMarket" type="checkbox" value="幼儿园食堂" name="remark">&nbsp&nbsp&nbsp幼儿园食堂</td>
                        		<td><input id="cvs" type="checkbox" value="企事业单位机关食堂" name="remark">&nbsp&nbsp&nbsp企事业单位机关食堂</td>
                        		<td><input id="store" type="checkbox" value="含裱花蛋糕" name="remark">&nbsp&nbsp&nbsp含裱花蛋糕</td>
                      		</tr>
                      		
                      		<tr>
                       			<td><input id="foodMarket" type="checkbox" value="含凉菜" name="remark">&nbsp&nbsp&nbsp含凉菜</td>
                        		<td><input id="superMarket" type="checkbox" value="含生食海产品" name="remark">&nbsp&nbsp&nbsp含生食海产品</td>
                        		<td><input id="cvs" type="checkbox" value="冷热饮品制售" name="remark">&nbsp&nbsp&nbsp冷热饮品制售</td>
                        		<td><input id="store" type="checkbox" value="其他" name="remark">&nbsp&nbsp&nbsp其他</td>
                      		</tr>
                      		
                      		<tr>
                        		<td>须知：</td>
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
