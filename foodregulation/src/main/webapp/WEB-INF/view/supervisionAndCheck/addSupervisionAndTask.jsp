<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">添加监督检查任务</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box pt10">
    <div class="marb10 " >
        <div class="marb10">
            <a href="" class="form_btn2"  data-toggle='modal' data-target='#add_sampTask_modal' onclick="querySamTaskEnterprise()"><img src="${pageContext.request.contextPath }/images/ioc/choose.png"> 选择企业</a>
        </div>
        <div class="title_font">您已选择了   <span class="blue1 " id="total_selent">0</span>个企业</div>
        <div class="title_font">已选择企业列表 <span class="blue1 " id="enterpriseList"></span></div>
    </div>
    <table class="table search_box marb10">
        <thead>
        <tr>
            <td  class="noborder">选择企业类别</td>
            <td>
                <select  style="" name="supervisionAndCheckType" id="supervisionAndCheckTypeAddTask">
	                <c:forEach items="${enterpriseTypeList}" var="list">
		        		   	<option  value="${list.tDictionaryCode}">${list.tDictionaryName}</option>
		          	</c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th class="width120 noborder">
                检查时间
            </th>
            <th class="text-left noborder">
                <div id="samTaskStart_date_calenderOneBox" style="position:relative"  class="width220 pull-left">
                    <input id="samTaskStart_date_calender" class="bg_calender" size="16" type="text" name="checkStartDateStr" readonly>
                </div>
                <span class="pull-left test_line"> —— </span>
                <div id="samTaskEnd_date_calenderOneBox" style="position:relative" class="width220 pull-left" >
                    <input id="samTaskEnd_date_calender" class="bg_calender" size="16" type="text" name="checkEndDateStr" readonly>
                </div>
            </th>
        </tr>
        <tr>
            <th class="noborder">
                                           检查频次
            </th>
            <th class="text-left noborder ">
                <select class="select_style1 marr10 input2 width120" name="checkFrequencyCode" id="checkFrequencyCodeSam_Add">
                    <option value="">请选择</option>
                    <c:forEach items="${checkFrequencyList}" var="list">
                        <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                    </c:forEach>
                </select>
            </th>
        </tr>
        <tr>
            <th class="noborder">
                委托单位
            </th>
            <th class="text-left noborder ">
                <select class="select_style1 marr10 input2 width120" name="unitCode" id="unitCodeSam_Add">
                    <option value="">请选择</option>
                    <c:forEach items="${unitList}" var="list">
                        <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                    </c:forEach>
                </select>
            </th>
        </tr>
        <tr>
            <td class="noborder title_font" ></td>
            <td style="text-align: left" colspan="3">
                <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_samTask"  data-dismiss="modal" onclick="saveTask()">确认添加</a>
                <%--<a href="javascript:void(0)" class="form_btn  width140 title_font" id="update_samTask"  data-dismiss="modal" onclick="updateExamination()">确认修改</a>--%>
            </td>

        </tr>
        </thead>
    </table>
