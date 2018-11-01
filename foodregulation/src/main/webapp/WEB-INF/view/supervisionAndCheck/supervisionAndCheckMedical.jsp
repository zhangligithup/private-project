<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="addscMedical">
<input type = "hidden" value="enterprise_10" name="enterpriseTypeCode">
<input type = "hidden" value="${dealTaskId}" name="taskId">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">添加医疗器械销售监督检查</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <div class="titledivone marb3">
        <div class="title_txt">基本信息</div>
    </div>
     <table class="table  table3">
        <tbody>
        <tr>
            <td  class="table3_th">被检查单位名称</td>
            <td width="35%"><input name="checkedEnterpriseName" type="text" class="input2" id="checkedEnterpriseName" readonly value="${enterpriseName}"></td>
            <td  class="table3_th">地址</td>
            <td><input type="text" class="input2" name="_address"></td>

        </tr>
        <tr>
            <td  class="table3_th">企业负责人</td>
            <td width="35%"><input type="text" class="input2" name="_person"></td>
            <td  class="table3_th">电话（手机号）</td>
            <td><input type="text" class="input2" name="_phone"></td>

        </tr>
        <tr>
            <td  class="table3_th">许可证编号</td>
            <td width="35%"><input type="text" class="input2" name="_code1"></td>
            <td  class="table3_th">注册号/统一社会信用代码</td>
            <td><input type="text" class="input2" name="_code2"></td>

        </tr>
        <tr>
            <td  class="table3_th">检查时间</td>
            <td>
                 <input name="checkDate" class="input2 bg_calender" size="16" type="text" value="${checkDate}" readonly>
           </td>
        </tr>
        </tbody>
    </table>
    <div class="titledivone marb3">
        <div class="title_txt">检查人员及执法证件编号</div>
    </div>
      <table class="table  table3">
        <tbody>
        <tr>
            <td  class="table3_th">姓名</td>
            <td width="35%"><input type="text" class="input2" name="checkPersonName" onblur="setNumberByPersonName(this)"></td>
            <td  class="table3_th">执法编号</td>
            <td colspan="2"><input type="text" class="input2" name="checkPersonCode"></td>
        </tr>
        <tr>
            <td  class="table3_th">姓名</td>
            <td width="35%"><input type="text" class="input2" name="checkPersonName" onblur="setNumberByPersonName(this)"></td>
            <td  class="table3_th">执法编号</td>
            <td><input type="text" class="input2" name="checkPersonCode"></td>
            <td><a class="form_btn" href="#" onclick="addTR(this)">增加人员</a></td>
        </tr>
        <tr>
            <td  class="table3_th">检查地点</td>
            <td width="35%"><input type="text" class="input2" name="checkAddress"></td>
            <td  class="table3_th">被检查单位意见</td>
            <td colspan="2"><input type="text" class="input2" name="checkedEnterpriseOption"></td>
        </tr>
        <tr>
            <td  class="table3_th">监管单位</td>
            <td width="35%">
           		<c:forEach items="${unitList}" var="list">
					<c:if test="${unitcode eq list.tDictionaryCode }">
						<input type="hidden"name="checkUnitCode" value="${list.tDictionaryCode}">
            			<input type="text" class="input2" value="${list.tDictionaryName}" readonly>
					</c:if>              		
				</c:forEach>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="titledivone marb3">
        <div class="title_txt">监督检查表</div>
        <div class="title_btn">
        </div>
    </div>
    <table class="table table-bordered table2" id="medicalProject">
        <thead>
        <tr>
            <th class="width220">检查项目</th>
            <th class="width100">序号</th>
            <th>检查内容</th>
            <th class="width140">评价</th>
            <th class="width220">备注</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan="3"><SPAN lang="EN-US">1.</SPAN><SPAN lang="EN-US"> </SPAN>许可证照</td>
            <td>*1.1</td>
            <td>查《医疗器械经营许可证》或《第二类医疗器械经营备案凭证》，核实经营范围；<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>1.2</td>
          <td>查证照有效期，看是否过期；<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio2">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.3</td>
          <td>是否悬挂在显著位置。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio3">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        
        <tr>
            <td rowspan="2">2.经营品种</td>
            <td>*2.1</td>
            <td>查是否经营第三类医疗器械；</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio4">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>2.2</td>
          <td>查是否经营第二类医疗器械（包括第1、2批不需要办理许可证的产品）</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio5">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="2"><SPAN lang="EN-US">3.</SPAN>食品标签等外观质量状况<SPAN lang="EN-US"></SPAN></td>
          <td>3.1</td>
          <td>查是否未取得《医疗器械经营许可证》经营第三类医疗器械；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio6">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.2</td>
          <td>查是否未取得《医疗器械经营许可证》或未办理备案手续经营第二类医疗器械（包括第1、2批不需要办理许可证的产品）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio7">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
            
       
        <tr>
          <td rowspan="2">4.扩大经营范围<strong><SPAN lang="EN-US"></SPAN></strong></td>
          <td>4.1</td>
          <td>查第三类医疗器械，是否在《医疗器械经营许可证》的经营范围，有无扩大范围经营情况；<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio8">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.2</td>
          <td>查第二类医疗器械，是否在《第二类医疗器械经营备案凭证》的经营范围，有无扩大范围经营情况。<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio9">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="1"><p><SPAN lang="EN-US">5.</SPAN>购进票据<SPAN lang="EN-US"></SPAN></p></td>
          <td>*5.1</td>
          <td>抽查部分品种，查是否索取、保留购进票据。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio10">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
              
        <tr>
          <td rowspan="1">6.供货单位资质</td>
          <td>*6.1</td>
          <td>根据上述抽查品种的购进票据，查是否索取、查验、留存供货单位资料。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio11">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
       
        <tr>
            <td rowspan="1">7.产品注册证明<SPAN lang="EN-US"></SPAN></td>
            <td>7.1</td>
            <td>查部分品种，查是否收集、留存医疗器械产品注册证或备案批件。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio12">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
       
        
        <tr>
            <td rowspan="1"><SPAN lang="EN-US">8.</SPAN>验收记录</td>
            <td>8.1</td>
            <td>根据上述抽查品种查验收记录。验收记录：包括医疗器械的名称、规格（型号）、注册证号或者备案凭证编号、生产批号或者序列号、生产日期和有效期（或者失效期）、生产企业、供货者、到货数量、到货日期、验收合格数量、验收结果等内容。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio13">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
       
         <tr>
            <td rowspan="2">9.执行陈列规定</td>
            <td>9.1</td>
            <td>查是否设立专柜或专区，有无明显标识；<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio14">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>9.2</td>
          <td>查是否与药品、化妆品、保健食品、非药品等分开；<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio15">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
      
         <tr>
            <td rowspan="5">10. 经营无注册证产品等违法行为<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
            <td>10.1</td>
            <td>查经营品种有无未取得医疗器械产品注册证或备案批件；<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio16">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
      
      <tr>
          <td>*10.2</td>
          <td>查是否经营无合格证明文件、过期、失效、淘汰的医疗器械，或者使用未依法注册的医疗器械的；<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio17">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
          <tr>
          <td>10.3</td>
          <td>查是否经营说明书、标签不符合条例规定的医疗器械；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio18">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
          <tr>
          <td>10.4</td>
          <td>查有无未按照医疗器械说明书和标签标示要求运输、贮存医疗器械；<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio19">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
          <tr>
          <td>10.5</td>
          <td>查是否未依照条例规定建立并执行医疗器械进货查验记录制度。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio20">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
          <tr>
          <td rowspan="1"><p>11. 违法广告</p></td>
          <td>11.1</td>
          <td>查店堂张贴或散发的广告，是否经过批准，是否按批准内容宣传，有无夸大、虚假宣传。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="medicalradio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="medicalradio21">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr> 
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其它需记录的问题</td>
        </tr>
        <tr>
            <td class="text-left " colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="otherQuestion"></textarea></td>
        </tr>
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其他说明</td>
        </tr>
        <tr>
            <td class="width220 text-left p20" colspan="5" ><p>说明：<span lang="EN-US">1. </span>医疗器械通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">5</span>项，一般项<span lang="EN-US">16</span>项，共<span lang="EN-US">21</span>项。重点项目应逐项检查，一般项可视情况随机抽查。<span lang="EN-US"> </span></p>
            <p><span lang="EN-US">       2.</span>检查过程中，被检查的经营者不涉及的项目，可视为合理缺项并在&ldquo;备注&rdquo;栏标注为不适用。</p></td>
        </tr>
        </tbody>
    </table>
    <div class="add_check_box marb10">
         <p class="p_txt">共检查了 <font class="blue1" name="totalCheck">0</font>  项内容，其中：重点项 <font class="blue1" name="zhongdianTotalCheck">0</font>  项  项目序号分别是 <font class="blue1" name="zhongdianDetail"> </font> 一般项 <font class="blue1" name="yibanTotalCheck">0</font> 项 项目序号分别是 <font class="blue1" name="yibanDetail"> </font> </p>
        <div class="add_check_title">具体问题</div>
        <table class="table table-bordered table2 marb0">
            <tbody>
            <tr>
                <td class=" table2th  pl20" colspan="5" >重点问题内容</td>
            </tr>
            <tr>
                <td  colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="zhongdianQuestion"></textarea></td>
            </tr>
            </tbody>
        </table>
        <table class="table table-bordered table2">
            <tbody>
            <tr>
                <td class=" table2th  pl20" colspan="5" >一般问题内容</td>
            </tr>
            <tr>
                <td  colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="yibanQuestion"></textarea></td>
            </tr>
            </tbody>
        </table>
        <div class="add_check_title">检查结果</div>
        <ul class="add_check ">
            <li>
                <label class="radio radio-inline">
                    <input type="radio"  value="1" name="checkResult">符合
                </label>
            </li>
            <li>
                <label class="radio radio-inline">
                    <input type="radio"  value="2" name="checkResult">基本符合
                </label>
            </li>
            <li>
                <label class="radio radio-inline">
                    <input type="radio"  value="3" name="checkResult">不符合
                </label>
            </li>
        </ul>
        <div class="add_check_title">结果处理</div>
        <ul class="add_check ">
             <li>
                <label class="radio radio-inline">
                    <input type="radio"  value="1" name="resultHandle">通过
                </label>
            </li>
            <li>
                <label class="radio radio-inline">
                    <input type="radio"  value="2" name="resultHandle">	书面限期整改   
                </label>
            </li>
            <li class="width300">
                <label class="radio radio-inline">
                    <input type="radio"  value="3" name="resultHandle">药品销售销售经营者立即停止药品销售活动  
                </label>
            </li>
        </ul>
    </div>
    <input type="hidden" value="" name="checkProject">
