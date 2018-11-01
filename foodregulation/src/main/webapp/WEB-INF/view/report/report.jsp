<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">投诉举报</a></li>
            <li class="active">投诉举报</li>
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
            <th >
                <div class="search_parent" style="width:400px">
                    <input type="text" class="search_input" name="search_reportCompany" placeholder="搜素企业名称">
                    <a class="search_btn" onclick="searchReport()">搜索</a>
                </div>
            </th>
            <th>投诉日期</th>
             <th>
                 <div id="calenderOneBox2" style="position:relative">
                     <input id="reportTime" name="reportTime" class="bg_calender" size="16" type="text" >
                 </div>
             </th>
             <th><a href="javascript:void(0)" class="form_btn " onclick="searchDateReport()">筛选</a></th>
        </tr>
        </thead>
    </table>                     
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_report' onclick="addReport()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加投诉举报</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_report"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>投诉企业名称</th>
            <th>投诉类型</th>
            <th>投诉人姓名</th>
            <th>投诉人电话</th>
            <th>投诉时间</th>
            <th>执行人员</th>
            <th>状态</th>
            <th>操作</th>
        </tr> 
        </thead>
        <tbody id="dataListTbody_report">

        </tbody>
    </table>
    <div id="page_report"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_report" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加投诉举报</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_report">
                <div class="content_box">
                        <div class="pull-left add_personl">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th>投诉类型<input type="hidden" name="reportId"></th>
                                    <td>
                                        <select class="select_style1 width260" id="reportTypeId" name="reportTypeId">
                                           
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>投诉日期</th>
                                    <td>
                                        <div id="calenderOneBox3" style="position:relative">
                     						<input id="reportTime1" name="reportTime" class="bg_calender login_input width260" type="text" >
                 						</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th >投诉人姓名</th>
                                    <td><input type="text" class="login_input width260" name="reportName"></td>

                                </tr>                              
                                <tr>
                                    <th>联系电话</th>
                                    <td><input type="text" class="login_input width260" name="reportTel"></td>
                                </tr>
                                <tr>
                                    <th >被投诉企业名称</th>
                                    <td><input type="text" class="login_input width260" id="reportCompany" name="reportCompany"></td>
                                </tr>
                                <tr>
                                    <th >被投诉企业地址</th>
                                    <td><input type="text" class="login_input width260" name="reportAddress"></td>
                                </tr>
                                <tr>
                                    <th >所在行政区域</th>
                                    <td>
                                    	<select class="select_style1 width260" id="reportAdministrationAddressCode" name="reportAdministrationAddressCode">
                                           
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th >投诉内容</th>
                                    <td>
                                    	<textarea name="reportContent" id="reportContent" cols="30" rows="10"  class="login_input login_textarea width500"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="noborder title_font" ></td>
                                    <td style="text-align: left">
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="save_report" data-dismiss="modal" onclick="insertReport()">提 交</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font" id="update_report" data-dismiss="modal" onclick="updateReport()">修改</a>
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

