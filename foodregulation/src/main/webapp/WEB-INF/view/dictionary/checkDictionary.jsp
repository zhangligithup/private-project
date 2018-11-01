<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">系统设置</a></li>
            <li class="active">企业检查频次设置</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:queryDictionaryCheckClause()"><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_dictionary_CheckClause' onclick="addDictionaryCheckClause()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加企业检查频次</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_dictionary_Check"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th>级别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_dictionary_CheckClause">

        </tbody>
    </table>
    <div id="page_dictionary_CheckClause"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_dictionary_CheckClause" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_dictionaryCheckClause"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加企业检查频次</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_dictionaryCheckClause">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width150 noborder title_font">级别<input type="hidden" name="dictionaryCheckClauseId"></td>
                        <td colspan="2"><input type="text" class="login_input" name="dictionaryCheckClauseName"></td>

                    </tr>
                    <tr>
                        <td  class="width150 noborder title_font">时间</td>
                        <td><input type="text" class="login_input" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" name="dictionaryCheckClauseTime">  
                        </td>
                        <td>
                        	 <select class="select_style1 width160" id="dictionaryCheckClauseTimeUnit">
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
                        <td colspan="2"><input type="text" class="login_input" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" name="dictionaryCheckClauseNum"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td colspan="2" style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_dictionaryCheckClause"  data-dismiss="modal" onclick="insertDictionaryCheckClause()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_dictionaryCheckClause"  data-dismiss="modal" onclick="updateDictionaryCheckClause()">确认修改</a>
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
	queryDictionaryCheckClause();  
});

//清空表单 
function emptyDictionaryCheck(){
	$("#data_dictionaryCheckClause").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	
}

function queryDictionaryCheckClause(curr){
	$("#dataListTbody_dictionary_CheckClause tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/dictionary/getDictionaryListCount.do",
			type : "post",
			dataType : "json",
			data:{
				type:6
			},
			async: false,
			success : function(total) {
				$("#total_dictionary_Check").html(total);
				page("page_dictionary_CheckClause",total,10,10,queryDictionaryCheckClause);
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
			type:6
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].tDictionaryName+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_dictionary_CheckClause'  onclick='preUpdateDictionaryCheckClause("+json[i].id+",\""+json[i].tDictionaryName+"\","+json[i].tDictionaryTime+",\""+json[i].tDictionaryTimeUnit+"\","+json[i].tDictionaryNum+")'>编辑</a></td></tr>";	
			}
			$("#dataListTbody_dictionary_CheckClause").append(tr);
		}
	});
}

function addDictionaryCheckClause(){
	$("#save_dictionaryCheckClause").show();
	$("#update_dictionaryCheckClause").hide();
	emptyDictionaryCheck();
	$("#title_dictionaryCheckClause").html("添加企业检查频次");
}

function insertDictionaryCheckClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/saveDictionary.do",
		type:"post",
		dataType:"json",
		data:{
		    tDictionaryName:$("input[name='dictionaryCheckClauseName']").val(),
		    tDictionaryType:6,
		    tDictionaryTime:$("input[name='dictionaryCheckClauseTime']").val(),
		    tDictionaryTimeUnit:$("#dictionaryCheckClauseTimeUnit").val(),
		    tDictionaryNum:$("input[name='dictionaryCheckClauseNum']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyDictionaryCheck();
			queryDictionaryCheckClause();
		}
	}); 
}

function preUpdateDictionaryCheckClause(id,name,time,timeUnit,num){
	$("#save_dictionaryCheckClause").hide();
	$("#update_dictionaryCheckClause").show();
	$("#title_dictionaryCheckClause").html("修改企业检查频次");
	$("input[name='dictionaryCheckClauseName']").val(name);
	$("input[name='dictionaryCheckClauseId']").val(id);
	$("input[name='dictionaryCheckClauseNum']").val(num);
	$("input[name='dictionaryCheckClauseTime']").val(time);
	$("#dictionaryCheckClauseTimeUnit").val(timeUnit);
}

function updateDictionaryCheckClause(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/updateDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			id:$("input[name='dictionaryCheckClauseId']").val(),
		    tDictionaryName:$("input[name='dictionaryCheckClauseName']").val(),
		    tDictionaryNum:$("input[name='dictionaryCheckClauseNum']").val(),
		    tDictionaryTime:$("input[name='dictionaryCheckClauseTime']").val(),
		    tDictionaryTimeUnit:$("#dictionaryCheckClauseTimeUnit").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyDictionaryCheck();
			queryDictionaryCheckClause();
		}
	});
}

function deleteDictionaryCheckClause(id){
	confirmMessage('con_dictionaryCheckClause','你确实要删除吗',{width:300,height:150,sure:callBack}); 
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
				queryDictionaryCheckClause();
			}
		});	
	}
}
</script>