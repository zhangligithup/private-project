<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<div class="breadcrumb_box">
	<!-- 产品进货台账Id -->
	<input type="hidden" name="purchaseLedgerId" value="${id}">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">溯源管理</a></li>
            <li class="active">产品进货台账</li>
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
                <div class="title_txt">食品原料及食品相关产品进货台账</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td  class="table3_th">企业名称</td>
                    <td width="35%" class="text-left">${purchaseLedger.company }</td>
                    <td  class="table3_th">物品名称</td>
                    <td class="text-left">${purchaseLedger.commodity }</td>
                </tr>
                <tr>
                    <td class="table3_th">规格</td>
                    <td  class="text-left">${purchaseLedger.spec }</td>
                    <td  class="table3_th">数量</td>
                    <td class="text-left">${purchaseLedger.num }</td>
                </tr>
                <tr>
                    <td class="table3_th">生产批号</td>
                    <td  class="text-left">${purchaseLedger.batchNumber }</td>
                    <td  class="table3_th">保质期</td>
                    <td class="text-left">${purchaseLedger.safeDateStr }</td>
                </tr>
                <tr>
                    <td  class="table3_th">进货时间</td>
                    <td class="text-left">${purchaseLedger.purchaseTimeStr }</td>
                    <td  class="table3_th">供货单位</td>
                    <td class="text-left">${purchaseLedger.supplyUnit }</td>
                </tr>
                <tr>
                    <td class="table3_th">供货单位联系人</td>
                    <td  class="text-left">${purchaseLedger.supplyPerson }</td>
                    <td  class="table3_th">供货人联系电话</td>
                    <td class="text-left">${purchaseLedger.supplyTel }</td>
                </tr>
                <tr>
                    <td class="table3_th">采购员</td>
                    <td  class="text-left">${purchaseLedger.buyer }</td>
                    <td  class="table3_th">验收记录员</td>
                    <td class="text-left">${purchaseLedger.recordPerson }</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <hr/>
    <div class="titledivone marb3">
    	<div class="title_txt">相关图片</div>
    </div>
    <div id="imgPurchaseLedgerDe">
    
    </div>
</div>

<script>
$(document).ready(function(){
	findPurchaseLedger();  
});

function findPurchaseLedger(){
	$.ajax({
		url:"${pageContext.request.contextPath}/origin/findPurchaseLedger.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='purchaseLedgerId']").val()
		},
		success : function(json) {
			var imgA="";
			var imgUrls = json.imgUrl.split(",");
			for(var j=0;j<imgUrls.length;j++) {
				if(imgUrls[j]){
				    imgA+="<img src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"' style='width:120px;height:120px'  data-action='zoom' class='pull-left'>&nbsp;"
				}
				}
			$("#imgPurchaseLedgerDe").html(imgA);
		}
	});
}



</script>