<!--查看详情  -->
<div class="modal fade addsource_modal" id="mymodal_report_details" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">查看详情</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <div class="content_box" id="details">
                        <div class="pull-left add_personl">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th>投诉类型</th>
                                    <td><input type="text" class="login_input width260" name="reportTypeId2" readonly></td>
                                </tr>
                                <tr>
                                    <th>投诉日期</th>
                                    <td><input type="text" class="login_input width260" name="reportTime2" readonly></td>
                                </tr>
                                <tr>
                                    <th >投诉人姓名</th>
                                    <td><input type="text" class="login_input width260" name="reportName2" readonly></td>

                                </tr>                              
                                <tr>
                                    <th>联系电话</th>
                                    <td><input type="text" class="login_input width260" name="reportTel2" readonly></td>
                                </tr>
                                <tr>
                                    <th >被投诉企业名称</th>
                                    <td><input type="text" class="login_input width260" name="reportCompany2" readonly></td>
                                </tr>
                                <tr>
                                    <th >被投诉企业地址</th>
                                    <td><input type="text" class="login_input width260" name="reportAddress2" readonly></td>
                                </tr>
                                <tr>
                                    <th >所在行政区域</th>
                                    <td><input type="text" class="login_input width260" name="reportAdministrationAddressCode2" readonly></td>
                                </tr>
                                <tr>
                                    <th >投诉内容</th>
                                    <td>
                                    	<textarea name="reportContent2" id="reportContent2" cols="30" rows="10"  class="login_input login_textarea width500" readonly></textarea>
                                    </td>
                                </tr>
                                <tr>
	                                <th>承办人姓名</th>
	                                <td><input type="text" class="login_input width260" name="createPepole2" readonly></td>
	                            </tr>
	                            <tr>
	                                <th>是否满意</th>
	                                <td><input type="radio" name="isSatisfied2" value="0">满意<input type="radio" name="isSatisfied2" value="1">不满意</td>
	                            </tr>
	                            <tr>
	                                <th>是否立案</th>
	                                <td><input type="radio" name="isRecord2" value="0" >立案<input type="radio" name="isRecord2" value="1"  >不立案</td>
	                            </tr>
	                            <tr>
			                        <th>附件列表</th>
			                        <td>
			                        	<a href="" id="reportFile_check1"></a>
			                        </td>
			                    </tr>
	                            <tr>
	                                <th>办理情况</th>
	                                <td>
	                                	<textarea name="solveSituation2" id="solveSituation2" cols="30" rows="10"  class="login_input login_textarea width500" readonly></textarea>
	                               </td>
	                            </tr>
	                            <tr>
		                            <td colspan="2">
		                            	<div id="img"></div>
		                            </td>
	                            </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- 分配任务 -->
<div class="modal fade addsource_modal" id="mymodal102" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">分配任务</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_assignTask">
            <!--隐藏域> 分配任务  投诉举报主键ID -->
        	<input type="hidden" name="reportId1">
                <div class="content_box">
                    <div class="pull-left add_personl">
                        <table class="table table4 marb0">
                            <tbody>
                            <tr>
                                <th>监管单位</th>
                                <td>
                                    <select class="select_style1 width260" id="reportLocalId" name="reportLocalId">
                                       <option value="abc">----请选择----</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>执法人员</th>
                                <td>
                                	<select class="select_style1 width260" id="reportOfficialPersonId" name="reportOfficialPersonId">
                                       
                                    </select>
                               </td>
                            </tr>                              
                            <tr>
                                <td class="noborder title_font" ></td>
                                <td style="text-align: left">
                                    <a href="javascript:void(0)" class="form_btn   title_font"  onclick="assignTaskSubmit()" data-dismiss="modal">提 交</a>
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
<!--投诉处理  -->
<div class="modal fade addsource_modal" id="mymodal103" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_report"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">投诉处理</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_handle">
            <!--隐藏域> 投诉处理  投诉举报主键ID -->
            <input type="hidden" name="reportId">
                <div class="content_box">
                    <div class="pull-left add_personl">
                        <table class="table table4 marb0">
                            <tbody>
                            <tr>
                                <th>承办人姓名</th>
                                <td><input type="text" class="login_input width260" name="createPepole"></td>
                            </tr>
                            <tr>
                                <th>是否满意</th>
                                <td><input type="radio" name="isSatisfied" value="0">满意<input type="radio" name="isSatisfied" value="1">不满意</td>
                            </tr>
                            <tr>
                                <th>是否立案</th>
                                <td><input type="radio" name="isRecord" value="0" >立案<input type="radio" name="isRecord" value="1"  >不立案</td>
                            </tr>
                            <tr>
		                        <th>上传附件</th>
		                        <td><input id="reportFile" type="file" name="file"></td>
			                </tr>
                            <tr>
                                <th>办理情况</th>
                                <td>
                                	<textarea name="solveSituation" id="solveSituation" cols="30" rows="10"  class="login_input login_textarea width500"></textarea>
                               </td>
                            </tr>                              
                            <tr>
                                <td class="noborder title_font" ></td>
                                <td style="text-align: left">
                                    <a href="javascript:void(0)" class="form_btn   title_font" id="handleReportSave"  onclick="handleReportSave()" data-dismiss="modal">立即处理</a>
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
<script>
$(document).ready(function(){
	queryReport();
	querySelectReportType();
	querySelectReportAdministrationAddress();
	querySelectLocal();
	likeEnterprise();
});
var reportCompany;
var reportTime;

