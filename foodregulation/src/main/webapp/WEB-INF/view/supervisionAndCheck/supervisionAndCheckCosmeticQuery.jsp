<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form id="addscCosmetic">
<input type = "hidden" value="enterprise_8" name="enterpriseTypeCode">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">化妆品销售监督检查</li>
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
            <td width="35%"><input name="checkedEnterpriseName" value="${supervisionAndCheck.checkedEnterpriseName}" type="text" class="input2"></td>
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
            	<div id="calenderOneBox039" style="position:relative">
                            <input id="calenderOne039" name="checkDate" class="input2 bg_calender" size="16" type="text" value="${supervisionAndCheck.checkDate}">
                </div>
           </td>
        </tr>
        </tbody>
    </table>
    <div class="titledivone marb3">
        <div class="title_txt">检查人员及执法证件编号</div>
    </div>
    <table class="table  table3">
        <tbody>
        <c:forEach items="${fn:split(supervisionAndCheck.checkPersonName,',')}" var="name" varStatus="st">
        <tr>
            <td  class="table3_th">姓名</td>
            <td width="35%"><input type="text" class="input2" name="checkPersonName" value="${name}" onblur="setNumberByPersonName(this)"></td>
            <td  class="table3_th">执法编号</td>
            <c:forEach items="${fn:split(supervisionAndCheck.checkPersonCode,',')}" var="code" varStatus="st2">
	            <c:if test="${st2.index == st.index and st.index == 1}">
	            	<td><input type="text" class="input2" name="checkPersonCode" value="${code}"></td>
	            	<td><a class="form_btn" href="#" onclick="addTR(this)">增加人员</a></td>
	            </c:if>
	            <c:if test="${st2.index == st.index and st.index != 1}">
	            	<td colspan="2"><input type="text" class="input2" name="checkPersonCode" value="${code}"></td>
	            </c:if>
            </c:forEach>
        </tr>
        </c:forEach>
        <tr>
            <td  class="table3_th">检查地点</td>
            <td width="35%"><input type="text" class="input2" name="checkAddress" value="${supervisionAndCheck.checkAddress}"></td>
            <td  class="table3_th">被检查单位意见</td>
            <td colspan="2"><input type="text" class="input2" name="checkedEnterpriseOption" value="${supervisionAndCheck.checkedEnterpriseOption}"></td>
        </tr>
        <tr>
            <td  class="table3_th">监管单位</td>
            <td width="35%">
            	<select class="select_style1 marr10 input2" name="checkUnitCode">
                    <option value="">请选择</option>
            		<c:forEach items="${unitList}" var="list">
              			<option  value="${list.tDictionaryCode}" <c:if test="${supervisionAndCheck.checkUnitCode eq list.tDictionaryCode }">selected='selected'</c:if>>${list.tDictionaryName}</option>
              		</c:forEach>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="titledivone marb3">
        <div class="title_txt">监督检查表</div>
        <div class="title_btn">
        </div>
    </div>
    <table class="table table-bordered table2" id="cosmeticProject">
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
            <td rowspan="1"><SPAN lang="EN-US">1.</SPAN>经营资质<SPAN lang="EN-US"></SPAN></td>
            <td>*1.1</td>
            <td>经营者持有的营业执照是否合法有效，登记表载明的有关内容与实际经营是否相符。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        
        
      <tr>
            <td rowspan="5"><SPAN lang="EN-US">2.</SPAN>化妆品合法性</td>
            <td>*2.1</td>
            <td>所经营的国产化妆品是否由取得有效的《化妆品生产企业卫生许可证》的企业生产。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio2">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>2.2</td>
          <td>国产特殊用途化妆品是否取得&ldquo;国产特殊用途化妆品批准文号&rdquo;。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio3">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>2.3</td>
          <td>进口非特殊用途化妆品是否取得 &ldquo;进口非特殊用途化妆品备案凭证&rdquo;（查看复印件）；进口特殊用途化妆品是否取得&ldquo;进口特殊用途化妆品卫生许可批件&rdquo;（查看复印件）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio4">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>2.4</td>
          <td>经营的进口化妆品是否在卫生许可批件或备案凭证有效期内入境。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio5">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*2.5</td>
          <td>进口化妆品是否经过检验检疫部门检验。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio6">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="6"><SPAN lang="EN-US">3.</SPAN>化妆品标识标签<SPAN lang="EN-US"></SPAN></td>
          <td>*3.1</td>
          <td>所经营的化妆品是否有质量合格标记。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio7">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.2</td>
          <td>产品名称是否符合《化妆品命名规定》、《消费品使用说明化妆品通用标签》及其他化妆品标签标识管理相关规定。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio8">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.3</td>
          <td>国产化妆品是否标明生产企业的名称和地址；进口化妆品标明原产国名或地区名、经销商、进口商、在华代理商的名称和地址。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio9">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.4</td>
          <td>产品是否标注生产日期和保质期，或者标注生产批号和限期使用日期。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio10">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.5</td>
          <td>国产化妆品是否标明生产企业的卫生许可证编号。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio11">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.6</td>
          <td>特殊用途化妆品是否标示批准文号；进口非特殊用途化妆品是否标示备案文号。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio12">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
       
        <tr>
          <td rowspan="3"><SPAN lang="EN-US">4.</SPAN>购货验收制度<SPAN lang="EN-US"></SPAN></td>
          <td>*4.1</td>
          <td>是否执行化妆品进货查验制度。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio13">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.2</td>
          <td>是否索取供货企业的相关合法性证件材料。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio14">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.3</td>
          <td>是否建立供货企业档案；是否建立购货台账。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio15">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="1"><p><SPAN lang="EN-US">5.</SPAN><span lang="EN-US"> </span>产品保质期</p></td>
          <td>5.1</td>
          <td>抽查化妆品是否过期。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio16">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="2"><SPAN lang="EN-US">6<span lang="EN-US"> </span>.储存条件、卫生情况</SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>6.1</td>
          <td>检查化妆品经营企业经营场所和仓库是否保持内外整洁；是否有通风、防尘、防潮、防虫、防鼠等设施；散装和供顾客试用的化妆品是否有防污染设施。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio17">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.2</td>
          <td>是否按规定的储存条件储存化妆品。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio18">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="3"><SPAN lang="EN-US">7<span lang="EN-US"> </span>.产品宣传、店内宣传</SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>7.1</td>
          <td>所经营的化妆品是否宣传疗效；所经营的化妆品是否使用医疗术语；所经营的化妆品是否标注有适应症。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio19">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*7.2</td>
          <td>所经营的化妆品是否存在虚假或夸大宣传。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio20">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.3</td>
          <td>检查店内宣传资料是否存在宣称预防、治疗疾病功能等违规行为。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio21">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="1"><SPAN lang="EN-US">8<span lang="EN-US"> </span>.其他违法行为</SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>8.1</td>
          <td>是否有自制化妆品行为。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="cosmeticRadio22">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="cosmeticRadio22">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
       
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其它需记录的问题</td>
        </tr>
        <tr>
            <td class="width220 text-left " colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="otherQuestion">${supervisionAndCheck.otherQuestion}</textarea></td>
        </tr>
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其他说明</td>
        </tr>
        <tr>
            <td class="width220 text-left p20" colspan="5" ><p>说明：<span lang="EN-US">1. </span>化妆品通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">12</span>项，一般项<span lang="EN-US">10</span>项，共<span lang="EN-US">22</span>项。重点项目应逐项检查，一般项可视情况随机抽查。<span lang="EN-US"> </span></p>
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
                <td  colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="zhongdianQuestion">${supervisionAndCheck.zhongdianQuestion}</textarea></td>
            </tr>
            </tbody>
        </table>
        <table class="table table-bordered table2">
            <tbody>
            <tr>
                <td class=" table2th  pl20" colspan="5" >一般问题内容</td>
            </tr>
            <tr>
                <td  colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="yibanQuestion">${supervisionAndCheck.yibanQuestion}</textarea></td>
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
                    <input type="radio"  value="3" name="resultHandle">	化妆品销售经营者立即停止销售经营活动
                </label>
            </li>
        </ul>
    </div>
