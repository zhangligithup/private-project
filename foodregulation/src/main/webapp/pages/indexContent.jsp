<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content_box">
    <div class="index_box_left">
        <div class="index_box_title">
            <span class="pull-left">通知公告</span>
            <span class="pull-right index_title_more"><a href="javascript:void(0)" onclick="creatTabPage(35,'${pageContext.request.contextPath }/notification/show.do')">more》</a></span>
        </div>
        <ul class="index_ul marb10" id="ul_indexNews">
           
        </ul>
        <div class="nothing" style="display:none" id="div_indexNewsNull">
            <img src="${pageContext.request.contextPath}/images/ioc/nothing.png" alt="">
        </div>
        <div class="index_box_title">
            <span class="pull-left">投诉举报</span>
            <span class="pull-right index_title_more"><a href="javascript:void(0)" onclick="creatTabPage(14,'${pageContext.request.contextPath}/report/report.do')">more》</a></span>
        </div>
        <ul class="index_ul marb10" id="ul_indexReport">
           
        </ul>
        <div class="nothing" style="display:none"  id="div_indexReportNull">
            <img src="${pageContext.request.contextPath}/images/ioc/nothing.png" alt="">
        </div>
    </div>
    <div class="index_box_right">
        <div class="index_box_title">
            <span class="pull-left" id="totalCount"></span>
            <span class="pull-right index_title_more"><a href="javascript:void(0)" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">more》</a></span>
        </div>
        <div class="index_ul index_ul_title2">
            <span class="lspan2 pl20">企业分类</span><span class="cspan">数量</span> <span class="rspan ">详细</span>
        </div>
        <ul class="index_ul">
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">食品生产企业</a></span>
                <span class="cspan" id="span_production"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">食品销售企业</a></span>
                <span class="cspan" id="span_criculate"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">食品餐饮企业</a></span>
                <span class="cspan" id="span_food"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">酒类销售企业</a></span>
                <span class="cspan" id="span_wine"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">保健食品销售企业</a></span>
                <span class="cspan" id="span_health"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">化妆品销售企业</a></span>
                <span class="cspan" id="span_cosmetic"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">药品零售企业</a></span>
                <span class="cspan" id="span_drug"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">医疗器械销售企业</a></span>
                <span class="cspan" id="span_medical"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">医疗器械使用企业</a></span>
                <span class="cspan" id="span_usemed"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>
            <li>
                <span class="lspan2 "><a href="javascript:void(0)">食品小摊点经营户</a></span>
                <span class="cspan" id="span_agricultural"></span>
                <span class="rspan"><a href="javascript:void(0)" class="editer_btns look_btn" onclick="creatTabPage(46,'${pageContext.request.contextPath }/enterpriseInfo/show.do')">查看</a></span>
            </li>

        </ul>
    </div>
</div>



<div class="modal fade addsource_modal" id="index_mymodal_report" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" ><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">查看详情</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <div class="content_box">
                        <div class="pull-left add_personl">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th>投诉类型</th>
                                    <td>
                                    	<input type="text" class="login_input width260" name="index_reportTypeId" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th >投诉人姓名</th>
                                    <td><input type="text" class="login_input width260" name="index_reportName" readonly></td>

                                </tr>                              
                                <tr>
                                    <th>联系电话</th>
                                    <td><input type="text" class="login_input width260" name="index_reportTel" readonly></td>
                                </tr>
                                <tr>
                                    <th >被投诉企业名称</th>
                                    <td><input type="text" class="login_input width260" name="index_reportCompany" readonly></td>

                                </tr>
                                <tr>
                                    <th >投诉内容</th>
                                    <td>
                                    	<textarea name="index_reportContent" id="index_reportContent" cols="30" rows="10"  class="login_input login_textarea width500" readonly></textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>  
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<div class="modal fade addsource_modal" id="index_mymodal_notification" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="" >查看详情</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <form id="noti" onsubmit="return saveNoti();" action="javascript:void(0)">
                <table class="table table3 marb0">
                    <tbody>
                    <tr>
                        <td  class="width60 noborder title_font">标题</td>
                        <td><input type="text" name="index_title" class="login_input"></td>

                    </tr>
                    <tr>
                        <td class="noborder title_font ">内  容</td>
                        <td>
                            <textarea id="index_content" cols="30" rows="10"  class="login_input login_textarea"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">附件列表</td>
                        <td>
                        	<div id="imgNoti" style="text-align:left"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder title_font ">发送至</td>
                        <td>
                        	<input type="text" id="toCodeName" class="login_input" readonly>
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
<!-- 隐藏域 登录人ID -->
<input type="hidden" name="personId" value="${personId}"> 
<!-- 隐藏域 登录人单位code -->
<input type="hidden" name="uitcode" value="${uitcode}"> 

