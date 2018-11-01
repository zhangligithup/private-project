<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb_box">
	<div class="breadcrumb_box_l">
		<ol class="breadcrumb">
			<li><a href="#">首页</a></li>
			<li><a href="#">通知公告</a></li>
			<li class="active">公告查询</li>
		</ol>
	</div>
	<div class="breadcrumb_box_r">
		<div class="pull-right">
			<a href=""><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
		</div>
	</div>
</div>
<div class="content_box">
	<table class="table search_box marb10">
		<thead>
			<tr>
				<th>
					<div class="search_parent" style="width: 300px">
						<input type="text" class="search_input" id="search" placeholder="请输入公告标题">
						<a class="search_btn" href="#" onclick="queryNoti()">搜索</a>
					</div>
				</th>
			</tr>
		</thead>
	</table>
	<div class="btn_box marb10">
		<div class="pull-left ">
			<a href="#" class="form_btn2" data-toggle='modal' data-target='#mymodal_notification'><img src="${pageContext.request.contextPath }/images/ioc/add.png">
				添加公告</a>
		</div>
	</div>
	<table class="table table-bordered table2">
		<thead>
			<tr>
				<th class="width60">编号</th>
				<th>标题</th>
				<th>发送时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="dataList">
		</tbody>
	</table>
	<div id="page_notification"></div>
</div>
<div class="modal fade addsource_modal" id="mymodal_notification" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_notification"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="" >添加公告</div>
                <button type="button" class="close fileinput-remove fileinput-remove-button" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="noti">
                <input type="hidden" name="imgUrl">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">标题<input type="hidden" name="id"></td>
                        <td><input type="text" id="title" name="title" class="login_input" required></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font ">内  容</td>
                        <td>
                            <textarea id="content_add" name="content" id="" cols="30" rows="10"  class="login_input login_textarea" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">上传附件</td>
                        <td id="fileTd">
                             <div id="zyuploadNotificationQuery" class="zyupload row-fluid">
                             </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">发送至</td>
                        <td style="text-align:left">
                            <select class="select_style1 marr10 input2 width140" name="toType" id="toType" onChange="toCodeSelect()">
			                    <option  value=""  >请选择</option>
			            		<option  value="2" >监管单位</option>
			            		<option  value="1" >监管企业</option>
                			</select>
                			<div id="selectDiv" style="display:inline">
                            <select class="selectpicker" multiple data-live-search="false" name="toCode" id="toCode">
                			</select>
                			</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: center">
                            <input class="form_btn  width140 title_font" type="button" onclick="saveNoti()" value="保存">
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
<div class="modal fade addsource_modal" id="mymodal_notification_check" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_notification"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="" >公告详情</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">标题</td>
                        <td><input type="text" id="title_check" class="login_input" required></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font ">内  容</td>
                        <td>
                            <textarea id="content_check"icols="30" rows="10"  class="login_input login_textarea" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">附件列表</td>
                        <td>
                        	 <div id="imgNot" style="text-align:left"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">发送至</td>
                        <td>
                        	<input type="text" id="toCodeName1" class="login_input" readonly>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- 隐藏域 登录人ID -->
