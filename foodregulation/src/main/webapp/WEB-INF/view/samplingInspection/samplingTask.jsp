<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">抽样检查</a></li>
            <li class="active">抽样检查任务</li>
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
            <th>企业名称</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="enterpriseNamSam">
                </div>
            </th>
            <th>企业类别</th>
            <th>
                <select class="select_style1" id="enterpriseTypeSam">
                    <option value="" selected>请选择</option>
                    <c:forEach  items="${enterpriseTypeList}" var="enterpriseType">
                        <option  value="${enterpriseType.tDictionaryCode}" >${enterpriseType.tDictionaryName}</option>
                    </c:forEach >
                </select>
            </th>
            <th>抽检开始日期</th>
            <th>
                <div id="start_calenderOneBox1" style="position:relative">
                    <input id="start_calenderOne" class="bg_calender" size="16" type="text" value="">
                </div>
            </th>
            <th>抽检结束日期</th>
            <th>
                <div id="end_calenderOneBox1" style="position:relative">
                    <input id="end_calenderOne" class="bg_calender" size="16" type="text" value="">
                </div>
            </th>
            <th><a class="form_btn" href="#" onclick="querySamTaskBasic()">筛选</a></th>
        </tr>
        </thead>
    </table>
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <ul>
                <li id='li-add_samTask_tab'>
                    <a href="javascript:void (0)" class="form_btn2" onclick="addBtnProcessSamTask()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加抽样检验任务</a>
                </li>
            </ul>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_samTask"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">序号</th>
            <th>企业名称</th>
            <th>抽检时间</th>
            <th>抽检批次</th>
            <th>委托单位</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_samTask">
        
        </tbody>
    </table>
    <div id="page_samTask"></div>
</div>



<div class="modal fade addsource_modal" id="mymodal_process_samTask" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_SamTask"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">处理抽样检验任务</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <form id="data_samTask">
            <table class="table search_box marb10">
                <input type="hidden" id="process_task_qyname">
                <input type="hidden" id="process_task_type">
                <input type="hidden" id="process_task_id">
                <input type="hidden" id="process_task_batch">
                <input type="hidden" id="process_task_ent_type">
                <thead>
                <tr>
                    <td  class="width60 noborder title_font">抽检时间</td>
                    <td class="width220 ">
                        <div id="samTask_date_calenderOneBox" style="position:relative">
                            <input id="samTask_date_calender" class="login_input bg_calender  width260" size="16" type="text" name="physicalDateStr" readonly value="">
                        </div>
                    </td>
                </tr>
                </thead>
            </table>

                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left" colspan="3">
                            <ul><li><a href="javascript:void(0)" class="form_btn  width140 title_font"  data-dismiss="modal" onclick="processSamTask()">开始添加</a></li></ul>

                        </td>

                    </tr>
                    </tbody>
                </table>

                <div class="modal-footer">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
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
$('#samTask_date_calender').datetimepicker({
container:'#samTask_date_calenderOneBox',
format: 'yyyy-mm-dd',
weekStart: 1,
todayBtn:  1,
autoclose: 1,
todayHighlight: 1,
startView: 2,
minView: 2,
forceParse: 0
});

//清空表单 
function emptyFormSamTask(){
	$("#data_samTask").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
}