$("#mymodal102").on("hidden.bs.modal",function(){
	$("#reportOfficialPersonId").html("");
	$("#reportLocalId").find("option").each(function(){  
        if($(this).val() == "abc"){  
           $(this).attr("selected","selected");  
           return false;  
        }  
    });	
});
//分配任务 
function assignTask(reportId){
	$("input[name='reportId1']").val(reportId);
	$("#reportOfficialPersonId").find("option").each(function(){  
        if($(this).val() == "abc"){  
           $(this).attr("selected","selected");  
           return false;  
        }  
    });	
}


//分配任务 --提交 
function assignTaskSubmit(){
	$.ajax({
		url:"${pageContext.request.contextPath}/report/updateReport.do",
		type:"post",
		dataType:"json",
		data:{
			reportId:$("input[name='reportId1']").val(),
			reportLocalId:$("#reportLocalId").val(),
			reportOfficialPersonId:$("#reportOfficialPersonId").val(),
		},
		success : function(json) {
			if(json>0){
				alertEase("分配任务成功",'alert_succ');
			}else{
				alertEase("分配任务失败",'alert_err');
			}
			emptyFormReport();
			queryReport();
		}
	});
}

//清空表单 
function emptyFormReport(){
	$("#data_report").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("input[name='reportId']").val("");
	$("#reportContent").val("");
}
//查询加载投诉类型 下拉框
function querySelectReportType(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:3
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#reportTypeId").append("<option value='"+json[i].id+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
//查询加载行政区域 下拉框 
function querySelectReportAdministrationAddress(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:0
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#reportAdministrationAddressCode").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}
//查询加载监管单位  下拉框
function querySelectLocal(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:2
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#reportLocalId").append("<option value='"+json[i].id+"'>"+json[i].tDictionaryName+"</option>");
			}
			$("#reportLocalId").on("change",function(){
				$("#reportOfficialPersonId option").remove();  
				querySelectPerson($(this).val());
			})
		}
	});
}
//查询加载执法人员   下拉框
function querySelectPerson(personCompanyId){
	$.ajax({
		url:"${pageContext.request.contextPath}/personInfo/selectPersonInfo.do",
		type:"post",
		dataType:"json",
		data:{
			personCompanyId:personCompanyId
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				$("#reportOfficialPersonId").append("<option value='"+json[i].personId+"'>"+json[i].personName+"</option>");
			}
		}
	});
}

function queryReport(curr){
	$("#dataListTbody_report tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/report/selectReportTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				reportCompany:reportCompany,
				reportTime:reportTime
			},
			success : function(total) {
				$("#total_report").html(total);
				page("page_report",total,10,10,queryReport);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/report/selectReport.do",
		type:"post",
		dataType:"json",
		data:{
			reportTime:reportTime,
			reportCompany:reportCompany,
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+(i+1)+"</td><td>"+json[i].reportCompany+"</td><td>"+json[i].reportTypeName+"</td><td>"+json[i].reportName+"</td><td>"+json[i].reportTel+"</td><td>"+json[i].reportTime+"</td><td>"+(json[i].personName==null?'':json[i].personName)+"</td><td>"+(json[i].reportStatus=='1'?'已处理':'未处理')+"</td><td><a href='javascript:void(0)' class='editer_btns look_btn' data-toggle='modal' data-target='#mymodal_report_details'  onclick='detailReport("+json[i].reportId+")'>查看</a>";
			    if("${sessionAdmin.username}"=="admin"){
			        tr+="<a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal102' onclick='assignTask("+json[i].reportId+")'>分配任务</a><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_report'  onclick='findReport("+json[i].reportId+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteReport("+json[i].reportId+")'>删除</a>";
			    }
			    tr+="<a href='javascript:void(0)' class='editer_btns edit_btn'  onclick='handleReport("+json[i].reportId+","+json[i].reportStatus+")'>投诉处理</a></td></tr>";	
			}
			$("#dataListTbody_report").append(tr);
		}
	});
}

