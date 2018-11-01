<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">人员培训</a></li>
            <li class="active">创建试卷</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box pt10">
    <table class="table search_box marb10">
        <thead>
        <tr>
            <td  class="noborder title_font" style="width:120px">试卷模版名称</td>
            <td class="noborder" style="width:250px"><input type="text"  class="login_input" id="add_exam_templateName"></td>
            <td  class="noborder title_font" style="width:120px"></td>
            <td class="noborder" style="width:250px"></td>
            <td class="noborder"></td>
        </tr>
        <tr>
            <td  class="noborder title_font">选择题</td>
            <td class="noborder"><a href="" class="form_btn2"  data-toggle='modal' data-target='#add_sel_exam_modal' onclick="addSelType('1')">
                <img src="${pageContext.request.contextPath }/images/ioc/choose.png">选择题目</a>
                <div class="title_font"><span class="blue1 " id="total_sel_xuanze"></span></div>
            </td>
            <td  class="noborder title_font">每道选择题分数</td>
            <td class="noborder"><input type="text" class="login_input" id="add_exam_choiceScore"></td>
            <td  class="noborder title_font">每道选择题答题时间(秒)</td>
            <td class="noborder"><input type="text" class="login_input" id="add_exam_choiceTime"></td>
            <td class="noborder"></td>
        </tr>
        <tr>
            <td  class="noborder title_font">判断题</td>
            <td class="noborder"> <a href="" class="form_btn2"  data-toggle='modal' data-target='#add_sel_exam_modal' onclick="addSelType('2')">
                <img src="${pageContext.request.contextPath }/images/ioc/choose.png">选择题目</a>
                <div class="title_font"><span class="blue1 " id="total_sel_panduan"></span></div>
            </td>
            <td  class="noborder title_font">每道判断题分数</td>
            <td class="noborder"><input type="text" class="login_input" id="add_exam_judgmentScore"></td>
            <td  class="noborder title_font">每道判断题答题时间(秒)</td>
            <td class="noborder"><input type="text" class="login_input" id="add_exam_judgmentTime"></td>
            <td class="noborder"></td>
        </tr>
        <tr>
            <td  class="noborder title_font">填空题</td>
            <td class="noborder"><a href="" class="form_btn2"  data-toggle='modal' data-target='#add_sel_exam_modal' onclick="addSelType('3')">
                <img src="${pageContext.request.contextPath }/images/ioc/choose.png">选择题目</a>
                <div class="title_font"><span class="blue1 " id="total_sel_tiankong"></span></div>
            </td>
            <td  class="noborder title_font">每道填空题分数</td>
            <td class="noborder"><input type="text" class="login_input" id="add_exam_completionScore"></td>
            <td  class="noborder title_font">每道填空题答题时间(秒)</td>
            <td class="noborder"><input type="text" class="login_input" id="add_exam_completionTime"></td>
            <td class="noborder"></td>
        </tr>
        <tr>
            <td class="noborder" style="text-align: left" colspan="3">
                <a href="javascript:void(0)" class="form_btn  width140 title_font" data-dismiss="modal" onclick="addExamination()">确认添加</a>
            </td>
			<td class="noborder"></td>
			<td class="noborder"></td>
			<td class="noborder"></td>
			<td class="noborder"></td>
        </tr>
        </thead>
    </table>
</div>
<div class="modal fade addtest_modal" id="add_sel_exam_modal" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">

                <input type="hidden" id="sel_exam_type">
                <table class="table table-bordered table2 marb0 ">
                    <thead>
                    <tr>
                        <th>全选<input type='checkbox' onclick="allChoice(this)"></th>
                        <th>ID</th>
                        <th>试题题目</th>
                        <th>试题选项</th>
                        <th>试题答案</th>
                    </tr>
                    </thead>
                    <tbody id="content_Tbody_addExamination">
                    </tbody>
                </table>
                <div id="select_Exam_Page"></div>
                <div class="text-center" style="margin-top:10px">
                    <a href="javascript:void(0)" class="form_btn " onclick="addExamToList()">确认选择</a>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<script>
