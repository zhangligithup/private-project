<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>食品药品动态监管系统</title>
    <link rel="stylesheet" href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">  
    <link rel="stylesheet" href="<c:url value='/ionicons/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/dist/css/AdminLTE.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/dist/css/skins/_all-skins.min.css' />">
    <link rel="stylesheet" href="<c:url value='/plugins/iCheck/flat/blue.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/morris/morris.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/datepicker/datepicker3.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/daterangepicker/daterangepicker-bs3.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">  
    <link rel="stylesheet" href="<c:url value='/ionicons/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fileinput.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/imgUpload/zyupload-1.0.0.min.css">
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/fileinput.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/fileinput_locale_zh.js"></script>
    <!--日历插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap-datetimepicker.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/extendPagination.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/ichart.1.2.1.src.js"></script>
    <!-- ztree --> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.core.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.excheck.js"></script>
    
    <script src="<c:url value='/plugins/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/plugins/datatables/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>"></script>
    <script src="<c:url value='/plugins/fastclick/fastclick.min.js'/>"></script>
    <script src="<c:url value='/dist/js/app.min.js'/>"></script>
    <script src="<c:url value='/dist/js/demo.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/messages_zh.js'/>"></script>
	<script src="<c:url value='/js/public/public.js'/>"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dmm9c58sobIwy0mGVtwruvnaZZMQdBVx"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/imgUpload/zyupload.basic-1.0.0.min.js"></script>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
<div class="food_right_section" style="width:100%">
<ul class="nav nav-tabs " id="myTab">
                <li class="active"><b class="nav_bg_left"></b><a href="#div-1" data-toggle="tab" aria-expanded="true">监督检查信息列表</a><span class="module_span_close">X</span><b class="nav_bg_right"></b></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade active in" id="div-1">  
        <input type="hidden" id="currentCode" value="${currentUnitCode}">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">监督检查信息列表</li>
        </ol>
    </div>
</div>
<div class="content_box" id="checkTask">
    <table class="table search_box marb10">
        <thead>
            <tr>
                <th>企业名称</th>
                <th>
                    <div class="search_parent">
                        <input type="text" class="search_input" id="enterpriseNames"> 
                    </div>
                </th>
                <th>企业类别</th>
                <th>
                    <select class="select_style1" id="enterpriseType">
                         <option value="">请选择企业类别</option>
                        <c:forEach items="${enterpriseTypeList}" var="list">
                            <option  value="${list.tDictionaryCode}">${list.tDictionaryName}</option>
                        </c:forEach>    
                    </select>
                </th>
                <th>委托监管单位</th>
                <th>
                    <select class="select_style1" id="checkUnitCode" name="checkUnitCode">
                        <option value="" selected>请选择</option>
                        
                    </select>
                </th>
            </tr>
            <tr>
                <th>检查开始日期</th>
                <th>
                    <div id="start_calenderOneBox1" style="position:relative">
                        <input id="start_calenderOne" class="bg_calender" size="16" type="text" value="">
                    </div>
                </th>
                <th>检查结束日期</th>
                <th>
                    <div id="end_calenderOneBox1" style="position:relative">
                        <input id="end_calenderOne" class="bg_calender" size="16" type="text" value="">
                    </div>
                </th>
            
                <th>
                                               检查频次
                </th>
                <th>
                    <select class="select_style1" id="checkFrequencyCode">
                        <option value="">请选择</option>
                        <c:forEach items="${checkFrequencyList}" var="list">
                            <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                        </c:forEach>
                    </select>
                </th>
               <th><a class="form_btn" href="#" onclick="querySupervisionCheckTask()">搜索</a></th>
            </tr>
        </thead>
    </table>
    <div class="pull-left" style="margin-bottom:10px">
            <ul>
                <li id='li-8235'>
            <a href="#" class="form_btn2" onclick="addTask()"><img src="${pageContext.request.contextPath }/images/ioc/add.png">
                添加监督检查任务</a>
                </li>
            </ul>
    </div>
    <table class="table table-bordered table2">
        <thead>
            <tr>
                <th class="width60">序号</th>
                <th>企业类别</th>
                <th>检查开始日期</th>
                <th>检查结束日期</th>
                <th>委托单位</th>
                <th>检查频次</th>
                <th>企业名称</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="supervisionAndCheckTaskTbody">
        </tbody>
    </table>
    <div id="supervisionAndCheckTaskPage"></div>
</div>
<div class="modal fade addtest_modal" id="deal_task_modal" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog" style="width:300px">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">处理监督检查任务</div>
            </div>
            <div class="modal-body">
                <sapn>选择监督检查日期</sapn>
                <div id="deal_calenderOneBox1" style="position:relative">
                    <input id="deal_calenderOne" class="bg_calender" size="16" type="text" value="">
                </div>
            </div>
            <div class="modal-footer">
            <div class="pull-left" style="margin-bottom:10px">
            <ul>
                <li id='li-8237'>
                    <a href="#" class="form_btn2" onclick="addDealTask()"><img src="${pageContext.request.contextPath }/images/ioc/add.png">开始添加</a>
                </li>
            </ul>
            </div>
            </div>
        </div>
    </div>
</div>
     </div>
