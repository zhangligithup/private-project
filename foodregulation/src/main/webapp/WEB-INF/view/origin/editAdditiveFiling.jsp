<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<div class="breadcrumb_box">
	<!-- 产品进货台账Id -->
	<input type="hidden" name="additiveFilingId" value="${id}">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">溯源管理</a></li>
            <li class="active">食品添加剂备案</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box details_tabs">
    <div id="myTabContent2" class="tab-content">
        <div class="tab-pane  in active" id="one">
            <div class="titledivone marb3">
                <div class="title_txt">基本信息</div>
            </div>
            <form id="editItiveFilingForm">
                <input type="hidden" name="imgUrl" value="${additiveFiling.imgUrl}">
                <input type="hidden" name="id" value="${additiveFiling.id}">
	            <table class="table  table3">
	                <tbody>
		                <tr>
		                    <td  class="table3_th">企业名称</td>
		                    <td width="35%" class="text-left"><input type="text" class="input2" name="company" value="${additiveFiling.company }"></td>
		                    <td  class="table3_th">企业地址</td>
		                    <td class="text-left"><input type="text" class="input2" name="companyAddress" value="${additiveFiling.companyAddress }"></td>
		                </tr>
		                <tr>
		                    <td class="table3_th">法人代表</td>
		                    <td  class="text-left"><input type="text" class="input2" name="legalPerson" value="${additiveFiling.legalPerson }"></td>
		                    <td  class="table3_th">联系人</td>
		                    <td class="text-left"><input type="text" class="input2" name="contacts" value="${additiveFiling.contacts }"></td>
		                </tr>
		                <tr>
		                    <td class="table3_th">联系电话</td>
		                    <td  class="text-left"><input type="text" class="input2" name="contactsTel" value="${additiveFiling.contactsTel }"></td>
		                    <td  class="table3_th">备案时间</td>
		                    <td class="text-left">
			                    <div id="recordTimecalenderOneBox1" style="position:relative">
			                      <input id="recordTime" type="text" class="input2" name="recordTime" value="${additiveFiling.recordTime }">
			                    </div>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="table3_th">验收记录员</td>
		                    <td  class="text-left"><input type="text" class="input2" name="keeper" value="${additiveFiling.keeper}"></td>
		                    <td  class="table3_th">进货时间</td>
		                    <td class="text-left">
			                    <div id="purchaseTimecalenderOneBox1" style="position:relative">
			                      <input id="purchaseTime" type="text" class="input2" name="purchaseTime" value="${additiveFiling.purchaseTime}">
			                    </div>
		                    </td>
		                </tr>
		                <tr>
                        <td class="table3_th">上传图片</td>
                        <td id="additiveFilingTd">
                             <div id="zyuploadAdditiveFilling" class="zyupload row-fluid">
                             </div>
                        </td>
		                </tr>
	                </tbody>
	            </table>
            </form>
        </div>
    </div>
    <div class="titledivone marb3">
    	<div class="title_txt">备案登记表</div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>序号</th>
            <th>食品添加剂名称</th>
            <th>添加剂执行标准 </th>
            <th>添加剂生产单位</th>
            <th>添加剂经销单位</th>
            <th>进货验收方式</th>
            <th>用于何种食品及添加量</th>
            <th>备注</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_keepRecord">

        </tbody>
    </table>
    <div id="page_keepRecord"></div>
    <hr/>
    <div class="titledivone marb3">
    	<div class="title_txt">相关图片</div>
    </div>
    <div id="imgAdditiveFiling">
    
    </div>
     <div class="btn_box marb10" >
        <div style="text-align: center">
            <a href="javascript:void(0)" class="form_btn  width140" onclick="updateAdditiveFiling()">保 存</a>
        </div>
    </div>
</div>

