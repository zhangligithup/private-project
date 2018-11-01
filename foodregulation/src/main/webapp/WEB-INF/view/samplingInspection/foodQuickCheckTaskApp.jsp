<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta name="renderer" content="webkit">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        html,
        body {
            height: 100%;
        }
        
        html {
            overflow: hidden;
        }
        
        body {
            overflow: auto;
            width: calc(100vw + 20px);
        }
        
        .page {
            height: 200%;
            border: 1px dashed;
            width: 100vw;
        }
    </style>
    <title>食品药品动态监管系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fileinput.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/imgUpload/zyupload-1.0.0.min.css">
    <style>
        .search_parent2{
		  width: 100%;
		  min-width: 120px;
		}
		.search_parent2 .search_input{
		  min-width: 120px;
		  width:calc(100% - 70px);
		  float: left;
		}
		.search_parent2 .bg_calender{
		  min-width: 120px;
		  width:calc(100% - 70px);
		  float: left;
		}
		.search_parent2 select{
		  min-width: 120px;
		  width:calc(100% - 70px);
		  float: left;
		}
		.confirm_sure2
		{
		  display:inline-block;
		  text-align:center;
		  background:#3095de;
		  color:#fff;
		  padding:5px 5px;
		  margin:5px 5px;
		  border-radius:5px;
		}
    </style>
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
<body class="hold-transition skin-blue sidebar-mini" style="font-size:20px">  
<div class="content_box">
    <table class="table search_box marb10">
        <thead>
        <tr>
            <!-- 隐藏域 登录人单位code -->
            <input type="hidden" id="taskUnitCode" value="${uitcode}">
            <th>样品名称</th>
            <th>
                <div class="search_parent2">
                    <input type="text" class="search_input" id="sampleName">
                </div>
            </th>
        </tr>
        <tr>
            <th>检测项目</th>
            <th>
               <div class="search_parent2">
                <select class="select_style1" id="quickcheckproject">
                    <option value="" selected>请选择</option>
                    <c:forEach  items="${quickcheckprojectList}" var="quickcheckproject">
                        <option  value="${quickcheckproject.tDictionaryCode}" >${quickcheckproject.tDictionaryName}</option>
                    </c:forEach >
                </select>
                </div>
            </th>
        </tr>
        <tr>
            <th>检测日期</th>
            <th>
                <div class="search_parent2">
	                <div id="start_quickCheckBox1" style="position:relative">
	                    <input id="start_quickCheck" class="bg_calender" size="16" type="text" value="">
	                </div>
                </div>
            </th>
        </tr>
        <tr>
            <th>至</th>
            <th>
                <div class="search_parent2">
	                <div id="end_quickCheckBox1" style="position:relative">
	                    <input id="end_quickCheck" class="bg_calender" size="16" type="text" value="">
	                </div>
                </div>
            </th>
        </tr>
        <tr>
            <th>被检企业</th>
            <th>
                <div class="search_parent2">
                    <input type="text" class="search_input" id="detectionedEnterprise">
                </div>
            </th>
        </tr>
        <!--<tr>
            <th>检测单位</th>
            <th>
            <div class="search_parent2">
                <select class="select_style1" id="detectionUnitCode">
                    <option value="" selected>请选择</option>
                    <c:forEach  items="${unitList}" var="unit">
                        <option  value="${unit.tDictionaryCode}" >${unit.tDictionaryName}</option>
                    </c:forEach >
                </select>
                </div>
            </th>
        </tr>  -->
        <tr>
            <th>检测结果</th>
            <th>
            <div class="search_parent2">
                <select class="select_style1" id="result">
                    <option value="" selected>请选择</option>
                    <option value="合格">合格</option>
                    <option value="不合格">不合格</option>
                </select>
                </div>
            </th>
        </tr>
        </thead>
    </table>
    <div style="width:100%;text-align: center">
        <a class="form_btn" href="#" onclick="queryQuickCheckBasic()">查询</a>
        <a class="form_btn" data-toggle='modal' data-target='#mymodal_process_quickCheck' href="#">添加食品快检</a>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>样品名称</th>
            <th>检测项目</th>
            <th>检测结果</th>
            <th>被检企业</th>
            <th>检测单位</th>
            <th>检测日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_quickCheck">
        </tbody>
    </table>
    <div id="page_quickCheck"  style="width:100%;text-align: center">
    </div>
