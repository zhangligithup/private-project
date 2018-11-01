<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/imgUpload/zyupload-1.0.0.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/imgUpload/zyupload.basic-1.0.0.min.js"></script>

<div id="zyupload" class="zyupload" style="min-height:400px">
</div>
<input type="hidden" name="imgUrl">
<input type="hidden" name="noticeId" id="noticeId">
<input type="hidden" name="inspectionRecordId" id="inspectionRecordId">
<input type="hidden" name="proposalId" id="proposalId">
</form>
<table class="table search_box marb10">
	<thead>
		<tr>
		     <th>
		     	<input id="inspectionRecord" name="" class="input2" size="16" type="text" readonly>
		     </th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="addInspectionRecord()" style="width:180px">添加现场检查笔录</a></th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="findInspectionRecord() ">编辑</a></th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="deleteInspectionRecord()">删除</a></th>
		</tr>
		<tr>
		     <th>
		     	<input id="proposal" name="" class="input2" size="16" type="text" readonly>
		     </th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="addProposal()" style="width:180px">添加监督检查意见书</a></th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="findProposal()">编辑</a></th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="deleteProposal()">删除</a></th>
		</tr>
		<tr>
		     <th>
		     	<input id="notice" name="" class="input2" size="16" type="text"  readonly>
		     </th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="addNotice()" style="width:180px">添加责令整改通知书</a></th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="findNotice()">编辑</a></th>
		     <th><a href="javascript:void(0)" class="form_btn" onclick="deleteNotice()">删除</a></th>
		</tr>
	</thead>
</table>


<!-- 新增现场检查笔录 -->
<div class="modal fade addsource_modalw" id="mymodal_inspectionRecord" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">       	
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report">添加现场检查笔录</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_inspectionRecord">
                <!-- 隐藏域 主键ID -->
        		<input type="hidden" name="id">
                
                <div class="content_box">
                        <div class="pull-left">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th>被检查单位名称</th>
                                    <td><input type="text" class="login_input width260" name="company"></td>
                                    <th>法定代表人</th>
                                    <td><input type="text" class="login_input width260" name="legalPerson"></td>
                                </tr>
                                <tr>
                                    <th>陪同人员</th>
                                    <td><input type="text" class="login_input width260" name="accompanyPerson"></td>
                                    <th>监督检查类别</th>
                                    <td><input type="text" class="login_input width260" name="type"></td>
                                </tr>
                                <tr>
                                    <th>记录人</th>
                                    <td><input type="text" class="login_input width260" name="recordPerson"></td>
                                    <th>联系方式</th>
                                    <td><input type="text" class="login_input width260" name="tel"></td>
                                </tr>
                                <tr>
                                    <th>检查现场</th>
                                    <td><input type="text" class="login_input width260" name="checkScene"></td>
                                    <th>检查人</th>
                                    <td>
                                    	<input type="text" class="login_input width260" id="person_name" name="" value="${sessionAdmin.name}" readonly>
                                    	<input type="hidden" name="checkPerson" value="${personId}" id="person_id">
                                    </td>
                                </tr>
                                <tr>
                                    <th>检查时间</th>
                                    <td colspan="3">
                                    	<div id="calenderOneBox1041" style="position:relative" class="width220 pull-left">
						                    <input id="calenderOne1041" name="checkStartTime" class="input2 bg_calender" size="16" type="text" value="">
						                </div>
						                <span class="pull-left spanpd">-</span>
						                <div id="calenderOneBox2041" style="position:relative" class="width220 pull-left">
						                    <input id="calenderOne2041" name="checkEndTime" class="input2 bg_calender" size="16" type="text" value="">
						                </div>
                                    </td>
                                    
                                    
                                </tr>                              
                                <tr>
                                    <th >问题记录</th>
                                    <td>
                                    	<textarea name="question" id="question" cols="30" rows="10"  class="login_input login_textarea width500"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th >现场检查记录</th>
                                    <td>
                                    	<textarea name="content" id="content1" cols="30" rows="10"  class="login_input login_textarea width500"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="noborder title_font" ></td>
                                    <td style="text-align: left">
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="saveInspectionRecord1" data-dismiss="modal" onclick="insertInspectionRecord()">保存</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="saveInspectionRecord2" data-dismiss="modal" onclick="updateInspectionRecord()">确定修改</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" data-dismiss="modal">取消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>   
			</form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- 新增监督检查意见书 -->
