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
					<select class="select_style1" id="department1">
						<option value="" selected>请选择</option>
						
					</select>
				</th>
				<th>行政区域</th>
				<th>
					<select class="select_style1" id="address1">
						<option value="" selected>请选择</option>
						
					</select>
				</th>
				<th>发证日期</th>
                    <th>
                        <div id="calenderTwoBox" style="position:relative">
                            <input id="calenderTwo" class="bg_calender" size="16" type="text" value="">
                        </div>
                    </th>
				<th><a class="form_btn" href="#" onclick="queryEnterprise1()">搜索</a></th>
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
		<tbody id="enterpriseTbody1">
		</tbody>
	</table>
	<div id="enterprisePage"></div>
</div>
<script type="text/javascript">
$(function (){
	$('#calenderTwo').datetimepicker({
        container:'#calenderTwoBox',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
	queryEnterprise1();
	querySelectDepartment1();
	querySelectAddress1();
});

function queryEnterprise1(curr){
	var enterpriseName=$("#enterpriseName").val();
	var enterpriseType=$("#enterpriseType").val();
	var fazhengriqi=$("#calenderTwo").val();
	var address=$("#address1").val();
	var department=$("#department1").val();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/enterpriseInfo/getEnterpriseTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data : {
				enterpriseName:enterpriseName,
				enterpriseType:enterpriseType,
				address:address,
				department:department,
				fazhengriqi:fazhengriqi
			},
			success : function(total) {
					page("enterprisePage",total,10,10,queryEnterprise1);
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
			enterpriseName:enterpriseName,
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
				//var url="${pageContext.request.contextPath }/companyCredit/detailCredit.do?qyname="+data[i].qyname;
				tr = tr + "<tr><td>"+data[i].id+"</td><td>"+data[i].qyname+"</td><td>"+data[i].addressName+"</td><td>"+data[i].scpermit+"</td><td>"+data[i].youxiaodate+"</td><td>"
                +"<a id='li-521"+i+"' href='javascript:void(0)'class='editer_btns look_btn' onclick='editCompanyCredit(521"+i+",\""+data[i].qyname+"\")' >查看详情</a></td></tr>";
			}
			$("#enterpriseTbody1").html(tr);
		}
	}); 
}
var div="";
function editCompanyCredit(divId,qyname){
	if(div!=""&&div!=divId){
		$.each(aHistoryMinTab,function(index,div){// index是索引值（即下标）   item是每次遍历得到的值；
            aHistoryMinTab.splice(index,1);
	    });
		var a=$("a[href='#div-"+div+"']");
		$(a).parent().remove();
		$("#div-"+div).remove();
	}
	div = divId;

	creatTabPage(divId,"${pageContext.request.contextPath }/companyCredit/detailCredit.do?qyname="+qyname);
}


//查询加载监管单位  下拉框
function querySelectDepartment1(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:2
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#department1").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
//查询加载行政区域  下拉框
function querySelectAddress1(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:0
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#address1").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
</script>
