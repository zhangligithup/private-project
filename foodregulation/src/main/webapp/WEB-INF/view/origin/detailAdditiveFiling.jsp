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
            <table class="table  table3">
                <tbody>
	                <tr>
	                    <td  class="table3_th">企业名称</td>
	                    <td width="35%" class="text-left">${additiveFiling.company }</td>
	                    <td  class="table3_th">企业地址</td>
	                    <td class="text-left">${additiveFiling.companyAddress }</td>
	                </tr>
	                <tr>
	                    <td class="table3_th">法人代表</td>
	                    <td  class="text-left">${additiveFiling.legalPerson }</td>
	                    <td  class="table3_th">联系人</td>
	                    <td class="text-left">${additiveFiling.contacts }</td>
	                </tr>
	                <tr>
	                    <td class="table3_th">联系电话</td>
	                    <td  class="text-left">${additiveFiling.contactsTel }</td>
	                    <td  class="table3_th">备案时间</td>
	                    <td class="text-left">${additiveFiling.recordTime }</td>
	                </tr>
	                <tr>
	                    <td class="table3_th">验收记录员</td>
	                    <td  class="text-left">${additiveFiling.keeper }</td>
	                    <td  class="table3_th">进货时间</td>
	                    <td class="text-left">${additiveFiling.purchaseTime }</td>
	                </tr>
                </tbody>
            </table>
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
    <div id="imgAdditiveFilingDe">
    
    </div>
</div>

<script>
$(document).ready(function(){
	findAdditiveFiling();  
	selectKeepRecord();
});

function findAdditiveFiling(){
	$.ajax({
		url:"${pageContext.request.contextPath}/origin/findAdditiveFiling.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='additiveFilingId']").val()
		},
		success : function(json) {
			var imgA="";
			var imgUrls = json.imgUrl.split(",");
			for(var j=0;j<imgUrls.length;j++) {
				if(imgUrls[j]){
				imgA+="<img src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"' style='width:120px;height:120px' data-action='zoom' class='pull-left'>&nbsp;"
				}
			}
			$("#imgAdditiveFilingDe").html(imgA);
		}
	});
}


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
</script>

