<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="taskId" value="${taskId}">
<div class="breadcrumb_box">
	<div class="breadcrumb_box_l">
		<ol class="breadcrumb">
			<li><a href="#">首页</a></li>
			<li><a href="#">监督检查</a></li>
			<li class="active">监督检查信息列表</li>
		</ol>
	</div>
	<div class="breadcrumb_box_r">
		<div class="pull-right">
			<a href=""><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
		</div>
	</div>
</div>
<div class="content_box">
	<table class="table search_box marb10" id="check">
		<thead>
			<tr>
				<th>企业名称</th>
				<th>
					<div class="search_parent">
						<input type="text" class="search_input" id="enterpriseName"> 
					</div>
				</th>
				<th>行政区域</th>
				<th>
					<select class="select_style1" id="address2" name="address2">
						<option value="" selected>请选择</option>
						
					</select>
				</th>
				<th>检查日期</th>
                    <th>
                        <div id="calenderOneBox1" style="position:relative">
                            <input id="calenderOne" class="bg_calender" size="16" type="text" value="">
                        </div>
                    </th>
				<th><a class="form_btn" href="#" onclick="querySupervisionCheck()">搜索</a></th>
			</tr>
		</thead>
	</table>
	</div>
	<table class="table table-bordered table2">
		<thead>
			<tr>
				<th class="width60">ID</th>
				<th>企业名称</th>
				<th>检查人</th>
				<th>检查地点</th>
				<th>检查时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="supervisionAndCheckTbody">
		</tbody>
	</table>
	<div id="supervisionAndCheckPage"></div>
</div>
<script>
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
	querySupervisionCheck();
	querySelectAddress2();
});
function querySupervisionCheck(curr){
	var enterpriseName=$("#check").find("#enterpriseName").val();
	var checkDate=$("#check").find("#calenderOne").val();
	var pageNum;
	if(!curr){
		pageNum = 1;
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/supervisionAndCheck/selectSupervisionCheckTotal.do",
			type : "post",
			dataType : "json",
			data : {
				enterpriseName:enterpriseName,
				checkDate:checkDate,
				address:$("#check").find("select[name='address2']").val(),
				taskId:$("input[name='taskId']").val()
			},
			success : function(total) {
					page("supervisionAndCheckPage",total,10,10,querySupervisionCheck);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/selectSupervisionCheck.do",
		type:"post",
		dataType:"json",
		data:{
			enterpriseName:enterpriseName,
			checkDate:checkDate,
			address:$("select[name='address2']").val(),
			taskId:$("input[name='taskId']").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(data) {
			var tr = "";
			for(var i=0;i<data.length;i++){
				tr = tr + "<tr><td>"+data[i].id+"</td><td>"+data[i].checkedEnterpriseName+"</td><td>"+data[i].checkPersonName+"</td><td>"+data[i].checkAddress+"</td><td>"+data[i].checkDate+"</td><td>"
				+"<a id='li-34562"+i+"' href='javascript:void(0)' class='editer_btns look_btn' onclick='query(34562"+i+","+data[i].id+",\""+data[i].enterpriseTypeCode+"\")'>编辑</a>"
                //+"<a id='li-34563"+i+"' href='javascript:void(0)' class='editer_btns edit_btn' onclick='edit(34563"+i+","+data[i].id+","+data[i].enterpriseType+")'>编辑</a>"
                +"<a href='javascript:void(0)' class='editer_btns del_btn'  onclick='del("+data[i].id+")'>删除</a></td></tr>";
			}
			$("#supervisionAndCheckTbody").html(tr);
		}
	}); 
}
function del(id){
	$.ajax({
		url : "${pageContext.request.contextPath}/supervisionAndCheck/del.do",
		type : "post",
		data : {
			id:id
		},
		success : function(result) {
			if(result>0){
				alertEase("删除成功",1);
				querySupervisionCheck();
			}else{
				alertEase("删除失败",2);
			}
		}
	});
}
var div="";
function query(divId,id,type){
	if(div!=""&&div!=divId){
		$.each(aHistoryMinTab,function(index,div){// index是索引值（即下标）   item是每次遍历得到的值；
             aHistoryMinTab.splice(index,1);
	    });
		var a=$("a[href='#div-"+div+"']");
		$(a).parent().remove();
		$("#div-"+div).remove();
	}
	div = divId;
	creatTabPage(divId,"${pageContext.request.contextPath}/supervisionAndCheck/query.do?id="+id+"&type="+type);
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
</script>