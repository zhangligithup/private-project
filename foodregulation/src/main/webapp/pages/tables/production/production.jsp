<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<script type="text/javascript">
			//产品执行标准
			var i=3;
		  	var count = 1;
			function addNew()
			{
				i++;   
				tr=document.all.table1.insertRow(); 
				tr.insertCell().innerHTML=i;   
				tr.insertCell().innerHTML='<input   type=text  name=chanpinName  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=zxbzName  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=zxbzCode  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=beian  class=border_index>';
				tr.insertCell().innerHTML="<a href=javascript:void(0) onclick=delete1('"+"table1"+count+"')>删除</a>";
				count++;
			}
			function  delete1(aa){
			 	document.all.table1.deleteRow(window.event.srcElement.parentElement.parentElement.rowIndex);   
			}
			
			//产品明细
			var j=3;
		  	var count2 = 1;
			function addNew2()
			{
				j++;   
				tr=document.all.table2.insertRow(); 
				tr.insertCell().innerHTML=j;   
				tr.insertCell().innerHTML='<input   type=text  name=cpName  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=guiGe  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=nianChanLiang  class=border_index>';   
				tr.insertCell().innerHTML="<a href=javascript:void(0) onclick=delete2('"+"table2"+count2+"')>删除</a>";
				count2++;
			}
			function  delete2(aa){
			 	document.all.table2.deleteRow(window.event.srcElement.parentElement.parentElement.rowIndex);   
			}
			
			//食品添加剂使用情况
			var k=3;
		  	var count3 = 1;
			function addNew3()
			{
				k++;   
				tr=document.all.table3.insertRow(); 
				tr.insertCell().innerHTML=k;   
				tr.insertCell().innerHTML='<input   type=text  name=additive  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=additiveComposition  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=addFoodName  class=border_index>';   
				tr.insertCell().innerHTML='<input   type=text  name=maxAmount  class=border_index>';
				tr.insertCell().innerHTML='<input   type=text  name=amount  class=border_index>';
				tr.insertCell().innerHTML='<input   type=text  name=handlers  class=border_index>';
				tr.insertCell().innerHTML="<a href=javascript:void(0) onclick=delete3('"+"table3"+count3+"')>删除</a>";
				count3++;
			}
			function  delete3(aa){
			 	document.all.table3.deleteRow(window.event.srcElement.parentElement.parentElement.rowIndex);   
			}
			
			//打印
    	function print(){
    		location.href="${pageContext.request.contextPath }/pages/tables/production/downloadProduction.jsp";
    	}
    	function save9(){
    		if(_submit()){
	    		$.ajax({
					url:"${pageContext.request.contextPath }/ProductionServlet",
					type:"post",
					dataType:"json",
					data:$('#formValidate9').serialize(),
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
                  <h3>食品生产企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate9" action="<c:url value='/ProductionServlet'/>" method="post">
                 <input type="hidden" name="method" value="adddd">
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
                        <td>生产地址(具体到门牌号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('prlongitude','prlatitude')"/>
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
                        <td>成立日期</td>
                        <td>
                        <div id="cldateBox1" style="position:relative">
		                    <input id="cldate" type="text" style="width:280px" class="" name="cldate" />
		                </div>
		                </td>
						<td>年总产值(万元)</td>
                        <td><input id="nzyield" type="text" style="width:280px" name="nzyield" class=""/></td>
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
                        <td>从业人员数量</td>
                        <td><input id="cynumber" type="text" style="width:280px" name="cynumber" class=""/></td>
						 <td>化验人员数量</td>
                        <td><input id="assay" type="text" style="width:280px" name="assay" class=""/></td>
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
                        <td><input id="prlongitude" type="text" style="width:280px" class="" name="longitude" /></td>
						<td>纬度</td>
                        <td><input id="prlatitude" type="text" style="width:280px" class="" name="latitude" /></td>
                      </tr>
					 
					  <tr>
                        <td><b>二、企业管理认证情况</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="isoapprove" type="checkbox" value="ISO质量体系认证" name="isoapprove">&nbsp&nbsp&nbspISO质量体系认证</td>
                        <td><input id="hacccpapprove" type="checkbox" value="HACCP认证" name="hacccpapprove">&nbsp&nbsp&nbspHACCP认证</td>
                        <td><input id="wghapprove" type="checkbox" value="无公害食品认证" name="wghapprove">&nbsp&nbsp&nbsp无公害食品认证</td>                        
                      </tr>
					  <tr>
                        <td><input id="lsapprove" type="checkbox" value="绿色食品认证" name="lsapprove">&nbsp&nbsp&nbsp绿色食品认证</td>
						<td><input id="yjapprove" type="checkbox" value="有机食品认证" name="yjapprove">&nbsp&nbsp&nbsp有机食品认证</td>
						<td><input id="capprove" type="checkbox" value="标志认证" name="capprove">&nbsp&nbsp&nbsp标志认证</td>                   
                      </tr>
					  
					  <tr>
                        <td><b>三、产品执行标准</b></td>
                      </tr>
                      <tr>
                      	<td colspan="4">
	                      	<table class="table table-condensed"  id="table1">    
								<tr>
			      			 		<td width="5%">序号</td> 
			    				    <td width="20%">产品名称</td> 
			    	       	 		<td width="20%">执行标准名称</td>  
			    	      	 		<td width="20%">执行标准编号</td>
			    	      	 		<td width="20%">是否备案</td> 
			    	      			<td width="15%"> <a href="javascript:void(0)"   onclick="addNew()">添加明细</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>1</td> 
			    				    <td><input type="text"  name="chanpinName"></td>  
			    	       	 		<td><input type="text"  name="zxbzName"></td>   
			    	      	 		<td><input type="text"  name="zxbzCode"></td> 
			    	      	 		<td><input type="text"  name="beian"></td>  
			    	      			<td><a href=javascript:void(0) onclick=delete1(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>2</td> 
			    				    <td><input type="text"  name="chanpinName"></td>  
			    	       	 		<td><input type="text"  name="zxbzName"></td>   
			    	      	 		<td><input type="text"  name="zxbzCode"></td> 
			    	      	 		<td><input type="text"  name="beian"></td>  
			    	      			<td><a href=javascript:void(0) onclick=delete1(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>3</td> 
			    				    <td><input type="text"  name="chanpinName"></td>  
			    	       	 		<td><input type="text"  name="zxbzName"></td>   
			    	      	 		<td><input type="text"  name="zxbzCode"></td> 
			    	      	 		<td><input type="text"  name="beian"></td>  
			    	      			<td><a href=javascript:void(0) onclick=delete1(this)>删除</a></td>  
		    	    			</tr>
	         				</table>
         				</td>
                      </tr>
                      
                      <tr>
                        <td align="left"><b>四、产品明细</b></td>
                      </tr>
                      <tr>
                      	<td colspan="4">
	                      	<table class="table table-condensed"  id="table2"> 
	                      		<tr>
			      			 		<td width="5%">序号</td> 
			      			 		<td width="20%">产品名称</td>
			    				    <td width="20%">规格</td> 
			    	       	 		<td width="20%">年产量</td>  
			    	      			<td width="20%"> <a href="javascript:void(0)"   onclick="addNew2()">添加明细</a></td>  
		    	    			</tr>     
								<tr>
			      			 		<td>1</td> 
			    				    <td><input type="text"  name="cpName"></td>  
			    	       	 		<td><input type="text"  name="guiGe"></td>   
			    	      	 		<td><input type="text"  name="nianChanLiang"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete2(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>2</td> 
			    				    <td><input type="text"  name="cpName"></td>  
			    	       	 		<td><input type="text"  name="guiGe"></td>   
			    	      	 		<td><input type="text"  name="nianChanLiang"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete2(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>3</td> 
			    				    <td><input type="text"  name="cpName"></td>  
			    	       	 		<td><input type="text"  name="guiGe"></td>   
			    	      	 		<td><input type="text"  name="nianChanLiang"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete2(this)>删除</a></td>  
		    	    			</tr>
	         				</table>
         				</td>
                      </tr>
                      
                      <tr>
                        <td><b>五、食品添加剂使用情况</b></td>
                      </tr>
                      <tr>
                      	<td colspan="4">
	                      	<table class="table table-condensed" width="100%" cellspacing="1" id="table3">    
								<tr>
			      			 		<td width="5%">序号</td> 
			    				    <td width="15%">添加剂名称</td> 
			    	       	 		<td width="15%">添加剂主要成分</td>  
			    	      	 		<td width="15%">需要添加食品名称</td>
			    	      	 		<td width="15%">标准规格最大使用量(g/kg)</td>
			    	      	 		<td width="10%">实际用量(g/kg)</td>
			    	      	 		<td width="10%">操作者</td> 
			    	      			<td width="10%"> <a href="javascript:void(0)"   onclick="addNew3()">添加明细</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>1</td> 
			    				    <td><input type="text"  name="additive"></td>  
			    	       	 		<td><input type="text"  name="additiveComposition"></td>   
			    	      	 		<td><input type="text"  name="addFoodName"></td>
			    	      	 		<td><input type="text" name="maxAmount"></td>
			    	      	 		<td><input type="text" name="amount"></td>
			    	      	 		<td><input type="text" name="handlers"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete3(this)>删除</a></td>  
		    	    			</tr>
		    	    			<tr>
			      			 		<td>2</td> 
			    				    <td><input type="text"  name="additive"></td>  
			    	       	 		<td><input type="text"  name="additiveComposition"></td>   
			    	      	 		<td><input type="text"  name="addFoodName"></td>
			    	      	 		<td><input type="text" name="maxAmount"></td>
			    	      	 		<td><input type="text" name="amount"></td>
			    	      	 		<td><input type="text" name="handlers"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete3(this)>删除</a></td>  
		    	    			</tr> 
		    	    			<tr>
			      			 		<td>3</td> 
			    				    <td><input type="text"  name="additive"></td>  
			    	       	 		<td><input type="text"  name="additiveComposition"></td>   
			    	      	 		<td><input type="text"  name="addFoodName"></td>
			    	      	 		<td><input type="text" name="maxAmount"></td>
			    	      	 		<td><input type="text" name="amount"></td>
			    	      	 		<td><input type="text" name="handlers"></td> 
			    	      			<td><a href=javascript:void(0) onclick=delete3(this)>删除</a></td>  
		    	    			</tr>  
	         				</table>
         				</td>
                      </tr>
                      
                      
                      <tr>
                        <td><b>五、委托加工备案情况</b></td>
                      </tr>
                      <tr>
                      	<td>产品类别</td>
                        <td><input id="chanPinLeiBie" type="text" style="width:280px" class="" name="chanPinLeiBie" /></td>
						<td>委托加工产品名称</td>
                        <td><input id="wtChanPinName" type="text" style="width:280px" class="" name="wtChanPinName" /></td>
                      </tr>
                      
                      <tr>
                      	<td>委托方企业名称</td>
                        <td><input id="wtQyName" type="text" style="width:280px" class="" name="wtQyName" /></td>
						<td>生产地址</td>
                        <td><input id="wtScAddress" type="text" style="width:280px" class="" name="wtScAddress" /></td>
                      </tr>
                      
                      <tr>
                      	<td>委托方联系人</td>
                        <td><input id="wtLinkman" type="text" style="width:280px" class="" name="wtLinkman" /></td>
						<td>联系电话</td>
                        <td><input id="wtTel" type="text" style="width:280px" class="" name="wtTel" /></td>
                      </tr>
                      
                      <tr>
                      	<td>被委托方企业名称</td>
                        <td><input id="bwtQyName" type="text" style="width:280px" class="" name="bwtQyName" /></td>
						<td>生产地址</td>
                        <td><input id="bwtScAddress" type="text" style="width:280px" class="" name="bwtScAddress" /></td>
                      </tr>
                      
                      <tr>
                      	<td>被委托方联系人</td>
                        <td><input id="bwtLinkName" type="text" style="width:280px" class="" name="bwtLinkName" /></td>
						<td>联系电话</td>
                        <td><input id="bwtTel" type="text" style="width:280px" class="" name="bwtTel" /></td>
                      </tr>
                      
                      <tr>
                      	<td>合同生效日期</td>
                        <td>
                        <div id="htSxDateBox1" style="position:relative">
                        	<input id="htSxDate" type="text" style="width:280px" class="" name="htSxDate" />
                        </div>
                        </td>
						<td>委托合同期限</td>
                        <td>
                        <div id="wtHtDateBox1" style="position:relative">
                        	<input id="wtHtDate" type="text" style="width:280px" class="" name="wtHtDate" />
                        </div>
                        </td>
                      </tr>
                      
						<tr>
						<td colspan="2" align="right"><input type="button" onclick="save9()" class="btn btn-primary" width="30px" value="保存"/></td>	
						<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>					
                      </tr>											  
                    </tfoot>
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
  	    $('#htSxDate').datetimepicker({
  	        container:'#htSxDateBox1',
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
  	  $('#wtHtDate').datetimepicker({
	        container:'#wtHtDateBox1',
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
