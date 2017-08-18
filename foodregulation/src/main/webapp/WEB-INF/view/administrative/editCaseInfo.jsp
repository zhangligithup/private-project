<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">行政处罚</a></li>
            <li class="active">编辑</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
<form id="data_caseInfo1">
    <table class="table table4 marb0">
        <tbody>
        <tr>
            <th >涉案企业<input type="hidden" name="caseInfoId" value="${caseInfo.caseInfoId}"></th>
            <td><input type="text" class="login_input width260" name="caseInfoCompany" value="${caseInfo.caseInfoCompany}"></td>

        </tr>
        <tr>
            <th >立案人</th>
            <td><input type="text" class="login_input width260" name="caseInfoFilingPerson" value="${caseInfo.caseInfoFilingPerson}" ></td>
        </tr>
        <tr>
            <th >案件来源类型</th>
            <td>
            	<input type="hidden" id="select_caseFromId" value="${caseInfo.caseFromId}">
                <select class="select_style1 width260" name="caseInfo_caseFromId" id="caseInfo_caseFromId" >
                
                </select>
            </td>
        </tr>
        <tr>
            <th >立案时间</th>
            <td>
                <div id="calenderOneBox" style="position:relative">
                    <input id="caseInfoTime" name="caseInfoTime" class="login_input bg_calender  width260" size="16" type="text" value="${caseInfo.caseInfoTime}" >
                </div>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >案由</th>
            <td>
                <textarea name="caseInfoReason" id="caseInfoReason" cols="30" rows="10"  class="login_input login_textarea width700">${caseInfo.caseInfoReason}</textarea>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >违法条款</th>
            <td>
                <a href="javascript:void (0)" class="form_btn2 marb10"  data-toggle='modal' data-target='#mymodal_choose11'><img src="${pageContext.request.contextPath }/images/ioc/choose.png"> 选择条款</a>
                <input type="hidden" name="illegalClauseIds" value="${caseInfo.illegalClauseIds}">
                <div class="choose_div width700" id="illegalClauseContents">${caseInfo.illegalClauseContents}</div>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >违法具体内容</th>
            <td>
                <textarea name="illegalClauseDetailContent" id="illegalClauseDetailContent" cols="30" rows="10"  class="login_input login_textarea width700">${caseInfo.illegalClauseDetailContent}</textarea>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >处罚依据</th>
            <td>
                <a href="javascript:void (0)" class="form_btn2 marb10" data-toggle='modal' data-target='#mymodal_choose21'><img src="${pageContext.request.contextPath }/images/ioc/choose.png" > 选择处罚依据</a>
                <input type="hidden" name="punishBasisIds" value="${caseInfo.punishBasisIds}">
                <div class="choose_div width700" id="punishBasisContents">${caseInfo.punishBasisContents}</div>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >处罚具体内容</th>
            <td>
                <textarea name="punishBasisDetailContent" id="punishBasisDetailContent" cols="30" rows="10"  class="login_input login_textarea width700">${caseInfo.punishBasisDetailContent}</textarea>
            </td>
        </tr>
        <tr>
            <td class="noborder title_font" ></td>
            <td style="text-align: left">
                <a href="javascript:void(0)" class="form_btn  width140 title_font" onclick="updateCaseInfo()">确认修改</a>
            </td>
        </tr>

        </tbody>
    </table>
</form>
</div>


<!-- 选择条款 -->
<div class="modal fade addsource_modal" id="mymodal_choose11" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id=""><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">选择条款</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
				<table class="table table-bordered table2">
			        <thead>
			        <tr>
			        	<th></th>
			            <th>编号</th>
			            <th>类型名称</th>
			        </tr>
			        </thead>
			        <tbody id="dataListTbody_chooseIllegalClause1">
			
			        </tbody>
			    </table>
            </div>
            <div class="modal-footer">
            	<a href="javascript:void(0)" class="form_btn  width140 title_font" data-dismiss="modal" onclick="chooseIllegalClause1()">选择</a>
            </div>
        </div>
    </div>
