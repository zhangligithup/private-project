<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
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
                    <option value="唐山百货大楼集团八方购物广场有限责任公司兴海名都购物广场">唐山百货大楼集团八方购物广场有限责任公司兴海名都购物广场</option>
                    <option value="唐山市南堡开发区仁和超市">唐山市南堡开发区仁和超市</option>
                    <option value="唐山家万佳超市有限公司南堡店">唐山家万佳超市有限公司南堡店</option>
                    <option value="唐山远通实业有限公司农贸综合市场分公司">唐山远通实业有限公司农贸综合市场分公司</option>
                    <option value="曹妃甸区市场建设服务中心">曹妃甸区市场建设服务中心</option>
                    <option value="唐山兴龙广缘商业有限公司曹妃甸分公司">唐山兴龙广缘商业有限公司曹妃甸分公司</option>
                    <option value="唐山市曹妃甸区农机有限公司幸福树购物广场">唐山市曹妃甸区农机有限公司幸福树购物广场</option>
                    <option value="唐山百货大楼八方购物广场曹妃甸购物中心">唐山百货大楼八方购物广场曹妃甸购物中心</option>
                    <option value="唐山百货大楼集团八方购物广场有限责任公司曹妃甸购物广场">唐山百货大楼集团八方购物广场有限责任公司曹妃甸购物广场</option>
                    <option value="唐山曹妃甸区金莎国际购物广场有限公司">唐山曹妃甸区金莎国际购物广场有限公司</option>
                    <option value="曹妃甸新三加市场">曹妃甸新三加市场</option>
                </select>
            </th>
            <th>检测结果</th>
            <th>
                <select class="select_style1" id="result">
                    <option value="" selected>请选择</option>
                    <option value="合格">合格</option>
                    <option value="不合格">不合格</option>
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
            <th>检测结果图片</th>
            <th>不合格食品处理图像</th>
            <th>操作</th>
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
			            <th style="width:150px">检测结果图片</th>
			            <th style="width:150px">不合格食品处理图像</th>
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
	                                <input type="radio"  value="合格" name="result">合格
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
                        <td style="width:150px">
                             <input type="hidden" name="imgUrl">
                             <input type="file" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                        </td>
                        <td style="width:150px">
                             <input type="hidden" name="noQualifiedVideo">
                             <input type="file" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                        </td>
                        <td style="width:150px"><a class="form_btn" href="#" onclick="deleteLine(this)">删除</a></td>
                    </tr>
                    </tbody>
                </table>
                <div class="modal-footer" style="text-align:center">
                <a class="form_btn" href="#" onclick="saveQuickCheck()">保存</a>
                </div>
        </div>
    </div>
</div>

<div class="modal fade addsource_modal" id="edit_process_quickCheck" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog" style="width:1052px">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_quickCheck"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">修改食品快检</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
             <table class="table search_box marb10">
                <thead>
                    <tr>
                        <th style="width:200px">检测日期</th>
                        <th style="width:200px">
                            <div id="detectionDateOneBox2" style="position:relative;display:inline;">
                                <input id="detectionDateOne2" name = "detectionDate" class="bg_calender" size="16" type="text" value="">  
                            </div>
                        </th>
                        <th style="width:200px"></th>
                        <th style="width:200px"></th>
                        <th style="width:200px"></th>
                    </tr>
                </thead>
            </table>
                <table class="table table-bordered table2" style="width:1050px" id="editQuickTable">
                    <thead>
                    <tr>
                        <th style="width:150px">样品名称</th>
                        <th style="width:150px">检测项目</th>
                        <th style="width:150px">检测结果</th>
                        <th style="width:150px">被检企业</th>
                        <th style="width:150px">检测单位</th>
                        <th style="width:150px">检测结果图片</th>
                        <th style="width:150px">不合格食品处理图像</th>
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
                                    <input type="radio"  value="合格" name="result">合格
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
                            <input name="id" type="hidden">
                        </td>
                        <td style="width:150px" id="editImg">
                             <input type="hidden" name="imgUrl">
                             <input type="file" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                        </td>
                        <td style="width:150px" id="editVideo">
                             <input type="hidden" name="noQualifiedVideo">
                             <input type="file" style="display:none;" onchange="previewImg(this);">
                             <a class="form_btn" href="#" onclick="uploadImg(this)">上传</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="modal-footer" style="text-align:center">
                <a class="form_btn" href="#" onclick="editSaveFoodQuichCheck()">保存</a>
                </div>
        </div>
    </div>