<div class="modal fade addsource_modal" id="mymodal_proposal" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report">添加监督检查意见书</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_proposal">
            	<!-- 隐藏域 主键ID -->
        		<input type="hidden" name="id">
        		
                <div class="content_box">
                        <div class="pull-left add_personl">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th>被检查单位名称</th>
                                    <td><input type="text" class="login_input width260" name="company"></td>
                                </tr>
                                <tr>
                                    <th>法定代表人</th>
                                    <td><input type="text" class="login_input width260" name="legalPerson"></td>
                                </tr>
                                <tr>
                                    <th>地址</th>
                                    <td><input type="text" class="login_input width260" name="address"></td>
                                </tr>
                                <tr>
                                    <th>联系方式</th>
                                    <td><input type="text" class="login_input width260" name="tel"></td>
                                </tr>
                                <tr>
                                    <th>记录时间</th>
                                    <td>
                                    	<div id="calenderOneBox3041" style="position:relative">
						                    <input id="calenderOne3041" name="proposalTime" class="input2 bg_calender" size="16" type="text" value="">
						                </div>
                                    </td>
                                </tr> 
                                <tr>
                                    <th >监督意见</th>
                                    <td>
                                        <textarea name="supervisionOpinion" id="supervisionOpinion" cols="30" rows="10"  class="login_input login_textarea width500"></textarea>
                                    </td>
                                </tr>                             
                                <tr>
                                    <td class="noborder title_font" ></td>
                                    <td style="text-align: left">
                                    	<a href="javascript:void(0)" class="form_btn   title_font" id="saveProposal1" data-dismiss="modal" onclick="insertProposal()">保存</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="saveProposal2" data-dismiss="modal" onclick="updateProposal()">确定修改</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" data-dismiss="modal">取消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>   
			</form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>



<!-- 新增责令整改通知书 -->
<div class="modal fade addsource_modal" id="mymodal_notice" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report">添加责令整改通知书</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_notice">
            	<!-- 隐藏域 主键ID -->
        		<input type="hidden" name="id">
        		
                <div class="content_box">
                        <div class="pull-left add_personl">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th>被检查单位名称</th>
                                    <td><input type="text" class="login_input width260" name="company"></td>
                                </tr>
                                <tr>
                                    <th>违法行为</th>
                                    <td>
                                    	<textarea name="illegalActivities" id="illegalActivities" cols="30" rows="10"  class="login_input login_textarea width500"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>违法条款</th>
                                    <td>
                                    	<a href="javascript:void (0)" class="form_btn2 marb10"  data-toggle='modal' data-target='#mymodal_choose10000'> 选择条款</a>
						                <input type="hidden" name="illegalids">
						                <input type="hidden" name="illegalcontents">
						                <div class="choose_div " id="div_illegalContents"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>整改日期</th>
                                    <td>
                                    	<div id="calenderOneBox4041" style="position:relative">
						                    <input id="calenderOne4041" name="noticeDate" class="input2 bg_calender" size="16" type="text" value="">
						                </div>
                                    </td>
                                </tr>                              
                                <tr>
                                    <th>整改内容</th>
                                    <td>
                                    	<textarea name="content" id="content1"   class="login_input login_textarea"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="noborder title_font" ></td>
                                    <td style="text-align: left">
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="saveNotice1" data-dismiss="modal" onclick="insertNotice()">保存</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="saveNotice2" data-dismiss="modal" onclick="updateNotice()">确定修改</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" data-dismiss="modal">取消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>   
			</form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- 选择条款 -->
