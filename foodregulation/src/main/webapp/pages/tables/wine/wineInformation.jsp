<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script type="text/javascript">
		$(function(){

			//经营范围的数据回显
			var jyrange='${wine.jyrange}';
			var rangearr=Array();
			rangearr=jyrange.split(",");
			$("input:checkbox[name='range']").each(
			function (){
				for(i=0;i<rangearr.length;i++){
				var abc=rangearr[i];
				if (abc==$(this).val()){$(this).attr("checked",true);}
			}
			}
			);
				
			//循环遍历jytype选中项
	   		var jytype = '${wine.jytype}';
	           var typearr = new Array();
	           typearr=jytype.split(",");
	           $("input:checkbox[name='type']").each(function (){
	           for(i=0;i<typearr.length;i++){
	           		if(typearr[i] == $(this).val()){
	           			$(this).attr("checked",true);
	           			continue;
	           		}
	           	}
			});
				//显示提交成功
				if(${success eq null}){
				
		  		}else{
		  			alert("${success}");
		  		}
		});
		
    	
		//打印
		function print(){
    		$("#printForm").submit();
    	}
		
		
        function method1(){  
        	$("#exprotExcel").submit();
        }
		
		
		

	</script>
			<section class="content">
			<div class="row" style="text-align:center">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3>酒类销售企业备案登记表</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
				<form id="deleteForm" action="" method="post">
                	<input type="hidden" name="method" value="delete">
                	<input type="hidden" name="idW" value="${wine.id }">
                	<input type="hidden" name="pageCode" value="${pageCode }">
                </form>
                
                 <form id="printForm" action="${pageContext.request.contextPath }/WineServlet" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="idW" value="${wine.id }">
                </form>
                
                <form id="exprotExcel" action="${pageContext.request.contextPath }/WineServlet" method="post">
                	<input type="hidden" name="method" value="exprotExcel">
                	<input type="hidden" name="idW" value="${wine.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbit_sure()" id="winForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="idW" value="${wine.id}">
                  <label class="pull-left">最后修改人: ${wine.amend }</label>
							
								<table id="ta" class="table table-condensed">
									<tbody>
										<tr>
											<td><b>一、基本情况</b></td>
											<td></td>
											<td></td>
											<td align="right"><font color="red" size="0.8e"></font>
											</td>
										</tr>
										<tr>
											<td>经营单位名称</td>
											<td><input id="qyname" type="text" style="width:280px"
												class="" name="qyname" value="${wine.qyname}" /></td>
											<td>所属行政区域</td>
											<td><select id="" style="width:280px" name="address">
													<c:forEach items="${addressList}" var="addressLis">
														<option value="${addressLis.tDictionaryCode }"
															<c:if test="${addressLis.tDictionaryCode eq wine.address}">selected</c:if>>${addressLis.tDictionaryName
															}</option>
													</c:forEach>
											</select>
											</td>
										</tr>
										<tr>
											<td>经营场所(具体到门牌号)</td>
											<td><input id="scaddress" type="text"
												style="width:280px" name="scaddress"
												value="${wine.scaddress}" class="" onblur="searchAddress('wilongitude','wilatitude')"/>
											</td>
											<td>邮政编码</td>
											<td><input id="ems" type="text" style="width:280px"
												name="ems" value="${wine.ems}" class="" /></td>
										</tr>
										<tr>
											<td>法定代表人</td>
											<td><input id="lerepre" type="text" style="width:280px"
												class="" value="${wine.lerepre}" name="lerepre" /></td>
											<td>电话(手机)号</td>
											<td><input id="lephone" type="text" style="width:280px"
												class="" value="${wine.lephone}" name="lephone" /></td>
										</tr>
										<tr>
											<td>企业负责人</td>
											<td><input id="qydelegate" type="text"
												style="width:280px" class="" value="${wine.qydelegate}"
												name="qydelegate" /></td>
											<td>电话(手机)号</td>
											<td><input id="qyphone" type="text" style="width:280px"
												class="" value="${wine.qyphone}" name="qyphone" /></td>
										</tr>
										<tr>
											<td>注册号/统一社会信用代码</td>
											<td><input id="zzcode" type="text" style="width:280px"
												class="" value="${wine.zzcode}" name="zzcode" /></td>
											<td>成立日期</td>
											<td><input id="cldate" type="text" style="width:280px"
												class="" value="${wine.cldate}" name="cldate" /></td>
										</tr>
										<tr>
											<td>监管单位</td>
											<td><select style="width:280px" id="department"
												name="department">
													<option value="0">请选择</option>
													<c:forEach items="${unitList}" var="list">
														<option value="${list.tDictionaryCode }" <c:if test="${list.tDictionaryCode eq wine.department}">selected</c:if>>${list.tDictionaryName
															}</option>
													</c:forEach>
											</select></td>
											<td>监管人员</td>
											<td><input id="spdelegate" type="text"
												style="width:280px" name="spdelegate"
												value="${wine.spdelegate}" class="" /></td>
										</tr>
										<tr>
											<td>监督人员</td>
											<td><input id="jiandurenyuan" type="text"
												style="width:280px" class=""
												value="${wine.jiandurenyuan}" name="jiandurenyuan" /></td>
											<td>协管人员</td>
											<td><input id="xieguanrenyuan" type="text"
												style="width:280px" class=""
												value="${wine.xieguanrenyuan}" name="xieguanrenyuan" />
											</td>
										</tr>
										<tr>
											<td>食品经营许可证编号</td>
											<td><input id="scpermit" type="text" style="width:280px"
												class="" value="${wine.scpermit}" name="scpermit" /></td>
											<td>发证机关</td>
											<td><input id="fazhengjiguan" type="text"
												style="width:280px" class=""
												value="${wine.fazhengjiguan}" name="fazhengjiguan" /></td>
										</tr>
										<tr>
											<td>发证日期</td>
											<td><input id="fazhengriqi" type="text"
												style="width:280px" class="" value="${wine.fazhengriqi}"
												name="fazhengriqi" /></td>
											<td>有效日期</td>
											<td><input id="youxiaodate" type="text"
												style="width:280px" class="" value="${wine.youxiaodate}"
												name="youxiaodate" /></td>
										</tr>
										<tr>
											<td>经度</td>
											<td><input id="wilongitude" type="text"
												style="width:280px" class="" value="${wine.longitude}"
												name="longitude" /></td>
											<td>纬度</td>
											<td><input id="wilatitude" type="text" style="width:280px"
												class="" value="${wine.latitude}" name="latitude" /></td>
										</tr>
										<tr>
											<td><b>二、许可范围</b></td>
										</tr>

										<tr>
											<td>经营类型</td>
										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox"
												value="酒类生产企业" name="type">&nbsp&nbsp&nbsp酒类生产企业</td>
											<td><input id="hacccpapprove" type="checkbox"
												value="白酒生产作坊" name="type">&nbsp&nbsp&nbsp白酒生产作坊</td>
											<td><input id="wghapprove" type="checkbox"
												value="酒类销售企业" name="type">&nbsp&nbsp&nbsp酒类销售企业</td>
											<td><input id="wghapprove" type="checkbox" value="个体工商户"
												name="type">&nbsp&nbsp&nbsp个体工商户</td>

										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox"
												value="批发（含批零兼营）" name="type">&nbsp&nbsp&nbsp批发（含批零兼营）</td>
											<td><input id="hacccpapprove" type="checkbox" value="零售"
												name="type">&nbsp&nbsp&nbsp零售</td>
											<td><input id="hacccpapprove" type="checkbox" value="餐饮"
												name="type">&nbsp&nbsp&nbsp餐饮</td>
											<td><input id="wghapprove" type="checkbox"
												value="酒吧等娱乐场所" name="type">&nbsp&nbsp&nbsp酒吧等娱乐场所</td>
										</tr>
										<tr>
											<td><input id="wghapprove" type="checkbox" value="其他"
												name="type">&nbsp&nbsp&nbsp其他</td>
										</tr>
										<tr>
											<td>经营范围</td>
										</tr>
										<tr>
											<td><input id="isoapprove" type="checkbox" value="白酒"
												name="range">&nbsp&nbsp&nbsp白酒</td>
											<td><input id="hacccpapprove" type="checkbox" value="啤酒"
												name="range">&nbsp&nbsp&nbsp啤酒</td>
											<td><input id="wghapprove" type="checkbox" value="葡萄酒"
												name="range">&nbsp&nbsp&nbsp葡萄酒</td>
											<td><input id="wghapprove" type="checkbox" value="果酒"
												name="range">&nbsp&nbsp&nbsp果酒</td>
										</tr>
										<tr>
											<td><input id="wghapprove" type="checkbox" value="黄酒"
												name="range">&nbsp&nbsp&nbsp黄酒</td>
											<td><input id="wghapprove" type="checkbox" value="配制酒"
												name="range">&nbsp&nbsp&nbsp配制酒</td>
											<td><input id="isoapprove" type="checkbox" value="进口酒"
												name="range">&nbsp&nbsp&nbsp进口酒</td>
											<td><input id="hacccpapprove" type="checkbox"
												value="酒精度（alcohol）大于0.5%Vol的含酒精饮料" name="range">&nbsp&nbsp&nbsp酒精度（alcohol）大于0.5%Vol的含酒精饮料</td>
										</tr>
										<tr>
						<td colspan="2" align="right"><input type="submit" class="btn btn-primary"  width="30px" value="修改"/></td>
						<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>	
						<td><input type="button" onclick="method1()" class="btn btn-primary"  width="50px" value="导出EXCEL"/></td>	
                     </tr>	
									</tbody>
								</table>
							</form>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> </section>
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
  				url:"${pageContext.request.contextPath }/WineServlet",
  				type:"post",
  				dataType:"json",
  				data:$('#winForm').serialize(),
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