function querySamTaskBasic(curr){
	$("#dataListTbody_samTask tr").remove();
    var enterpriseName=$("#enterpriseNamSam").val();
    var enterpriseType=$("#enterpriseTypeSam").val();
    var unitCode=$("#taskUnitCode").val();
    var startCalenderOne = $("#start_calenderOne").val();
    var endCalenderOne = $("#end_calenderOne").val();

	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/samplingInspection/findSampTaskListTotal.do",
			type : "post",
			dataType : "json",
			async: false,
            data:{
                enterpriseName:enterpriseName,
                enterpriseType:enterpriseType,
                unitCode:unitCode,
                startCalenderOne:startCalenderOne,
                endCalenderOne:endCalenderOne
            },
			success : function(total) {
				$("#total_samTask").html(total);
				page("page_samTask",total,10,10,querySamTaskBasic);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/samplingInspection/findSampTaskList.do",
		type:"post",
		dataType:"json",
		data:{
            enterpriseName:enterpriseName,
            enterpriseType:enterpriseType,
            unitCode:unitCode,
            startCalenderOne:startCalenderOne,
            endCalenderOne:endCalenderOne,
            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
				if(json[i].state=="未完成") {
				    tr+="<tr style='color:red'>";
				}else{
				    tr+="<tr>";
				}
			    tr+="<td>"+(i+1)+"</td><td>"+json[i].qyname+"</td><td>"+json[i].checkDate+"</td><td>"+json[i].batch+"</td><td>"+json[i].unitName+"</td><td>"+json[i].state+"</td>"
                        +"<td><ul class='list-inline'>" ;
			    if(json[i].state=="未完成") {
                    tr += "<li id='li-cyjc-500100" + json[i].sampling_type + "'><a href='javascript:void(0)' class='editer_btns look_btn' data-toggle='modal' data-target='#mymodal_process_samTask' " +
                        "onclick=\"processSam('" + json[i].qyname+"','"+json[i].sampling_type + "','" + json[i].batch + "'," + json[i].id + ",'" + json[i].enterprise_type + "')\">处理</a></li>";
                }
                 tr+="<li id='li-cyjc-list-" + json[i].id + "'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='seeSampleTaskResult(" + json[i].id + ")'>查看处理详情</a></li>"
                 tr+="<li><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteSamTask("+json[i].id+")'>删除</a></li></ul></td></tr>";
			}
			$("#dataListTbody_samTask").append(tr);
		}
});
}




function addBtnProcessSamTask(){
//	$("#save_samTask").show();
//	$("#update_samTask").hide();
//	emptyFormSamTask();
//	$("#title_SamTask").html("添加记录");
//    querySamTaskEnterprise1();

    creatTabPage("add_samTask_tab",'${pageContext.request.contextPath }/samplingInspection/addTask.do?random='+Math.random());

}


function formatDateD (strTime) {
    var date = new Date(strTime);
    return date.getFullYear()+"年/"+(date.getMonth()+1)+"月/"+date.getDate()+"日";
}


function deleteSamTask(id){
	confirmMessage('con_Examination','你确实要删除吗',{width:300,height:150,sure:callBack});
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/samplingInspection/delSampTask.do",
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
				querySamTaskBasic();
			}
		});	
	}
}

function publishExam() {
    var data=[];
    $("input[name='enterpriseId']:checked").each(function () {
        var pub ={
            examinationid:$("#pubexaminationId").val(),
            enterpriseid:this.value,
            enterprisetype:$(this).attr("enterpriseType")
        };
        data.push(pub);
    });

    if(data.length==0)
        return;

    $.ajax({
        url:"${pageContext.request.contextPath}/exam/publish.do",
        type:"post",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        dataType:"json",
        data:JSON.stringify(data),
        success : function(data) {
            if(data.result=="true"){
                alertEase("发布成功",'alert_succ');
                emptyFormSamTask();
                querySamTaskBasic();
            }else{
                alertEase("发布失败! "+data.msg,'alert_err');
            }
        }
    });

}

function processSam(qyname,type,batch,id,entType) {
    $("#process_task_qyname").val(qyname);
    $("#process_task_type").val(type);
    $("#process_task_batch").val(batch);
    $("#process_task_id").val(id);
    $("#process_task_ent_type").val(entType);
}

function processSamTask() {
    var qyname=$("#process_task_qyname").val();
    var type=$("#process_task_type").val();
    var batch=$("#process_task_batch").val();
    var id=$("#process_task_id").val();
    var time=$("#samTask_date_calender").val();
    var entType=$("#process_task_ent_type").val();
    if(time.length==0){
        alertEase("请选择处理时间",2);
        return;
    }
    time=time.replace("年/", "-").replace("月/", "-").replace("日", "");
    creatTabPage("cyjc-500100"+type,'${pageContext.request.contextPath }/samplingInspection/jump.do?url=chooseSample'+type+'&random='+Math.random()+'&taskId='+id+'&time='+time+'&batch='+batch+'&entType='+entType+'&entName='+qyname);
}

function seeSampleTaskResult(id) {
    creatTabPage("cyjc-list-"+id,'${pageContext.request.contextPath }/samplingInspection/index.do?taskId='+id);
}
querySamTaskBasic();
</script>