<input type="hidden" name="id" value="${supervisionAndCheck.id}">
<input type="hidden" name="checkProject">
<input type="hidden" name="checkResult2" value="${supervisionAndCheck.checkResult}">
<input type="hidden" name="resultHandle2" value="${supervisionAndCheck.resultHandle}">
<input type="hidden" name="typeCode" value="${supervisionAndCheck.enterpriseTypeCode}">
<input type="hidden" value="" name="otherQuestion">
<input type="hidden" value="" name="zhongdianQuestion">
<input type="hidden" value="" name="yibanQuestion">
    <div id="documentQueryDiv">
     <%@ include file="/pages/documentQuery.jsp" %> 
    </div>
    
    <div class="btn_box marb10" >
        <div style="text-align: center">
            <a href="javascript:void(0)" class="form_btn  width140" onclick="updateCosmetic()">保 存</a>
        </div>

    </div>

</div>
<div style="display:none" id="checkProject">${supervisionAndCheck.checkProject}</div>
<script>
$(function (){
	var json = eval('(' + $("#checkProject").html() + ')');
	if($("#checkProject").html()!=""){
		$("#cosmeticProject").find("input[type='radio']").each(function (){
			var tdv = "";
			tdv = $(this).parent().parent().parent().parent().find("td:eq(1)").html();
			if(!(/\d+\.\d+/.test(tdv))){
				tdv = $(this).parent().parent().parent().parent().find("td:eq(0)").html();
			}
			
			if(json[tdv]){
				var radio = json[tdv][0];
				var remark = json[tdv][1];
				if($(this).val()==radio){
					this.checked = true;
					$(this).parent().parent().parent().parent().find("input[type='text']").val(remark);
				}
			}
		});	
	}
	$("input[name='checkResult']").each(function (){
		if($(this).val()==$("input[name='checkResult2']").val()){
			this.checked = true;
		}
	});
	$("input[name='resultHandle']").each(function (){
		if($(this).val()==$("input[name='resultHandle2']").val()){
			this.checked = true;
		}
	});
}
);
initEnterpriseInfo($("input[name='checkedEnterpriseName']").val());
statistics();
$(function (){
	$("input[name='checkedEnterpriseName']").on("blur",function (){
		initEnterpriseInfo($(this).val());
	});
});

$(function (){
	$("#cosmeticProject").find("input[type='radio']").change(function(){
		statistics();
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
	$("#cosmeticProject").find("input[type='radio']").each(function (){
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
function updateCosmetic(){
	statistics();
	upload();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/update.do",
		type:"post",
		dataType:"json",
		data:$('#addscCosmetic').serialize(),
		success : function(result) {
			if(result>0){
				alertEase("修改成功",1);
			}else{
				alertEase("修改失败",2);
			}
		}
	});
}
/*
 * 根据企业名称加载企业信息
 */
function initEnterpriseInfo(qyname){
	if(!qyname){
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/enterpriseInfo/getEnterprise.do",
		type:"post",
		dataType:"json",
		data:{
			enterpriseName:qyname
		},
		success : function(data) {
			if(data.length>0){
				$("input[name='_address']").val(data[0].addressName);
				$("input[name='_person']").val(data[0].qydelegate);
				$("input[name='_phone']").val(data[0].qyphone);
				$("input[name='_code1']").val(data[0].scpermit);
				$("input[name='_code2']").val(data[0].zzcode);
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
    $('#calenderOne039').datetimepicker({
        container:'#calenderOneBox039',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
    $('#calenderOne040').datetimepicker({
        container:'#calenderOneBox040',
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