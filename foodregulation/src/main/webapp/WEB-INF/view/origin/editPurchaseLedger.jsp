<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">溯源管理</a></li>
            <li class="active">食品进货台账</li>
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
                <div class="title_txt">食品进货台账</div>
            </div>
            <form id="purchaseLedgerEditForm">
                <input type="hidden" id = "imgUrl" name="imgUrl" value="${purchaseLedger.imgUrl}">
                <input type="hidden" name="id" value="${purchaseLedger.id}">
	            <table class="table  table3">
	                <tbody>
	                <tr>
	                    <td  class="table3_th">企业名称<font style="color: red">*</font></td>
	                    <td width="35%" class="text-left"><input type="text" id="company" onblur="checkIsHave(this)" class="input2" name="company" value="${purchaseLedger.company}"></td>
	                    <td  class="table3_th">物品名称</td>
	                    <td class="text-left"><input type="text" id="commodity" class="input2" name="commodity" value="${purchaseLedger.commodity}"></td>
	                </tr>
	                <tr>
	                    <td class="table3_th">规格</td>
	                    <td  class="text-left"><input type="text" id = "spec" class="input2" name="spec" value="${purchaseLedger.spec}"></td>
	                    <td  class="table3_th">数量</td>
	                    <td class="text-left"><input type="text" id="num" class="input2" name="num" value="${purchaseLedger.num}"></td>
	                </tr>
	                <tr>
	                    <td class="table3_th">生产日期</td>
	                    <td  class="text-left">
	                       <div id="batchNumberBox1" style="position:relative">
	                           <input type="text" class="input2" id="batchNumber" name="batchNumber" value="${purchaseLedger.batchNumber}">
	                       </div>
	                    </td>
	                    <td  class="table3_th">保质期</td>
	                    <td class="text-left">
	                      <div id="safeDateStrBox1" style="position:relative">
	                        <input type="text" id="safeDateStr" class="input2" name="safeDateStr" value="${purchaseLedger.safeDateStr}">
	                       </div>
	                    </td>
	                </tr>
	                 <tr>
                        <td class="table3_th">产地</td>
                        <td  class="text-left"><input type="text" id = "productionPlace" class="input2" name="productionPlace" value="${purchaseLedger.productionPlace}"></td>
                        <td  class="table3_th"></td>
                        <td class="text-left"></td>
                    </tr>
	                <tr>
	                    <td  class="table3_th">进货时间<font style="color: red">*</font></td>
	                    <td class="text-left">
	                       <div id="purchasecalenderOneBox1" style="position:relative">
	                           <input type="text" id="purchaseTimeStr" class="input2" name="purchaseTimeStr" value="${purchaseLedger.purchaseTimeStr}">
	                       </div>
	                    </td>
	                    <td  class="table3_th">供货单位</td>
	                    <td class="text-left"><input type="text" id="supplyUnit" class="input2" name="supplyUnit" value="${purchaseLedger.supplyUnit}"></td>
	                </tr>
	                <tr>
	                    <td class="table3_th">供货单位联系人</td>
	                    <td  class="text-left"><input type="text" class="input2" name="supplyPerson" value="${purchaseLedger.supplyPerson}"></td>
	                    <td  class="table3_th">供货人联系电话</td>
	                    <td class="text-left"><input type="text" class="input2" name="supplyTel" value="${purchaseLedger.supplyTel}"></td>
	                </tr>
	                <tr>
                        <td class="table3_th">上传进货票据<font style="color: red">*</font></td>
                        <td id="purchaseLedgerTd">
                             <div id="zyuploadPurchaseLedger" class="zyupload row-fluid">
                             </div>
                        </td>
	                </tr>
	                </tbody>
	            </table>
            </form>
        </div>
    </div>
    <hr/>
    <div class="titledivone marb3">
    	<div class="title_txt">相关图片</div>
    </div>
    <div id="imgPurchaseLedger">
    
    </div>
    <div class="btn_box marb10" >
        <div style="text-align: center">
            <a href="javascript:void(0)" class="form_btn  width140" onclick="updatePurchaseLedger()">保 存</a>
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
            $("#imgPurchaseLedger").html(imgA);
    }
}
function initFile(){
	ZYFILE.uploadFile = [];
    ZYFILE.lastUploadFile = [];
    ZYFILE.perUploadFile = [];
    // 初始化插件
 $("#zyuploadPurchaseLedger").zyUpload({
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
                $("#purchaseLedgerEditForm").find("input[name='imgUrl']").val($("#purchaseLedgerEditForm").find("input[name='imgUrl']").val()+","+data)
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
	loadImg();
	initFile();
});
$(function(){
    $('#purchaseTimeStr').datetimepicker({
        container:'#purchasecalenderOneBox1',
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
    $('#safeDateStr').datetimepicker({
        container:'#safeDateStrBox1',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format:'yyyy-mm-dd'
    });
    $('#batchNumber').datetimepicker({
        container:'#batchNumberBox1',
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
function updatePurchaseLedger(){
	if(!$("#company").val()){
		alertEase("企业名称不能为空",2);
		return;
	}
	if(!$("#purchaseTimeStr").val()){
		alertEase("进货时间不能为空",2);
		return;
	}
	upload();
	if(!$("#imgUrl").val()){
        alertEase("进货票据不能为空",2);
        return;
    }
	$.ajax({
		url:"${pageContext.request.contextPath}/origin/updatePurchaseLedger.do",
		type:"post",
        async:false,
        data:$('#purchaseLedgerEditForm').serialize(),
		success:function(result){
			if(result == 1){
                alertEase("修改成功",1);
            }else{
                alertEase("修改失败",2);
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

</script>