</div>



<div class="modal fade" id="mymodal_process_quickCheck" aria-hidden="true" data-backdrop="static" style="overflow-y:scroll">
    <div class="modal-dialog" style="margin:0px auto">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_quickCheck"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加食品快检</div>
            </div>
                 <table class="table table-bordered table2" id="addQuickTable" style="padding:0px">
                    <tbody>
                    <tr>
                        <th>检测日期</th>
                        <th>
	                            <div id="detectionDateOneBox1" style="position:relative;display:inline;">
	                                <input id="detectionDateOne" name = "detectionDate" class="bg_calender" size="16" type="text" value="">  
	                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">样品名称</th>
                        <th>
                            <div class="search_parent2">
                                <input type="text" class="search_input" name="sampleName">
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测项目</th>
                        <th>
                            <div class="search_parent2">
                            <select class="select_style1" name="quickcheckproject">
                                <option value="" selected>请选择</option>
                                <c:forEach  items="${quickcheckprojectList}" var="quickcheckproject">
                                    <option  value="${quickcheckproject.tDictionaryCode}" >${quickcheckproject.tDictionaryName}</option>
                                </c:forEach >
                            </select>
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测结果</th>
                        <th>
                            <div class="myradio radio-inline marr10">
                                <label>
                                    <input type="radio"  value="合格" name="result">合格
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label>
                                    <input type="radio"  value="不合格" name="result">不合格
                                </label>
                            </div>
                        </th>
                    </tr> 
                    <tr>
                        <th style="padding:8px 0px">被检企业</th>
                        <th>
                            <div class="search_parent2">
                                <input value="" onblur="checkIsHave(this)" type="text" class="search_input" name="detectionedEnterprise">
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测单位</th>
                        <th>
                            ${unitName}${enterpriseName}
                        </th>
                    </tr>
                     <tr>
                        <th style="padding:8px 0px">检测结果图片</th>
                        <td style="width:150px">
                             <input type="hidden" name="imgUrl">
                             <input type="file" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" accept="image/*" href="#" onclick="uploadImg(this)">上传</a>
                         </td>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">不合格食品处理图像</th>
                        <td style="width:150px">
                             <input type="hidden" name="noQualifiedVideo">
                             <input type="file" accept="image/*,video/*" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                         </td>
                    </tr>
                    </tbody>
                </table>
                <div class="modal-footer" style="text-align:center">
                <a class="form_btn" href="#" onclick="saveQuickCheck()">保存</a>
                <a class="form_btn" href="#" onclick="closeModal('mymodal_process_quickCheck')">关闭</a>
                </div>
        </div>
    </div>
</div>

<div class="modal fade" id="edit_process_quickCheck" aria-hidden="true" data-backdrop="static" style="overflow-y:scroll">
    <div class="modal-dialog" style="margin:0px auto">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_quickCheck"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">修改食品快检</div>
            </div>
                <table class="table table-bordered table2" id="editQuickTable" style="padding:0px">
                    <tbody>
                    <tr>
                        <th>检测日期</th>
                        <th>
	                            <div id="detectionDateOneBox2" style="position:relative;display:inline;">
	                                <input id="detectionDateOne2" name = "detectionDate" class="bg_calender" size="16" type="text" value="">  
	                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">样品名称</th>
                        <th>
                            <div class="search_parent2">
                                <input type="text" class="search_input" name="sampleName">
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测项目</th>
                        <th>
                            <div class="search_parent2">
		                        <select class="select_style1" name="quickcheckproject">
		                            <option value="" selected>请选择</option>
		                            <c:forEach  items="${quickcheckprojectList}" var="quickcheckproject">
		                                <option  value="${quickcheckproject.tDictionaryCode}" >${quickcheckproject.tDictionaryName}</option>
		                            </c:forEach >
		                        </select>
	                        </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测结果</th>
                        <th>
                            <div class="myradio radio-inline marr10">
                                <label>
                                    <input type="radio"  value="合格" name="result">合格
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label>
                                    <input type="radio"  value="不合格" name="result">不合格
                                </label>
                            </div>
                        </th>
                    </tr> 
                    <tr>
                        <th style="padding:8px 0px">被检企业</th>
                        <th>
                            <div class="search_parent2">
                                <input value="" onblur="checkIsHave(this)" type="text" class="search_input" name="detectionedEnterprise">
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测单位</th>
                        <th>
                            ${unitName}${enterpriseName}
                            <input name="id" type="hidden">
                        </th>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">检测结果图片</th>
                        <td style="width:150px" id="editImg">
                             <input type="hidden" name="imgUrl">
                             <input type="file" accept="image/*" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                         </td>
                    </tr>
                    <tr>
                        <th style="padding:8px 0px">不合格食品处理图像</th>
                        <td style="width:150px" id="editVideo">
                             <input type="hidden" name="noQualifiedVideo">
                             <input type="file" accept="image/*,video/*" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                         </td>
                    </tr>
                    </tbody>
                </table>
                <div class="modal-footer" style="text-align:center">
                <a class="form_btn" href="#" onclick="editSaveFoodQuichCheck()">保存</a>
                <a class="form_btn" href="#" onclick="closeModal('edit_process_quickCheck')">关闭</a>
                </div>
        </div>
    </div>
</div>
<input type="hidden" id="enterpriseName" value="${enterpriseName}">
<input type="hidden" id="unitCode" value="${unitCode}">
<script>
$('#start_quickCheck').datetimepicker({
    container:'#start_quickCheckBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd hh:ii'
});
$('#end_quickCheck').datetimepicker({
    container:'#end_quickCheckBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd  hh:ii'
});
$('#detectionDateOne').datetimepicker({
    container:'#detectionDateOneBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd  hh:ii'
});
$('#detectionDateOne2').datetimepicker({
    container:'#detectionDateOneBox2',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd hh:ii'
});
var pageNum = 1;
function clickQueryQuickCheckBasic(){
    var sampleName=$("#sampleName").val();
    var quickcheckproject=$("#quickcheckproject").val();
    var start_calenderOne=$("#start_quickCheck").val();
    var end_calenderOne = $("#end_quickCheck").val();
    var detectionedEnterprise = $("#detectionedEnterprise").val();
    //var detectionUnitCode = $("#detectionUnitCode").val();
    var result = $("#result").val();
    $.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/findQuickCheck.do",
        type:"post",
        dataType:"json",
        data:{
            sampleName:sampleName,
            quickcheckproject:quickcheckproject,
            start_calenderOne:start_calenderOne,
            end_calenderOne:end_calenderOne,
            detectionedEnterprise:detectionedEnterprise,
            //detectionUnitCode:detectionUnitCode,
            result:result,
            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
            limit:10//每页显示的条数
        },
        success : function(json) {
        	 var tr="";
             for(var i=0;i<json.length;i++) {
                 tr+="<tr><td>"+json[i].sampleName+"</td><td>"+json[i].projectName+"</td><td>"+json[i].result+"</td><td>"+json[i].detectionedEnterprise+"</td><td>"+json[i].detectionUnitName+json[i].detectionEnterpriseName+"</td>"
                         +"<td>"+json[i].detectionDate+"</td><td><ul class='list-inline'>" ;
                 tr+="<li id='li-cyjc-list-" + json[i].id + "'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='editFoodQuichCheck(" + json[i].id + ")'>编辑</a></li>"
                 tr+="<li><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteFoodQuichCheck("+json[i].id+")'>删除</a></li></ul></tr>";
             }
             $("#dataListTbody_quickCheck").append(tr);
        	if(json.length == 10){
	            pageNum = pageNum+1;
        	}else{
        		$("#page_quickCheck").html("<span>没有更多！</span>");
        	}
        }
});
}
function queryQuickCheckBasic(){
    $("#dataListTbody_quickCheck tr").remove();
    var sampleName=$("#sampleName").val();
    var quickcheckproject=$("#quickcheckproject").val();
    var start_calenderOne=$("#start_quickCheck").val();
    var end_calenderOne = $("#end_quickCheck").val();
    var detectionedEnterprise = $("#detectionedEnterprise").val();
    //var detectionUnitCode = $("#detectionUnitCode").val();
    var result = $("#result").val();
    pageNum = 1;
    $.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/findQuickCheck.do",
        type:"post",
        dataType:"json",
        data:{
            sampleName:sampleName,
            quickcheckproject:quickcheckproject,
            start_calenderOne:start_calenderOne,
            end_calenderOne:end_calenderOne,
            detectionedEnterprise:detectionedEnterprise,
            //detectionUnitCode:detectionUnitCode,
            result:result,
            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
            limit:10//每页显示的条数
        },
        success : function(json) {
        	pageNum = 2;
            var tr="";
            for(var i=0;i<json.length;i++) {
                tr+="<tr><td>"+json[i].sampleName+"</td><td>"+json[i].projectName+"</td><td>"+json[i].result+"</td><td>"+json[i].detectionedEnterprise+"</td><td>"+json[i].detectionUnitName+json[i].detectionEnterpriseName+"</td>"
                        +"<td>"+json[i].detectionDate+"</td><td><ul class='list-inline'>" ;
                tr+="<li id='li-cyjc-list-" + json[i].id + "'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='editFoodQuichCheck(" + json[i].id + ")'>编辑</a></li>"
                tr+="<li><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteFoodQuichCheck("+json[i].id+")'>删除</a></li></ul></tr>";
            }
            $("#dataListTbody_quickCheck").append(tr);
            if(json.length == 10){
            	$("#page_quickCheck").html("<a href='javascript:void(0)' class='editer_btns' onclick='clickQueryQuickCheckBasic()'>加载更多</a>");
            }
        }
});
}
function editFoodQuichCheck(id){
	$.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/queryFoodQuickCheck.do",
        type:"post",
        dataType:"json",
        data:{
            id:id
        },
        success : function(data) {
        	$("#detectionDateOne2").val(data.detectionDate);
        	var table = $("#editQuickTable");
            $(table).find("input[name='sampleName']").val(data.sampleName);
            $(table).find("input[name='id']").val(data.id);
            $(table).find("select[name='quickcheckproject']").val(data.projectType);
            $(table).find("input[name='result'][value='" + data.result + "']").prop("checked", "checked");
            $(table).find("input[name='detectionedEnterprise']").val(data.detectionedEnterprise);
            $(table).find("input[name='imgUrl']").val(data.imgUrl);
            $(table).find("input[name='noQualifiedVideo']").val(data.noQualifiedVideo);
            $("#editVideo").find("video").remove();
            $("#editVideo").find("img").remove();
            $("#editImg").find("img").remove();
            var noQualifiedVideo = data.noQualifiedVideo;
            var index= noQualifiedVideo.lastIndexOf("."); //得到"."在第几位
            var file = noQualifiedVideo.substring(index); //截断"."之前的，得到后缀
            $("#editVideo").find("video").remove();
            $("#editVideo").find("img").remove();
            $("#editImg").find("img").remove();
            $("#editImg").prepend("<img src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+data.imgUrl+"\" style=\"width:150px;height:150px;display:block\" />");
            if(file!=".bmp"&&file!=".png"&&file!=".gif"&&file!=".jpg"&&file!=".jpeg"){  //根据后缀，判断是否符合图片格式
                $("#editVideo").prepend("<video src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+noQualifiedVideo+"\" controls=\"controls\" style=\"width:150px;height:150px;display:block\"></video>");
            }else{
                $("#editVideo").prepend("<img src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+noQualifiedVideo+"\" style=\"width:150px;height:150px;display:block\" />");
            }
        }
    }); 
	$("#edit_process_quickCheck").modal('show');
}
function closeModal(eleId){
	$("#"+eleId+"").modal('hide');
}
function editSaveFoodQuichCheck(id){
	var detectionDate = $("#detectionDateOne2").val();
    if(!detectionDateOne2){
        alertEase("检测日期不能为空",2);
        return;
    }
    var table = $("#editQuickTable");
    var id = $(table).find("input[name='id']").val().trim();
    var sampleName = $(table).find("input[name='sampleName']").val().trim();
    if(!sampleName){
        alertEase("样品名称不能为空",2);
        return;
    }
    var quickcheckproject = $(table).find("select[name='quickcheckproject']").val();
    if(!quickcheckproject){
        alertEase("检测项目不能为空",2);
        return;
    }
    var result = $(table).find("input[type='radio']:checked").val();
    if(!result){
        alertEase("检测结果不能为空",2);
        return;
    }
    var detectionedEnterprise = $(table).find("input[name='detectionedEnterprise']").val().trim();
    if(!detectionedEnterprise){
        alertEase("被检测企业不能为空",2);
        return;
    }
    var imgUrl = $(table).find("input[name='imgUrl']").val().trim();
    var noQualifiedVideo = $(table).find("input[name='noQualifiedVideo']").val().trim();
    $.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/saveModifyFoodQuickCheck.do",
        type:"post",
        dataType:"text",
        data:{
        	id:id,
        	sampleName:sampleName,
        	projectType:quickcheckproject,
        	result:result,
        	detectionedEnterprise:detectionedEnterprise,
        	detectionDate:detectionDate,
        	imgUrl:imgUrl,
        	noQualifiedVideo:noQualifiedVideo
        },
        success : function(result) {
            if(result){
                alertEase("修改成功",1);
                $('#edit_process_quickCheck').modal('hide');
                queryQuickCheckBasic();
            }else{
                alertEase("修改失败",2);
            }
        }
    }); 
}
function deleteFoodQuichCheck(id){
	confirmMessage3('con_Examination','你确实要删除吗',{width:150,height:100,sure:callBack});
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/foodQuickCheck/deleteFoodQuickCheck.do",
			type:"post",
			dataType:"json",
			data:{
				id:id
			},
			success : function(data) {
                if(data == 1){
					alertEase("删除信息成功",1);
				}else{
					alertEase("删除信息失败",2);
				}
                queryQuickCheckBasic(); 
			}
		});	
	}
}

function saveQuickCheck(){
	var detectionDate = $("#detectionDateOne").val();
	var detectionUnitCode = $("#unitCode").val();
	var detectionEnterpriseName = $("#enterpriseName").val();
	if(!detectionDate){
		alertEase("检测日期不能为空",2);
		return;
	}
	var table = $("#addQuickTable");
    var sampleName = $(table).find("input[name='sampleName']").val().trim();
    if(!sampleName){
        alertEase("样品名称不能为空",2);
        return;
    }
    var quickcheckproject = $(table).find("select[name='quickcheckproject']").val();
    if(!quickcheckproject){
        alertEase("检测项目不能为空",2);
        return;
    }
    var result = $(table).find("input[type='radio']:checked").val();
    if(!result){
        alertEase("检测结果不能为空",2);
        return;
    }
    var imgUrl = $(table).find("input[name='imgUrl']").val().trim();
    if(!imgUrl){
        imgUrl = " ";
    }
    var noQualifiedVideo = $(table).find("input[name='noQualifiedVideo']").val().trim();
    if(!noQualifiedVideo){
        noQualifiedVideo = " ";
    }
    var detectionedEnterprise = $(table).find("input[name='detectionedEnterprise']").val().trim();
    if(!detectionedEnterprise){
        alertEase("被检测企业不能为空",2);
        return;
    }
    var params = sampleName+","+quickcheckproject+","+result+","+detectionedEnterprise+","+imgUrl+","+noQualifiedVideo;
	$.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/batchAdd.do",
        type:"post",
        dataType:"text",
        data:{
        	detectionDate:detectionDate,
        	detectionEnterpriseName:detectionEnterpriseName,
        	detectionUnitCode:detectionUnitCode,
        	params:params
        },
        success : function(result) {
            if(result){
            	alertEase("保存成功",1);
            	$('#mymodal_process_quickCheck').modal('hide');
            	$("#detectionDateOne").val('');
            	$(table).find("input[name='sampleName']").val('');
            	$(table).find("input[name='imgUrl']").val('');
            	$(table).find("input[name='noQualifiedVideo']").val('');
            	$(table).find("select[name='quickcheckproject']").val('');
            	$(table).find("input[name='detectionedEnterprise']").val('');
            	$(table).find("input[type='radio']:checked").val('');
            	$(table).find("img").remove();
            	$(table).find("video").remove();
                queryQuickCheckBasic();
            }else{
            	alertEase("保存失败",2);
            }
        }
    }); 
	
}
function checkIsHave(ele){
	var detectionEnterpriseName = $(ele).val().trim();
	$(ele).val(detectionEnterpriseName);
	if(detectionEnterpriseName){
		$.ajax({
	        url:"${pageContext.request.contextPath}/foodQuickCheck/checkEnterpriseIsHave.do",
	        type:"post",
	        dataType:"text",
	        data:{
	            detectionEnterpriseName:detectionEnterpriseName
	        },
	        success : function(result) {
	            if(result==0){
	                alertEase("企业不存在",2);
	                $(ele).focus();
	            }
	        }
	    });
	}
}
queryQuickCheckBasic();
//信息确认框
function confirmMessage3(id,msg,options){
    var oWin=window.top?window.top:window;
    var oDiv=document.createElement("div");
    oDiv.id=id;
    oDiv.className='creatAlert_box';
    oWin.document.body.appendChild(oDiv);
    var options=options||{};
    options.width=options.width||300;
    options.height=options.height||130;
    options.fade=options.fade||500;

    var oContentBox=document.createElement("div");
    oDiv.appendChild(oContentBox);

    $(oContentBox).css({
        'width':options.width+50,
        'height':options.height+50,
        'margin-left':-options.width/2,
        'margin-top':-options.height
    })
    $(oContentBox).addClass('confirmContent');
    $(oContentBox).html(msg+'<div class="confirm_footer"><a class="confirm_sure2" href="javascript:;" id="confirm_ok">确定</a><a class="confirm_sure2" href="javascript:;" id="confirm_cancel">取消</a></div>');
    $(oContentBox).animate({opacity:1},options.fade,function(){
        var oConfirmCancel=oWin.document.getElementById('confirm_cancel');
        var oConfirmOk=oWin.document.getElementById('confirm_ok');

        $(oConfirmCancel).on('click',function(){
            $(oDiv).remove();
        });
        $(oConfirmOk).on('click',function(){
            $(oDiv).remove();
            options.sure&&options.sure();
        });

    });
}
function uploadImg(ele){
    $(ele).parent().find("input[type='file']").click();
}
function previewImg(ele){
   var formData = new FormData();
   formData.append('fileselect',ele.files[0]);    //将文件转成二进制形式
   $.ajax({
       type:"post",
       url:"${pageContext.request.contextPath}/supervisionAndCheck/upload.do",
       async:false,
       contentType: false,    //这个一定要写
       processData: false, //这个也一定要写，不然会报错
       data:formData,
       dataType:'text',    //返回类型，有json，text，HTML。
       success : function(data) {
    	   if(data){
               var url = data;
               var index= data.lastIndexOf("."); //得到"."在第几位
               var file = data.substring(index); //截断"."之前的，得到后缀
               $(ele).parent().find("img").remove();
               $(ele).parent().find("video").remove();
               if(file!=".bmp"&&file!=".png"&&file!=".gif"&&file!=".jpg"&&file!=".jpeg"){  //根据后缀，判断是否符合图片格式
                   $(ele).parent().prepend("<video src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+url+"\" controls=\"controls\" style=\"width:150px;height:150px;display:block\"></video>");
               }else{
                   $(ele).parent().prepend("<img src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+url+"\" style=\"width:150px;height:150px;display:block\" />");
               }
               $(ele).parent().find("input[name='imgUrl']").val(url);
               $(ele).parent().find("input[name='noQualifiedVideo']").val(url);
         }
         }
       });
}
</script>
</body>
</html>