<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">行政处罚</a></li>
            <li class="active">违法条件信息</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="content_box" id="checkTask">
    <table class="table search_box marb10">
        <thead>
            <tr>
                <th>违法条款编号</th>
                <th>
                        <input id="searchIllegalClauseCode" class="search_input" type="text" value="">
                </th>
               <th><a class="form_btn" href="#" onclick="queryIllegalClause()">搜索</a></th>
            </tr>
        </thead>
    </table>
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_illegalClause' onclick="addIllegalClause()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加违法条款</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_illegalClause"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>类型名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_illegalClause">

        </tbody>
    </table>
    <div id="page_illegalClause"></div>
<div class="modal fade addsource_modal" id="mymodal_illegalClause" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_illegalClause"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加违法条款</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_illegalClause">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">编  号<input type="hidden" name="illegalClauseId"></td>
                        <td><input type="text" class="login_input" name="illegalClauseCode"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font ">内  容</td>
                        <td>
                            <textarea name="illegalClauseContent" id="illegalClauseContent" cols="30" rows="10"  class="login_input login_textarea"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_illegalClause"  data-dismiss="modal" onclick="insertIllegalClause()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_illegalClause"  data-dismiss="modal" onclick="updateIllegalClause()">确认修改</a>
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
	queryIllegalClause();  
});

//清空表单 
function emptyFormIllegalClause(){
	$("#data_illegalClause").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("#illegalClauseContent").html("");
	$('#illegalClauseContent').val("");
}

function queryIllegalClause(curr){
	$("#dataListTbody_illegalClause tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/illegalClause/selectIllegalClauseTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				illegalClauseCode:$("#searchIllegalClauseCode").val()
			},
			success : function(total) {
				$("#total_illegalClause").html(total);
				page("page_illegalClause",total,10,10,queryIllegalClause);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/illegalClause/selectIllegalClause.do",
		type:"post",
		dataType:"json",
		data:{
			illegalClauseCode:$("#searchIllegalClauseCode").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].illegalClauseCode+"</td><td>"+json[i].illegalClauseContent+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_illegalClause'  onclick='findIllegalClause("+json[i].illegalClauseId+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteIllegalClause("+json[i].illegalClauseId+")'>删除</a></td></tr>";	
			}
			$("#dataListTbody_illegalClause").append(tr);
		}
	});
}

function addIllegalClause(){
	$("#save_illegalClause").show();
	$("#update_illegalClause").hide();
	emptyFormIllegalClause();
	$("#title_illegalClause").html("添加违法条款");
}

function insertIllegalClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/illegalClause/insertIllegalClause.do",
		type:"post",
		dataType:"json",
		data:$('#data_illegalClause').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyFormIllegalClause();
			queryIllegalClause();
		}
	}); 
}

function findIllegalClause(illegalClauseId){
	$("#save_illegalClause").hide();
	$("#update_illegalClause").show();
	$("#title_illegalClause").html("修改违法条款");
	$.ajax({
		url:"${pageContext.request.contextPath}/illegalClause/findIllegalClause.do",
		type:"post",
		dataType:"json",
		data:{
			illegalClauseId:illegalClauseId
		},
		success : function(json) {
			$("input[name='illegalClauseId']").val(json.illegalClauseId);
			$("input[name='illegalClauseCode']").val(json.illegalClauseCode);
			$("#illegalClauseContent").html(json.illegalClauseContent);
		}
	});
}

function updateIllegalClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/illegalClause/updateIllegalClause.do",
		type:"post",
		dataType:"json",
		data:$('#data_illegalClause').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyFormIllegalClause();
			queryIllegalClause();
		}
	});
}

function deleteIllegalClause(illegalClauseId){
	confirmMessage('con_illegalClause','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/illegalClause/deleteIllegalClause.do",
			type:"post",
			dataType:"json",
			data:{
				illegalClauseId:illegalClauseId
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryIllegalClause();
			}
		});	
	}
}
</script>