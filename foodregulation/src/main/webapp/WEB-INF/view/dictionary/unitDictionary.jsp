<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">系统设置</a></li>
            <li class="active">监督单位设置</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:queryDictionaryUnitClause()"><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_dictionary_UnitClause' onclick="addDictionaryUnitClause()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添监管单位</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_dictionary_Unit"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>监管单位名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_dictionary_UnitClause">

        </tbody>
    </table>
    <div id="page_dictionary_UnitClause"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_dictionary_UnitClause" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_dictionaryUnitClause"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加行政区域</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_dictionaryUnitClause">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width150 noborder title_font">监管单位名称<input type="hidden" name="dictionaryUnitClauseId"></td>
                        <td><input type="text" class="login_input" name="dictionaryUnitClauseName"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_dictionaryUnitClause"  data-dismiss="modal" onclick="insertDictionaryUnitClause()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_dictionaryUnitClause"  data-dismiss="modal" onclick="updateDictionaryUnitClause()">确认修改</a>
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
	queryDictionaryUnitClause();  
});

//清空表单 
function emptyDictionaryUnit(){
	$("#data_dictionaryUnitClause").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	
}

function queryDictionaryUnitClause(curr){
	$("#dataListTbody_dictionary_UnitClause tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/dictionary/getDictionaryListCount.do",
			type : "post",
			dataType : "json",
			data:{
				type:2//企业类别
			},
			async: false,
			success : function(total) {
				$("#total_dictionary_Unit").html(total);
				page("page_dictionary_UnitClause",total,10,10,queryDictionaryUnitClause);
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
			type:2//行政区
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].tDictionaryName+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_dictionary_UnitClause'  onclick='preUpdateDictionaryUnitClause("+json[i].id+",\""+json[i].tDictionaryName+"\")'>编辑</a></td></tr>";	
			}
			$("#dataListTbody_dictionary_UnitClause").append(tr);
		}
	});
}

function addDictionaryUnitClause(){
	$("#save_dictionaryUnitClause").show();
	$("#update_dictionaryUnitClause").hide();
	emptyDictionaryUnit();
	$("#title_dictionaryUnitClause").html("添加监管单位域");
}

function insertDictionaryUnitClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/saveDictionary.do",
		type:"post",
		dataType:"json",
		data:{
		    tDictionaryName:$("input[name='dictionaryUnitClauseName']").val(),
		    tDictionaryType:2
		},
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyDictionaryUnit();
			queryDictionaryUnitClause();
		}
	}); 
}

function preUpdateDictionaryUnitClause(id,name){
	$("#save_dictionaryUnitClause").hide();
	$("#update_dictionaryUnitClause").show();
	$("#title_dictionaryUnitClause").html("修改监管单位");
	$("input[name='dictionaryUnitClauseName']").val(name);
	$("input[name='dictionaryUnitClauseId']").val(id);
}

function updateDictionaryUnitClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/updateDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='dictionaryUnitClauseId']").val(),
		    tDictionaryName:$("input[name='dictionaryUnitClauseName']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyDictionaryUnit();
			queryDictionaryUnitClause();
		}
	});
}

function deleteDictionaryUnitClause(id){
	confirmMessage('con_dictionaryUnitClause','你确实要删除吗',{width:300,height:150,sure:callBack}); 
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
				queryDictionaryUnitClause();
			}
		});	
	}
}
</script>