<script>
$(document).ready(function(){
	getUserMenus();
	queryIndexNews();
	queryIndexReport();
	$("#span_agricultural").html(selectDataCount("agricultural"));
	$("#span_production").html(selectDataCount("production"));
	$("#span_criculate").html(selectDataCount("criculate"));
	$("#span_food").html(selectDataCount("food"));
	$("#span_wine").html(selectDataCount("wine"));
	$("#span_health").html(selectDataCount("health"));
	$("#span_cosmetic").html(selectDataCount("cosmetic"));
	$("#span_drug").html(selectDataCount("drug"));
	$("#span_medical").html(selectDataCount("medical"));
	$("#span_usemed").html(selectDataCount("usemed"));
	$("#totalCount").html("食药监管企业（"+(parseInt(selectDataCount('usemed'))+parseInt(selectDataCount('production'))+parseInt(selectDataCount('agricultural'))
			+parseInt(selectDataCount('criculate'))+parseInt(selectDataCount('food'))+parseInt(selectDataCount('wine'))
			+parseInt(selectDataCount('health'))+parseInt(selectDataCount('cosmetic'))+parseInt(selectDataCount('drug'))+parseInt(selectDataCount('medical')))+"家）");
});
//查询加载公告
function queryIndexNews(){
	$.ajax({
		url:"${pageContext.request.contextPath}/notification/query.do",
		type:"post",
		dataType:"json",
		data:{
			personId:$("input[name='personId']").val(),
			toCode:$("input[name='uitcode']").val()
		},
		success : function(json) {
			if(json.length>5){
				for(var i=0;i<5;i++) {
					$("#ul_indexNews").append("<li><span class='lspan'><a href='javascript:void(0)'  data-toggle='modal' data-target='#index_mymodal_notification'  onclick='detailNotificationIndex("+json[i].id+")'>"+json[i].title+"</a></span><span class='rspan'>"+(json[i].time==null?'':json[i].time.substring(0,10))+"</span></li>");
				}
			}else if(json.length==0){
				$("#div_indexNewsNull").show();
				$("#ul_indexNews").hide();
			}else{				
				for(var j=0;j<json.length;j++) {
					$("#ul_indexNews").append("<li><span class='lspan'><a href='javascript:void(0)' data-toggle='modal' data-target='#index_mymodal_notification'  onclick='detailNotificationIndex("+json[j].id+")'>"+json[j].title+"</a></span><span class='rspan'>"+(json[j].time==null?'':json[j].time.substring(0,10))+"</span></li>");
				}
			}
		}
	});
}
//查询加载投诉举报
function queryIndexReport(){
	$.ajax({
		url:"${pageContext.request.contextPath}/report/selectReport.do",
		type:"post",
		dataType:"json",
		success : function(json) {
			if(json.length>5){
				for(var i=0;i<5;i++) {
					$("#ul_indexReport").append("<li><span class='lspan'><a href='javascript:void(0)' data-toggle='modal' data-target='#index_mymodal_report'  onclick='detailReportIndex("+json[i].reportId+")' >"+json[i].reportCompany+"</a></span><span class='rspan'>"+(json[i].reportTime==null?'':json[i].reportTime.substring(0,10))+"</span></li>");
				}
			}else if(json.length==0){
				$("#div_indexReportNull").show();
				$("#ul_indexReport").hide();
			}else{
				for(var j=0;j<json.length;j++) {
					$("#ul_indexReport").append("<li><span class='lspan'><a href='javascript:void(0)' data-toggle='modal' data-target='#index_mymodal_report'  onclick='detailReportIndex("+json[j].reportId+")' >"+json[j].reportCompany+"</a></span><span class='rspan'>"+(json[j].reportTime==null?'':json[j].reportTime.substring(0,10))+"</span></li>");
				}
			}
		}
	});
}
//投诉举报查看
function detailReportIndex(reportId){
	$.ajax({
		url:"${pageContext.request.contextPath}/report/findReport.do",
		type:"post",
		dataType:"json",
		data:{
			reportId:reportId
		},
		success : function(json) {
			$("input[name='index_reportName']").val(json.reportName);
			$("input[name='index_reportTel']").val(json.reportTel);			
			$("input[name='index_reportCompany']").val(json.reportCompany);
			$("#index_reportContent").val(json.reportContent);
			$("input[name='index_reportTypeId']").val(json.reportTypeName);
		}
	});
}
//公告查看
function detailNotificationIndex(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/notification/findNotification.do",
		type:"post",
		dataType:"json",
		data:{
			id:id
		},
		success : function(json) {
			$("input[name='index_title']").val(json.title);
			$("#index_content").val(json.content);
			 var imgUrlStr = json.url;
             if(imgUrlStr&&imgUrlStr!="null"){
                     var imgUrls = imgUrlStr.split(",");
                     var imgA="";
                     for(var j=0;j<imgUrls.length;j++) {
                         if(imgUrls[j]){
                               imgA+="<a href='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"' download>"+imgUrls[j]+"</a><br>";
                         }
                     }
                     $("#imgNoti").html(imgA);
             }
			$("#toCodeName").val(json.toCodeName);
		}
	});
}

function selectDataCount(tableName){
	var count = "";
	$.ajax({
		url:"${pageContext.request.contextPath}/common/selectDataCount.do",
		type:"post",
		dataType:"json",
		async:false,
		data:{
			tableName:tableName
		},
		success : function(json) {
			count = json;
		}
	});
	return count;
}
</script>