</div>
<div class="modal fade addtest_modal" id="add_sampTask_modal" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">选择企业</div>
                <button type="button" class="close" data-dismiss="modal" onclick="addBtnSamTask()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <table class="table search_box  marb30">
                    <thead>
                    <tr>
                        <th>企业名称</th>
                        <th>
                            <div class="search_parent">
                                <input type="text" class="search_input" id="enterpriseNamSamTaskAdd">
                                <a class="search_btn" href="#" onclick="querySamTaskEnterprise()">搜索</a>
                            </div>
                        </th>
                        <th class="table3_th">监管单位</th>
                        <th>
                            <select class="select_style1 marr10 input2" name="unitCode" id="unitCodeSamTaskAdd">
                                <option value="">请选择</option>
                                <c:forEach items="${unitList}" var="list">
                                    <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                                </c:forEach>
                            </select>
                        </th>
                        <th class="table3_th">行政区域</th>
                        <th>
                            <select class="select_style1 marr10 input2" name="regionCode" id="regionCodeSamTaskAdd">
                                <option value="">请选择</option>
                                <c:forEach items="${addressList}" var="list">
                                    <option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                                </c:forEach>
                            </select>
                        </th>
                    </tr>
                    </thead>
                </table>
                <table class="table table-bordered table2 marb0 ">
                    <thead>
                    <tr>
                        <th><input type='checkbox' id="allCheckSuper">选择</th>
                        <th>企业类别</th>
                        <th>监管单位</th>
                        <th>行政区域</th>
                        <th>企业名称</th>
                    </tr>
                    </thead>
                    <tbody id="enterpriseTbody_SuperTask">
                    </tbody>
                </table>
                <div id="enterpriseSamTaskPage"></div>
                <div class="text-center">
                    <a href="javascript:void(0)" class="form_btn " onclick="addEnterpriseId()">确认选择</a>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){

        $('#samTaskStart_date_calender').datetimepicker({
            container:'#samTaskStart_date_calenderOneBox',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format:'yyyy-mm-dd'
        });
        $('#samTaskEnd_date_calender').datetimepicker({
            container:'#samTaskEnd_date_calenderOneBox',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format:'yyyy-mm-dd'
        });
    });

    $("#allCheckSuper").click(function(){
        if(this.checked){
            $("#enterpriseTbody_SuperTask :checkbox").prop("checked", true);
        }else{
            $("#enterpriseTbody_SuperTask :checkbox").prop("checked", false);
        }
    });

    $("#enterpriseTypeSamTaskAdd").change(function(){
        querySamTaskEnterprise();
    });
    $("#unitCodeSamTaskAdd").change(function(){
        querySamTaskEnterprise();
    });
    $("#regionCodeSamTaskAdd").change(function(){
        querySamTaskEnterprise();
    });


    function querySamTaskEnterprise(curr){
        var enterpriseName=$("#enterpriseNamSamTaskAdd").val();
        var enterpriseType=$("#supervisionAndCheckTypeAddTask").val();
        var unitCode=$("#unitCodeSamTaskAdd").val();
        var regionCode=$("#regionCodeSamTaskAdd").val();

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
                    unitCode:unitCode,
                    regionCode:regionCode,
                },
                success : function(total) {
                    page("enterpriseSamTaskPage",total,10,10,querySamTaskEnterprise);
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
                unitCode:unitCode,
                regionCode:regionCode,
                startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
                limit:10//每页显示的条数
            },
            success : function(data) {
                var tr = "";
                for(var i=0;i<data.length;i++){
                    tr = tr + "<tr><td><input type='checkbox'  value='"+data[i].id+"' name='enterpriseId' enterpriseType='"+data[i].enterpriseType+"'></td>" +
                            "<td>"+data[i].enterpriseTypeName+"</td><td>"+data[i].unitName+"</td><td>"+data[i].region+"</td><td name='qyname'>"+data[i].qyname+"</td></tr>";
                }
                $("#enterpriseTbody_SuperTask").html(tr);
            }
        });
    }

    function addBtnSamTask(){
//	$("#update_samTask").hide();

        querySamTaskEnterprise();

    }

    var enterpriseIds="";
    var enterpriseNames="";
    function addEnterpriseId() {
    	    enterpriseIds="";
    	    enterpriseNames="";
            $('input[name="enterpriseId"]:checked').each(function(){
                        enterpriseIds+=$(this).val()+",";
                        enterpriseNames+=$(this).parent().parent().find("td[name='qyname']").html()+",";
                    }
            );

            if(enterpriseIds==""){
                alertEase("选择的企业不能为空",2);
                return;
            }

            confirmMessage('con_addSamTask','选择的企业已添加,确定结束选择企业吗(点击取消继续选择)',{width:300,height:150,sure:callBack});
            function callBack(){
                $("#add_sampTask_modal").hide();
                $("#total_selent").html(enterpriseIds.split(",").length-1);
				$("#enterpriseList").html(enterpriseNames);
            }
    }



    function saveTask() {
        if (enterpriseIds.length == 0) {
            alertEase("请选择企业",2);
            return
        }
        var data={
        	starttimeStr:$("input[name='checkStartDateStr']").val(),
        	endtimeStr:$("input[name='checkEndDateStr']").val(),
            enterprisetype:$("#supervisionAndCheckTypeAddTask").val(),
            unitcode:$("#unitCodeSam_Add").val(),
            checkFrequencyCode:$("#checkFrequencyCodeSam_Add").val(),
            enterpriseids:enterpriseIds,
            enterpriseNames:enterpriseNames
        };

        $.ajax({
            url:"${pageContext.request.contextPath}/supervisionAndCheck/saveTask.do",
            type:"post",
            dataType:"json",
            data:data,
            success : function(data) {
                if(data.result=="true"){
                    alertEase("新增成功",'alert_succ');
                    querySupervisionCheckTask();
                }else{
                    alertEase("新增失败! "+data.msg,'alert_err');
                }
            }
        });
    }
</script>