<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form id="addscHealth">
<input type = "hidden" value="enterprise_7" name="enterpriseTypeCode">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">保健食品监督检查</li>
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
            <td width="35%"><input name="checkedEnterpriseName" type="text" class="input2" value="${supervisionAndCheck.checkedEnterpriseName}"></td>
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
            	<div id="calenderOneBox023" style="position:relative">
                            <input id="calenderOne023" name="checkDate" class="input2 bg_calender" size="16" type="text" value="${supervisionAndCheck.checkDate}">
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
    <table class="table table-bordered table2" id="healthProject">
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
            <td rowspan="3"><SPAN lang="EN-US">1.</SPAN>经营资质<SPAN lang="EN-US"></SPAN></td>
            <td>*1.1</td>
            <td>经营者持有的营业执照是否合法有效。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>*1.2</td>
          <td>经营者持有的食品经营许可证是否合法有效。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio2">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.3</td>
          <td>食品经营许可证载明的有关内容与实际经营是否相符。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio3">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        
        <tr>
            <td rowspan="3"><SPAN lang="EN-US">2.</SPAN>经营条件<SPAN lang="EN-US"></SPAN></td>
            <td>2.1</td>
            <td>是否具有与经营的保健食品品种、数量相适应的场所。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio4">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>2.2</td>
          <td>经营场所环境是否整洁，是否与污染源保持规定的距离。<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio5">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>2.3</td>
          <td>是否具有与经营的保健食品品种、数量相适应的生产经营设备或者设施。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio6">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="9"><SPAN lang="EN-US">3.</SPAN>食品标签等外观质量状况<SPAN lang="EN-US"></SPAN></td>
          <td>*3.1</td>
          <td>检查的保健食品是否在保质期内。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio7">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.2</td>
          <td>是否销售盗用、假冒批准文号的伪劣保健食品产品。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio8">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.3</td>
          <td>检查的食品是否符合国家为防病等特殊需要的要求。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio9">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.4</td>
          <td>经营的保健食品的包装上是否有标签，标签标明的内容是否符合食品安全法等法律法规的规定。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio10">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.5</td>
          <td>经营的保健食品的标签、说明书是否清楚、明显，生产日期、保质期等事项是否显著标注，容易辨识。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio11">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.6</td>
          <td>经营保健食品标签、说明书是否涉及疾病预防、治疗功能。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio12">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.7</td>
          <td>经营场所设置或摆放的保健食品广告的内容是否涉及疾病预防、治疗功能。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio13">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.8</td>
          <td>经营的进口保健食品是否有中文标签<SPAN lang="EN-US">,</SPAN>并载明食品的原产地以及境内代理商的名称、地址、联系方式。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio14">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.9</td>
          <td>经营的进口保健食品是否有国家出入境检验检疫部门出具的入境货物检验检疫证明。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio15">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
       
        <tr>
          <td rowspan="6"><SPAN lang="EN-US">4.</SPAN>供货商及产品资质<strong><SPAN lang="EN-US"></SPAN></strong></td>
          <td>*4.1</td>
          <td>供货商是否具有保健食品生产许可证<SPAN lang="EN-US">/</SPAN>卫生许可证。<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio16">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.2</td>
          <td>供货商是否具有保健食品<SPAN lang="EN-US">GMP</SPAN>审查证明。<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio17">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.3</td>
          <td>供货商是否具有实际生产企业营业执照复印件。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio18">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.4</td>
          <td>是否供货商的营业执照复印件。<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio19">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.5</td>
          <td>供货商是否具有保健食品批准证书（注册批件）。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio20">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.6</td>
          <td>是否具有经营产品批次检验合格报告 。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio21">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="3"><p><SPAN lang="EN-US">5.</SPAN>从业人员管理<SPAN lang="EN-US"></SPAN></p></td>
          <td>5.1</td>
          <td>经营者是否建立从业人员健康管理制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio22">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio22">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.2</td>
          <td>在岗经营人员是否取得健康证明。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio23">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio23">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.3</td>
          <td>在岗经营人员是否存在患有国务院卫生行政部门规定的有碍食品安全疾病的情况。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio24">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio24">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
              
        <tr>
          <td rowspan="4"><SPAN lang="EN-US">6.</SPAN>从业人员管理<SPAN lang="EN-US"></SPAN></td>
          <td>6.1</td>
          <td>食品经营者是否建立从业人员健康管理制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio25">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio25">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.2</td>
          <td>在岗从事接触直接入口食品工作的食品经营人员是否取得健康证明。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio26">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio26">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.3</td>
          <td>在岗从事接触直接入口食品工作的食品经营人员是否存在患有国务院卫生行政部门规定的有碍食品安全疾病的情况。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio27">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio27">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.4</td>
          <td>食品经营企业是否对职工进行食品安全知识培训和考核。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio28">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio28">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
            <td rowspan="2"><SPAN lang="EN-US">7. </SPAN>进货查验记录、批发记录或者票据<SPAN lang="EN-US"></SPAN></td>
            <td>*7.1</td>
            <td>保健食品经营企业是否具有进货查验记录、批发记录或者票据，<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio29">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio29">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>7.2</td>
          <td>记录票据是否真实，保存期限是否少于<SPAN lang="EN-US">2</SPAN>年。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio30">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio30">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
            <td rowspan="1"><SPAN lang="EN-US">8. </SPAN>产品台账<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
            <td>*8.1</td>
            <td>检查台账是否记录进货时间、产品名称、数量、供货商等内容。（供货清单如内容齐全可作为企业台账）<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio31">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio31">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
       
         <tr>
            <td rowspan="2"><SPAN lang="EN-US">9.</SPAN>场地卫生及产品码放<SPAN lang="EN-US"></SPAN></td>
            <td>9.1</td>
            <td>现场查看经营场所卫生、储存环境：防虫、防鼠、防尘、防污染等是否符合要求。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio32">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio32">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>9.2</td>
          <td>检查保健食品是否有相对独立的专用销售区域或专用货柜（架）。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio33">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio33">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
      
         <tr>
            <td rowspan="1"><SPAN lang="EN-US">10.</SPAN>库房卫生储存环境<SPAN lang="EN-US"></SPAN><SPAN lang="EN-US"></SPAN></td>
            <td>10.1</td>
            <td>现场查看库房卫生、储存环境：防虫、防鼠、防尘、防污染等是否符合要求；容器、工具和设备是否符合要求。（无库房可不查）<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="healthradio34">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="healthradio34">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
      
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其它需记录的问题</td>
        </tr>
         <tr>
            <td class="width220 text-left " colspan="5" >
            <textarea  cols="30" rows="10"  class="login_input login_textarea " id="otherQuestion">${supervisionAndCheck.otherQuestion}</textarea></td>
        </tr>
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其他说明</td>
        </tr>
        <tr>
            <td class="width220 text-left p20" colspan="5" ><p>说明：<span lang="EN-US">1. </span>保健食品通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">12</span>项，一般项<span lang="EN-US">22</span>项，共<span lang="EN-US">34</span>项。重点项目应逐项检查，一般项可视情况随机抽查。<span lang="EN-US"> </span></p>
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
                    <input type="radio"  value="2" name="resultHandle">书面限期整改
                </label>
            </li>
            <li class="width300">
                <label class="radio radio-inline ">
                    <input type="radio"  value="3" name="resultHandle">食品生产经营者立即停止食品生产经营活动
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
            <a href="javascript:void(0)" class="form_btn  width140" onclick="updateHealth()">保 存</a>
        </div>
    </div>

</div>
<div style="display:none" id="checkProject">${supervisionAndCheck.checkProject}</div>
<script>
$(function (){
	var json = eval('(' + $("#checkProject").html() + ')');
	if($("#checkProject").html()!=""){
		$("#healthProject").find("input[type='radio']").each(function (){
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
	$("#healthProject").find("input[type='radio']").change(function(){
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
	$("#healthProject").find("input[type='radio']").each(function (){
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
function updateHealth(){
	statistics();
	upload();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/update.do",
		type:"post",
		dataType:"json",
		data:$('#addscHealth').serialize(),
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
    $('#calenderOne023').datetimepicker({
        container:'#calenderOneBox023',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
    $('#calenderOne024').datetimepicker({
        container:'#calenderOneBox024',
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