</div>
</div>
<input type="hidden" id="appPersonName" value="${sessionAdmin.name}">
<input type="hidden" id="appPersonId" value="${sessionAdmin.id}">
<script>
$(function(){
    $('#start_calenderOne').datetimepicker({
        container:'#start_calenderOneBox1',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
    $('#end_calenderOne').datetimepicker({
        container:'#end_calenderOneBox1',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
    $('#deal_calenderOne').datetimepicker({
        container:'#deal_calenderOneBox1',
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
function addTask(){
    creatTabPage('8235','${pageContext.request.contextPath }/supervisionAndCheck/addTask.do');
}
$(function (){
	querySupervisionCheckTask();
	querySelectCheckUnitCode();
	querySelectAddress2();
});
function querySupervisionCheckTask(curr){
	var enterpriseType=$("#checkTask").find("#enterpriseType").val();
	var startCheckDate=$("#checkTask").find("#start_calenderOne").val();
	var endCheckDate=$("#checkTask").find("#end_calenderOne").val();
	var checkFrequencyCode=$("#checkTask").find("#checkFrequencyCode").val();
	var checkUnitCode=$("#checkTask").find("#checkUnitCode").val();
	var enterpriseNames = $("#checkTask").find("#enterpriseNames").val();
	var pageNum;
	if(!curr){
		pageNum = 1;
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/supervisionAndCheck/selectSupervisionCheckTaskTotal.do",
			type : "post",
			dataType : "json",
			data : {
				enterpriseType:enterpriseType,
				startCheckDate:startCheckDate,
				endCheckDate:endCheckDate,
				checkUnitCode:checkUnitCode,
				checkFrequencyCode:checkFrequencyCode,
				currentUnitCode:$("#currentCode").val(),
				enterpriseNames:enterpriseNames
			},
			success : function(total) {
					page("supervisionAndCheckTaskPage",total,10,10,querySupervisionCheckTask);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/selectSupervisionCheckTask.do",
		type:"post",
		dataType:"json",
		data:{
			enterpriseType:enterpriseType,
			startCheckDate:startCheckDate,
			endCheckDate:endCheckDate,
			checkUnitCode:checkUnitCode,
			checkFrequencyCode:checkFrequencyCode,
			currentUnitCode:$("#currentCode").val(),
			enterpriseNames:enterpriseNames,
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(data) {
			var tr = "";
			for(var i=0;i<data.length;i++){
			   if(data[i].supervisionCheckCount>0){
                    tr = tr +"<tr>";
                }else{
                    tr = tr +"<tr style='color:red'>";
                }
				tr = tr + "<td>"+(i+1)+"</td><td>"+data[i].enterprisetypeName+"</td><td>"+data[i].starttimeStr+"</td><td>"+data[i].endtimeStr+"</td><td>"+data[i].unitcodeName+"</td><td>"+data[i].checkFrequencyCodeName+"</td><td>"+data[i].enterpriseNames+"</td>";
                if(data[i].supervisionCheckCount>0){
                    tr = tr +"<td>已处理</td>";
                }else{
                    tr = tr +"<td>未处理</td>";
                }
                tr = tr +"<td><ul class='list-inline'>";
                //+"<a href='javascript:void(0)' class='editer_btns look_btn'  onclick='query("+data[i].id+")'>查看</a>"
                //+"<a href='javascript:void(0)' class='editer_btns edit_btn'  onclick='edit("+data[i].id+")'>编辑</a>"
                if(data[i].supervisionCheckCount==0){
                    tr=tr+"<li><a href='javascript:void(0)' class='editer_btns edit_btn'  onclick='deal("+data[i].id+",\""+data[i].enterprisetype+"\",\""+data[i].unitcode+"\",\""+data[i].enterpriseNames+"\")'>处理</a></li>";
                }
                tr=tr+"<li id='li-8300'><a href='javascript:void(0)' class='editer_btns look_btn'  onclick='queryDealDetail("+data[i].id+")'>查看处理详情</a></li>";
                //if(data[i].createUnitCode==$("#currentCode").val()){
                    tr=tr+"<li><a href='javascript:void(0)' class='editer_btns del_btn'  onclick='delTask("+data[i].id+")'>删除</a></li>";
                //}
                tr = tr + "</ul></td></tr>";
			}
			$("#supervisionAndCheckTaskTbody").html(tr);
		}
	}); 
}
var dealTaskId = "";//保存待处理的任务id
var enterprisetype = "";//保存待处理的企业类别
var unitcode = "";//保存待处理的委托监管单位
var enterpriseName = "";//保存待处理的企业名称
function deal(id,enterprisetypeTemp,unitcodeTemp,enterpriseNames){
	dealTaskId = id;
	enterprisetype = enterprisetypeTemp;
	unitcode = unitcodeTemp;
	enterpriseName = enterpriseNames;
	$("#deal_task_modal").modal("show");
}
function addDealTask(){
	var checkDate = $("#deal_calenderOne").val();
	if(!checkDate){
		alertEase("请选择检查日期",2);
		return;
	}
	$("#deal_task_modal").modal("hide");
	creatTabPage('8237','${pageContext.request.contextPath }/supervisionAndCheck/addShow.do?enterpriseTypeCode='+enterprisetype+'&dealTaskId='+dealTaskId+'&checkDate='+checkDate+'&unitcode='+unitcode+'&enterpriseName='+enterpriseName);
}
function delTask(id){
	$.ajax({
		url : "${pageContext.request.contextPath}/supervisionAndCheck/delSupervisionAndCheckTaskById.do",
		type : "post",
		data : {
			id:id
		},
		success : function(result) {
			if(result>0){
				alertEase("删除成功",1);
				querySupervisionCheckTask();
			}else{
				alertEase("删除失败",2);
			}
		}
	});
}
function queryDealDetail(taskId){
	creatTabPage('8300','${pageContext.request.contextPath }/supervisionAndCheck/show.do?taskId='+taskId);
}


//查询加载监管单位  下拉框
function querySelectCheckUnitCode(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:2
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#checkUnitCode").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
//查询加载行政区域  下拉框
function querySelectAddress2(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:0
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#address2").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
$("#deal_task_modal").on("hidden.bs.modal",function(){
    $("#deal_calenderOne").val("");
});
</script>
</body>
</html>