<div class="modal fade addsource_modal" id="mymodal_choose10000" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id=""><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">选择条款</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
			<table class="table search_box marb10">
				<thead>
					<tr>
						<th>违法条款编号</th>
						<th><input id="searchIllegalClauseCode1" class="search_input"
							type="text" value=""></th>
						<th><a class="form_btn" href="#"
							onclick="queryChooseIllegalClause1()">搜索</a></th>
					</tr>
				</thead>
			</table>
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
			    <div id="page_illegalClause1"></div>
            </div>
            <div class="modal-footer">
            	<a href="javascript:void(0)" class="form_btn  width140 title_font" data-dismiss="modal" onclick="chooseIllegalClause1()">选择</a>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
	queryChooseIllegalClause1();
	if(!$("#person_name").val()){
		$("#person_name").val($("#appPersonName").val());
	}
	if(!$("#person_id").val()){
		$("#person_id").val($("#appPersonId").val());
	}
});
/*************************************************************现场检查笔录*******************************************************************************/
function emptyInspectionRecord(){
	$("#data_inspectionRecord").find("input[name='id']").val("");
	$("#data_inspectionRecord").find("input[name='company']").val("");
	$("#data_inspectionRecord").find("input[name='legalPerson']").val("");
	$("#data_inspectionRecord").find("input[name='accompanyPerson']").val("");
	$("#data_inspectionRecord").find("input[name='type']").val("");
	$("#data_inspectionRecord").find("input[name='recordPerson']").val("");
	$("#data_inspectionRecord").find("input[name='tel']").val("");
	$("#data_inspectionRecord").find("input[name='checkScene']").val("");
	$("#data_inspectionRecord").find("input[name='checkStartTime']").val("");
	$("#data_inspectionRecord").find("input[name='checkEndTime']").val("");
	$("#data_inspectionRecord").find("#content1").val("");
}
//添加 现场检查笔录
function addInspectionRecord(){
	emptyInspectionRecord();
	if($("#inspectionRecord").val()){
		alertEase("请勿重复添加",2);
	}else{
		$('#mymodal_inspectionRecord').modal('show');
		$("#saveInspectionRecord1").show();
		$("#saveInspectionRecord2").hide();
		$("input[name='company']").val($("input[name='checkedEnterpriseName']").val());	
		$.ajax({
            url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
            type:"post",
            dataType:"json",
            data:{
                enterpriseName:$("input[name='checkedEnterpriseName']").val()
            },
            success : function(data) {
               $("input[name='legalPerson']").val(data[0].fddelegate);
               $("input[name='legalPerson']").val(data[0].fddelegate);
            }
        });
	}
}

//保存 现场检查笔录
function insertInspectionRecord(){
	if(!$("#calenderOne1041").val()||!$("#calenderOne2041").val()){
		alertEase("检查开始时间或结束时间不能为空",2);
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/insertInspectionRecord.do",
		type:"post",
		data:$('#data_inspectionRecord').serialize(),
		success : function(result) {
			if(result>0){
				alertEase("添加信息成功",1);
				$("input[name='inspectionRecordId']").val(result);
				$("#inspectionRecord").val("现场检查笔录");
			}else{
				alertEase("添加信息失败",2);
			}
		}
	}); 
}

function findInspectionRecord(){
	emptyInspectionRecord();
	if($("#inspectionRecord").val()){
		$('#mymodal_inspectionRecord').modal('show');
		$("#saveInspectionRecord1").hide();
		$("#saveInspectionRecord2").show();
		$.ajax({
			url:"${pageContext.request.contextPath}/supervisionAndCheck/findInspectionRecord.do",
			type:"post",
			dataType:"json",
			data:{
				id:$("input[name='inspectionRecordId']").val()
			},
			success : function(json) {
				$("#data_inspectionRecord").find("input[name='id']").val(json.id);
				$("#data_inspectionRecord").find("input[name='company']").val(json.company);
				$("#data_inspectionRecord").find("input[name='legalPerson']").val(json.legalPerson);
				$("#data_inspectionRecord").find("input[name='accompanyPerson']").val(json.accompanyPerson);
				$("#data_inspectionRecord").find("input[name='type']").val(json.type);
				$("#data_inspectionRecord").find("input[name='recordPerson']").val(json.recordPerson);
				$("#data_inspectionRecord").find("input[name='tel']").val(json.tel);
				$("#data_inspectionRecord").find("input[name='checkScene']").val(json.checkScene);
				$("#data_inspectionRecord").find("input[name='checkStartTime']").val(json.checkStartTime);
				$("#data_inspectionRecord").find("input[name='checkEndTime']").val(json.checkEndTime);
				$("#data_inspectionRecord").find("#person_id").val(json.checkPerson);
                $("#data_inspectionRecord").find("#person_name").val(json.personName);
				$("#data_inspectionRecord").find("#content1").val(json.content);
				$("#data_inspectionRecord").find("#question").val(json.question);
			}
		});
	}else{
		alertEase("请先进行添加操作",2);
	}
}

function updateInspectionRecord(){
	if($("#inspectionRecord").val()){
		$('#mymodal_inspectionRecord').modal('show');
		$.ajax({
			url:"${pageContext.request.contextPath}/supervisionAndCheck/updateInspectionRecord.do",
			type:"post",
			dataType:"json",
			data:$('#data_inspectionRecord').serialize(),
			success : function(json) {
				if(json>0){
					alertEase("修改信息成功",1);
				}else{
					alertEase("修改信息失败",2);
				}
			}
		});
	}else{
		alertEase("请先进行添加操作",2);
	}
}

