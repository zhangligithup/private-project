<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">抽样检验</a></li>
            <li class="active">添加抽样检验任务</li>
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
        <div class="title_font">您已选择了   <span class="blue1 " id="total_selent">0</span>      个企业</div>
    </div>
    <table class="table search_box marb10">
        <thead>
        <tr>
            <th class="width120 noborder">
                抽检时间
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
                委托单位
            </th>
            <th class="text-left noborder ">
                <select class="select_style1 marr10 input2" name="unitCode" id="unitCodeSam_Add">
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
                <a href="javascript:void(0)" class="form_btn  width140 title_font" id="save_samTask"  data-dismiss="modal" onclick="addSamTask()">确认添加</a>
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
                        <th>企业类别</th>
                        <th>
                            <select class="select_style1" id="enterpriseTypeSamTaskAdd">
                                <option value="" selected>请选择</option>
                                <c:forEach  items="${enterpriseTypeList}" var="enterpriseType">
                                    <option  value="${enterpriseType.tDictionaryCode}" >${enterpriseType.tDictionaryName}</option>
                                </c:forEach >
                            </select>
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
                        <th><input type='checkbox' id="allCheckSamTask">选择</th>
                        <th>企业类别</th>
                        <th>监管单位</th>
                        <th>行政区域</th>
                        <th>企业名称</th>
                        <th>分配抽检批次</th>
                    </tr>
                    </thead>
                    <tbody id="enterpriseTbody_SamTask">
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

    $("#enterpriseTypeSamTaskAdd").change(function(){
        querySamTaskEnterprise();
    });
    $("#unitCodeSamTaskAdd").change(function(){
        querySamTaskEnterprise();
    });
    $("#regionCodeSamTaskAdd").change(function(){
        querySamTaskEnterprise();
    });

    $("#allCheckSamTask").click(function(){
        if(this.checked){
            $("#enterpriseTbody_SamTask :checkbox").prop("checked", true);
        }else{
            $("#enterpriseTbody_SamTask :checkbox").prop("checked", false);
        }
    });

    var enterpriseIds=[];

    function querySamTaskEnterprise(curr){
        var enterpriseName=$("#enterpriseNamSamTaskAdd").val();
        var enterpriseType=$("#enterpriseTypeSamTaskAdd").val();
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
                            "<td>"+data[i].enterpriseTypeName+"</td><td>"+data[i].unitName+"</td><td>"+data[i].region+"</td><td>"+data[i].qyname+"</td>" +
                            "<td><input type='text' enterpriseId='"+data[i].id+"' name='batch'</td></tr>";
                }
                $("#enterpriseTbody_SamTask").html(tr);
            }
        });
    }

    function addBtnSamTask(){
//	$("#update_samTask").hide();

        querySamTaskEnterprise();

    }

    function addEnterpriseId() {

        var result="0";

        $('input[name="enterpriseId"]:checked').each(function(){
            var batch=$("input[name='batch'][enterpriseId='"+$(this).val()+"']").val();
            if(batch==undefined){
                result="1";
                alertEase("选择的企业批次不能为空",2);
                return false;
            }
            if(isNaN(batch)){
                result="1";
                alertEase("选择的企业批次只能为数字",2);
                return false;
            }

            if(batch.length==0){
                result="1";
                alertEase("选择的企业批次不能为空",2);
                return false;
            }
        });
        if(result=="0"){
            $('input[name="enterpriseId"]:checked').each(function(){
                        var batch=$("input[name='batch'][enterpriseId='"+$(this).val()+"']").val();
                        enterpriseIds.push({
                            enterpriseId:$(this).val(),
                            batch:batch,
                            enterpriseType:$(this).attr("enterpriseType"),
                        });

                        result="2";
                    }
            );

            if(result=="0"){
                alertEase("选择的企业不能为空",2);
                return;
            }

            confirmMessage('con_addSamTask','选择的企业已添加,确定结束选择企业吗(点击取消继续选择)',{width:300,height:150,sure:callBack});
            function callBack(){
                $("#add_sampTask_modal").hide();
                $("#total_selent").html(enterpriseIds.length);

            }
        }

    }



    function addSamTask() {
        if (enterpriseIds.length == 0) {
            alertEase("请选择企业",2);
            return
        }
        var data={
            checkStartDateStr:$("input[name='checkStartDateStr']").val(),
            checkEndDateStr:$("input[name='checkEndDateStr']").val(),
            unitCode:$("#unitCodeSam_Add").val(),
            unitName:$("#unitCodeSam_Add").find("option:selected").text(),
            listJson:JSON.stringify(enterpriseIds)
        };

        $.ajax({
            url:"${pageContext.request.contextPath}/samplingInspection/addSampTaskList.do",
            type:"post",
            dataType:"json",
            data:data,
            success : function(data) {
                if(data.result=="true"){
                    alertEase("新增成功",'alert_succ');
                    querySamTaskBasic();
                }else{
                    alertEase("新增失败! "+data.msg,'alert_err');
                }
            }
        });
    }
</script>