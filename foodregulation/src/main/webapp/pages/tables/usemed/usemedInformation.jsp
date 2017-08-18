<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
    	
    	//医疗器械使用情况明细
           var names = '${medical.name}';
           var manufacturers = '${medical.manufacturer}';
           var guiGes = '${medical.guiGe}';
           var priductCodes = '${medical.priductCode}';
           var suppliers = '${medical.supplier}';
           var times = '${medical.time}';
           
           var name1 = new Array();
           var manufacturer = new Array();
           var guiGe = new Array();
           var priductCode = new Array(); 
           var supplier = new Array();
           var time = new Array();
           
            name1 = names.split(",");
            manufacturer = manufacturers.split(",");
            guiGe = guiGes.split(",");
            priductCode = priductCodes.split(",");
            supplier = suppliers.split(",");
            time = times.split(",");
            
    	$(function(){
    		//$("tbody>tr>td>input").attr("readonly", readonly);
    		/*if(${groupid eq 1})
    		{
    			$(":input[readonly]").removeAttr("readonly");
    			$("#textarea").removeAttr("readonly");
    			$("#selectId").removeAttr("disabled");
    			$(":checkbox").removeAttr("disabled");
    		}*/
    		 
                //医疗器械使用情况明细
               var table3 = "";
               var j = 0;
               for(i=0; i<name1.length;i++){
               	j++;
               	table3+="<tr><td>"+ j + "</td><td><input type='text' name='name' value='" +name1[i] +"'/></td>" +
               							"<td><input type='text'  name='manufacturer' value='" + manufacturer[i] +"'/></td>" +
               	      					"<td><input type='text'  name='guiGe' value='" + guiGe[i] +"'/></td>"+
               	     					"<td><input type='text'  name='priductCode' value='" + priductCode[i] +"'/></td>"+
               	      					"<td><input type='text'  name='supplier' value='" + supplier[i] +"'/></td>"+
               	      					"<td><input type='text'  name='time' value='" + time[i] +"'/></td>"+
               	      					"<td><a href=javascript:void(0) onclick=delete3('"+"table3"+count3+"')>删除</a></td></tr>";
               }
               $("#table3").append(table3);
			
    	});
    	
    	//医疗器械使用情况明细
			var k=name1.length;
		  	var count3 = 1;
			function addNew3(){
				k++;   
				tr=document.all.table3.insertRow(); 
				tr.insertCell().innerHTML='<div   align=left>'+k+'</div>';   
				tr.insertCell().innerHTML='<div   align=left><input   type=text  name=name  class=border_index></div>';   
				tr.insertCell().innerHTML='<div   align=left><input   type=text  name=manufacturer  class=border_index></div>';   
				tr.insertCell().innerHTML='<div   align=left><input   type=text  name=guiGe  class=border_index></div>';   
				tr.insertCell().innerHTML='<div   align=left><input   type=text  name=priductCode  class=border_index></div>';
				tr.insertCell().innerHTML='<div   align=left><input   type=text  name=supplier  class=border_index></div>';
				tr.insertCell().innerHTML='<div   align=left><input   type=text  name=time  class=border_index></div>';
				tr.insertCell().innerHTML="<a href=javascript:void(0) onclick=delete3('"+"table3"+count3+"')>删除</a>";
				count3++;
			}
			function  delete3(aa){
			 	document.all.table3.deleteRow(window.event.srcElement.parentElement.parentElement.rowIndex);   
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
                  <h3>医疗器械使用企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form id="deleteForm" action="" method="post">
                	<input type="hidden" name="method" value="delete">
                	<input type="hidden" name="id" value="${medical.id }">
                	<input type="hidden" name="pageCode" value="${pageCode }">
                </form>
                
                <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/UsemedServlet" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="idU" value="${medical.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbit_sure()" id="usemedForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="idM" value="${medical.id}">
                  <label class="pull-left">最后修改人: ${medical.amend }</label>
                  
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
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" value="${medical.qyname }"/></td>
						<td>所属行政区域</td>
                        <td>
                        	<select id="address" style="width:280px" name="address">
                        		<option value="0">请选择</option>
                 			  <c:forEach items="${addressList}" var="addressLis">
                  		          <option  value="${addressLis.tDictionaryCode }" <c:if test="${medical.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                       </td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" value="${medical.scaddress }" onblur="searchAddress('uslongitude','uslatitude')"/>
                        </td>
                        <td>邮政编码</td>
                        <td><input id="ems" type="text" style="width:280px" name="ems" value="${medical.ems }"/></td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td><input id="phone" type="text" style="width:280px" name="phone" value="${medical.phone }"/></td>
						<td>传    真</td>
                        <td><input id="fax" type="text" style="width:280px" name="fax" value="${medical.fax }"/></td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td><input id="email" type="text" style="width:280px" name="email" value="${medical.email }"/></td>
						<td>经济类型</td>
                        <td> <select id="" style="width:280px" name="jjtype">
                  		            <option value="">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode }" <c:if test="${medical.jjtype eq economicType.tDictionaryCode }">selected='selected'</c:if>>${economicType.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                        </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td><input id="gsorganization" type="text" style="width:280px" name="gsorganization" value="${medical.gsorganization }"/></td>
                        <td>注册号</td>
                        <td><input id="zzcode" type="text" style="width:280px" name="zzcode" value="${medical.zzcode }"/></td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" value="${medical.fddelegate }"/></td>
						<td>电话(手机)号</td>
                        <td><input id="fdphone" type="text" style="width:280px" name="fdphone" value="${medical.fdphone }"/></td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" value="${medical.qydelegate }"/></td>
						<td>电话(手机)号</td>
                        <td><input id="qyphone" type="text" style="width:280px" name="qyphone" value="${medical.qyphone }"/></td>
                      </tr>
                      
                      <tr>
                        <td>监管单位</td>
                      	<td><select style="width:280px" id="department" name="department">
                      			<option value="0">请选择</option>
                      			<c:forEach items="${unitList}" var="list">
                        			<option value="${list.tDictionaryCode }" <c:if test="${medical.department eq list.tDictionaryCode }">selected='selected'</c:if>>${list.tDictionaryName }</option>
                        		</c:forEach>
                            </select>
                        </td>
						<td>监管人员</td>
                        <td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" value="${medical.spdelegate }"/></td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td><input id="jiandurenyuan" type="text" style="width:280px" class="" name="jiandurenyuan" value="${medical.jiandurenyuan }"/></td>
						<td>协管人员</td>
                        <td><input id="xieguanrenyuan" type="text" style="width:280px" class="" name="xieguanrenyuan" value="${medical.xieguanrenyuan }"/></td>
                      </tr>
                      
                      <tr>
                        <td>经营范围</td>
                        <td><input id="jyArea" type="text" style="width:280px" name="jyArea" value="${medical.jyArea }"/></td>
						 <td>使用单位类别</td>
                        <td><input id="useCategory" type="text" style="width:280px" name="useCategory" value="${medical.useCategory }"/></td>
                      </tr>
                      
                      <tr>
                       <td>许可证编号</td>
                        <td><input id="scpermit" type="text" style="width:280px" name="scpermit" value="${medical.scpermit }"/></td>
						<td>发证机关</td>
                        <td><input id="fazhengjiguan" type="text" style="width:280px" class="" name="fazhengjiguan" value="${medical.fazhengjiguan }"/></td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td><input id="fazhengriqi" type="text" style="width:280px" class="" name="fazhengriqi" value="${medical.fazhengriqi }"/></td>
						<td>有效日期</td>
                        <td><input id="youxiaodate" type="text" style="width:280px" class="" name="youxiaodate" value="${medical.youxiaodate }"/></td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td><input id="uslongitude" type="text" style="width:280px" class="" name="longitude" value="${medical.longitude }"/></td>
						<td>纬度</td>
                        <td><input id="uslatitude" type="text" style="width:280px" class="" name="latitude" value="${medical.latitude }"/></td>
                      </tr>
					 
					 <!--  
					  <tr>
                        <td><b>二、企业类别</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="销售" name="market" <c:if test="${medical.market eq '销售' }">checked='checked'</c:if>>
                        		&nbsp&nbsp&nbsp医疗器械销售企业</td>
                        <td><input id="hacccpapprove" type="checkbox" value="使用" name="useEnterprise" <c:if test="${medical.useEnterprise eq '使用' }">checked='checked'</c:if>>
                        		&nbsp&nbsp&nbsp医疗器械使用企业</td>
                      </tr>
                      -->
                      
                      <tr>
                        <td><b>二、医疗器械使用情况明细</b></td>                 
                      </tr>
					   <tr>
                      	<td colspan="4">
	                      	<table class="table table-condensed" width="100%" cellspacing="1" id="table3">    
								<tr>
			      			 		<td width="5%">序号</td> 
			    				    <td width="15%">医疗器械名称</td> 
			    	       	 		<td width="15%">生产厂家</td>  
			    	      	 		<td width="15%">规格型号</td>
			    	      	 		<td width="15%">产品注册证号</td>
			    	      	 		<td width="10%">供货单位</td>
			    	      	 		<td width="10%">购进时间</td> 
			    	      			<td width="10%"> <a href="javascript:void(0)"   onclick="addNew3()">添加明细</a></td>  
		    	    			</tr>
	         				</table>
         				</td>
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
				url:"${pageContext.request.contextPath }/UsemedServlet",
				type:"post",
				dataType:"json",
				data:$('#usemedForm').serialize(),
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
