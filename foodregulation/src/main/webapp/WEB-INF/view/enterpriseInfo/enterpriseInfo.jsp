<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb_box">
	<div class="breadcrumb_box_l">
		<ol class="breadcrumb">
			<li><a href="#">首页</a></li>
			<li><a href="#">企业信息</a></li>
			<li class="active">企业信息列表</li>
		</ol>
	</div>
	<div class="breadcrumb_box_r">
		<div class="pull-right">
			<a href=""><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
		</div>
	</div>
</div>
<div class="content_box">
	<table class="table search_box marb10">
		<thead>
			<tr>
				<th>企业名称</th>
				<th>
					<div class="search_parent">
						<input type="text" class="search_input" id="enterpriseName"> 
					</div>
				</th>
				<th>企业类别</th>
				<th>
					<select class="select_style1" id="enterpriseType">
						<option value="" selected>请选择</option>
           			    <c:forEach  items="${enterpriseTypeList}" var="enterpriseType">
            		          <option  value="${enterpriseType.tDictionaryCode}" >${enterpriseType.tDictionaryName}</option>
           			     </c:forEach >	
					</select>
				</th>
			</tr>
			<tr>
				<th>监管单位</th>
				<th>
					<select class="select_style1" id="edepartment">
						<option value="" selected>请选择</option>						
					</select>
				</th>
				<th>行政区域</th>
				<th>
					<select class="select_style1" id="eaddress">
						<option value="" selected>请选择</option>						
					</select>
				</th>
				<th>发证日期</th>
                    <th>
                        <div id="calenderOneBox1" style="position:relative">
                            <input id="calenderOne" class="bg_calender" size="16" type="text" value="">
                        </div>
                    </th>
				<th><a class="form_btn" href="#" onclick="queryEnterprise()">搜索</a><%-- <a class="form_btn" href="${pageContext.request.contextPath}/enterpriseInfo/excelEnterprise.do" >导出</a> --%></th>
			</tr>
		</thead>
	</table>
	<table class="table table-bordered table2">
		<thead>
			<tr>
				<th class="width60">ID</th>
				<th>企业名称</th>
				<th>所属区域</th>
				<th>许可证编号</th>
				<th>有效日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="enterpriseTbody">
		</tbody>
	</table>
	<div id="enterprisePage"></div>
</div>
<script type="text/javascript">
$(function(){
    $('#calenderOne').datetimepicker({
        container:'#calenderOneBox1',
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
$(function (){
	queryEnterprise();
	querySelectDepartment();
	querySelectAddress();
});

function queryEnterprise(curr){
	var enterpriseName=$("#enterpriseName").val();
	var enterpriseType=$("#enterpriseType").val();
	var fazhengriqi=$("#calenderOne").val();
	var address=$("#eaddress").val();
	var department=$("#edepartment").val();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/enterpriseInfo/getEnterpriseTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data : {
				enterpriseNameLike:enterpriseName,
				enterpriseType:enterpriseType,
				fazhengriqi:fazhengriqi,
				address:address,
				department:department
			},
			success : function(total) {
					page("enterprisePage",total,10,10,queryEnterprise);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
		type:"post",
		dataType:"json",
		data:{
			enterpriseNameLike:enterpriseName,
			enterpriseType:enterpriseType,
			fazhengriqi:fazhengriqi,
			address:address,
			department:department,
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(data) {
			var tr = "";
			for(var i=0;i<data.length;i++){
				tr = tr + "<tr><td>"+data[i].id+"</td><td>"+data[i].qyname+"</td><td>"+data[i].addressName+"</td><td>"+data[i].scpermit+"</td><td>"+data[i].youxiaodate+"</td><td>"
				+"<a id='li-34562"+i+"' href='javascript:void(0)' class='editer_btns look_btn' onclick='edit(34562"+i+","+data[i].id+",\""+data[i].enterpriseType+"\")'>编辑</a>"
                //+"<a id='li-34563"+i+"' href='javascript:void(0)' class='editer_btns edit_btn' onclick='edit(34563"+i+","+data[i].id+","+data[i].enterpriseType+")'>编辑</a>"
                +"<a id='li-34564"+i+"' href='javascript:void(0)' class='editer_btns del_btn'  onclick='del("+data[i].id+",\""+data[i].enterpriseType+"\")'>删除</a></td></tr>";
			}
			$("#enterpriseTbody").html(tr);
		}
	}); 
}
var div="";
function edit(divId,id,type){
	if(div!=""&&div!=divId){
		$.each(aHistoryMinTab,function(index,div){// index是索引值（即下标）   item是每次遍历得到的值；
             aHistoryMinTab.splice(index,1);
	    });
		var a=$("a[href='#div-"+div+"']");
		$(a).parent().remove();
		$("#div-"+div).remove();
	}
	div = divId;
	var url = "";
	switch(type){
		case "enterprise_1":url="AgriculturalServlet";break;
		case "enterprise_2":url="ProductionServlet";break;
		case "enterprise_3":url="servlet/CriculateServlet1";break;
		case "enterprise_4":url="FoodServlet";break;
		case "enterprise_6":url="WineServlet";break;
		case "enterprise_7":url="HealthServlet";break;
		case "enterprise_8":url="CosmeticServlet";break;
		case "enterprise_9":url="DrugServlet";break;
		case "enterprise_10":url="MedicalServlet";break;
		case "enterprise_11":url="UsemedServlet";break;
	};
	creatTabPage(divId,"${pageContext.request.contextPath}/"+url+"?method=infor&enterpriseId="+id);
}
function del(id,type){
	var url = "";
	switch(type){
		case "enterprise_1":url="AgriculturalServlet";break;
		case "enterprise_2":url="ProductionServlet";break;
		case "enterprise_3":url="servlet/CriculateServlet1";break;
		case "enterprise_4":url="FoodServlet";break;
		case "enterprise_6":url="WineServlet";break;
		case "enterprise_7":url="HealthServlet";break;
		case "enterprise_8":url="CosmeticServlet";break;
		case "enterprise_9":url="DrugServlet";break;
		case "enterprise_10":url="MedicalServlet";break;
		case "enterprise_11":url="UsemedServlet";break;
	};
	confirmMessage('con_punishBasis','确定要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath }/"+url,
			type: "POST",
	        data:{
	        	method:"delete",
	        	id:id
	        },
	        async: false,
	        success: function(result) {
	        	if(result == 1){
	        		alertEase("删除成功",'alert_succ');
	        	}else{
	        		alertEase("删除失败",'alert_err');
	        	}
	        	queryEnterprise();
	        }
		});
	}
}

//查询加载监管单位  下拉框
function querySelectDepartment(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:2
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#edepartment").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
//查询加载行政区域  下拉框
function querySelectAddress(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:0
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#eaddress").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}


</script>
