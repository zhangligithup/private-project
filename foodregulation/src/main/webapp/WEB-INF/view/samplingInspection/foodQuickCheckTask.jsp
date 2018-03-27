<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">抽样检查</a></li>
            <li class="active">食品快检</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <table class="table search_box marb10">
        <thead>
        <tr>
            <!-- 隐藏域 登录人单位code -->
            <input type="hidden" id="taskUnitCode" value="${uitcode}">
            <th>样品名称</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="sampleName">
                </div>
            </th>
            <th>检测项目</th>
            <th>
                <select class="select_style1" id="quickcheckproject">
                    <option value="" selected>请选择</option>
                    <c:forEach  items="${quickcheckprojectList}" var="quickcheckproject">
                        <option  value="${quickcheckproject.tDictionaryCode}" >${quickcheckproject.tDictionaryName}</option>
                    </c:forEach >
                </select>
            </th>
            <th>检测日期</th>
            <th>
                <div id="start_quickCheckBox1" style="position:relative">
                    <input id="start_quickCheck" class="bg_calender" size="16" type="text" value="">
                </div>
            </th>
            <th>至</th>
            <th>
                <div id="end_quickCheckBox1" style="position:relative">
                    <input id="end_quickCheck" class="bg_calender" size="16" type="text" value="">
                </div>
            </th>
        </tr>
        <tr>
            <th>被检企业</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="detectionedEnterprise">
                </div>
            </th>
            <th>检测单位</th>
            <th>
                <select class="select_style1" id="detectionUnitCode">
                    <option value="" selected>请选择</option>
                    <c:forEach  items="${unitList}" var="unit">
                        <option  value="${unit.tDictionaryCode}" >${unit.tDictionaryName}</option>
                    </c:forEach >
                </select>
            </th>
            <th><a class="form_btn" href="#" onclick="queryQuickCheckBasic()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <ul>
                <li id='li-add_quickCheck_tab'>
                    <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_process_quickCheck'><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加食品快检</a>
                </li>
            </ul>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_quickCheck"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">序号</th>
            <th>样品名称</th>
            <th>检测项目</th>
            <th>检测结果</th>
            <th>被检企业</th>
            <th>检测单位</th>
            <th>检测日期</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_quickCheck">
        
        </tbody>
    </table>
    <div id="page_quickCheck"></div>
</div>



<div class="modal fade addsource_modal" id="mymodal_process_quickCheck" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog" style="width:1052px">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_quickCheck"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加食品快检</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
             <table class="table search_box marb10">
		        <thead>
			        <tr>
			            <th style="width:200px">检测日期</th>
			            <th style="width:200px">
			                <div id="detectionDateOneBox1" style="position:relative;display:inline;">
			                    <input id="detectionDateOne" name = "detectionDate" class="bg_calender" size="16" type="text" value="">  
			                </div>
			            </th>
			            <th style="width:200px"></th>
			            <th style="width:200px"></th>
			            <th style="width:200px"></th>
			        </tr>
		        </thead>
	        </table>
                <table class="table table-bordered table2" style="width:1050px" id="addQuickTable">
                    <thead>
			        <tr>
			            <th style="width:150px">样品名称</th>
			            <th style="width:150px">检测项目</th>
			            <th style="width:150px">检测结果</th>
			            <th style="width:150px">被检企业</th>
			            <th style="width:150px">检测单位</th>
			            <th style="width:150px"><a class="form_btn" href="#" onclick="addLine()">增加一行</a></th>
			        </tr>
			        </thead>
                    <tbody>
                    <tr>
                        <td style="width:150px"><input type="text" class="search_input" name="sampleName"></td>
                        <td style="width:150px">
                        <select class="select_style1" name="quickcheckproject">
		                    <option value="" selected>请选择</option>
		                    <c:forEach  items="${quickcheckprojectList}" var="quickcheckproject">
		                        <option  value="${quickcheckproject.tDictionaryCode}" >${quickcheckproject.tDictionaryName}</option>
		                    </c:forEach >
                        </select>
                        </td>
                        <td style="width:150px">
                            <div class="myradio radio-inline marr10">
	                            <label>
	                                <input type="radio"  value="合格" name="result" checked>合格
	                            </label>
                            </div>
	                        <div class="myradio radio-inline">
	                            <label>
	                                <input type="radio"  value="不合格" name="result">不合格
	                            </label>
	                        </div>
                        </td>
                        <td style="width:150px"><input value="" onblur="checkIsHave(this)" type="text" class="search_input" name="detectionedEnterprise"></td>
                        <td style="width:150px">
                            ${unitName}${enterpriseName}
                        </td>
                        <td style="width:150px"><a class="form_btn" href="#" onclick="deleteLine(this)">删除</a></td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" id="enterpriseName" value="${enterpriseName}">
                <input type="hidden" id="unitCode" value="${unitCode}">
                <div class="modal-footer" style="text-align:center">
                <a class="form_btn" href="#" onclick="saveQuickCheck()">保存</a>
                </div>
        </div>
    </div>
