<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<script type="text/javascript">
		
		//打印
    	function print(){
    		location.href="${pageContext.request.contextPath }/pages/tables/cosmetic/downloadCosmetic.jsp";
    	}
    	function save2(){
    		if(_submit()){
	    		$.ajax({
					url:"${pageContext.request.contextPath }/CosmeticServlet",
					type:"post",
					dataType:"json",
					data:$('#formValidate2').serialize(),
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
                  <h3>化妆品经营企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate2" action="javascript:void(0)" method="post">
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
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('colongitude','colatitude')"/>
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
                        <td>营业面积</td>
                        <td><input id="jyArea" type="text" style="width:280px" name="jyArea" class=""/></td>
						 <td>经营品种个数</td>
                        <td><input id="jyNum" type="text" style="width:280px" name="jyNum" class=""/></td>
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
                        <td><input id="colongitude" type="text" style="width:280px" class="" name="longitude" /></td>
						<td>纬度</td>
                        <td><input id="colatitude" type="text" style="width:280px" class="" name="latitude" /></td>
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
                        <td><input id="healthFood" type="checkbox" value="保健食品" name="healthFood">&nbsp&nbsp&nbsp保健食品</td>
                        <td><input id="cosmetic" type="checkbox" value="化妆品" name="cosmetic">&nbsp&nbsp&nbsp化妆品</td>                        
                      </tr>
                      -->
                      
                      <tr>
                        <td><b>三、人员情况</b></td>                 
                      </tr>
					  <tr>
                        <td>从业人数</td>
                        <td><input id="cyNum" type="text" style="width:280px" class="" name="cyNum" /></td>
						<td>中专及其以下人数</td>
                        <td><input id="graduateNum" type="text" style="width:280px" class="" name="graduateNum" /></td>
                      </tr>
                      
                      <tr>
                        <td>大专及其以上人数</td>
                        <td><input id="juniorNum" type="text" style="width:280px" class="" name="juniorNum" /></td>
                      </tr>
					  
					  
					  <tr>
                        <td><b>四、管理情况</b></td>                 
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="供货商资质档案" name="manage">&nbsp&nbsp&nbsp供货商资质档案</td>
                        <td><input id="manage" type="checkbox" value="化妆品批准证书" name="manage">&nbsp&nbsp&nbsp化妆品批准证书</td> 
                        <td><input id="manage" type="checkbox" value="化妆品存储设备" name="manage">&nbsp&nbsp&nbsp化妆品存储设备</td>
                        <td><input id="manage" type="checkbox" value="购进验收记录出入台账" name="manage">&nbsp&nbsp&nbsp购进验收记录出入台账</td>                           
                      </tr>
                      <tr>
                        <td><input id="manage" type="checkbox" value="从业人员健康证" name="manage">&nbsp&nbsp&nbsp从业人员健康证</td>
                        <td><input id="manage" type="checkbox" value="人员培训记录" name="manage">&nbsp&nbsp&nbsp人员培训记录</td>                        
                      </tr>
                      
						<tr>
						<td colspan="2" align="right"><input type="button" onclick="save2()" class="btn btn-primary" width="30px" value="保存"/></td>
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
