<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">系统设置</a></li>
            <li class="active">行政区域设置</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:queryDictionaryAddressClause()"><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_dictionary_addressClause' onclick="addDictionaryAddressClause()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加行政区域</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_dictionary_address"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>行政区名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_dictionary_addressClause">

        </tbody>
    </table>
    <div id="page_dictionary_addressClause"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_dictionary_addressClause" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_dictionaryAddressClause"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加行政区域</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_dictionaryAddressClause">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width150 noborder title_font">行政区域名称<input type="hidden" name="dictionaryAddressClauseId"></td>
                        <td><input type="text" class="login_input" name="dictionaryAddressClauseName"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_dictionaryAddressClause"  data-dismiss="modal" onclick="insertDictionaryAddressClause()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_dictionaryAddressClause"  data-dismiss="modal" onclick="updateDictionaryAddressClause()">确认修改</a>
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
	queryDictionaryAddressClause();  
});

//清空表单 
function emptyDictionaryAddress(){
	$("#data_dictionaryAddressClause").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	
}

function queryDictionaryAddressClause(curr){
	$("#dataListTbody_dictionary_addressClause tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/dictionary/getDictionaryListCount.do",
			type : "post",
			dataType : "json",
			data:{
				type:0//行政区
			},
			async: false,
			success : function(total) {
				$("#total_dictionary_address").html(total);
				page("page_dictionary_addressClause",total,10,10,queryDictionaryAddressClause);
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
			type:0//行政区
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].tDictionaryName+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_dictionary_addressClause'  onclick='preUpdateDictionaryAddressClause("+json[i].id+",\""+json[i].tDictionaryName+"\")'>编辑</a></td></tr>";	
			}
			$("#dataListTbody_dictionary_addressClause").append(tr);
		}
	});
}

function addDictionaryAddressClause(){
	$("#save_dictionaryAddressClause").show();
	$("#update_dictionaryAddressClause").hide();
	emptyDictionaryAddress();
	$("#title_dictionaryAddressClause").html("添加行政区域");
}

function insertDictionaryAddressClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/saveDictionary.do",
		type:"post",
		dataType:"json",
		data:{
		    tDictionaryName:$("input[name='dictionaryAddressClauseName']").val(),
		    tDictionaryType:0
		},
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyDictionaryAddress();
			queryDictionaryAddressClause();
		}
	}); 
}

function preUpdateDictionaryAddressClause(id,name){
	$("#save_dictionaryAddressClause").hide();
	$("#update_dictionaryAddressClause").show();
	$("#title_dictionaryAddressClause").html("修改行政区域");
	$("input[name='dictionaryAddressClauseName']").val(name);
	$("input[name='dictionaryAddressClauseId']").val(id);
}

function updateDictionaryAddressClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/updateDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='dictionaryAddressClauseId']").val(),
		    tDictionaryName:$("input[name='dictionaryAddressClauseName']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyDictionaryAddress();
			queryDictionaryAddressClause();
		}
	});
}

function deleteDictionaryAddressClause(id){
	confirmMessage('con_dictionaryAddressClause','你确实要删除吗',{width:300,height:150,sure:callBack}); 
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
				queryDictionaryAddressClause();
			}
		});	
	}
}
</script>