</div>
<script>
$('#start_quickCheck').datetimepicker({
    container:'#start_quickCheckBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format:'yyyy-mm-dd'
});
$('#end_quickCheck').datetimepicker({
    container:'#end_quickCheckBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format:'yyyy-mm-dd'
});
$('#detectionDateOne').datetimepicker({
    container:'#detectionDateOneBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format:'yyyy-mm-dd'
});

function queryQuickCheckBasic(curr){
	$("#dataListTbody_quickCheck tr").remove();
    var sampleName=$("#sampleName").val();
    var quickcheckproject=$("#quickcheckproject").val();
    var start_calenderOne=$("#start_quickCheck").val();
    var end_calenderOne = $("#end_quickCheck").val();
    var detectionedEnterprise = $("#detectionedEnterprise").val();
    var detectionUnitCode = $("#detectionUnitCode").val();

	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/foodQuickCheck/findQuickCheckTotal.do",
			type : "post",
			dataType : "json",
			async: false,
            data:{
            	sampleName:sampleName,
            	quickcheckproject:quickcheckproject,
            	start_calenderOne:start_calenderOne,
            	end_calenderOne:end_calenderOne,
            	detectionedEnterprise:detectionedEnterprise,
            	detectionUnitCode:detectionUnitCode
            },
			success : function(total) {
				$("#total_quickCheck").html(total);
				page("page_quickCheck",total,10,10,queryQuickCheckBasic);
			}
		});
	}else{
		pageNum = curr;
	}
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
            detectionUnitCode:detectionUnitCode,
            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
			    tr+="<tr><td>"+(i+1)+"</td><td>"+json[i].sampleName+"</td><td>"+json[i].projectName+"</td><td>"+json[i].result+"</td><td>"+json[i].detectionedEnterprise+"</td><td>"+json[i].detectionUnitName+json[i].detectionEnterpriseName+"</td>"
                        +"<td>"+json[i].detectionDate+"</td></tr>" ;
			}
			$("#dataListTbody_quickCheck").append(tr);
		}
});
}

function deleteQuickCheck(id){
	confirmMessage('con_Examination','你确实要删除吗',{width:300,height:150,sure:callBack});
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/foodQuickCheck/delSampTask.do",
			type:"post",
			dataType:"json",
			data:{
				taskId:id
			},
			success : function(data) {
                if(data.result=="true"){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryQuickCheckBasic(); 
			}
		});	
	}
}

function addLine(){
	var num = $("#addQuickTable tr").length;
    var tr = $("#addQuickTable tr").eq(num-1).clone();
    var result = $("#addQuickTable tr").eq(num-1).find("input[type='radio']").val();
    $("#addQuickTable").append(tr);
    if(result == "合格"){
        $("#addQuickTable tr").eq(num-1).find("input[type='radio']:eq(0)").attr("checked","checked");
    }else{
        $("#addQuickTable tr").eq(num-1).find("input[type='radio']:eq(1)").attr("checked","checked");
    }
    $("#addQuickTable tr").eq(num).find("input[type='radio']").attr("name",Math.random());
}
function deleteLine(td){
	var num = $("#addQuickTable tr").length;
	if(num>2){
	   $(td).parents("tr").remove();
	}else{
		alert("至少保留一行");
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
	var num = $("#addQuickTable tr").length;
	var params = "";
	for(var i=1;i<num;i++){
		var tr = $("#addQuickTable tr").eq(i);
		var sampleName = $(tr).find("input[name='sampleName']").val().trim();
		if(!sampleName){
	        alertEase("第"+i+"行样品名称不能为空",2);
	        return;
	    }
		var quickcheckproject = $(tr).find("select[name='quickcheckproject']").val();
		if(!quickcheckproject){
            alertEase("第"+i+"行检测项目不能为空",2);
            return;
        }
		var result = $(tr).find("input[type='radio']").val().trim();
		if(!result){
            alertEase("第"+i+"行检测结果不能为空",2);
            return;
        }
		var detectionedEnterprise = $(tr).find("input[name='detectionedEnterprise']").val().trim();
		if(!detectionedEnterprise){
            alertEase("第"+i+"行被检测企业不能为空",2);
            return;
        }
		if(i == 1){
			params = params + sampleName+","+quickcheckproject+","+result+","+detectionedEnterprise
		}else{
	        params = params +":"+sampleName+","+quickcheckproject+","+result+","+detectionedEnterprise
		}
	}
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
</script>