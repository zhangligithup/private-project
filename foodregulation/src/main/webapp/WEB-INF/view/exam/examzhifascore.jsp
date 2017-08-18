<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">人员培训</a></li>
            <li><a href="#">试卷管理</a></li>
            <li class="active">执法人员查看结果</li>
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
           <div class="r_txt">共有数据 <font id="total_examzhifaScore${param.id}"></font>条</div>
        </div>
    </div>
    <table class="table search_box marb10">
        <thead>
        <tr>
            <th>答题人名字</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="personNamExamScore${param.id}">
                </div>
            </th>
            <th>监管单位</th>
            <th>
            <select style="width:280px" id="examScoreUnit${param.id}" name="unitId">
                <option value="0">请选择</option>
                <c:forEach items="${unitList}" var="list">
                    <option  value="${list.id}" >${list.tDictionaryName}</option>
                </c:forEach>
            </select>
            </th>
            <th><a class="form_btn" href="#" onclick="queryExamZhifaScoreBasic${param.id}()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>监管单位类型</th>
            <th>答题人</th>
            <th>答题时间</th>
            <th>答题分数</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_examzhifascore${param.id}">
        
        </tbody>
    </table>
    <div id="page_examzhifascore${param.id}"></div>
</div>

<script>
$(document).ready(function(){
	queryExamZhifaScoreBasic${param.id}();
});

function queryExamZhifaScoreBasic${param.id}(curr){
	$("#dataListTbody_examzhifascore${param.id} tr").remove();
	var pageNum = 1;
    var personName=$("#personNamExamScore${param.id}").val();
    var examScoreUnit=$("#examScoreUnit${param.id}").val();

	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/exam/findJianGuanScoreTotal.do",
			type : "post",
			dataType : "json",
			async: false,
            data:{
                examinationId:${param.id},
                personName:personName,
                unitId:examScoreUnit,
            },
			success : function(total) {
				$("#total_examzhifaScore${param.id}").html(total);
				page("page_examzhifascore${param.id}",total,10,10,queryExamZhifaScoreBasic${param.id});
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/findJianGuanScore.do",
		type:"post",
		dataType:"json",
		data:{
            examinationId:${param.id},
            personName:personName,
            unitId:examScoreUnit,
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
                var vreportDate = new Date(json[i].createTime);
                // examinationId,enterpriseType,enterpriseTypeName,operatorId,personName,createTime,SUM(score) AS score
			    tr+="<tr><td>"+json[i].enterpriseTypeName+"</td><td>"+json[i].personName+"</td><td>"+formatDateD(vreportDate)+"</td><td>"+json[i].score+"</td></tr>";
			}
			$("#dataListTbody_examzhifascore${param.id}").append(tr);
		}
	});
}


</script>