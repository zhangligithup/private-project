<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">从业人员体检</a></li>
            <li class="active">体检信息</li>
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
            <th>体验人员姓名/企业名称</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="physicalSearch">
                </div>
            </th>
            <th><a class="form_btn" href="#" onclick="queryPhysicalBasic()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_physical' onclick="addBtnPhysical()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加记录</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_physical"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>企业名称</th>
            <th>体检医院</th>
            <th>体检人姓名</th>
            <th>体检日期</th>
            <th>报告日期</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_physical">
        
        </tbody>
    </table>
    <div id="page_physical"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_physical" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_physical"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加体检记录</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_physical">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td>企业类别</td>
                        <td>
                            <select class="select_style1" name="enterpriseTypeId" id="enterpriseTypePhysical">
                                <option value="" selected>请选择</option>
                                <c:forEach  items="${enterpriseTypeList}" var="enterpriseType">
                                    <option  value="${enterpriseType.tDictionaryCode}" >${enterpriseType.tDictionaryName}</option>
                                </c:forEach >
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">企业名称<input type="hidden" name="id" id="vphysicalId"></td>
                        <td><input type="text" class="login_input" name="companyName" id="companyName"></td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">体检医院</td>
                        <td><input type="text" class="login_input" name="hospital"></td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">体检人姓名</td>
                        <td><input type="text" class="login_input" name="physicalName"></td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">身份证号</td>
                        <td><input type="text" class="login_input" name="idNumber"></td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">联系电话</td>
                        <td><input type="text" class="login_input" name="phone"></td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">体检日期</td>
                        <td class="width220 ">
                            <div id="physical_date_calenderOneBox" style="position:relative">
                                <input id="physical_date_calender" class="login_input bg_calender" size="16" type="text" name="physicalDateStr" readonly value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">报告日期</td>
                        <td class="width220 ">
                            <div id="physical_report_date_calenderOneBox" style="position:relative">
                                <input id="physical_report_date_calender" class="login_input bg_calender" size="16" type="text" name="reportDateStr" readonly value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">上传健康证照片</td>
                        <td id="physicalFileTd">
                             <input id="physicalFile" type="file" name="file">
                        </td>
                    </tr>
                    <tr>
                    	<td id="td_img"><img id="image" style="width:120px;height:120px" alt="" src="" data-action='zoom' class='pull-left'></td>
                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_physical"  data-dismiss="modal" onclick="addPhysical()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_physical"  data-dismiss="modal" onclick="updatePhysical()">确认修改</a>
                        </td>

                    </tr>
                    </tbody>
                </table>
			</form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
    $('#physical_date_calender').datetimepicker({
        container:'#physical_date_calenderOneBox',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format:'yyyy-mm-dd'
    });
    $('#physical_report_date_calender').datetimepicker({
        container:'#physical_report_date_calenderOneBox',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format:'yyyy-mm-dd'
    });
	queryPhysicalBasic();
	initFileInput("physicalFile");
});

//清空表单 
function emptyFormPhysical(){
	$("#data_physical").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("#physicalFileTd").html("");
    $("#physicalFileTd").html('<input id="physicalFile" type="file" name="file">');
    initFileInput("physicalFile");
}
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
function queryPhysicalBasic(curr){
	$("#dataListTbody_physical tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/physical/selectPhysicalTotal.do",
			type : "post",
			dataType : "json",
            data: {
                physicalSearch: $("#physicalSearch").val()
            },
			async: false,
			success : function(total) {
				$("#total_physical").html(total);
				page("page_physical",total,10,10,queryPhysicalBasic);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/physical/selectPhysical.do",
		type:"post",
		dataType:"json",
		data:{
            physicalSearch:$("#physicalSearch").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
                var vphysicalDate = new Date(json[i].physicalDate);
                var vreportDate = new Date(json[i].reportDate);

			    tr+="<tr><td>"+json[i].id+"</td><td>"+json[i].companyName+"</td><td>"+json[i].hospital+"</td><td>"+json[i].physicalName+"</td><td>"+formatDatedD(vphysicalDate)+"</td><td>"+formatDatedD(vreportDate)+"</td><td>"+json[i].state+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_physical'  onclick='findPhysical("+json[i].id+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deletePhysical("+json[i].id+")'>删除</a></td></tr>";
			}
			$("#dataListTbody_physical").append(tr);
		}
	});
}

