<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">系统设置</a></li>
            <li class="active">企业抽检频次设置</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:queryDictionarySamplingClause()"><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_dictionary_SamplingClause' onclick="addDictionarySamplingClause()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加企业抽检频次</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_dictionary_Sampling"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>级别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_dictionary_SamplingClause">

        </tbody>
    </table>
    <div id="page_dictionary_SamplingClause"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_dictionary_SamplingClause" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_dictionarySamplingClause"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加企业抽检频次</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_dictionarySamplingClause">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width150 noborder title_font">级别<input type="hidden" name="dictionarySamplingClauseId"></td>
                        <td colspan="2"><input type="text" class="login_input" name="dictionarySamplingClauseName"></td>

                    </tr>
                    <tr>
                        <td  class="width150 noborder title_font">时间</td>
                        <td><input type="text" class="login_input" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" name="dictionarySamplingClauseTime">  
                        </td>
                        <td>
                        	 <select class="select_style1 width160" id="dictionarySamplingClauseTimeUnit">
								<option value="0">选择时间单位</option>
								<option value="1">小时</option>
								<option value="2">天</option>
								<option value="3">周</option>
								<option value="4">月</option>
								<option value="5">年</option>
							</select>
                        </td>
							
                    </tr>
                    <tr>
                        <td  class="width150 noborder title_font">次数</td>
                        <td colspan="2"><input type="text" class="login_input" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" name="dictionarySamplingClauseNum"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td colspan="2" style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_dictionarySamplingClause"  data-dismiss="modal" onclick="insertDictionarySamplingClause()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_dictionarySamplingClause"  data-dismiss="modal" onclick="updateDictionarySamplingClause()">确认修改</a>
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
	queryDictionarySamplingClause();  
});

//清空表单 
function emptyDictionarySampling(){
	$("#data_dictionarySamplingClause").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	
}

function queryDictionarySamplingClause(curr){
	$("#dataListTbody_dictionary_SamplingClause tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/dictionary/getDictionaryListCount.do",
			type : "post",
			dataType : "json",
			data:{
				type:7
			},
			async: false,
			success : function(total) {
				$("#total_dictionary_Sampling").html(total);
				page("page_dictionary_SamplingClause",total,10,10,queryDictionarySamplingClause);
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
			type:7
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].tDictionaryName+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_dictionary_SamplingClause'  onclick='preUpdateDictionarySamplingClause("+json[i].id+",\""+json[i].tDictionaryName+"\","+json[i].tDictionaryTime+",\""+json[i].tDictionaryTimeUnit+"\","+json[i].tDictionaryNum+")'>编辑</a></td></tr>";	
			}
			$("#dataListTbody_dictionary_SamplingClause").append(tr);
		}
	});
}

function addDictionarySamplingClause(){
	$("#save_dictionarySamplingClause").show();
	$("#update_dictionarySamplingClause").hide();
	emptyDictionarySampling();
	$("#title_dictionarySamplingClause").html("添加企业抽检频次");
}

function insertDictionarySamplingClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/saveDictionary.do",
		type:"post",
		dataType:"json",
		data:{
		    tDictionaryName:$("input[name='dictionarySamplingClauseName']").val(),
		    tDictionaryType:7,
		    tDictionaryTime:$("input[name='dictionarySamplingClauseTime']").val(),
		    tDictionaryTimeUnit:$("#dictionarySamplingClauseTimeUnit").val(),
		    tDictionaryNum:$("input[name='dictionarySamplingClauseNum']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyDictionarySampling();
			queryDictionarySamplingClause();
		}
	}); 
}

function preUpdateDictionarySamplingClause(id,name,time,timeUnit,num){
	$("#save_dictionarySamplingClause").hide();
	$("#update_dictionarySamplingClause").show();
	$("#title_dictionarySamplingClause").html("修改企业抽检频次");
	$("input[name='dictionarySamplingClauseName']").val(name);
	$("input[name='dictionarySamplingClauseId']").val(id);
	$("input[name='dictionarySamplingClauseNum']").val(num);
	$("input[name='dictionarySamplingClauseTime']").val(time);
	$("#dictionarySamplingClauseTimeUnit").val(timeUnit);
}

function updateDictionarySamplingClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/updateDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='dictionarySamplingClauseId']").val(),
		    tDictionaryName:$("input[name='dictionarySamplingClauseName']").val(),
		    tDictionaryNum:$("input[name='dictionarySamplingClauseNum']").val(),
		    tDictionaryTime:$("input[name='dictionarySamplingClauseTime']").val(),
		    tDictionaryTimeUnit:$("#dictionarySamplingClauseTimeUnit").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyDictionarySampling();
			queryDictionarySamplingClause();
		}
	});
}

function deleteDictionarySamplingClause(id){
	confirmMessage('con_dictionarySamplingClause','你确实要删除吗',{width:300,height:150,sure:callBack}); 
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
				queryDictionarySamplingClause();
			}
		});	
	}
}
</script>