<input type="hidden" value="" name="otherQuestion">
<input type="hidden" value="" name="zhongdianQuestion">
<input type="hidden" value="" name="yibanQuestion">
    <div id="medicalDiv">
    <%@ include file="/pages/document.jsp" %>  
    </div>
    <div class="btn_box marb10" >
        <div style="text-align: center">
            <a href="javascript:void(0)" class="form_btn  width140" onclick="saveMedical()">保 存</a>
        </div>

    </div>

</div>
<!-- <input type="hidden" value="" name="checkDate"> -->
<script>
/* $("input[name='checkDate']").val(getDateDay()); */
$(function (){
    initEnterpriseInfo();
});

$(function (){
	$("#medicalProject").find("input[type='radio']").change(function(){
		statistics($(this));
	  });	
}
);
function statistics(){
	var totalCheck = 0;
	var checkProject = {};
	var zhongdianTotalCheck = 0;
	var zhongdianDetail = "";
	var yibanTotalCheck = 0;
	var yibanDetail = "";
	$("#medicalProject").find("input[type='radio']").each(function (){
		if(this.checked){
			var tdv = "";
			tdv = $(this).parent().parent().parent().parent().find("td:eq(1)").html();
			if(!(/\d+\.\d+/.test(tdv))){
				tdv = $(this).parent().parent().parent().parent().find("td:eq(0)").html();
			}
			totalCheck++;
			checkProject[tdv] = new Array($(this).val(),$(this).parent().parent().parent().parent().find("input[type='text']").val());
			if(tdv.indexOf("*")>-1){
				zhongdianTotalCheck++;
				zhongdianDetail += tdv+",";
			}else{
				yibanTotalCheck++;
				yibanDetail += tdv+",";
			}
		}
	});
	$("font[name='totalCheck']").html(totalCheck);
	$("font[name='zhongdianTotalCheck']").html(zhongdianTotalCheck);
	$("font[name='zhongdianDetail']").html(zhongdianDetail);
	$("font[name='yibanTotalCheck']").html(yibanTotalCheck);
	$("font[name='yibanDetail']").html(yibanDetail);
	$("input[name='checkProject']").val(JSON.stringify(checkProject));
}
function saveMedical(){
	statistics();
	upload();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/add.do",
		type:"post",
		dataType:"json",
		data:$('#addscMedical').serialize(),
		success : function(result) {
			if(result>0){
				alertEase("新增成功",1);
				querySupervisionCheck();
				querySupervisionCheckTask();
			}else{
				alertEase("新增失败",2);
			}
		}
	});
}
/*
 * 根据企业名称加载企业信息
 */
 function initEnterpriseInfo(){
     $.ajax({
         url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
         type:"post",
         dataType:"json",
         data:{
             enterpriseName:$("#checkedEnterpriseName").val()
         },
         success : function(data) {
             if(data.length>0){
            	 $("input[name='_address']").val(data[0].scaddress);
                 $("input[name='_person']").val(data[0].qydelegate);
                 $("input[name='_phone']").val(data[0].qyphone);
                 $("input[name='_code1']").val(data[0].scpermit);
                 $("input[name='_code2']").val(data[0].zzcode);
             }else{
                 alertEase("企业不存在",2);
                 $("input[name='_address']").val("");
                 $("input[name='_person']").val("");
                 $("input[name='_phone']").val("");
                 $("input[name='_code1']").val("");
                 $("input[name='_code2']").val("");
             }
         }
     });
}
 $("input[type='radio']").on("click",function(){
	    var domName = $(this).attr('name');//获取当前单选框控件name 属性值
	    var checkedState = $(this).attr('checked');//记录当前选中状态
	   
	    $("input:radio[name='" + domName + "']").attr('checked',false);//1.
	    $(this).prop('checked',true);//2.
	    $(this).attr('checked','checked');
	    if(checkedState == 'checked'){
	        $(this).prop('checked',false); //3.
	    }
	});
