<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<script type="text/javascript">
   		$(function(){
			
			//显示提交成功
			if(${success eq null}){
  		
	  		}else{
	  			alert("${success}");
	  		}
		});
		
		function _click(){
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
				alert("请填写负责人");
				return false;
			}else if(zzcode.trim() == ""){
				alert("请填写注册号");
				return false;
			}else if(val == 0){
				alert("请选择监管单位");
				return false;
			}else{
				$.ajax({
    				url:"${pageContext.request.contextPath }/AgriculturalServlet",
    				type:"post",
    				dataType:"json",
    				data:$('#validateForm1').serialize(),
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
		
		//打印
    	function print(){
    		location.href="./downloadAgricultural.jsp";
    	}
		
   	</script>
        <section class="content">
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3>食用农产品经营户信息登记表</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="validateForm1" action="javascript:void(0)" method="post">
                 <input type="hidden" name="method" value="add">
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
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" class=""/></td>
						<td>所属行政区域</td>
                        <td>
                        	<select id="address" style="width:280px" name="address">
                        		<option value="0" selected>请选择</option>
                 			  <c:forEach  items="${addressList}" var="addressLis">
                  		          <option  value="${addressLis.tDictionaryCode}" >${addressLis.tDictionaryName}</option>
                 			  </c:forEach >	
                           </select>
                       </td>
					 </tr>
					  <tr>
                        <td>经营场所地址(具体到摊位号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('aglongitude','aglatitude')"/>
                        </td>
                        <td>负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" class=""/></td>                   
                      </tr>
					  <tr>
                        <td>联系电话</td>
                        <td><input id="qyphone" type="text" style="width:280px" name="qyphone" class=""/></td>
						<td>注册号/统一社会信用代码</td>
                        <td><input id="zzcode" type="text" style="width:280px" name="zzcode" class=""/></td>
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
                        <td>食品经营许可证</td>
                        <td><input id="scpermit" type="text" style="width:280px" name="scpermit" class=""/></td>
						<td>经度</td>
                        <td><input id="aglongitude" type="text" style="width:280px" name="longitude" class=""/></td>
                      </tr>
                      
                       <tr>                        
						<td>纬度</td>
                        <td><input id="aglatitude" type="text" style="width:280px" name="latitude" class=""/></td>
                      </tr>
                      
					 
					  <tr>
                        <td><b>二、经营方式</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="批发" name="jyType">&nbsp&nbsp&nbsp批发</td>
                        <td><input id="hacccpapprove" type="checkbox" value="零售" name="jyType">&nbsp&nbsp&nbsp零售</td>
                        <td><input id="wghapprove" type="checkbox" value="批发兼零售" name="jyType">&nbsp&nbsp&nbsp批发兼零售</td>                        
                      </tr>
                      
                      
                       <tr>
                        <td><b>三、经营项目</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="预包装食品" name="itemsOfBusiness">&nbsp&nbsp&nbsp预包装食品</td>
                        <td><input id="hacccpapprove" type="checkbox" value="散装食品" name="itemsOfBusiness">&nbsp&nbsp&nbsp散装食品</td>
                        <td><input id="wghapprove" type="checkbox" value="熟食" name="itemsOfBusiness">&nbsp&nbsp&nbsp熟食</td> 
                        <td><input id="lsapprove" type="checkbox" value="乳制品" name="itemsOfBusiness">&nbsp&nbsp&nbsp乳制品</td>                       
                      </tr>
					  <tr>
						<td><input id="yjapprove" type="checkbox" value="食用农产品" name="itemsOfBusiness">&nbsp&nbsp&nbsp食用农产品</td>
						<td><input id="lsapprove" type="checkbox" value="水产品" name="itemsOfBusiness">&nbsp&nbsp&nbsp水产品</td>
						<td><input id="yjapprove" type="checkbox" value="冷鲜畜禽产品" name=itemsOfBusiness>&nbsp&nbsp&nbsp冷鲜畜禽产品</td>
                      </tr>
                      
                      <tr>
                        <td><input id="lsapprove" type="checkbox" value="保健食品" name="itemsOfBusiness">&nbsp&nbsp&nbsp保健食品</td>
						<td><input id="yjapprove" type="checkbox" value="现场制售" name="itemsOfBusiness">&nbsp&nbsp&nbsp现场制售</td>
                      </tr>
                      
                      
						<tr>
						<td colspan="2" align="right"><input type="button" onclick="_click()" class="btn btn-primary" width="30px" value="保存"/></td>
									<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>						
                      </tr>											  
                    </tbody>
                  </table>	
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
            </div><!-- /.col -->
			
          </div><!-- /.row -->
          
        </section>
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