function addReport(){
	$("#save_report").show();
	$("#update_report").hide();
	emptyFormReport();
	$("#title_report").html("添加投诉举报");
}

function insertReport(){
	$.ajax({
		url:"${pageContext.request.contextPath}/report/insertReport.do",
		type:"post",
		dataType:"json",
		data:$('#data_report').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyFormReport();
			queryReport();
		}
	}); 
}

function findReport(reportId){
	$("#save_report").hide();
	$("#update_report").show();
	$("#title_report").html("修改投诉举报");
	$.ajax({
		url:"${pageContext.request.contextPath}/report/findReport.do",
		type:"post",
		dataType:"json",
		data:{
			reportId:reportId
		},
		success : function(json) {
			$("input[name='reportId']").val(json.reportId);
			$("input[name='reportName']").val(json.reportName);
			$("input[name='reportTel']").val(json.reportTel);			
			$("input[name='reportCompany']").val(json.reportCompany);
			$("#reportContent").val(json.reportContent);
			$("#reportTime1").val(json.reportTime);
			$("input[name='reportAddress']").val(json.reportAddress);
			$("#reportAdministrationAddressCode").find("option").each(function(){  
                if(json.reportTypeId == $(this).val()){  
                   $(this).attr("selected","selected");  
                }  
            });
			$("#reportTypeId").find("option").each(function(){  
                if(json.reportTypeId == $(this).val()){  
                   $(this).attr("selected","selected");  
                   return false;  
                }  
            });	
		}
	});
}

function detailReport(reportId){
	$("#details").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("#reportContent2").val("");
	$("#solveSituation2").val("");
	$("input[name='isSatisfied2']").removeAttr("checked");
	$("input[name='isRecord2']").removeAttr("checked");
	$.ajax({
		url:"${pageContext.request.contextPath}/report/findReport.do",
		type:"post",
		dataType:"json",
		data:{
			reportId:reportId
		},
		success : function(json) {
			$("#reportFile_check1").attr("href","${pageContext.request.contextPath}/notification/download.do?url="+json.imgUrl);
			$("#reportFile_check1").html(json.imgUrl);
			$("input[name='reportName2']").val(json.reportName);
			$("input[name='reportTel2']").val(json.reportTel);			
			$("input[name='reportCompany2']").val(json.reportCompany);
			$("#reportContent2").val(json.reportContent);
			$("input[name='reportTime2']").val(json.reportTime);
			$("input[name='reportAddress2']").val(json.reportAddress);
			$("input[name='reportAdministrationAddressCode2']").val(json.reportAdministrationAddressName);
			$("input[name='reportTypeId2']").val(json.reportTypeName);	
			$("input[name='createPepole2']").val(json.createPepole);
			$("#solveSituation2").val(json.solveSituation);
			$("input[name='isSatisfied2']").each(function(){  
                if(json.isSatisfied == $(this).val()){
                   $(this).prop("checked","checked");
                }  
                $(this).attr("disabled","disabled");
            });
			$("input[name='isRecord2']").each(function(){  
                if(json.isRecord == $(this).val()){  
                   $(this).prop("checked","checked");
                }  
                $(this).attr("disabled","disabled");
            });
			/* if(json.imgUrl){
				var urls = json.imgUrl.split(",");
				var img = "";
				for(var i = 0;i<urls.length;i++){
					img = img + "<img src='"+urls[i]+"'>"
				}
				$("#img").html(img);
			} */
		}
	});
}
//投诉处理 
function handleReport(reportId,reportStatus){
	$("input[name='createPepole']").val("");
	$("#solveSituation").val("");
	$("input[name='reportId']").val(reportId);
	if(reportStatus=="1"){
		alertEase("请勿重复处理 ",'alert_err');
		/* $("#handleReportSave").hide();
		$.ajax({
			url:"${pageContext.request.contextPath}/solveReport/findHandleReport.do",
			type:"post",
			dataType:"json",
			data:{
				reportId:reportId
			},
			success : function(json) {
				$("input[name='createPepole']").val(json.createPepole);
				$("#solveSituation").val(json.solveSituation);
				$("input[name='isSatisfied']").each(function(){  
	                if(json.isSatisfied == $(this).val()){  
	                   $(this).attr("checked","checked");
	                }  
	            });
				$("input[name='isRecord']").each(function(){  
	                if(json.isRecord == $(this).val()){  
	                   $(this).attr("checked","checked");
	                }  
	            });
			}
		}); */
	}else{
		$("#mymodal103").modal('show');
		$("#handleReportSave").show();
	}
}
function handleReportSave(){
	
	var formData = new FormData();
    formData.append('file',$("#reportFile")[0].files[0]);    //将文件转成二进制形式
    formData.append('reportId',$("input[name='reportId']").val());
    formData.append('createPepole',$("input[name='createPepole']").val());
    formData.append('isSatisfied',$("input[name='isSatisfied']:checked").val());
    formData.append('isRecord',$("input[name='isRecord']:checked").val());
    formData.append('solveSituation',$("#solveSituation").val());
	
	$.ajax({
		url:"${pageContext.request.contextPath}/solveReport/handleReport.do",
		type:"post",
		async:false,
        contentType: false,    //这个一定要写
        processData: false, //这个也一定要写，不然会报错
        data:formData,
        dataType:'text',    //返回类型，有json，text，HTML。
		success : function(json) {
			if(json>0){
				alertEase("投诉处理成功",'alert_succ');
			}else{
				alertEase("投诉处理失败",'alert_err');
			}
			queryReport();
		}
	});
}

