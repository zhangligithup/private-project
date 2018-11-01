<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<script type="text/javascript">
		//食品添加剂使用情况
		var k=3;
	  	var count3 = 1;
		function addNew3()
		{
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
    		location.href="${pageContext.request.contextPath }/pages/tables/usemed/downloadUsemed.jsp";
    	}
		function save10(){
			if(_submit()){
	    		$.ajax({
					url:"${pageContext.request.contextPath }/UsemedServlet",
					type:"post",
					dataType:"json",
					data:$('#formValidate10').serialize(),
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
                  <h3>医疗器械使用企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate10" action="<c:url value='/UsemedServlet'/>" method="post">
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
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" class=""/></td>
						<td>所属行政区域</td>
                        <td>
                        	<select id="address" style="width:280px" name="address">
                        		<option value="0">请选择</option>
                 			  <c:forEach items="${addressList}" var="addressLis">
                  		          <option  value="${addressLis.tDictionaryCode}" >${addressLis.tDictionaryName}</option>
                 			  </c:forEach>	
                           </select>
                       </td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('uslongitude','uslatitude')"/>
                        </td>
                        <td>邮政编码</td>
                        <td><input id="ems" type="text" style="width:280px" name="ems" class=""/></td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td><input id="phone" type="text" style="width:280px" name="phone" class=""/></td>
						<td>传    真</td>
                        <td><input id="fax" type="text" style="width:280px" name="fax" class=""/></td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td><input id="email" type="text" style="width:280px" name="email" class=""/></td>
						<td>经济类型</td>
                        <td> <select id="" style="width:280px" name="jjtype">
                  		          <option value="0">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode}" >${economicType.tDictionaryName}</option>
                 			  </c:forEach>	
                           </select>
                        </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td><input id="gsorganization" type="text" style="width:280px" name="gsorganization" class=""/></td>
                        <td>注册号/统一社会信用代码</td>
                        <td><input id="zzcode" type="text" style="width:280px" name="zzcode" class=""/></td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" class=""/></td>
						<td>电话(手机)号</td>
                        <td><input id="fdphone" type="text" style="width:280px" name="fdphone" class=""/></td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" class=""/></td>
						<td>电话(手机)号</td>
                        <td><input id="qyphone" type="text" style="width:280px" name="qyphone" class=""/></td>
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
                        <td>经营范围</td>
                        <td><input id="jyArea" type="text" style="width:280px" name="jyArea" class=""/></td>
						 <td>使用单位类别</td>
                        <td><input id="useCategory" type="text" style="width:280px" name="useCategory" class=""/></td>
                      </tr>
                      
                      <tr>
                       <td>许可证编号</td>
                        <td><input id="scpermit" type="text" style="width:280px" name="scpermit" class=""/></td>
						<td>发证机关</td>
                        <td><input id="fazhengjiguan" type="text" style="width:280px" class="" name="fazhengjiguan" /></td>
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
                        <td><input id="uslongitude" type="text" style="width:280px" class="" name="longitude" /></td>
						<td>纬度</td>
                        <td><input id="uslatitude" type="text" style="width:280px" class="" name="latitude" /></td>
                      </tr>
					 
					 <!--  
					  <tr>
                        <td><b>二、企业类别</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyType" type="checkbox" value="销售" name="market">&nbsp&nbsp&nbsp医疗器械销售企业</td>
                        <td><input id="hacccpapprove" type="checkbox" value="使用" name="useEnterprise">&nbsp&nbsp&nbsp医疗器械使用企业</td>
                      </tr>
                      -->
                      
                      <tr>
                        <td><b>二、医疗器械使用情况明细</b></td>                 
                      </tr>
					   <tr>
                      	<td colspan="4">
	                      	<table class="table table-condensed" cellspacing="1" id="table3">    
								<tr>
			      			 		<td>序号</td> 
			    				    <td>医疗器械名称</td> 
			    	       	 		<td>生产厂家</td>  
			    	      	 		<td>规格型号</td>
			    	      	 		<td>产品注册证号</td>
			    	      	 		<td>供货单位</td>
			    	      	 		<td>购进时间</td> 
			    	      			<td> <a href="javascript:void(0)"   onclick="addNew3()">添加明细</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>1</td> 
			    				    <td><input type="text"  name="name"></td>  
			    	       	 		<td><input type="text"  name="manufacturer"></td>   
			    	      	 		<td><input type="text"  name="guiGe"></td>
			    	      	 		<td><input type="text"  name="priductCode"></td>
			    	      	 		<td><input type="text"  name="supplier"></td>
			    	      	 		<td><input type="text"  name="time"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete3(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>2</td> 
			    				    <td><input type="text"  name="name"></td>  
			    	       	 		<td><input type="text"  name="manufacturer"></td>   
			    	      	 		<td><input type="text"  name="guiGe"></td>
			    	      	 		<td><input type="text"  name="priductCode"></td>
			    	      	 		<td><input type="text"  name="supplier"></td>
			    	      	 		<td><input type="text"  name="time"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete3(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>3</td> 
			    				    <td><input type="text"  name="name"></td>  
			    	       	 		<td><input type="text"  name="manufacturer"></td>   
			    	      	 		<td><input type="text"  name="guiGe"></td>
			    	      	 		<td><input type="text"  name="priductCode"></td>
			    	      	 		<td><input type="text"  name="supplier"></td>
			    	      	 		<td><input type="text"  name="time"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete3(this)>删除</a></td>  
		    	    			</tr>  
	         				</table>
         				</td>
                      </tr>
                      
						<tr>
						<td colspan="2" align="right"><input type="button" onclick="save10()" class="btn btn-primary" width="30px" value="保存"/></td>						
                        <td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/>					
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
  	});
    </script>
  </body>
</html>
