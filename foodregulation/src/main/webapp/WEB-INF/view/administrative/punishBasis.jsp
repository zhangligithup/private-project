<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">行政处罚</a></li>
            <li class="active">处罚依据信息</li>
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
                <th>处罚依据编号</th>
                <th>
                        <input id="searchPunishBasisCode" class="search_input" type="text" value="">
                </th>
               <th><a class="form_btn" href="#" onclick="queryPunishBasis()">搜索</a></th>
            </tr>
        </thead>
    </table>                    
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_punishBasis' onclick="addPunishBasis()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加处罚依据</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_punishBasis"></font>条</div>
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
        <tbody id="dataListTbody_punishBasis">
        
        </tbody>
    </table>
    <div id="page_punishBasis"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_punishBasis" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_punishBasis"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加案件来源</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_punishBasis">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">编  号<input type="hidden" name="punishBasisId"></td>
                        <td><input type="text" class="login_input" name="punishBasisCode"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font ">内  容</td>
                        <td>
                            <textarea name="punishBasisContent" id="punishBasisContent" cols="30" rows="10"  class="login_input login_textarea"></textarea>
                        </td>

                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_punishBasis"  data-dismiss="modal" onclick="insertPunishBasis()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_punishBasis"  data-dismiss="modal" onclick="updatePunishBasis()">确认修改</a>
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
	queryPunishBasis();  
});

//清空表单 
function emptyFormPunishBasis(){
	$("#data_punishBasis").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("#punishBasisContent").html("");
}

function queryPunishBasis(curr){
	$("#dataListTbody_punishBasis tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/punishBasis/selectPunishBasisTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				punishBasisCode:$("#searchPunishBasisCode").val()
			},
			success : function(total) {
				$("#total_punishBasis").html(total);
				page("page_punishBasis",total,10,10,queryPunishBasis);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/punishBasis/selectPunishBasis.do",
		type:"post",
		dataType:"json",
		data:{
			punishBasisCode:$("#searchPunishBasisCode").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+json[i].punishBasisCode+"</td><td>"+json[i].punishBasisContent+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_punishBasis'  onclick='findPunishBasis("+json[i].punishBasisId+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deletePunishBasis("+json[i].punishBasisId+")'>删除</a></td></tr>";	
			}
			$("#dataListTbody_punishBasis").append(tr);
		}
	});
}

function addPunishBasis(){
	$("#save_punishBasis").show();
	$("#update_punishBasis").hide();
	emptyFormPunishBasis();
	$("#title_punishBasis").html("添加处罚依据");
}

function insertPunishBasis(){
	$.ajax({
		url:"${pageContext.request.contextPath}/punishBasis/insertPunishBasis.do",
		type:"post",
		dataType:"json",
		data:$('#data_punishBasis').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyFormPunishBasis();
			queryPunishBasis();
		}
	}); 
}

function findPunishBasis(punishBasisId){
	$("#save_punishBasis").hide();
	$("#update_punishBasis").show();
	$("#title_punishBasis").html("修改处罚依据");
	$.ajax({
		url:"${pageContext.request.contextPath}/punishBasis/findPunishBasis.do",
		type:"post",
		dataType:"json",
		data:{
			punishBasisId:punishBasisId
		},
		success : function(json) {
			$("input[name='punishBasisId']").val(json.punishBasisId);
			$("input[name='punishBasisCode']").val(json.punishBasisCode);
			$("#punishBasisContent").html(json.punishBasisContent);
		}
	});
}

function updatePunishBasis(){
	$.ajax({
		url:"${pageContext.request.contextPath}/punishBasis/updatePunishBasis.do",
		type:"post",
		dataType:"json",
		data:$('#data_punishBasis').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("修改信息成功",'alert_succ');
			}else{
				alertEase("修改信息失败",'alert_err');
			}
			emptyFormPunishBasis();
			queryPunishBasis();
		}
	});
}

function deletePunishBasis(punishBasisId){
	confirmMessage('con_punishBasis','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/punishBasis/deletePunishBasis.do",
			type:"post",
			dataType:"json",
			data:{
				punishBasisId:punishBasisId
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryPunishBasis();
			}
		});	
	}
}
</script>