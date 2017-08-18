<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">人员培训</a></li>
            <li class="active">试题库管理</li>
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
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal_exam' onclick="addBtnExam()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加试题</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_exam"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>试题类别</th>
            <th>试题题目</th>
            <th>试题选项</th>
            <th>试题答案</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_exam">
        
        </tbody>
    </table>
    <div id="page_exam"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_exam" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_exam"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加试题</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_exam">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">试题类别<input type="hidden" name="id" id="vexamId"></td>
                        <td style="text-align:left">
                            <div class="myradio radio-inline marr10">
                            <label class=" ">
                                <input type="radio"  value="选择题" name="exType" checked onclick="changcontent(1)">选择题
                            </label>
                            </div>
                            <div class="myradio radio-inline marr10">
                                <label class=" ">
                                    <input type="radio"  value="判断题" name="exType" onclick="changcontent(2)">判断题
                                </label>
                            </div>
                            <div class="myradio radio-inline marr10">
                                <label class=" ">
                                    <input type="radio"  value="填空题" name="exType" onclick="changcontent(3)">填空题
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                    	<td  class="width60 noborder title_font">试题题目</td>
                        <td><input type="text" class="login_input" name="title"></td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">试题选项</td>
                        <td id="content" class="text-left">
                        		选项A：<input type='text' class='login_input width220' name='content'><br/><br/>
                        		选项B：<input type='text' class='login_input width220' name='content'><br/><br/>
                        		选项C：<input type='text' class='login_input width220' name='content'><br/><br/>
                        		选项D：<input type='text' class='login_input width220' name='content'><br/><br/>
                        </td>
                    </tr>
                    <tr>
                        <td  class="width60 noborder title_font">试题答案</td>
                        <td id="answer" class="text-left">
                        	<input type="radio"  value="A" name="answer">A
                        	<input type="radio"  value="B" name="answer">B
                        	<input type="radio"  value="C" name="answer">C
                        	<input type="radio"  value="D" name="answer">D
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_exam"  data-dismiss="modal" onclick="addExam()">确认添加</a>
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_exam"  data-dismiss="modal" onclick="updatePhysical()">确认修改</a>
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
	queryExamBasic();
});

//清空表单 
function emptyFormExam(){
	$("#data_exam").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("input[name='content']").html("");
}

function queryExamBasic(curr){
	$("#dataListTbody_exam tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/exam/selectExamTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			success : function(total) {
				$("#total_exam").html(total);
				page("page_exam",total,10,10,queryExamBasic);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/selectExam.do",
		type:"post",
		dataType:"json",
		data:{
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {

			    tr+="<tr><td>"+json[i].id+"</td><td>"+json[i].exType+"</td><td>"+json[i].title+"</td><td>"+json[i].content+"</td><td>"+json[i].answer+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_exam'  onclick='findExam("+json[i].id+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteExam("+json[i].id+")'>删除</a></td></tr>";
			}
			$("#dataListTbody_exam").append(tr);
		}
	});
}

function addBtnExam(){
	$("#save_exam").show();
	$("#update_exam").hide();
	emptyFormExam();
	$("#title_exam").html("添加试题");
}

function addExam(){
    $("#vexamId").val("");
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/addExam.do",
		type:"post",
		dataType:"json",
		data:$('#data_exam').serialize(),
		success : function(data) {
            if(data.result=="true"){
                alertEase("新增成功",'alert_succ');
                emptyFormExam();
                queryExamBasic();
            }else{
                alertEase("新增失败! "+data.msg,'alert_err');
            }
		}
	}); 
}

function findExam(id){
	$("#save_exam").hide();
	$("#update_exam").show();
	$("#title_exam").html("修改记录");
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/findExam.do",
		type:"post",
		dataType:"json",
		data:{
			id:id
		},
		success : function(json) {
			$("#vexamId").val(json.id);
			$("input[name='exType'][value='"+json.exType+"']").prop("checked",true);
			$("input[name='title']").val(json.title);
			var content = json.content.split(",");
			if(json.exType=="选择题"){
				$("#content").parent().show();
				$("#content").html("选项A：<input type='text' class='login_input width220' name='content' value='"+content[0]+"'><br/><br/>选项B：<input type='text' class='login_input width220' name='content' value='"+content[1]+"'><br/><br/>选项C：<input type='text' class='login_input width220' name='content' value='"+content[2]+"'><br/><br/>选项D：<input type='text' class='login_input width220' name='content' value='"+content[3]+"'><br/><br/>");
				$("#answer").html('<input type="radio"  value="A" name="answer">A<input type="radio"  value="B" name="answer">B<input type="radio"  value="C" name="answer">C<input type="radio"  value="D" name="answer">D');
				$("input[name='answer'][value='"+json.answer+"']").prop("checked",true);
			}else if(json.exType=="判断题"){
				$("#content").parent().show();
				$("#content").html("选项A：对<input type='hidden' name='content' value='对'><br/><br/>选项B：错<input type='hidden' name='content' value='错'>");
				$("#answer").html('<input type="radio"  value="A" name="answer">A.对<input type="radio"  value="B" name="answer">B.错');
				$("input[name='answer'][value='"+json.answer+"']").prop("checked",true);
			}else if(json.exType=='填空题'){
				$("#content").parent().hide();
				$("#answer").html('<input type="text" class="login_input" name="answer" value="'+json.answer+'">');
			}
		}
	});
}

function updatePhysical(){
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/updateExam.do",
		type:"post",
		dataType:"json",
		data:$('#data_exam').serialize(),
		success : function(data) {
            if(data.result=="true"){
				alertEase("修改信息成功",'alert_succ');
                emptyFormExam();
                queryExamBasic();
			}else{
				alertEase("修改信息失败",'alert_err');
			}

		}
	});
}

function deleteExam(id){
	confirmMessage('con_punishBasis','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/exam/delExam.do",
			type:"post",
			dataType:"json",
			data:{
				id:id
			},
			success : function(data) {
                if(data.result=="true"){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryExamBasic();
			}
		});	
	}
}

function changcontent(type){
	if(type==1){
		$("#content").parent().show();
		$("#content").html("选项A：<input type='text' class='login_input width220' name='content'><br/><br/>选项B：<input type='text' class='login_input width220' name='content'><br/><br/>选项C：<input type='text' class='login_input width220' name='content'><br/><br/>选项D：<input type='text' class='login_input width220' name='content'><br/><br/>");
		$("#answer").html('<input type="radio"  value="A" name="answer">A<input type="radio"  value="B" name="answer">B<input type="radio"  value="C" name="answer">C<input type="radio"  value="D" name="answer">D');
	}else if(type==2){
        $("#content").html("");
        $("#content").parent().hide();
		$("#answer").html('<input type="radio"  value="A" name="answer">A.对<input type="radio"  value="B" name="answer">B.错');
	}else if(type==3){
		$("#content").html("");
		$("#content").parent().hide();
		$("#answer").html('<input type="text" class="login_input" name="answer">');
	}
}
</script>