//删除现场检查笔录
function deleteInspectionRecord(){
	$("#inspectionRecord").val("");
	$("#inspectionRecordId").val("");
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/deleteInspectionRecord.do",
		type:"post",
		data:{
			id:$("input[name='inspectionRecordId']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("删除成功",1);
			}else{
				alertEase("删除失败",2);
			}
		}
	});
}
//下载word文档
function printInspectionRecord(){
	if($("#inspectionRecord").val()){
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","${pageContext.request.contextPath}/supervisionAndCheck/printInspectionRecord.do");
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","id");
		input1.attr("value",$("input[name='inspectionRecordId']").val());
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.submit();
	}else{
		alertEase("请先进行添加操作",2);
	}
}


/*************************************************************监督检查意见书*******************************************************************************/
function emptyProposal(){
	$("#data_proposal").find("input[name='company']").val("");
	$("#data_proposal").find("input[name='legalPerson']").val("");
	$("#data_proposal").find("input[name='address']").val("");
	$("#data_proposal").find("input[name='tel']").val("");
	$("#data_proposal").find("input[name='proposalTime']").val("");
}
//添加 监督检查意见书
function addProposal(){
	emptyProposal();
	if($("#proposal").val()){
		alertEase("请勿重复添加",2);
	}else{
		$('#mymodal_proposal').modal('show');
		$("#saveProposal1").show();
		$("#saveProposal2").hide();
		$("input[name='company']").val($("input[name='checkedEnterpriseName']").val());
		$.ajax({
            url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
            type:"post",
            dataType:"json",
            data:{
                enterpriseName:$("input[name='checkedEnterpriseName']").val()
            },
            success : function(data) {
               $("input[name='legalPerson']").val(data[0].fddelegate);
               $("input[name='address']").val(data[0].scaddress);
            }
        });
	}
}
//保存 监督检查意见书
function insertProposal(){
	if(!$("#calenderOne3041").val()){
        alertEase("记录时间不能为空",2);
        return false;
    }
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/insertProposal.do",
		type:"post",
		dataType:"json",
		data:$('#data_proposal').serialize(),
		success : function(result) {
			if(result!=""){
				alertEase("添加信息成功",1);
				$("input[name='proposalId']").val(result);
				$("#proposal").val("监督检查意见书");
			}else{
				alertEase("添加信息失败",2);
			}
		}
	}); 
}

function findProposal(){
	emptyProposal();
	if($("#proposal").val()){
		$('#mymodal_proposal').modal('show');
		$("#saveProposal1").hide();
		$("#saveProposal2").show();
		$.ajax({
			url:"${pageContext.request.contextPath}/supervisionAndCheck/findProposal.do",
			type:"post",
			dataType:"json",
			data:{
				id:$("input[name='proposalId']").val()
			},
			success : function(json) {
				$("#data_proposal").find("input[name='id']").val(json.id);
				$("#data_proposal").find("input[name='company']").val(json.company);
				$("#data_proposal").find("input[name='legalPerson']").val(json.legalPerson);
				$("#data_proposal").find("input[name='address']").val(json.address);
				$("#data_proposal").find("input[name='tel']").val(json.tel);
				$("#data_proposal").find("input[name='proposalTime']").val(json.proposalTime);
				$("#data_proposal").find("#supervisionOpinion").val(json.supervisionOpinion);
			}
		});
	}else{
		alertEase("请先进行添加操作",2);
	}
}

function updateProposal(){
	if(!$("#calenderOne3041").val()){
        alertEase("记录时间不能为空",2);
        return false;
    }
	if($("#proposal").val()){
		$('#mymodal_proposal').modal('show');
		$.ajax({
			url:"${pageContext.request.contextPath}/supervisionAndCheck/updateProposal.do",
			type:"post",
			dataType:"json",
			data:$('#data_proposal').serialize(),
			success : function(json) {
				if(json>0){
					alertEase("修改信息成功",1);
				}else{
					alertEase("修改信息失败",2);
				}
			}
		});
	}else{
		alertEase("请先进行添加操作",2);
	}
}

