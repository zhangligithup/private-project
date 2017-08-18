<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">人员培训</a></li>
            <li class="active">试卷管理</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <input type="hidden" value="${sessionAdmin.accountType }" name="accountType">
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <ul>
                <li id='li-add_examination_tab'>
                    <a href="javascript:void (0)" class="form_btn2" onclick="addBtnExamTabPage()"><img src="${pageContext.request.contextPath }/images/ioc/add.png">创建试卷</a>
                </li>
            </ul>
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_Examination"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>试卷模版名称</th>
            <th>完成人数</th>
            <th>创建时间</th>
            <th width="300">操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_Examination">
        
        </tbody>
    </table>
    <div id="page_Examination"></div>
</div>

<div class="modal fade addsource_modal" id="mymodal_Examination" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_Examination"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">制作试卷</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="data_Examination">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width160 noborder title_font">试卷模版名称</td>
                        <td colspan="3"><input type="text"  class="login_input" name="templateName"></td>
                    </tr>
                    <tr>
                        <td  class="width160 noborder title_font">选择题题数</td>
                        <td><input type="text" class="login_input" name="choiceCount"></td>
                        <td  class="width160 noborder title_font">每道选择题分数</td>
                        <td><input type="text" class="login_input" name="choiceScore"></td>
                        <td  class="width160 noborder title_font">每道选择题答题时间(秒)</td>
                        <td><input type="text" class="login_input" name="choiceTime"></td>
                    </tr>
                    <tr>
                        <td  class="width160 noborder title_font">判断题题数</td>
                        <td><input type="text" class="login_input" name="judgmentCount"></td>
                        <td  class="width160 noborder title_font">每道判断题分数</td>
                        <td><input type="text" class="login_input" name="judgmentScore"></td>
                        <td  class="width160 noborder title_font">每道判断题答题时间(秒)</td>
                        <td><input type="text" class="login_input" name="judgmentTime"></td>
                    </tr>
                    <tr>
                        <td  class="width160 noborder title_font">填空题题数</td>
                        <td><input type="text" class="login_input" name="completionCount"></td>
                        <td  class="width160 noborder title_font">每道填空题分数</td>
                        <td><input type="text" class="login_input" name="completionScore"></td>
                        <td  class="width160 noborder title_font">每道填空题答题时间(秒)</td>
                        <td><input type="text" class="login_input" name="completionTime"></td>
                    </tr>
                    <tr>
                        <td class="noborder title_font" ></td>
                        <td style="text-align: left" colspan="3">
                            <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_Examination"  data-dismiss="modal" onclick="addExamination()">确认添加</a>
                            <%--<a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_Examination"  data-dismiss="modal" onclick="updateExamination()">确认修改</a>--%>
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

<div class="modal fade addsource_modal" id="mymodal_ExamEnterprise" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">发布试卷</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <form id="fmpublishexam">

            <table class="table table3 marb0">
                <tbody>
                <input type="hidden" id="pubexaminationId" name="examinationid"/>
                <tr>
                    <td colspan="2"  class="width160 noborder title_font text-left">请选择发布类型</td>
                </tr>
                <tr>
                    <td class="noborder title_font ">发布给</td>
                    <td style="text-align:left">
                        <select class="select_style1 marr10 input2 width140" name="type" id="selPublishType" onChange="toPublishSelect()">
                            <option  value=""  >请选择</option>
                            <option  value="2" >执法人员</option>
                            <option  value="1" >从业人员</option>
                        </select>
                        <div id="selectPublishDiv" style="display:inline">
                            <select class="selectpicker" multiple data-live-search="false" name="list" id="mulSelPublish">
                            </select>
                        </div>
                    </td>
                </tr>

                </tbody>
            </table>

            </form>

            <div class="btn_box marb10" style="margin-top:10px;margin-left:10px">
                <div class="text-center ">
                    <button class="form_btn  width140 title_font" data-dismiss="modal" onclick="publishExam()" type="button">发布</button>
                </div>

            </div>
            <div id="enterpriseExamPage"></div>

        </div>
    </div>
</div>
<script>
$(document).ready(function(){

	queryExaminationBasic();

});

//清空表单 
function emptyFormExamination(){
	$("#data_Examination").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
}

function queryExaminationBasic(curr){
	$("#dataListTbody_Examination tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/exam/selectExaminationTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			success : function(total) {
				$("#total_Examination").html(total);
				page("page_Examination",total,10,10,queryExaminationBasic);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/findExaminationList.do",
		type:"post",
		dataType:"json",
		data:{
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {
                var vcreateTime = new Date(json[i].createTime);

			    tr+="<tr><td>"+json[i].id+"</td><td>"+json[i].templateName+"</td><td>"+json[i].completeCount+"</td><td>"+formatDateD(vcreateTime)+"</td>" +
                    "<td style='width:310px'><ul class='list-inline'><li>" +
                    "<a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_ExamEnterprise'  onclick='openPublish("+json[i].id+")'>发布</a></li><li><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal_Examination'  onclick='findExamination("+json[i].id+")'>查看</a></li><li id='li-examjg-"+json[i].id+"'>" +
                    "<a href='javascript:void(0)' class='editer_btns look_btn' onclick='seeScore("+json[i].id+")'>执法人员结果</a></li>" +
                    "<li id='li-examcyjg-"+json[i].id+"'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='seeCongyeScore("+json[i].id+")'>从业人员结果</a></li>" +
                    "<li><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteExamination("+json[i].id+")'>删除</a></li></ul></td></tr>";
			}
			$("#dataListTbody_Examination").append(tr);
		}
});
}

