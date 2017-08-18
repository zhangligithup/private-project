<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">企业信用</a></li>
            <li class="active">查看详情</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box details_tabs">
    <ul id="myTab2" class="nav nav-tabs">
        <li class="active">
            <a href="#one" data-toggle="tab">基本信息</a>
        </li>
        <li>
            <a href="#two" data-toggle="tab">监督检查</a>
        </li>
        <!--<li>
            <a href="#three" data-toggle="tab">抽样检验</a>
        </li>-->
        <li>
            <a href="#four" data-toggle="tab">行政处罚</a>
        </li>
        <li>
            <a href="#five" data-toggle="tab">投诉举报</a>
        </li>
    </ul>
    <div id="myTabContent2" class="tab-content">
        <div class="tab-pane  in active" id="one">
            <h3 class="title_h3">${detailCredit.qyname}——基本信息</h3>
            <div class="titledivone marb3">
                <div class="title_txt">基本信息</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td  class="table3_th">企业名称</td>
                    <td width="35%" class="text-left">${detailCredit.qyname}</td>
                    <td  class="table3_th">企业地址</td>
                    <td class="text-left">${detailCredit.scaddress}</td>
                </tr>
                <tr>
                    <td class="table3_th">行政区域</td>
                    <td  class="text-left">${detailCredit.addressName}</td>
                    <td  class="table3_th">监管单位</td>
                    <td class="text-left">${detailCredit.departmentName}</td>
                </tr>
                <tr>
                    <td class="table3_th">企业负责人</td>
                    <td  class="text-left">${detailCredit.qydelegate}</td>
                    <td  class="table3_th">电话</td>
                    <td class="text-left">${detailCredit.qyphone}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane " id="two">
            <h3 class="title_h3">${detailCredit.qyname}——监督检查</h3>
            <div class="titledivone marb3">
                <div class="title_txt">监督检查</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td  class="table3_th">企业名称</td>
                    <td width="35%" class="text-left">${supervisionAndCheck.checkedEnterpriseName}</td>
                    <td  class="table3_th">检查人员姓名</td>
                    <td class="text-left">${supervisionAndCheck.checkPersonName}</td>
                </tr>
                <tr>
                    <td class="table3_th">检查地点</td>
                    <td  class="text-left">${supervisionAndCheck.checkAddress}</td>
                    <td  class="table3_th">检查日期</td>
                    <td class="text-left">${supervisionAndCheck.checkDate}</td>
                </tr>
                <tr>
                    <td class="table3_th">检查结果</td>
                    <td  class="text-left">${supervisionAndCheck.checkResult}</td>
                    <td  class="table3_th">结果处理</td>
                    <td class="text-left">${supervisionAndCheck.resultHandle}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--<div class="tab-pane fade" id="three">
            <p>抽样检验</p>
        </div>-->
        <div class="tab-pane " id="four">
            <h3 class="title_h3">${detailCredit.qyname}——行政处罚</h3>
            <div class="titledivone marb3">
                <div class="title_txt">行政处罚</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td  class="table3_th">涉案企业</td>
                    <td width="35%" class="text-left">${caseInfo.caseInfoCompany}</td>
                    <td  class="table3_th">立案人</td>
                    <td class="text-left">${caseInfo.caseInfoFilingPerson}</td>
                </tr>
                <tr>
                    <td class="table3_th">案件来源类型</td>
                    <td  class="text-left">${caseInfo.caseFromContent}</td>
                    <td  class="table3_th">立案时间</td>
                    <td class="text-left">${caseInfo.caseInfoTime}</td>

                </tr>
                <tr>
                    <td  class="table3_th">案由</td>
                    <td width="35%">${caseInfo.caseInfoReason}</td>
                    <td  class="table3_th">违法条款</td>
                    <td>${caseInfo.illegalClauseContents}</td>
                </tr>
                <tr>
                    <td  class="table3_th">违法具体内容</td>
                    <td width="35%">${caseInfo.illegalClauseDetailContent}</td>
                    <td  class="table3_th">违法依据</td>
                    <td>${caseInfo.punishBasisContents}</td>
                </tr>
                <tr>
                    <td  class="table3_th">处罚具体内容</td>
                    <td width="35%">${caseInfo.punishBasisDetailContent}</td>
                    <td  class="table3_th"></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane " id="five">
            <h3 class="title_h3">${detailCredit.qyname}——投诉举报</h3>
            <div class="titledivone marb3">
                <div class="title_txt">基本信息</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td  class="table3_th">企业名称</td>
                    <td width="35%" class="text-left">${report.reportCompany}</td>
                    <td  class="table3_th">投诉类型</td>
                    <td class="text-left">${report.reportTypeName}</td>
                </tr>
                <tr>
                    <td class="table3_th">投诉人姓名</td>
                    <td  class="text-left">${report.reportName}</td>
                    <td  class="table3_th">投诉人电话</td>
                    <td class="text-left">${report.reportTel}</td>
                </tr>
                <tr>
                    <td class="table3_th">监管单位</td>
                    <td  class="text-left">${report.reportLocalName}</td>
                    <td  class="table3_th">执法人员</td>
                    <td class="text-left">${report.reportOfficialPersonName}</td>
                </tr>
                <tr>
                    <td  class="table3_th">投诉时间</td>
                    <td width="35%">${report.reportTime}</td>
                    <td  class="table3_th">投诉内容</td>
                    <td width="35%" class="text-left">${report.reportContent}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>