//删除监督检查意见书
function deleteProposal(){
	$("#proposal").val("");
	$("#proposalId").val("");
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/deleteProposal.do",
		type:"post",
		data:{
			id:$("input[name='proposalId']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("删除成功",1);
			}else{
				alertEase("删除失败",2);
			}
		}
	});
}
//下载word文档
function printProposal(){
	if($("#proposal").val()){
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","${pageContext.request.contextPath}/supervisionAndCheck/printProposal.do");
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","id");
		input1.attr("value",$("input[name='proposalId']").val());
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.submit();
	}else{
		alertEase("请先进行添加操作",2);
	}
}


/*************************************************************责令整改通知书*******************************************************************************/
function emptyNotice(){
	$("#data_proposal").find("input[name='company']").val("");
	$("#data_proposal").find("input[name='legalPerson']").val("");
	$("#data_proposal").find("input[name='address']").val("");
	$("#data_proposal").find("input[name='tel']").val("");
	$("#data_proposal").find("input[name='proposalTime']").val("");
}
//添加 责令改正通知书
function addNotice(){
	if($("#notice").val()){
		alertEase("请勿重复添加",2);
	}else{
		$('#mymodal_notice').modal('show');
		$("#saveNotice1").show();
		$("#saveNotice2").hide();
		$("input[name='company']").val($("input[name='checkedEnterpriseName']").val());
	}	
}
//保存 责令改正通知书
function insertNotice(){
	if(!$("#calenderOne4041").val()){
        alertEase("整改日期不能为空",2);
        return false;
    }
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/insertNotice.do",
		type:"post",
		dataType:"json",
		data:$('#data_notice').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",1);
				$("input[name='noticeId']").val(json);
				$("#notice").val("责令改正通知书");
			}else{
				alertEase("添加信息失败",2);
			}
		}
	}); 
}


function findNotice(){
	emptyNotice();
	if($("#notice").val()){
		$('#mymodal_notice').modal('show');
		$("#saveNotice1").hide();
		$("#saveNotice2").show();
		$.ajax({
			url:"${pageContext.request.contextPath}/supervisionAndCheck/findNotice.do",
			type:"post",
			dataType:"json",
			data:{
				id:$("input[name='noticeId']").val()
			},
			success : function(json) {
				$("#data_notice").find("input[name='id']").val(json.id);
				$("#data_notice").find("input[name='company']").val(json.company);
				$("#data_notice").find("input[name='noticeDate']").val(json.noticeDate);
				$("#data_notice").find("#content1").val(json.content);
				$("#data_notice").find("#illegalActivities").val(json.illegalActivities);
				$("#data_notice").find("input[name='illegalids']").val(json.illegalids);
				$("#data_notice").find("input[name='illegalcontents']").val(json.illegalcontents);
				$("#data_notice").find("#div_illegalContents").val(json.illegalcontents);
			}
		});
	}else{
		alertEase("请先进行添加操作",2);
	}
}

function updateNotice(){
	if(!$("#calenderOne4041").val()){
        alertEase("整改日期不能为空",2);
        return false;
    }
	if($("#notice").val()){
		$('#mymodal_notice').modal('show');
		$.ajax({
			url:"${pageContext.request.contextPath}/supervisionAndCheck/updateNotice.do",
			type:"post",
			dataType:"json",
			data:$('#data_notice').serialize(),
			success : function(json) {
				if(json>0){
					alertEase("修改信息成功",1);
				}else{
					alertEase("修改信息失败",2);
				}
			}
		});
	}else{
		alertEase("请先进行添加操作",2);
	}
}

//删除责令改正通知书
function deleteNotice(){
	$("#notice").val("");
	$("#noticeId").val("");
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/deleteNotice.do",
		type:"post",
		data:{
			id:$("input[name='noticeId']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("删除成功",1);
			}else{
				alertEase("删除失败",2);
			}
		}
	});
}
//下载word文档
function printNotice(){
	if($("#notice").val()){
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","${pageContext.request.contextPath}/supervisionAndCheck/printNotice.do");
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","id");
		input1.attr("value",$("input[name='noticeId']").val());
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.submit();
	}else{
		alertEase("请先进行添加操作",2);
	}
}