<input type="hidden" name="personId" value="${personId}"> 
<script>
$(function (){
	queryNoti();
});
$("#mymodal_notification").on("hidden.bs.modal",function (){
	$("#title").val("");
	$("#content_add").val("");
	$("#toType").val("");
	$("#toCode").val("");
	$("#fileTd").html("");
	$("#fileTd").html('<div id="zyuploadNotificationQuery" class="zyupload row-fluid"></div>');
	initFile();
});
function saveNoti(){
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
	            var url = data;
	            var formData = new FormData();
	            var title = $("#title").val();
	            if(title==""){
	                alertEase("标题不能为空",2);
	                return false;
	            }
	            var content = $("#content_add").val();
	            if(content==""){
	                alertEase("内容不能为空",2);
	                return false;
	            }
	            formData.append('title',title);
	            formData.append('content',content);
	            formData.append('personId',$("input[name='personId']").val());
	            formData.append('url',url);
	            formData.append('toType',$("#toType").val());
	            formData.append('toCode',$("#toCode").val());
	           
	            $.ajax({
	                type:"post",
	                url:"${pageContext.request.contextPath}/notification/save.do",
	                async:false,
	                contentType: false,    //这个一定要写
	                processData: false, //这个也一定要写，不然会报错
	                data:formData,
	                dataType:'text',    //返回类型，有json，text，HTML。
	                success : function(data) {
	                    if(data>0){
	                        confirmMessage2('con_notification','保存成功',{width:300,height:150,sure:callBack});
	                        function callBack(){
	                            $("#mymodal_notification").modal("hide");
	                            queryNoti();
	                        }
	                    }else{
	                        alertEase("保存失败",2);
	                    }
	                },
	                error:function(){
	                    alertEase("保存失败",2);
	                }
	            });
	        },
	        error:function(){
	            alertEase("保存失败",2);
	        }
	    });
	
}

function queryNoti(curr){
	var title=$("#search").val();
	$("#dataList tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/notification/selectNotificationTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				title:title,
				personId:$("input[name='personId']").val()
			},
			success : function(total) {
				page("page_notification",total,10,10,queryNoti);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/notification/query.do",
		type:"post",
		dataType:"json",
		data:{
			title:title,
			personId:$("input[name='personId']").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(data) {
			var tr = "";
			for(var i=0;i<data.length;i++){
				tr = tr + "<tr>"
							+"<td>"+(i+1)+"</td>"
							+"<td>"+data[i].title+"</td>"
							+"<td>"+data[i].time+"</td>"
							+"<td><a href='javascript:void(0)' class='editer_btns look_btn' data-toggle='modal' data-target='#mymodal_notification_check'  onclick='detailNotification("+data[i].id+")'>查看</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteNotification("+data[i].id+")'>删除</a></td>"
						+"</tr>";
			}
			$("#dataList").html(tr);
		}
	}); 
}

function detailNotification(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/notification/findNotification.do",
		type:"post",
		dataType:"json",
		data:{
			id:id
		},
		success : function(json) {
			$("#toCodeName1").val(json.toCodeName);
			$("#title_check").val(json.title);
			$("#content_check").val(json.content);
			 var imgUrlStr = json.url;
			    if(imgUrlStr&&imgUrlStr!="null"){
			            var imgUrls = imgUrlStr.split(",");
			            var imgA="";
			            for(var j=0;j<imgUrls.length;j++) {
			                if(imgUrls[j]){
			                      imgA+="<a href='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"' download>"+imgUrls[j]+"</a><br>";
			                }
			            }
			            $("#imgNot").html(imgA);
			    }
		}
	});
}

function deleteNotification(id){
	confirmMessage('con_notification','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/notification/deleteNotification.do",
			type:"post",
			dataType:"json",
			data:{
				id:id
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",1);
				}else{
					alertEase("删除信息失败",2);
				}
				queryNoti();
			}
		});	
	}
}
initFile();
function initFile(){
    ZYFILE.uploadFile = [];
    ZYFILE.lastUploadFile = [];
    ZYFILE.perUploadFile = [];
    // 初始化插件
 $("#zyuploadNotificationQuery").zyUpload({
     width            :   "600px",                 // 宽度
     height           :   "auto",                 // 宽度
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
//公告下达目标下拉框
function toCodeSelect() {
	$("#selectDiv").html("");
	$("#selectDiv").html('<select class="selectpicker" multiple data-live-search="false" name="toCode" id="toCode"></select>');
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:$("#toType").val()
		},
		success : function(json) {
			for(var i=0;i<json.length;i++) {
				if(i==0){
				    $("#toCode").append("<option value='"+json[i].tDictionaryCode+"' selected>"+json[i].tDictionaryName+"</option>");
				}else{
	                $("#toCode").append("<option value='"+json[i].tDictionaryCode+"'>"+json[i].tDictionaryName+"</option>");
				}
			}
			$('#toCode').selectpicker({
		    });
		}
	});
}
</script>