$(function(){
    $('#calenderOne018').datetimepicker({
        container:'#calenderOneBox018',
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

//企业下拉框
function likeEnterprise() {
	$.ajax({
		url:"${pageContext.request.contextPath}/enterpriseInfo/likeEnterprise.do",
		type:"post",
		dataType:"json",
		success : function(datas) {
			$("#checkedEnterpriseName").focus(function(){
				showPullDownSearchData('checkedEnterpriseName',datas,itemSelectFuntion);
			});
			var itemSelectFuntion = function(){
				for(var i=0;i<datas.length;i++) {
					if(datas[i].id==this.id) {
						$("input[name='checkedEnterpriseName']").val(datas[i].qyname);
						$("input[name='_address']").val(datas[i].address);
						$("input[name='_person']").val(datas[i].qydelegate);
						$("input[name='_phone']").val(datas[i].qyphone);
						$("input[name='_code1']").val(datas[i].scpermit);
						$("input[name='_code2']").val(datas[i].zzcode);
					}
				}		
			};
		}
	});
}
//监督检查添加检查人员
function addTR(ele){
    $(ele).parent().parent().after("<tr><td  class='table3_th'>姓名</td><td width='35%'><input type='text' class='input2' name='checkPersonName' onblur='setNumberByPersonName(this)'></td><td  class='table3_th'>编号</td><td colspan='2'><input type='text' class='input2' name='checkPersonCode'></td></tr>")
}
//根据姓名填充人员编号
function  setNumberByPersonName(name){
    var number = $(name).parent().parent().find("input[name='checkPersonCode']");
    if($(name).val()){
        $.ajax({
            url:"${pageContext.request.contextPath}/personInfo/getNumberByPersonName.do",
            type:"post",
            data:{
                personName:$(name).val()
            },
            success : function(result) {
                if(result=="-1"){
                    alertEase("人员不存在",2);
                    $(name).focus();
                }else if(result=="-2"){
                    alertEase("人员姓名有重复,请自行填写执法编号",2);
                }else if(result==""){
                    alertEase("人员执法编号为空",2);
                }else{
                    $(number).val(result);
                }
            }
        }); 
    }
}
</script>