//查询违法条款 
function queryChooseIllegalClause1(curr){
	   $("#dataListTbody_chooseIllegalClause1 tr").remove();
	    var pageNum = 1;
	    if(!curr){
	        //初始化分页
	        $.ajax({
	            url : "${pageContext.request.contextPath}/illegalClause/selectIllegalClauseTotal.do",
	            type : "post",
	            dataType : "json",
	            async: false,
	            data:{
	                illegalClauseCode:$("#searchIllegalClauseCode1").val()
	            },
	            success : function(total) {
	                page("page_illegalClause1",total,10,10,queryChooseIllegalClause1);
	            }
	        });
	    }else{
	        pageNum = curr;
	    }
	    $.ajax({
	        url:"${pageContext.request.contextPath}/illegalClause/selectIllegalClause.do",
	        type:"post",
	        dataType:"json",
	        data:{
	            illegalClauseCode:$("#searchIllegalClauseCode1").val(),
	            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
	            limit:10//每页显示的条数
	        },
	        success : function(json) {
	        	var tr="";
	            for(var i=0;i<json.length;i++) {        
	                tr+="<tr><td><input type='checkbox' name='illegalClauseIdCheckbox1' value="+json[i].illegalClauseId+" illegalClauseContent="+json[i].illegalClauseContent+"></td><td>"+json[i].illegalClauseCode+"</td><td>"+json[i].illegalClauseContent+"</td></tr>"; 
	            }
	            $("#dataListTbody_chooseIllegalClause1").append(tr);
	        }
	    });
}
//选择违法条款 
function chooseIllegalClause1(){
	var illegalClauseIds="";
	var illegalClauseContents="";
	$('input[name="illegalClauseIdCheckbox1"]:checked').each(function(){ 
		illegalClauseIds+=$(this).val()+",";
		illegalClauseContents+=$(this).attr("illegalClauseContent")+",";
	});
	$("input[name='illegalids']").val(illegalClauseIds.substring(0,illegalClauseIds.length-1));
	$("input[name='illegalcontents']").val(illegalClauseContents.substring(0,illegalClauseContents.length-1));
	$("#div_illegalContents").html(illegalClauseContents.substring(0,illegalClauseContents.length-1));
}

$('#calenderOne1041').datetimepicker({
    container:'#calenderOneBox1041',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 0,
    forceParse: 0,
    minuteStep:1,
    format:'yyyy-mm-dd hh:ii'
});

$('#calenderOne2041').datetimepicker({
    container:'#calenderOneBox2041',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 0,
    forceParse: 0,
    minuteStep:1,
    format:'yyyy-mm-dd hh:ii'
});

$('#calenderOne3041').datetimepicker({
    container:'#calenderOneBox3041',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 0,
    forceParse: 0,
    minuteStep:1,
    format:'yyyy-mm-dd hh:ii'
});

$('#calenderOne4041').datetimepicker({
    container:'#calenderOneBox4041',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format:'yyyy-mm-dd'
});



$(function(){
	initFile();
});
function clearFile(){
	 $("#zyupload").html("");
	 initFile();
}
function initFile(){
	ZYFILE.uploadFile = [];
    ZYFILE.lastUploadFile = [];
    ZYFILE.perUploadFile = [];
	   // 初始化插件
    $("#zyupload").zyUpload({
        width            :   "650px",                 // 宽度
        height           :   "auto",                 // 高度
        itemWidth        :   "140px",                 // 文件项的宽度
        itemHeight       :   "115px",                 // 文件项的高度
        fileSize         :   51200000,                // 上传文件的大小
        multiple         :   true,                    // 是否可以多个文件上传
        dragDrop         :   false,                   // 是否可以拖动上传文件
        tailor           :   false,                   // 是否可以裁剪图片
        del              :   true,                    // 是否可以删除文件
        finishDel        :   false,                   // 是否在上传文件完成后删除预览
        /* 外部获得的回调接口 */
        onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
            console.info("当前选择了以下文件：");
            console.info(selectFiles);
        },
        onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
            console.info("当前删除了此文件：");
            console.info(file.name);
        },
        onSuccess: function(file, response){          // 文件上传成功的回调方法
            console.info("此文件上传成功：");
            console.info(file.name);
            console.info("此文件上传到服务器地址：");
            console.info(response);
            $("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
        },
        onFailure: function(file, response){          // 文件上传失败的回调方法
            console.info("此文件上传失败：");
            console.info(file.name);
        },
        onComplete: function(response){               // 上传完成的回调方法
            console.info("文件上传完成");
            console.info(response);
        }
    });
}
function upload() {
	
	var formData = new FormData();
	var num = ZYFILE.uploadFile.length;
	for(var i=0;i<num;i++){
    	formData.append('fileselect',ZYFILE.uploadFile[i]);    //将文件转成二进制形式
	}
   
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
				$("input[name='imgUrl']").val(data)
			}
		},
		error:function(){
			alertEase("保存失败",2);
		}
    });
}
</script>