</div>
<input type="hidden" id="enterpriseName" value="${enterpriseName}">
<input type="hidden" id="unitCode" value="${unitCode}">
<script>
$('#start_quickCheck').datetimepicker({
    container:'#start_quickCheckBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd  hh:ii'
});
$('#end_quickCheck').datetimepicker({
    container:'#end_quickCheckBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd  hh:ii'
});
$('#detectionDateOne').datetimepicker({
    container:'#detectionDateOneBox1',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd  hh:ii'
});
$('#detectionDateOne2').datetimepicker({
    container:'#detectionDateOneBox2',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    minView: 0,
    minuteStep:1,
    forceParse: 0,
    format:'yyyy-mm-dd  hh:ii'
});

function queryQuickCheckBasic(curr){
	$("#dataListTbody_quickCheck tr").remove();
    var sampleName=$("#sampleName").val();
    var quickcheckproject=$("#quickcheckproject").val();
    var start_calenderOne=$("#start_quickCheck").val();
    var end_calenderOne = $("#end_quickCheck").val();
    var detectionedEnterprise = $("#detectionedEnterprise").val();
    var detectionUnitCode = $("#detectionUnitCode").val();
    var result = $("#result").val();

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
            	detectionUnitCode:detectionUnitCode,
            	result:result
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
            result:result,
            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
			    tr+="<tr><td>"+(i+1)+"</td><td>"+json[i].sampleName+"</td><td>"+json[i].projectName+"</td><td>"+json[i].result+"</td><td>"+json[i].detectionedEnterprise+"</td><td>"+json[i].detectionUnitName+json[i].detectionEnterpriseName+"</td>"
                        +"<td>"+json[i].detectionDate+"</td>";
                if(json[i].imgUrl){
                	tr+="<td><img src=\"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+json[i].imgUrl+"\" style=\"width:150px;height:150px;display:block\" /></td>";
                }else{
                	tr+="<td></td>";
                }
                if(json[i].noQualifiedVideo){
                	 var noQualifiedVideo = json[i].noQualifiedVideo;
                     var index= noQualifiedVideo.lastIndexOf("."); //得到"."在第几位
                     var file = noQualifiedVideo.substring(index); //截断"."之前的，得到后缀
                     if(file!=".bmp"&&file!=".png"&&file!=".gif"&&file!=".jpg"&&file!=".jpeg"){  //根据后缀，判断是否符合图片格式
                         tr+="<td><video src=\"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+noQualifiedVideo+"\" controls=\"controls\" style=\"width:150px;height:150px;display:block\"/></video></td>";
                     }else{
                         tr+="<td><img src=\"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+noQualifiedVideo+"\" style=\"width:150px;height:150px;display:block\" /></td>";
                     }
                }else{
                	tr+="<td></td>";
                }
                tr+="<td><ul class='list-inline'>" ;
                tr+="<li id='li-cyjc-list-" + json[i].id + "'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='editFoodQuichCheck(" + json[i].id + ")'>编辑</a></li>"
                tr+="<li><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteFoodQuichCheck("+json[i].id+")'>删除</a></li></ul></tr>";
			}
			$("#dataListTbody_quickCheck").append(tr);
		}
});
}
function editFoodQuichCheck(id){
	$.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/queryFoodQuickCheck.do",
        type:"post",
        dataType:"json",
        data:{
            id:id
        },
        success : function(data) {
        	$("#detectionDateOne2").val(data.detectionDate);
        	var tr = $("#editQuickTable tr").eq(1);
            $(tr).find("input[name='sampleName']").val(data.sampleName);
            $(tr).find("input[name='id']").val(data.id);
            $(tr).find("select[name='quickcheckproject']").val(data.projectType);
            $(tr).find("input[name='result'][value='" + data.result + "']").prop("checked", "checked");
            $(tr).find("input[name='detectionedEnterprise']").val(data.detectionedEnterprise);
            $(tr).find("input[name='imgUrl']").val(data.imgUrl);
            $(tr).find("input[name='noQualifiedVideo']").val(data.noQualifiedVideo);
            var noQualifiedVideo = data.noQualifiedVideo;
            var index= noQualifiedVideo.lastIndexOf("."); //得到"."在第几位
            var file = noQualifiedVideo.substring(index); //截断"."之前的，得到后缀
            $("#editVideo").find("video").remove();
            $("#editVideo").find("img").remove();
            $("#editImg").find("img").remove();
            $("#editImg").prepend("<img src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+data.imgUrl+"\" style=\"width:150px;height:150px;display:block\" />");
            if(file!=".bmp"&&file!=".png"&&file!=".gif"&&file!=".jpg"&&file!=".jpeg"){  //根据后缀，判断是否符合图片格式
            	$("#editVideo").prepend("<video src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+noQualifiedVideo+"\" controls=\"controls\" style=\"width:150px;height:150px;display:block\"></video>");
            }else{
            	$("#editVideo").prepend("<img src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+noQualifiedVideo+"\" style=\"width:150px;height:150px;display:block\" />");
            }
        }
    }); 
	$("#edit_process_quickCheck").modal('show');
}
function editSaveFoodQuichCheck(id){
	var detectionDate = $("#detectionDateOne2").val();
    if(!detectionDateOne2){
        alertEase("检测日期不能为空",2);
        return;
    }
    var tr = $("#editQuickTable tr").eq(1);
    var id = $(tr).find("input[name='id']").val().trim();
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
    var result = $(tr).find("input[type='radio']:checked").val();
    if(!result){
        alertEase("第"+i+"行检测结果不能为空",2);
        return;
    }
    var detectionedEnterprise = $(tr).find("input[name='detectionedEnterprise']").val().trim();
    if(!detectionedEnterprise){
        alertEase("第"+i+"行被检测企业不能为空",2);
        return;
    }
    var imgUrl = $(tr).find("input[name='imgUrl']").val().trim();
    var noQualifiedVideo = $(tr).find("input[name='noQualifiedVideo']").val().trim();
    $.ajax({
        url:"${pageContext.request.contextPath}/foodQuickCheck/saveModifyFoodQuickCheck.do",
        type:"post",
        dataType:"text",
        data:{
        	id:id,
        	sampleName:sampleName,
        	projectType:quickcheckproject,
        	result:result,
        	detectionedEnterprise:detectionedEnterprise,
        	detectionDate:detectionDate,
        	imgUrl:imgUrl,
        	noQualifiedVideo:noQualifiedVideo
        },
        success : function(result) {
            if(result){
                alertEase("修改成功",1);
                $('#edit_process_quickCheck').modal('hide');
                queryQuickCheckBasic();
            }else{
                alertEase("修改失败",2);
            }
        }
    }); 
}
function deleteFoodQuichCheck(id){
	confirmMessage('con_Examination','你确实要删除吗',{width:300,height:150,sure:callBack});
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/foodQuickCheck/deleteFoodQuickCheck.do",
			type:"post",
			dataType:"json",
			data:{
				id:id
			},
			success : function(data) {
                if(data == 1){
					alertEase("删除信息成功",1);
				}else{
					alertEase("删除信息失败",2);
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
		var result = $(tr).find("input[type='radio']:checked").val();
		if(!result){
            alertEase("第"+i+"行检测结果不能为空",2);
            return;
        }
		var imgUrl = $(tr).find("input[name='imgUrl']").val().trim();
		if(!imgUrl){
			imgUrl = " ";
		}
		var noQualifiedVideo = $(tr).find("input[name='noQualifiedVideo']").val().trim();
		if(!noQualifiedVideo){
			noQualifiedVideo = " ";
        }
		var detectionedEnterprise = $(tr).find("input[name='detectionedEnterprise']").val().trim();
		if(!detectionedEnterprise){
            alertEase("第"+i+"行被检测企业不能为空",2);
            return;
        }
		if(i == 1){
			params = params + sampleName+","+quickcheckproject+","+result+","+detectionedEnterprise+","+imgUrl+","+noQualifiedVideo
		}else{
	        params = params +":"+sampleName+","+quickcheckproject+","+result+","+detectionedEnterprise+","+imgUrl+","+noQualifiedVideo
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
function uploadImg(ele){
     $(ele).parent().find("input[type='file']").click();
}
function previewImg(ele){
    var formData = new FormData();
    formData.append('fileselect',ele.files[0]);    //将文件转成二进制形式
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
        		  var url = data;
                  var index= data.lastIndexOf("."); //得到"."在第几位
                  var file = data.substring(index); //截断"."之前的，得到后缀
                  $(ele).parent().find("img").remove();
                  $(ele).parent().find("video").remove();
                  if(file!=".bmp"&&file!=".png"&&file!=".gif"&&file!=".jpg"&&file!=".jpeg"){  //根据后缀，判断是否符合图片格式
                      $(ele).parent().prepend("<video src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+url+"\" controls=\"controls\" style=\"width:150px;height:150px;display:block\"></video>");
                  }else{
                      $(ele).parent().prepend("<img src=\""+"http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+url+"\" style=\"width:150px;height:150px;display:block\" />");
                  }
                  $(ele).parent().find("input[name='imgUrl']").val(url);
                  $(ele).parent().find("input[name='noQualifiedVideo']").val(url);
        	}
          }
        });
}
</script>