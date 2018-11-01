<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">行政处罚</a></li>
            <li class="active">案件基本信息</li>
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
				<th>涉案企业</th>
				<th>
					<div class="search_parent">
						<input type="text" class="search_input" name="sel_caseInfoCompany"> 
					</div>
				</th>
				<th>案件来源</th>
				<th>
					<div class="search_parent">
						<select class="select_style1 width260" name="sel_caseInfoFrom" id="sel_caseInfoFrom">
                			<option value="">请选择</option>
                		</select>
					</div>
				</th>
				<th>立案时间</th>
                    <th>
                        <div id="calenderOneBox1" style="position:relative">
                            <input id="sel_caseInfoTime" name="sel_caseInfoTime" class="bg_calender" size="16" type="text" value="">
                        </div>
                    </th>
				<th><a href="#" class="form_btn" onclick="searchCaseInfo()">搜索</a></th>
			</tr>
		</thead>
	</table>                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
          <ul>
            <li id="li-10000"><a href="javascript:void (0)" class="form_btn2" onclick="creatTabPage(10000,'${pageContext.request.contextPath }/caseInfo/addCaseInfo.do')"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加案件</a></li>
          </ul>
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_caseInfo"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>企业名称</th>
            <th>案件来源</th>
            <th>处罚依据</th>
            <th>立案时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_caseInfo">

        </tbody>
    </table>
    <div id="page_caseInfo"></div>
</div>



<script>
$(function (){
	$.ajax({
		url:"${pageContext.request.contextPath}/casefrom/selectCasefrom.do",
		type:"post",
		dataType:"json",
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#sel_caseInfoFrom").append("<option value='"+json[i].caseFromId+"'>"+json[i].caseFromContent+"</option>");
			}
		}
	});
})
$('#caseInfoTime').datetimepicker({
    container:'#calenderOneBox',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 0,
    forceParse: 0,
    minuteStep:1,
    format:'yyyy-mm-dd hh:ii:ss'
});
$(document).ready(function(){
	queryCaseInfo();  
});

var caseInfoCompany;
var caseInfoFrom;
var caseInfoTime;

function queryCaseInfo(curr){
	$("#dataListTbody_caseInfo tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/caseInfo/selectCaseInfoTotal.do",
			type : "post",
			dataType : "json",
			data:{
				caseInfoCompany:caseInfoCompany,
				caseInfoFrom:caseInfoFrom,
				caseInfoTime:caseInfoTime
			},
			async: false,
			success : function(total) {
				$("#total_caseInfo").html(total);
				page("page_caseInfo",total,10,10,queryCaseInfo);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/caseInfo/selectCaseInfo.do",
		type:"post",
		dataType:"json",
		data:{
			caseInfoCompany:caseInfoCompany,
			caseInfoFrom:caseInfoFrom,
			caseInfoTime:caseInfoTime,
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {	
				var url1 = "${pageContext.request.contextPath }/caseInfo/detailCaseInfo.do?caseInfoId="+json[i].caseInfoId;
				var url2 = "${pageContext.request.contextPath }/caseInfo/findCaseInfo.do?caseInfoId="+json[i].caseInfoId;
			    tr+="<tr>"
			    	+"<td>"+(i+1)+"</td>"
			    	+"<td>"+json[i].caseInfoCompany+"</td>"
			    	+"<td>"+json[i].caseFromContent+"</td>"
			    	+"<td>"+json[i].punishBasisContents+"</td>"
			    	+"<td>"+json[i].caseInfoTime+"</td>"
			    	+"<td class='width220'><a href='javascript:void(0)' class='editer_btns look_btn' id='li-8000"+i+"'  onclick='creatTabPage(8000"+i+",\""+url1+"\")'>查看详情</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteCaseInfo(\""+json[i].caseInfoId+"\")'>删除</a></td>"
			    +"</tr>";	
			}
			$("#dataListTbody_caseInfo").append(tr);
		}
	});
}

function searchCaseInfo(){
	caseInfoCompany=$("input[name='sel_caseInfoCompany']").val();
	caseInfoFrom=$("#sel_caseInfoFrom").val();
	caseInfoTime=$("input[name='sel_caseInfoTime']").val();
	queryCaseInfo();
}




function deleteCaseInfo(caseInfoId){
	confirmMessage('con_caseInfo','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/caseInfo/deleteCaseInfo.do",
			type:"post",
			dataType:"json",
			data:{
				caseInfoId:caseInfoId
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryCaseInfo();
			}
		});	
	}
}
$('#sel_caseInfoTime').datetimepicker({
    container:'#calenderOneBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 0,
    forceParse: 0,
    minuteStep:1,
    format:'yyyy-mm-dd hh:ii:ss'
});
</script>