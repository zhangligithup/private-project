<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script type="text/javascript">
  	function _go(select){
  		var index = select.selectedIndex;//选中的option的下标
  		var option = select.options[index];//通过下标得到option对象
  		var value = option.value;//通过option元素值得到value值
  		location="${pb.url}&pageCode=" + value;
  	}
	
	function _submit(){
			var val = $("#selectId").val();
			var valRole = $("#selectRole").val();
			$("#formValidate").submit();
				return true;
		}
	
  </script>
        <section class="content">
		
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div >
                  <h3></h3>
               </div><!-- /.box-header -->
                <div class="box-body">
                
                <!-- 食品生产企业 -->
                <form id="formPro" action="${pageContext.request.contextPath }/ProductionServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idP" name="idP">
                </form>
                
                 <!-- 食品餐饮企业 -->
                <form id="formFood" action="${pageContext.request.contextPath }/FoodServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idF" name="idF">
                </form>
                
                <!-- 保健食品 -->
                <form id="formHealth" action="${pageContext.request.contextPath }/HealthServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idH" name="idH">
                </form>
                
                <!-- 医疗器械 -->
                <form id="formMedical" action="${pageContext.request.contextPath }/MedicalServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idM" name="idM">
                </form>
                
              	<!-- 食品五小行业 -->
                <form id="formIndustry" action="${pageContext.request.contextPath }/IndustryServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idI" name="idI">
                </form>
                
                <!-- 酒类销售企业 -->
                <form id="formWine" action="${pageContext.request.contextPath }/WineServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idW" name="idW">
                </form>
                
                <!-- 药品零售企业 -->
                <form id="formDrug" action="${pageContext.request.contextPath }/DrugServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idD" name="idD">
                </form>
                
                <!-- 医疗器械使用企业 -->
                <form id="formUsemed" action="${pageContext.request.contextPath }/UsemedServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idU" name="idU">
                </form>
                
                <!-- 化妆品销售企业 -->
                <form id="formCosmetic" action="${pageContext.request.contextPath }/CosmeticServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="idC" name="idC">
                </form>
                
                <!-- 食品流通企业 -->
                <form  id="formValidate" action="${pageContext.request.contextPath}/servlet/CriculateServlet1" method="post">
                  <input type="hidden" name="method" value="infor">
                  <input id="id" type="hidden" name="id">
                  <input id="page" type="hidden" name="page">
                </form>
                
                <!-- 食品经营户信息登记 -->
                <form  id="formAgricultural" action="${pageContext.request.contextPath}/AgriculturalServlet" method="post">
                  <input type="hidden" name="method" value="infor">
                  <input id="idA" type="hidden" name="idA">
                </form>
                
                
                <form  id="execlForm" action="${pageContext.request.contextPath}/ExeclServlet" method="post">
                  <label class="" >企业类别</label>&nbsp&nbsp
                  <select class="" style="width:150px" id="category" onchange="_category()" name="category">
                  			      <option>请选择...</option>
                  			      <option value="食品生产企业">食品生产企业</option>
                  			      <option value="食品流通企业">食品流通企业</option>
                  			      <option value="食品餐饮企业">食品餐饮企业</option>
                  			      <option value="食品五小行业">食品五小行业</option>
                  			      <option value="酒类销售企业">酒类销售企业</option>
                  			      <option value="保健食品销售企业">保健食品销售企业</option>
                  			      <option value="化妆品销售企业">化妆品销售企业</option>
                  			      <option value="药品零售企业">药品零售企业</option>
                  			      <option value="医疗器械销售企业">医疗器械销售企业</option>
                  			      <option value="医疗器械使用企业">医疗器械使用企业</option>
                  			      <option value="食品经营户">食用农产品经营户 </option>
                  </select><font>(必选)</font>
                  
                  
                  <c:choose>
              		<c:when test="${sessionScope.sessionAdmin.department eq '第一分局' || 
              						sessionScope.sessionAdmin.department eq '第二分局' ||
              						sessionScope.sessionAdmin.department eq '第三分局' ||
              						sessionScope.sessionAdmin.department eq '第四分局' ||
              						sessionScope.sessionAdmin.department eq '第五分局' ||
              						sessionScope.sessionAdmin.department eq '第六分局' ||
              						sessionScope.sessionAdmin.department eq '第七分局' }">
                  </c:when>
                  <c:otherwise>
                  	&nbsp&nbsp&nbsp&nbsp
	                  <label>监管单位</label>
	                  <select id="department" style="width:150px" onchange="_department()" name="department">
	                  			<option value="">请选择...</option>
	                  		<c:forEach items="${unitList}" var="list">
	                  			<option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
	                  		</c:forEach>
	                  </select>
                  </c:otherwise>
            	</c:choose>
                  &nbsp&nbsp&nbsp&nbsp
                  <label>企业地址</label>
                  <select id="address" style="width:150px" onchange="_address()" name="address">
                 			 <option value="">请选择...</option>
                  		<c:forEach items="${addressList}" var="addressLis">
                  			                  		          <option  value="${addressLis.tDictionaryCode}" >${addressLis.tDictionaryName}</option>
                  		</c:forEach>
                  </select>
                  &nbsp&nbsp&nbsp&nbsp
                  <label>企业名称</label>
                  <input class="" type="text" oninput="showValue()"  id="name" name="name">
                  
                  &nbsp&nbsp&nbsp&nbsp
                  <label>法定代表人</label>
                  <input class="" type="text" oninput="fddelegateShow()"  id="fddelegate" name="fddelegate">
                  
                  &nbsp&nbsp&nbsp&nbsp
                  <label>注册号/统一社会信用代码</label>
                  <input class="" type="text" oninput="zzcodeShow()"  id="zzcode" name="zzcode">
                  <input type="hidden" id="depart" value="${sessionScope.sessionAdmin.department}" name="depart">
                  
                  &nbsp&nbsp&nbsp&nbsp
                  <input type="submit" value="查询">
                  </form>
                  
                  <br/>
                  <br/>
                  <table  class="table table-condensed table-hover">                   
                    <tbody id="tb">
                    </tbody>
                  </table>
                  <div id="divAction" style="text-align: left;">
                  </div>
                  <br/>
                  <br/>
                  <div id="pageCode"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
            </div><!-- /.col -->
			
          </div><!-- /.row -->
        </section><!-- /.content -->