function addBtnPhysical(){
	$("#save_physical").show();
	$("#update_physical").hide();
    $("#enterpriseTypePhysical").removeAttr("disabled");
    $("input[name='phone']").removeAttr("disabled");
	emptyFormPhysical();
	$("#title_physical").html("添加记录");
	$("#td_img").hide();
}

function addPhysical(){
    $("#vphysicalId").val("");
    var formData = new FormData($('#data_physical')[0]);
	$.ajax({
		url:"${pageContext.request.contextPath}/physical/addPhysical.do",
		type:"post",
		async:false,
	    contentType: false,   
	    processData: false,
		data:formData,
		dataType:'json', 
		success : function(data) {
            if(data.result=="true"){
                alertEase("新增成功",'1');
                emptyFormPhysical();
                queryPhysicalBasic();
            }else{
                alertEase("新增失败! "+data.msg,'2');
            }
		}
	}); 
}

function findPhysical(id){
	$("#save_physical").hide();
	$("#update_physical").show();
	$("#title_physical").html("修改记录");
	$("#td_img").show();
	$.ajax({
		url:"${pageContext.request.contextPath}/physical/findPhysical.do",
		type:"post",
		dataType:"json",
		data:{
			id:id
		},
		success : function(json) {
            var vphysicalDate = new Date(json.physicalDate);
            var vreportDate = new Date(json.reportDate);


            $("#enterpriseTypePhysical").val(json.enterpriseTypeId);
            $("#enterpriseTypePhysical").attr("disabled","disabled");

			$("#vphysicalId").val(json.id);
			if(json.url){
			    $("#image").attr("src","http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+json.url);
			}
			$("input[name='companyName']").val(json.companyName);
			$("input[name='hospital']").val(json.hospital);
			$("input[name='physicalName']").val(json.physicalName);
			$("input[name='idNumber']").val(json.idNumber);
			$("input[name='phone']").val(json.phone);
			$("input[name='phone']").attr("disabled","disabled");

			$("input[name='physicalDateStr']").val(formatDatedD(vphysicalDate));
			$("input[name='reportDateStr']").val(formatDatedD(vreportDate));

		}
	});
}

function updatePhysical(){
	var formData = new FormData($('#data_physical')[0]);
	$.ajax({
		url:"${pageContext.request.contextPath}/physical/updatePhysical.do",
		type:"post",
		async:false,
	    contentType: false,   
	    processData: false,
		data:formData,
		dataType:'json', 
		success : function(data) {
            if(data.result=="true"){
				alertEase("修改信息成功",'alert_succ');
                emptyFormPhysical();
                queryPhysicalBasic();
			}else{
				alertEase("修改信息失败",'alert_err');
			}

		}
	});
}

function deletePhysical(id){
	confirmMessage('con_punishBasis','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/physical/delPhysical.do",
			type:"post",
			dataType:"json",
			data:{
				id:id
			},
			success : function(data) {
                if(data.result=="true"){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryPhysicalBasic();
			}
		});	
	}
}
$("#enterpriseTypePhysical").on("change",function(){
	if($(this).val()){
		$.ajax({
			url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterpriseNameList.do",
			type:"post",
			dataType:"json",
			data:{
				type:$(this).val()
			},
			success:function (data){
				showPullDownSearchData("companyName",data,function (){});
			}
		});
	}
});
$("#data_physical").find("input[name='companyName']").on("blur",function(){
	$(this).val($(this).val().trim());
	if($(this).val()){
		$.ajax({
	          url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
	          type:"post",
	          dataType:"json",
	          data:{
	              enterpriseName:$(this).val()
	          },
	          success : function(data) {
	              if(data.length>0){
	              }else{
	                  alertEase("企业不存在",2);
	                  $("#data_physical").find("input[name='companyName']").focus();
	              }
	          }
	      });
	}
})
</script>