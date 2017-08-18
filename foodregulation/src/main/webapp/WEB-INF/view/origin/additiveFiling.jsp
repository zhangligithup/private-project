<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
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
<div class="content_box">
	<table class="table search_box marb10">
        <thead>
        <tr>
            <th >
                <div class="search_parent" style="width:400px">
                    <input type="text" class="search_input" name="additiveFilingCompany" placeholder="搜素企业名称">
                    <a class="search_btn" onclick="queryAdditiveFiling()">搜索</a>
                </div>
            </th>
            <th>备案时间</th>
             <th>
                 <div id="calenderOneBox4" style="position:relative">
                     <input id="additiveFilingRecordTime" name="additiveFilingRecordTime" class="bg_calender" size="16" type="text" >
                 </div>
             </th>
             <th><a href="javascript:void(0)" class="form_btn " onclick="queryAdditiveFiling()">筛选</a></th>
        </tr>
        </thead>
    </table>               
    <div class="btn_box marb10" >
        <div class="pull-left ">        
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_additiveFiling"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>企业名称</th>
            <th>法人代表</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>备案时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_additiveFiling">

        </tbody>
    </table>
    <div id="page_additiveFiling"></div>
</div>

<script>
$(document).ready(function(){
	queryAdditiveFiling();  
});


function queryAdditiveFiling(curr){
	$("#dataListTbody_additiveFiling tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/origin/selectAdditiveFilingTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				company:$("input[name='additiveFilingCompany']").val(),
				recordTime:$("input[name='additiveFilingRecordTime']").val()
			},
			success : function(total) {
				$("#total_additiveFiling").html(total);
				page("page_additiveFiling",total,10,10,queryAdditiveFiling);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/origin/selectAdditiveFiling.do",
		type:"post",
		dataType:"json",
		data:{
			company:$("input[name='additiveFilingCompany']").val(),
			recordTime:$("input[name='additiveFilingRecordTime']").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
				var url = "${pageContext.request.contextPath }/origin/detailAdditiveFiling.do?id="+json[i].id;
				var url2 = "${pageContext.request.contextPath }/origin/editAdditiveFiling.do?id="+json[i].id;
			    tr+="<tr>"
			    		+"<td>"+json[i].company+"</td>"
			    		+"<td>"+json[i].legalPerson+"</td>"
			    		+"<td>"+json[i].contacts+"</td>"
			    		+"<td>"+json[i].contactsTel+"</td>"
			    		+"<td>"+json[i].recordTime+"</td>"
			    		+"<td>"
			    			+"<a href='javascript:void(0)' class='editer_btns look_btn' id='li-90000"+i+"'  onclick='creatTabPage(90000"+i+",\""+url+"\")'>查看详情</a>"
			    			+"<a href='javascript:void(0)' class='editer_btns look_btn' id='li-900001"+i+"'  onclick='creatTabPage(900001"+i+",\""+url2+"\")'>编辑</a>"
			    			+"<a href='javascript:void(0)' class='editer_btns del_btn'  onclick='deleteKeepRecord("+json[i].id+")'>删除</a>"
			    		+"</td>"
			    	+"</tr>";	
			}
			tr = tr.replace(/null/g,"");
			$("#dataListTbody_additiveFiling").append(tr);			
		}
	});
}


$('#additiveFilingRecordTime').datetimepicker({
    container:'#calenderOneBox4',
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
function deleteKeepRecord(keepRecordId){
   confirmMessage('con_punishBasis','确定要删除吗',{width:300,height:150,sure:callBack}); 
    function callBack(){
        $.ajax({
            url : "${pageContext.request.contextPath}/origin/deleteKeepRecord.do",
            type: "POST",
            data:{
                id:keepRecordId
            },
            async: false,
            success: function(result) {
                if(result == 1){
                    alertEase("删除成功",'alert_succ');
                    queryAdditiveFiling();
                }else{
                    alertEase("删除失败",'alert_err');
                }
            }
        });
    }
}
</script>