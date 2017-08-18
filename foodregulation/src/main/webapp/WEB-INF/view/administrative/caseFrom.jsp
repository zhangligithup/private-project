<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">行政处罚</a></li>
            <li class="active">案件来源类型</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal41' onclick="addCaseFrom()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加案件来源</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_caseFrom"></font>条</div>
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
        <tbody id="dataListTbody_caseFrom">

        </tbody>
    </table>
    <div id="page_caseFrom"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal41" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_caseFrom"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加案件来源</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_caseFrom">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">编  号<input type="hidden" name="caseFromId"></td>
                        <td><input type="text" class="login_input" name="caseFromCode"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font ">内  容</td>
                        <td>
                            <textarea name="caseFromContent" id="caseFromContent" cols="30" rows="10"  class="login_input login_textarea"></textarea>
                        </td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_caseFrom" onclick="insertCasefrom()" data-dismiss="modal">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_caseFrom" onclick="updateCasefrom()" data-dismiss="modal">确认修改</a>
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
	queryCaseFrom();  
});

//清空表单 
function emptyFormCaseFrom(){
	$("#data_caseFrom").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("#caseFromContent").html("");
}

function queryCaseFrom(curr){
	$("#dataListTbody_caseFrom tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/casefrom/selectCasefromTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			success : function(total) {
				$("#total_caseFrom").html(total);
				page("page_caseFrom",total,10,10,queryCaseFrom);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/casefrom/selectCasefrom.do",
		type:"post",
		dataType:"json",
		data:{
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].caseFromCode+"</td><td>"+json[i].caseFromContent+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal41'  onclick='findCaseFrom("+json[i].caseFromId+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteCasefrom("+json[i].caseFromId+")'>删除</a></td></tr>";	
			}
			$("#dataListTbody_caseFrom").append(tr);
		}
	});
}

function addCaseFrom(){
	$("#save_caseFrom").show();
	$("#update_caseFrom").hide();
	emptyFormCaseFrom();
	$("#title_caseFrom").html("添加案件来源");
}

function insertCasefrom(){
	$.ajax({
		url:"${pageContext.request.contextPath}/casefrom/insertCasefrom.do",
		type:"post",
		dataType:"json",
		data:$('#data_caseFrom').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyFormCaseFrom();
			queryCaseFrom();
		}
	}); 
}

function findCaseFrom(caseFromId){
	$("#save_caseFrom").hide();
	$("#update_caseFrom").show();
	$("#title_caseFrom").html("修改案件来源");
	$.ajax({
		url:"${pageContext.request.contextPath}/casefrom/findCaseFrom.do",
		type:"post",
		dataType:"json",
		data:{
			caseFromId:caseFromId
		},
		success : function(json) {
			$("input[name='caseFromId']").val(json.caseFromId);
			$("input[name='caseFromCode']").val(json.caseFromCode);
			$("#caseFromContent").html(json.caseFromContent);
		}
	});
}

function updateCasefrom(){
	$.ajax({
		url:"${pageContext.request.contextPath}/casefrom/updateCasefrom.do",
		type:"post",
		dataType:"json",
		data:$('#data_caseFrom').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyFormCaseFrom();
			queryCaseFrom();
		}
	});
}

function deleteCasefrom(caseFromId){
	confirmMessage('con_caseFrom','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/casefrom/deleteCasefrom.do",
			type:"post",
			dataType:"json",
			data:{
				caseFromId:caseFromId
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryCaseFrom();
			}
		});	
	}
}
</script>