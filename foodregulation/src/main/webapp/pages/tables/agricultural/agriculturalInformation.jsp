<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
    	
    	$(function(){
    		//循环遍历type选中项
	   		var type = '${agricultural.jyType}';
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
			var manage = '${agricultural.itemsOfBusiness}';
               var arrManage = new Array();
               arrManage = manage.split(",");
               $("input:checkbox[name='itemsOfBusiness']").each(function() {
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
    	
    	//生成二维码
    	function browseFolder(id){
		    $.ajax({
				url:"${pageContext.request.contextPath }/AgriculturalQrServlet",
				data:{"id":id},
				type: "POST",
		        async: false,
		        success: function(jsonData) {
		        	var objs=eval("("+jsonData+")");//将json形式字符串转换为json对象
		        	document.getElementById("down").href = "${pageContext.request.contextPath }/QrCode/" + objs.file; 
		        	document.getElementById("down").download = objs.fileName;
		        	document.getElementById("down").click();
		        }
			});
		}
    	
    	//提交修改
    	function sumbitsure(id){
			var val = $("#department").val();
			var add = $("#address").val();
			var qyname = $("#qyname").val();
			var zzcode = $("#zzcode").val();
			var qydelegate = $("#qydelegate").val();
			if(qyname.trim() == ""){
				alert("请填写企业名称");
				return false;
			}else if(add == 0){
				alert("请选择行政区域");
				return false;
			}else if(qydelegate.trim() == ""){
				alert("请填写法定代表人");
				return false;
			}else if(zzcode.trim() == ""){
				alert("请填写注册号");
				return false;
			}else if(val == 0){
				alert("请选择监管单位");
				return false;
			}else{
				confirmMessage('con_punishBasis','确定要修改吗',{width:300,height:150,sure:callBack}); 
	    		function callBack(){
	    			$.ajax({
	    				url:"${pageContext.request.contextPath }/AgriculturalServlet",
	    				type:"post",
	    				dataType:"json",
	    				data:$('#AgriculturalForm').serialize(),
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
		}
    	
    </script>
        <section class="content">
		
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3>食用农产品经营户信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                
                <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/AgriculturalServlet" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="id" value="${agricultural.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbitsure()" id="AgriculturalForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="idA" value="${agricultural.id}">
                  <label class="pull-left">最后修改人: ${agricultural.amend }</label>
                  
                  <table id="" class="table table-condensed" >     
                    <tbody>
					 <tr>
                        <td ><b>一、基本情况</b></td>
                         <td></td>
                        <td></td>
                        <td></td>                 
                     </tr>
					 <tr>
						<td>经营户名称</td>
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" value="${agricultural.qyname }"/></td>
						<td>所属行政区域</td>
                        <td>
                        	<select id="address" style="width:280px" name="address">
                        		<option value="0">请选择</option>
                 			  <c:forEach items="${addressList}" var="addressLis">
                  		          <option  value="${addressLis.tDictionaryCode }" <c:if test="${agricultural.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                       </td>
					 </tr>
					  <tr>
                        <td>经营场所地址(具体到摊位号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" value="${agricultural.scaddress }" onblur="searchAddress('aglongitude','aglatitude')"/>
                        </td>
                        <td>负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" value="${agricultural.qydelegate }"/></td>                   
                      </tr>
					  <tr>
                        <td>联系电话</td>
                        <td><input id="qyphone" type="text" style="width:280px" name="qyphone" value="${agricultural.qyphone }"/></td>
						<td>注册号/统一社会信用代码</td>
                        <td><input id="zzcode" type="text" style="width:280px" name="zzcode" value="${agricultural.zzcode }"/></td>
                      </tr>
                      
                      <tr>
                        <td>监管单位</td>
                      	<td><select style="width:280px" id="department" name="department">
                      			<option value="0">请选择</option>
                      			<c:forEach items="${unitList}" var="list">
                        			<option value="${list.tDictionaryCode }" <c:if test="${agricultural.department eq list.tDictionaryCode }">selected='selected'</c:if>>${list.tDictionaryName }</option>
                        		</c:forEach>
                            </select>
                        </td>
						<td>监管人员</td>
                        <td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" value="${agricultural.spdelegate }"/></td>
                      </tr>
                      
                      <tr>
                        <td>监督人员</td>
                        <td><input id="jiandurenyuan" type="text" style="width:280px" value="${agricultural.jiandurenyuan }" name="jiandurenyuan" /></td>
						<td>协管人员</td>
                        <td><input id="xieguanrenyuan" type="text" style="width:280px" value="${agricultural.xieguanrenyuan }" name="xieguanrenyuan" /></td>
                      </tr>
                      
                      
					  <tr>                        
                        <td>食品经营许可证</td>
                        <td><input id="scpermit" type="text" style="width:280px" name="scpermit" value="${agricultural.scpermit }"/></td>
						<td>经度</td>
                        <td><input id="aglongitude" type="text" style="width:280px" name="longitude" value="${agricultural.longitude }"/></td>
                      </tr>
                      
                       <tr>                        
						<td>纬度</td>
                        <td><input id="aglatitude" type="text" style="width:280px" name="latitude" value="${agricultural.latitude }"/></td>
                      </tr>
                      
					 
					  <tr>
                        <td><b>二、经营方式</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="批发" name="jyType">&nbsp;&nbsp;&nbsp;批发</td>
                        <td><input id="hacccpapprove" type="checkbox" value="零售" name="jyType">&nbsp;&nbsp;&nbsp;零售</td>
                        <td><input id="wghapprove" type="checkbox" value="批发兼零售" name="jyType">&nbsp;&nbsp;&nbsp;批发兼零售</td>                        
                      </tr>
                      
                      
                       <tr>
                        <td><b>三、经营项目</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="预包装食品" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;预包装食品</td>
                        <td><input id="hacccpapprove" type="checkbox" value="散装食品" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;散装食品</td>
                        <td><input id="wghapprove" type="checkbox" value="熟食" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;熟食</td> 
                        <td><input id="lsapprove" type="checkbox" value="乳制品" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;乳制品</td>                       
                      </tr>
					  <tr>
						<td><input id="yjapprove" type="checkbox" value="食用农产品" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;食用农产品</td>
						<td><input id="lsapprove" type="checkbox" value="水产品" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;水产品</td>
						<td><input id="yjapprove" type="checkbox" value="冷鲜畜禽产品" name=itemsOfBusiness>&nbsp;&nbsp;&nbsp;冷鲜畜禽产品</td>
                      </tr>
                      
                      <tr>
                        <td><input id="lsapprove" type="checkbox" value="保健食品" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;保健食品</td>
						<td><input id="yjapprove" type="checkbox" value="现场制售" name="itemsOfBusiness">&nbsp;&nbsp;&nbsp;现场制售</td>
                      </tr>
                      
					  <tr>
						<td colspan="2" align="right"><input type="submit" class="btn btn-primary"  width="30px" value="修改"/></td>
						<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>		
						<td>
							<input type="button" onclick="browseFolder(${agricultural.id})" class="btn btn-primary"  width="50px" value="生成二维码"/>
							<a download="" href="" id="down"></a>
						</td>					
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
    </script>