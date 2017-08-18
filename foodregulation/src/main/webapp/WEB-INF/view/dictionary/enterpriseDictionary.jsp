<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">系统设置</a></li>
            <li class="active">企业类型设置</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:queryDictionaryEnterpriseClause()"><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_dictionary_EnterpriseClause' onclick="addDictionaryEnterpriseClause()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加企业类型</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_dictionary_Enterprise"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>企业类型名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_dictionary_EnterpriseClause">

        </tbody>
    </table>
    <div id="page_dictionary_EnterpriseClause"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_dictionary_EnterpriseClause" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_dictionaryEnterpriseClause"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加行政区域</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_dictionaryEnterpriseClause">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width150 noborder title_font">企业类型名称<input type="hidden" name="dictionaryEnterpriseClauseId"></td>
                        <td><input type="text" class="login_input" name="dictionaryEnterpriseClauseName"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_dictionaryEnterpriseClause"  data-dismiss="modal" onclick="insertDictionaryEnterpriseClause()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_dictionaryEnterpriseClause"  data-dismiss="modal" onclick="updateDictionaryEnterpriseClause()">确认修改</a>
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
	queryDictionaryEnterpriseClause();  
});

//清空表单 
function emptyDictionaryEnterprise(){
	$("#data_dictionaryEnterpriseClause").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	
}

function queryDictionaryEnterpriseClause(curr){
	$("#dataListTbody_dictionary_EnterpriseClause tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/dictionary/getDictionaryListCount.do",
			type : "post",
			dataType : "json",
			data:{
				type:1//企业类型
			},
			async: false,
			success : function(total) {
				$("#total_dictionary_Enterprise").html(total);
				page("page_dictionary_EnterpriseClause",total,10,10,queryDictionaryEnterpriseClause);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionaryList.do",
		type:"post",
		dataType:"json",
		data:{
			pageIndex:(pageNum-1)*10,//分页参数，将要显示的分页数
			pageSize:10,//每页显示的条数
			type:1//行政区
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].tDictionaryName+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_dictionary_EnterpriseClause'  onclick='preUpdateDictionaryEnterpriseClause("+json[i].id+",\""+json[i].tDictionaryName+"\")'>编辑</a></td></tr>";	
			}
			$("#dataListTbody_dictionary_EnterpriseClause").append(tr);
		}
	});
}

function addDictionaryEnterpriseClause(){
	$("#save_dictionaryEnterpriseClause").show();
	$("#update_dictionaryEnterpriseClause").hide();
	emptyDictionaryEnterprise();
	$("#title_dictionaryEnterpriseClause").html("添加企业类型");
}

function insertDictionaryEnterpriseClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/saveDictionary.do",
		type:"post",
		dataType:"json",
		data:{
		    tDictionaryName:$("input[name='dictionaryEnterpriseClauseName']").val(),
		    tDictionaryType:1
		},
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyDictionaryEnterprise();
			queryDictionaryEnterpriseClause();
		}
	}); 
}

function preUpdateDictionaryEnterpriseClause(id,name){
	$("#save_dictionaryEnterpriseClause").hide();
	$("#update_dictionaryEnterpriseClause").show();
	$("#title_dictionaryEnterpriseClause").html("修改企业类型");
	$("input[name='dictionaryEnterpriseClauseName']").val(name);
	$("input[name='dictionaryEnterpriseClauseId']").val(id);
}

function updateDictionaryEnterpriseClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/updateDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='dictionaryEnterpriseClauseId']").val(),
		    tDictionaryName:$("input[name='dictionaryEnterpriseClauseName']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyDictionaryEnterprise();
			queryDictionaryEnterpriseClause();
		}
	});
}

function deleteDictionaryEnterpriseClause(id){
	confirmMessage('con_dictionaryEnterpriseClause','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/dictionary/deleteDictionary.do",
			type:"post",
			dataType:"json",
			data:{
				id:id
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryDictionaryEnterpriseClause();
			}
		});	
	}
}
</script>