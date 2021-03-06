<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<script type="text/javascript">
		function print(){
    		location.href="${pageContext.request.contextPath }/pages/tables/drug/downloadDrug.jsp";
    	}
		function save4(){
			if(_submit()){
	    		$.ajax({
					url:"${pageContext.request.contextPath }/DrugServlet",
					type:"post",
					dataType:"json",
					data:$('#formValidate4').serialize(),
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
                  <h3>药品零售企业信用档案</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate4" action="javascript:void(0)" method="post">
                 <input type="hidden" name="method" value="add">
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        <td ><b>一、基本情况</b></td>
                         <td></td>
                        <td></td>
                        <td align="right"></td>                 
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
                        <td>企业地址(具体到门牌号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('drlongitude','drlatitude')"/>
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
						<td>学历</td>
                        <td><input id="fdeduc" type="text" style="width:280px" name="fdeduc" class=""/></td>
                        </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td><input id="fdprofess" type="text" style="width:280px" name="fdprofess" class=""/></td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" class=""/></td>
						<td>学历</td>
                        <td><input id="qyeduc" type="text" style="width:280px" name="qyeduc" class=""/></td>
                        </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td><input id="qyprofess" type="text" style="width:280px" name="qyprofess" class=""/></td>
                      </tr>
                      <tr>
                        <td>质量负责人</td>
                        <td><input id="zldelegate" type="text" style="width:280px" name="zldelegate" class=""/></td>
						<td>学历</td>
                        <td><input id="zleduc" type="text" style="width:280px" name="zleduc" class=""/></td>
                       </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td><input id="zlprofess" type="text" style="width:280px" name="zlprofess" class=""/></td>
                      </tr>
                      <tr>
                        <td>中药饮品质量负责人</td>
                        <td><input id="zydelegate" type="text" style="width:280px" name="zydelegate" class=""/></td>
						<td>学历</td>
                        <td><input id="zyeduc" type="text" style="width:280px" name="zyeduc" class=""/></td>
                        </tr>
                      <tr>
                        <td>执业药师或技术职称</td>
                        <td><input id="zyprofess" type="text" style="width:280px" name="zyprofess" class=""/></td>                      </tr>
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
                       <td>GSP证书编号</td>
                        <td><input id="gsppermit" type="text" style="width:280px" name="gsppermit" class=""/></td>
						<td>发证机关</td>
                        <td><input id="gspfazhengjiguan" type="text" style="width:280px" class="" name="gspfazhengjiguan" /></td>
                      </tr>
                      <tr>
                        <td>GSP发证日期</td>
                        <td>
                        	<div id="gspfazhengriqiBox1" style="position:relative">
                        	<input id="gspfazhengriqi" type="text" style="width:280px" class="" name="gspfazhengriqi" />
                        	</div>
                        </td>
						<td>GSP有效日期</td>
                        <td>
                        <div id="gspyouxiaodateBox1" style="position:relative">
                        	<input id="gspyouxiaodate" type="text" style="width:280px" class="" name="gspyouxiaodate" />
                        </div>
                        </td>
                      </tr>
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
                        <td>经度</td>
                        <td><input id="drlongitude" type="text" style="width:280px" class="" name="longitude" /></td>
						<td>纬度</td>
                        <td><input id="drlatitude" type="text" style="width:280px" class="" name="latitude" /></td>
                      </tr>
                   
					  <tr>
                        <td><b>二、经营范围</b></td>                 
                      </tr>
					  <tr>
                        <td><input id="jyrange" type="checkbox" value="处方药" name="jyrange">&nbsp&nbsp&nbsp处方药</td>
                        <td><input id="jyrange" type="checkbox" value="非处方药" name="jyrange">&nbsp&nbsp&nbsp非处方药</td>
                        <td><input id="jyrange" type="checkbox" value="中药饮片" name="jyrange">&nbsp&nbsp&nbsp中药饮片</td>
                        <td><input id="jyrange" type="checkbox" value="中成药" name="jyrange">&nbsp&nbsp&nbsp中成药</td>
                      </tr>
					  <tr>
					    <td><input id="jyrange" type="checkbox" value="化学药制剂" name="jyrange">&nbsp&nbsp&nbsp化学药制剂</td>
                        <td><input id="jyrange" type="checkbox" value="抗生素制剂" name="jyrange">&nbsp&nbsp&nbsp抗生素制剂</td>
						<td><input id="jyrange" type="checkbox" value="生化药品" name="jyrange">&nbsp&nbsp&nbsp生化药品</td>
						<td><input id="jyrange" type="checkbox" value="生物制品" name="jyrange">&nbsp&nbsp&nbsp生物制品</td>
                      </tr>
                     <tr>
                      <td><input id="jyrange" type="checkbox" value="其他" name="jyrange">&nbsp&nbsp&nbsp其他</td>
                       </tr>
                      <tr>
                        <td><b>三、仓贮情况</b></td>                 
                      </tr>
                     
                        <tr>
                          <td colspan="5" align="center">药品仓库面积(m<sup>2</sup>)</td>
                        </tr>
						<tr>
								<td >总面积</td>
								<td><input id="zhongarea" type="text"
													style="width:280px" class="" name="zhongarea" /></td>
								<td>常温库</td>
								<td><input id="changarea" type="text"
													style="width:280px" class="" name="changarea" /></td>
								</tr>
								<td >阴凉库</td>
								<td><input id="yinarea" type="text" style="width:280px"
												class="" name="yinarea" /></td>

								<td >冷库</td>
								<td><input id="lengarea" type="text" style="width:280px"
												class="" name="lengarea" /></td>
								</tr>
                      <tr><td>&nbsp</td></tr>
						<tr>
						<td colspan="2" align="right"><input type="button" onclick="save4()" class="btn btn-primary" width="30px" value="保存"/></td>						
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
  	    $('#gspfazhengriqi').datetimepicker({
  	        container:'#gspfazhengriqiBox1',
  	        weekStart: 1,
  	        todayBtn:  1,
  	        autoclose: 1,
  	        todayHighlight: 1,
  	        startView: 2,
  	        minView: 2,
  	        forceParse: 0,
  		    format:'yyyy-mm-dd'
  	    });
  	    $('#gspyouxiaodate').datetimepicker({
  	        container:'#gspyouxiaodateBox1',
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
