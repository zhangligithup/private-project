<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
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
<div class="content_box">
	<table class="table search_box marb10">
        <thead>
        <tr>
            <th >
                <div class="search_parent" style="width:400px">
                    <input type="text" class="search_input" name="purchaseLedgerCompany" placeholder="搜素企业名称">
                    <a class="search_btn" onclick="queryPurchaseLedger()">搜索</a>
                </div>
            </th>
            <th>上报时间</th>
             <th>
                 <div id="calenderOneBox3" style="position:relative">
                     <input id="purchaseLedgerReportTime" name="purchaseLedgerReportTime" class="bg_calender" size="16" type="text" >
                 </div>
             </th>
             <th><a href="javascript:void(0)" class="form_btn " onclick="queryPurchaseLedger()">筛选</a></th>
        </tr>
        </thead>
    </table>                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
           
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_purchaseLedger"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>企业名称</th>
            <th>物品名称</th>
            <th>供货单位</th>
            <th>采购员</th>
            <th>进货时间</th>
            <th>上报时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_purchaseLedger">

        </tbody>
    </table>
    <div id="page_purchaseLedger"></div>
</div>

<script>
$(document).ready(function(){
	queryPurchaseLedger();  
});


function queryPurchaseLedger(curr){
	$("#dataListTbody_purchaseLedger tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/origin/selectPurchaseLedgerTotal.do",
			type : "post",
			dataType : "json",
			data:{
				company:$("input[name='purchaseLedgerCompany']").val(),
				reportTime:$("input[name='purchaseLedgerReportTime']").val()
			},
			async: false,
			success : function(total) {
				$("#total_purchaseLedger").html(total);
				page("page_purchaseLedger",total,10,10,queryPurchaseLedger);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/origin/selectPurchaseLedger.do",
		type:"post",
		dataType:"json",
		data:{
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10,//每页显示的条数
			company:$("input[name='purchaseLedgerCompany']").val(),
			reportTime:$("input[name='purchaseLedgerReportTime']").val()
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
				var url = "${pageContext.request.contextPath }/origin/detailPurchaseLedger.do?id="+json[i].id;
				var url2 = "${pageContext.request.contextPath }/origin/editPurchaseLedger.do?id="+json[i].id;
			    tr+="<tr>"
			    		+"<td>"+json[i].company+"</td>"
			    		+"<td>"+json[i].commodity+"</td>"
			    		+"<td>"+json[i].supplyUnit+"</td>"
			    		+"<td>"+json[i].buyer+"</td>"
			    		+"<td>"+json[i].purchaseTimeStr+"</td>"
			    		+"<td>"+json[i].reportTimeStr+"</td>"
			    		+"<td>"
			    			+"<a href='javascript:void(0)' class='editer_btns look_btn' id='li-80000"+i+"'  onclick='creatTabPage(80000"+i+",\""+url+"\")'>查看详情</a>"
			    			+"<a href='javascript:void(0)' class='editer_btns look_btn' id='li-800001"+i+"'  onclick='creatTabPage(800001"+i+",\""+url2+"\")'>编辑</a>"
			    			+"<a href='javascript:void(0)' class='editer_btns del_btn'  onclick='deletePurchaseLedger("+json[i].id+")'>删除</a>"
			    		+"</td>"
			    	+"</tr>";
			}
			tr = tr.replace(/null/g,"");
			$("#dataListTbody_purchaseLedger").append(tr);
		}
	});
}


$('#purchaseLedgerReportTime').datetimepicker({
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

//删除
function deletePurchaseLedger(ledgerId){
   confirmMessage('con_punishBasis','确定要删除吗',{width:300,height:150,sure:callBack}); 
    function callBack(){
        $.ajax({
            url : "${pageContext.request.contextPath}/origin/deletePurchaseLedger.do",
            type: "POST",
            data:{
            	id:ledgerId
            },
            async: false,
            success: function(result) {
                if(result == 1){
                    alertEase("删除成功",'alert_succ');
                    queryPurchaseLedger();
                }else{
                    alertEase("删除失败",'alert_err');
                }
            }
        });
    }
}
</script>