</div>
<!-- 选择依据 -->
<div class="modal fade addsource_modal" id="mymodal_choose21" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id=""><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">选择处罚依据</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
				<table class="table table-bordered table2">
			        <thead>
			        <tr>
			        	<th></th>
			            <th>编号</th>
			            <th>类型名称</th>
			        </tr>
			        </thead>
			        <tbody id="dataListTbody_choosePunishBasis1">
			
			        </tbody>
			    </table>
            </div>
            <div class="modal-footer">
            	<a href="javascript:void(0)" class="form_btn  width140 title_font" data-dismiss="modal" onclick="choosePunishBasis1()">选择</a>
            </div>
        </div>
    </div>
</div>


<script>
$(document).ready(function(){
	querySelectCaseFrom1();
	queryChooseIllegalClause1();
	queryChoosePunishBasis1();
});

//查询违法条款 
function queryChooseIllegalClause1(){
	$.ajax({
		url:"${pageContext.request.contextPath}/illegalClause/selectIllegalClause.do",
		type:"post",
		dataType:"json",
		data:{},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td><input type='checkbox' name='illegalClauseIdCheckbox' value="+json[i].illegalClauseId+" illegalClauseContent="+json[i].illegalClauseContent+"></td><td>"+json[i].illegalClauseCode+"</td><td>"+json[i].illegalClauseContent+"</td></tr>";	
			}
			$("#dataListTbody_chooseIllegalClause1").append(tr);
		}
	});
}
//查询处罚依据
function queryChoosePunishBasis1(){
	$.ajax({
		url:"${pageContext.request.contextPath}/punishBasis/selectPunishBasis.do",
		type:"post",
		dataType:"json",
		data:{},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td><input type='checkbox' name='punishBasisIdCheckbox' value="+json[i].punishBasisId+" punishBasisContent="+json[i].punishBasisContent+"></td><td>"+json[i].punishBasisCode+"</td><td>"+json[i].punishBasisContent+"</td></tr>";	
			}
			$("#dataListTbody_choosePunishBasis1").append(tr);
		}
	});
}
//选择违法条款 
function chooseIllegalClause1(){
	var illegalClauseIds="";
	var illegalClauseContents="";
	$('input[name="illegalClauseIdCheckbox"]:checked').each(function(){ 
		illegalClauseIds+=$(this).val()+",";
		illegalClauseContents+=$(this).attr("illegalClauseContent")+",";
	});
	$("input[name='illegalClauseIds']").val(illegalClauseIds.substring(0,illegalClauseIds.length-1));
	$("#illegalClauseContents").html(illegalClauseContents.substring(0,illegalClauseContents.length-1));
}
//选择处罚依据
function choosePunishBasis1(){
	var punishBasisIds="";
	var punishBasisContents="";
	$('input[name="punishBasisIdCheckbox"]:checked').each(function(){ 
		punishBasisIds+=$(this).val()+",";
		punishBasisContents+=$(this).attr("punishBasisContent")+",";
	});
	$("input[name='punishBasisIds']").val(punishBasisIds.substring(0,punishBasisIds.length-1));
	$("#punishBasisContents").html(punishBasisContents.substring(0,punishBasisContents.length-1));
}


//查询案件来源 （selec下拉框）
function querySelectCaseFrom1(){
	$.ajax({
		url:"${pageContext.request.contextPath}/casefrom/selectCasefrom.do",
		type:"post",
		dataType:"json",
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				if(json[i].caseFromId==$("#select_caseFromId").val()){
					$("#caseInfo_caseFromId").append("<option value='"+json[i].caseFromId+"' selected>"+json[i].caseFromContent+"</option>");
				}else{
					$("#caseInfo_caseFromId").append("<option value='"+json[i].caseFromId+"'>"+json[i].caseFromContent+"</option>");
				}		
			}

		}
	});
}

function updateCaseInfo(){
	$.ajax({
		url:"${pageContext.request.contextPath}/caseInfo/updateCaseInfo.do",
		type:"post",
		dataType:"json",
		data:$('#data_caseInfo1').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
		}
	});
}
</script>