initFileInput("reportFile");
//文件上传控件初始化
function initFileInput(ctrlName) {    
  var control = $('#' + ctrlName); 
  control.fileinput({
      language: 'zh', //设置语言
      showUpload: false, //是否显示上传按钮
      showPreview:false,//是否显示文件预览图
      showCaption: true,//是否显示文件标题
     // allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀格式名
      browseClass: "btn btn-primary", //按钮样式             
      previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
  });
}

function updateReport(){
	$.ajax({
		url:"${pageContext.request.contextPath}/report/updateReport.do",
		type:"post",
		dataType:"json",
		data:$('#data_report').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyFormReport();
			queryReport();
		}
	});
}

function deleteReport(reportId){
	confirmMessage('con_report','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/report/deleteReport.do",
			type:"post",
			dataType:"json",
			data:{
				reportId:reportId
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryReport();
			}
		});	
	}
}

//搜素企业名称
function searchReport(){
	reportCompany = $("input[name='search_reportCompany']").val();
	queryReport();
}

function searchDateReport(){
	reportTime = $("input[name='reportTime']").val();
	queryReport();
}

$('#reportTime').datetimepicker({
    container:'#calenderOneBox2',
    language:  'fr',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format:'yyyy-mm-dd'
});

$('#reportTime1').datetimepicker({
    container:'#calenderOneBox3',
    language:  'fr',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format:'yyyy-mm-dd'
});

//企业下拉框
function likeEnterprise() {
	$.ajax({
		url:"${pageContext.request.contextPath}/enterpriseInfo/likeEnterprise.do",
		type:"post",
		dataType:"json",
		success : function(datas) {
			$("#reportCompany").focus(function(){
				showPullDownSearchData('reportCompany',datas,itemSelectFuntion);
			});

			$("input[name='reportCompany']").val(this.text);
			var itemSelectFuntion = function(){
				for(var i=0;i<datas.length;i++) {
					if(datas[i].id==this.id) {
						$("input[name='reportAddress']").val(datas[i].address);
					}
				}		
			};
		}
	});
}
</script>