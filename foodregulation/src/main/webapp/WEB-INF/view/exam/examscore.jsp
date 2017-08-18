<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">人员培训</a></li>
            <li><a href="#">试卷管理</a></li>
            <li class="active">查看结果</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_examScore${param.id}"></font>条</div>
        </div>
    </div>
    <table class="table search_box marb10">
        <thead>
        <tr>
            <th>企业名称</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="enterpriseNamExamScore${param.id}">
                </div>
            </th>
            <th>企业类别</th>
            <th>
                <select class="select_style1" id="enterpriseTypeExamScore${param.id}">
                    <option value="" selected>请选择</option>
                    <c:forEach  items="${enterpriseTypeList}" var="enterpriseType">
                        <option  value="${enterpriseType.id}" >${enterpriseType.tDictionaryName}</option>
                    </c:forEach >
                </select>
            </th>
            <th><a class="form_btn" href="#" onclick="queryExamScoreBasic${param.id}()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>企业类别</th>
            <th>企业名称</th>
            <th>答题人</th>
            <th>答题时间</th>
            <th>答题分数</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_examscore${param.id}">
        
        </tbody>
    </table>
    <div id="page_examscore${param.id}"></div>
</div>

<script>
$(document).ready(function(){
	queryExamScoreBasic${param.id}();
});

function queryExamScoreBasic${param.id}(curr){
	$("#dataListTbody_examscore${param.id} tr").remove();
	var pageNum = 1;
    var enterpriseName=$("#enterpriseNamExamScore${param.id}").val();
    var enterpriseType=$("#enterpriseTypeExamScore${param.id}").val();
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/exam/findCongYeScoreTotal.do",
			type : "post",
			dataType : "json",
			async: false,
            data:{
                examinationId:${param.id},
                enterpriseName:enterpriseName,
                enterpriseType:enterpriseType,
            },
			success : function(total) {
				$("#total_examScore${param.id}").html(total);
				page("page_examscore${param.id}",total,10,10,queryExamScoreBasic${param.id});
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/findCongYeScore.do",
		type:"post",
		dataType:"json",
		data:{
            examinationId:${param.id},
            enterpriseName:enterpriseName,
            enterpriseType:enterpriseType,
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
                var vreportDate = new Date(json[i].createTime);
                //examinationId,enterpriseType,enterpriseTypeName,componyName,operatorId,personName,createTime,SUM(score) AS score
			    tr+="<tr><td>"+json[i].enterpriseTypeName+"</td><td>"+json[i].componyName+"</td><td>"+json[i].personName+"</td><td>"+formatDateD(vreportDate)+"</td><td>"+json[i].score+"</td></tr>";
			}
			$("#dataListTbody_examscore${param.id}").append(tr);
		}
	});
}


</script>