<script>
function loadImg(){
    var imgUrlStr = $("input[name='imgUrl']").val();
    if(imgUrlStr&&imgUrlStr!="null"){
            var imgUrls = imgUrlStr.split(",");
            var imgA="";
            for(var j=0;j<imgUrls.length;j++) {
                if(imgUrls[j]){
                      imgA+="<div style='display:inline;width:200px;height:200px' class='col-md-1'><img style='display:block;width:140px;height:140px' src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"'><a href='javascript:void(0)' class='form_btn' onclick='deleteFile(this,\""+imgUrls[j]+"\")'>删除</a></div>";
                }
            }
            $("#imgAdditiveFiling").html(imgA);
    }
}
function initFile(){
	ZYFILE.uploadFile = [];
    ZYFILE.lastUploadFile = [];
    ZYFILE.perUploadFile = [];
    // 初始化插件
 $("#zyuploadAdditiveFilling").zyUpload({
     width            :   "650px",                 // 宽度
     height           :   "400px",                 // 宽度
     itemWidth        :   "140px",                 // 文件项的宽度
     itemHeight       :   "115px",                 // 文件项的高度
     url              :   "/upload/UploadAction",  // 上传文件的路径
     fileType         :   ["jpg","png","bmp","gif"],// 上传文件的类型
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
            	$("#editItiveFilingForm").find("input[name='imgUrl']").val($("#editItiveFilingForm").find("input[name='imgUrl']").val()+","+data)
            }
        },
        error:function(){
            alertEase("保存失败",2);
        }
    });
}
function deleteFile(ele,deleImg){
    confirmMessage('documentDeleteFile','确定要删除吗',{width:300,height:150,sure:callBack}); 
    function callBack(){
        var imgUrlStr = $("input[name='imgUrl']").val();
        var newImgUrl = "";
        if(imgUrlStr&&imgUrlStr!="null"){
                var imgUrls = imgUrlStr.split(",");
                for(var j=0;j<imgUrls.length;j++) {
                    if(imgUrls[j]&&imgUrls[j]!=deleImg){
                        newImgUrl+=","+imgUrls[j];
                    }
                }
                $("input[name='imgUrl']").val(newImgUrl.substring(1));
        }
        $(ele).parent().remove();
    }
    
}
$(document).ready(function(){
	selectKeepRecord();
	loadImg();
	initFile();
});
$(function(){
    $('#recordTime').datetimepicker({
        container:'#recordTimecalenderOneBox1',
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
});
$(function(){
    $('#purchaseTime').datetimepicker({
        container:'#purchaseTimecalenderOneBox1',
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
});


function selectKeepRecord(curr){
	$("#dataListTbody_keepRecord tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/origin/selectKeepRecordTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				additivefilingId:$("input[name='additiveFilingId']").val()
			},
			success : function(total) {
				page("page_keepRecord",total,10,10,selectKeepRecord);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/origin/selectKeepRecord.do",
		type:"post",
		dataType:"json",
		data:{
			additivefilingId:$("input[name='additiveFilingId']").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
			    tr+="<tr>"
			    		+"<td>"+(i+1)+"</td>"
			    		+"<td>"+json[i].additivesName+"</td>"
			    		+"<td>"+json[i].implementationStandards+"</td>"
			    		+"<td>"+json[i].productCompany+"</td>"
			    		+"<td>"+json[i].sellCompany+"</td>"
			    		+"<td>"+json[i].acceptanceMethod+"</td>"
			    		+"<td>"+json[i].purpose+"</td>"
			    		+"<td>"+json[i].remark+"</td>"
			    	+"</tr>";	
			}
			tr = tr.replace(/null/g,"");
			$("#dataListTbody_keepRecord").append(tr);			
		}
	});
}
function updateAdditiveFiling(){
	upload();
    $.ajax({
        url:"${pageContext.request.contextPath}/origin/updateAdditiveFiling.do",
        type:"post",
        async:false,
        data:$('#editItiveFilingForm').serialize(),
        success:function(result){
            if(result == 1){
                alertEase("修改成功",1);
            }else{
                alertEase("修改失败",2);
            }
        }
    });
}
</script>