function allChoice(ele){
	if(ele.checked){
		$("input[name='check_exam']").prop("checked", true);
	}else{
		$("input[name='check_exam']").removeAttr("checked"); 
	}
}

    var selchoices=[];
    var seljudgment=[];
    var selcompletion=[];

    function queryExamPageList(curr){
        var type=$("#sel_exam_type").val();

        var pageNum = 1;
        if(!curr){
            //初始化分页
            $.ajax({
                url : "${pageContext.request.contextPath}/exam/selectExamTotal.do",
                type : "post",
                dataType : "json",
                async: false,
                data : {
                   type:type
                },
                success : function(total) {
                    page("select_Exam_Page",total,10,10,queryExamPageList);
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
                type:type,
                startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
                limit:10//每页显示的条数
            },
            success : function(data) {
                var tr = "";
                for(var i=0;i<data.length;i++){
                    tr = tr + "<tr><td><input type='checkbox'  value='"+data[i].id+"' name='check_exam'></td>" +
                            "<td>"+data[i].id+"</td><td>"+data[i].title+"</td><td>"+data[i].content+"</td><td>"+data[i].answer+"</td></tr>";
                }
                $("#content_Tbody_addExamination").html(tr);
            }
        });
    }

    function addSelType(type){

        if(type=="1"){
            $("#sel_exam_type").val("选择题");
        }else  if(type=="2"){
            $("#sel_exam_type").val("判断题");
        }else if(type=="3"){
            $("#sel_exam_type").val("填空题");
        }

        queryExamPageList();

    }

    function addExamToList() {
        var type=$("#sel_exam_type").val();
        var result="0";

        if(type=="选择题"){

            $('input[name="check_exam"]:checked').each(function(){

                var index=findIndex(selchoices,$(this).val());
                if(index==-1){
                    selchoices.push(
                            $(this).val()
                    );
                    result="2";
                }
            });
        }else if(type=="判断题"){

            $('input[name="check_exam"]:checked').each(function(){

                var index=findIndex(seljudgment,$(this).val());
                if(index==-1){
                    seljudgment.push(
                            $(this).val()
                    );
                    result="2";
                }
            });
        }else if(type=="填空题"){

            $('input[name="check_exam"]:checked').each(function(){

                var index=findIndex(selcompletion,$(this).val());
                if(index==-1){
                    selcompletion.push(
                            $(this).val()
                    );
                    result="2";
                }
            });
        }

        if(result=="0"){
            //alertEase("选择的试题不能为空",2);
            return;
        }

        confirmMessage('con_addSamTask','选择的试题已添加,确定结束选择吗(点击取消继续选择)',{width:300,height:150,sure:callBack_add_Exam});
        function callBack_add_Exam(){
            $("#add_sel_exam_modal").hide();

            if(type=="选择题"){
                if(selchoices.length>0){
                    $("#total_sel_xuanze").html("已选择"+selchoices.join(","));
                }
            }else if(type=="判断题"){
                if(seljudgment.length>0){
                    $("#total_sel_panduan").html("已选择"+seljudgment.join(","));
                }
            }else if(type=="填空题"){
                if(selcompletion.length>0){
                    $("#total_sel_tiankong").html("已选择"+selcompletion.join(","));
                }
            }

        }


    }


    function findIndex(sels,id) {
        var index=-1;
        if(sels.length>0){
            for ( var i = 0; i < sels.length; i++) {
                if(sels[i]==id){
                    return i;
                }
            }
        }
        return index;
    }



    function addExamination(){
        
    	
        if (selchoices.length == 0&&seljudgment.length == 0&&selcompletion.length == 0) {
            return;
        }

        var templateName=$("#add_exam_templateName").val();
        if(templateName==undefined||templateName.length==0){
            alertEase("试卷模版名称不能为空",2);
            return;
        }
        if (selchoices.length > 0) {
	        var choiceScore=$("#add_exam_choiceScore").val();
	        if(choiceScore==undefined||choiceScore.length==0){
	            alertEase("选择题分数不能为空",2);
	            return;
	        }
        }
        if (seljudgment.length > 0) {
	        var judgmentScore=$("#add_exam_judgmentScore").val();
	        if(judgmentScore==undefined||judgmentScore.length==0){
	            alertEase("判断题分数不能为空",2);
	            return;
	        }
        }
        if (selcompletion.length > 0) {
	        var completionScore=$("#add_exam_completionScore").val();
	        if(completionScore==undefined||completionScore.length==0){
	            alertEase("填空题分数不能为空",2);
	            return;
	        }
        }
        if (selchoices.length > 0) {
	        var choiceTime=$("#add_exam_choiceTime").val();
	        if(choiceTime==undefined||choiceTime.length==0){
	            alertEase("选择题答题时间不能为空",2);
	            return;
	        }
        }
        if (seljudgment.length > 0) {
	        var judgmentTime=$("#add_exam_judgmentTime").val();
	        if(judgmentTime==undefined||judgmentTime.length==0){
	            alertEase("判断题答题时间不能为空",2);
	            return;
	        }
        }
        if (selcompletion.length > 0) {
	        var completionTime=$("#add_exam_completionTime").val();
	        if(completionTime==undefined||completionTime.length==0){
	            alertEase("填空题答题时间不能为空",2);
	            return;
	        }
        }

        var data={
            templateName:$("#add_exam_templateName").val(),
            choiceScore:$("#add_exam_choiceScore").val(),
            judgmentScore:$("#add_exam_judgmentScore").val(),
            completionScore:$("#add_exam_completionScore").val(),
            choiceTime:$("#add_exam_choiceTime").val(),
            judgmentTime:$("#add_exam_judgmentTime").val(),
            completionTime:$("#add_exam_completionTime").val(),
            choiceCount:selchoices.join(","),
            judgmentCount:seljudgment.join(","),
            completionCount:selcompletion.join(","),
        };


        $.ajax({
            url:"${pageContext.request.contextPath}/exam/addExamination.do",
            type:"post",
            dataType:"json",
            data:data,
            success : function(data) {
                if(data.result=="true"){
                    alertEase("新增成功",1);
                    queryExaminationBasic();
                }else{
                    alertEase("新增失败! "+data.msg,2);
                }
            }
        });
    }


</script>