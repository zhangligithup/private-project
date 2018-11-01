<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">行政处罚</a></li>
            <li class="active">查看详情</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <table class="table table4 marb0">
        <tbody>
        <tr>
            <th >涉案企业</th>
            <td><input type="text" class="login_input width260" name="caseInfoCompany" value="${caseInfo.caseInfoCompany}" readonly></td>

        </tr>
        <tr>
            <th >立案人</th>
            <td><input type="text" class="login_input width260" name="caseInfoFilingPerson" value="${caseInfo.caseInfoFilingPerson}" readonly></td>
        </tr>
        <tr>
            <th >案件来源类型</th>
            <td>
                <input type="text" class="login_input width260" name="caseInfo_caseFromId" value="${caseInfo.caseFromContent}" readonly>
            </td>
        </tr>
        <tr>
            <th >立案时间</th>
            <td>
                <div id="calenderOneBox" style="position:relative">
                    <input id="caseInfoTime" name="caseInfoTime" class="login_input bg_calender  width260" size="16" type="text" value="${caseInfo.caseInfoTime}" readonly>
                </div>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >案由</th>
            <td>
                <textarea name="caseInfoReason" id="caseInfoReason" cols="30" rows="10"  class="login_input login_textarea width700" readonly>${caseInfo.caseInfoReason}</textarea>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >违法条款</th>
            <td>
                <input type="hidden" name="illegalClauseIds">
                <div class="choose_div width700" id="illegalClauseContents">${caseInfo.illegalClauseContents}</div>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >违法具体内容</th>
            <td>
                <textarea name="illegalClauseDetailContent" id="illegalClauseDetailContent" cols="30" rows="10"  class="login_input login_textarea width700" readonly>${caseInfo.illegalClauseDetailContent}</textarea>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >处罚依据</th>
            <td>
                <input type="hidden" name="punishBasisIds">
                <div class="choose_div width700" id="punishBasisContents">${caseInfo.punishBasisContents}</div>
            </td>
        </tr>
        <tr>
            <th  class="verticalTop" >处罚具体内容</th>
            <td>
                <textarea name="punishBasisDetailContent" id="punishBasisDetailContent" cols="30" rows="10"  class="login_input login_textarea width700" readonly>${caseInfo.punishBasisDetailContent}</textarea>
            </td>
        </tr>

        </tbody>
    </table>
</div>