function openPublish(id) {
    $("#pubexaminationId").val(id);
    //queryExaminationEnterprise();
}
function queryExaminationEnterprise(curr){
    var enterpriseName=$("#enterpriseNamExam").val();
    var enterpriseType=$("#enterpriseTypeExam").val();

    var pageNum = 1;
    if(!curr){
        //初始化分页
        $.ajax({
            url : "${pageContext.request.contextPath}/enterpriseInfo/getEnterpriseListTotal.do",
            type : "post",
            dataType : "json",
            async: false,
            data : {
                enterpriseName:enterpriseName,
                enterpriseType:enterpriseType,
            },
            success : function(total) {
                page("enterpriseExamPage",total,10,10,queryExaminationEnterprise);
            }
        });
    }else{
        pageNum = curr;
    }
    $.ajax({
        url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterpriseList.do",
        type:"post",
        dataType:"json",
        data:{
            enterpriseName:enterpriseName,
            enterpriseType:enterpriseType,
            startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
            limit:10//每页显示的条数
        },
        success : function(data) {
            var tr = "";
            for(var i=0;i<data.length;i++){
                tr = tr + "<tr><td><input type='checkbox'  value='"+data[i].id+"' name='enterpriseId' enterpriseType='"+data[i].enterpriseType+"'></td><td>"+data[i].id+"</td><td>"+data[i].qyname+"</td><td>"+data[i].enterpriseTypeName+"</td><td></tr>";
            }
            $("#enterpriseTbody_Exam").html(tr);
        }
    });
}

function addBtnExamTabPage() {
    creatTabPage("add_examination_tab",'${pageContext.request.contextPath }/exam/jumpScore.do?url=addExamination&random='+Math.random());
}

function findExamination(id){
	$("#save_Examination").hide();
	$("#update_Examination").hide();
	$("#title_Examination").html("查看记录");
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/findExamination.do",
		type:"post",
		dataType:"json",
		data:{
			id:id
		},
		success : function(json) {

			$("input[name='templateName']").val(json.templateName);
			$("input[name='choiceCount']").val(json.choiceCount);
			$("input[name='choiceScore']").val(json.choiceScore);
			$("input[name='choiceTime']").val(json.choiceTime);
			$("input[name='judgmentCount']").val(json.judgmentCount);
			$("input[name='judgmentScore']").val(json.judgmentScore);
			$("input[name='judgmentTime']").val(json.judgmentTime);
			$("input[name='completionCount']").val(json.completionCount);
			$("input[name='completionScore']").val(json.completionScore);
			$("input[name='completionTime']").val(json.completionTime);

		}
	});
}

function formatDateD (strTime) {
    var date = new Date(strTime);
    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
    var second = date.getSeconds()< 10 ? "0" + parseInt(date.getSeconds()) : parseInt(date.getSeconds());
    return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + second;
//    return date.getFullYear()+"年/"+(date.getMonth()+1)+"月/"+date.getDate()+"日";
}

function updateExamination(){
	$.ajax({
		url:"${pageContext.request.contextPath}/exam/updateExamination.do",
		type:"post",
		dataType:"json",
		data:$('#data_Examination').serialize(),
		success : function(data) {
            if(data.result=="true"){
				alertEase("修改信息成功",'alert_succ');
                emptyFormExamination();
                //queryExaminationBasic();
			}else{
				alertEase("修改信息失败",'alert_err');
			}

		}
	});
}

function deleteExamination(id){
	confirmMessage('con_Examination','你确实要删除吗',{width:300,height:150,sure:callBack});
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/exam/delExamination.do",
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
				queryExaminationBasic();
			}
		});	
	}
}

function publishExam() {

//    $("input[name='enterpriseId']:checked").each(function () {
//        var pub ={
//            examinationid:$("#pubexaminationId").val(),
//            enterpriseid:this.value,
//            enterprisetype:$(this).attr("enterpriseType")
//        };
//    headers: {
//        'Accept': 'application/json',
//                'Content-Type': 'application/json'
//    },
//        data.push(pub);
//    });


    $.ajax({
        url:"${pageContext.request.contextPath}/exam/publish.do",
        type:"post",
        dataType:"json",
        data:$("#fmpublishexam").serialize(),
        success : function(data) {
            if(data.result==true){
                alertEase("发布成功",'alert_succ');
                emptyFormExamination();
                queryExaminationBasic();
            }else{
                alertEase("发布失败! "+data.msg,'alert_err');
            }
        }
    });

}

function seeScore(id) {
    creatTabPage("examjg-"+id,'${pageContext.request.contextPath }/exam/jumpScore.do?random='+Math.random()+'&id='+id+"&url=examzhifascore");
}
function seeCongyeScore(id) {

    creatTabPage("examcyjg-"+id,'${pageContext.request.contextPath }/exam/jumpScore.do?random='+Math.random()+'&id='+id+"&url=examscore");

}

//发布目标
function toPublishSelect() {
    $("#selectPublishDiv").html("");
    $("#selectPublishDiv").html('<select class="selectpicker" multiple data-live-search="false" name="list" id="mulSelPublish"></select>');
    $.ajax({
        url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
        type:"post",
        dataType:"json",
        data:{
            type:$("#selPublishType").val()
        },
        success : function(json) {
            for(var i=0;i<json.length;i++) {
                if(i==0){
                    $("#mulSelPublish").append("<option value='"+json[i].id+"' selected>"+json[i].tDictionaryName+"</option>");
                }else{
                    $("#mulSelPublish").append("<option value='"+json[i].id+"'>"+json[i].tDictionaryName+"</option>");
                }
            }
            $('#mulSelPublish').selectpicker({
            });
        }
    });
}
</script>