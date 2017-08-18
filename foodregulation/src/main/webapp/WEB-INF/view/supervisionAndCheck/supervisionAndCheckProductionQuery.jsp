<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form id="addscProduction">
<input type = "hidden" value="enterprise_2" name="enterpriseTypeCode">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">食品生产监督检查</li>
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
            	<div id="calenderOneBox011" style="position:relative">
                            <input id="calenderOne011" name="checkDate" class="input2 bg_calender" size="16" type="text" value="${supervisionAndCheck.checkDate}">
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
    <table class="table table-bordered table2" id="productionProject">
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
            <td rowspan="7"><span lang="EN-US">1</span>．生产环境条件</td>
            <td>1.1</td>
            <td>厂区无扬尘、无积水，厂区、车间卫生整洁。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>*1.2</td>
          <td>厂区、车间与有毒、有害场所及其他污染源保持规定的距离。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio2">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*1.3</td>
          <td>卫生间应保持清洁，应设置洗手设施，未与食品生产、包装或贮存等区域直接连通。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio3">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.4</td>
          <td>有更衣、洗手、干手、消毒设备、设施，满足正常使用。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio4">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.5</td>
          <td>通风、防尘、照明、存放垃圾和废弃物等设备、设施正常运行。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio5">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.6</td>
          <td>车间内使用的洗涤剂、消毒剂等化学品应与原料、半成品、成品、包装材料等分隔放置，并有相应的使用记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio6">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.7</td>
          <td>定期检查防鼠、防蝇、防虫害装置的使用情况并有相应检查记录，生产场所无虫害迹象。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio7">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
            <td rowspan="3"> 2．进货查验结果

注：①检查原辅料仓库；②原辅料品种随机抽查，不足2种的全部检查。</td>
            <td>*2.1</td>
            <td>查验食品原辅料、食品添加剂、食品相关产品供货者的许可证、产品合格证明文件；供货者无法提供有效合格证明文件的食品原料，有检验记录。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio8">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>*2.2</td>
          <td>进货查验记录及证明材料真实、完整，记录和凭证保存期限不少于产品保质期期满后六个月，没有明确保质期的，保存期限不少于二年。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio9">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>2.3</td>
          <td>建立和保存食品原辅料、食品添加剂、食品相关产品的贮存、保管记录和领用出库记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio10">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="15"><span lang="EN-US">3</span>．生产过程控制注：在成品库至少抽取<span lang="EN-US">2</span>批次产品，按生产日期或批号追溯生产过程记录及控制的全部检查，有专供特定人群的产品至少抽查<span lang="EN-US">1</span>个产品。</td>
          <td>3.1</td>
          <td>有食品安全自查制度文件，定期对食品安全状况进行自查并记录和处置。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio11">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.2</td>
          <td>使用的原辅料、食品添加剂、食品相关产品的品种与索证索票、进货查验记录内容一致。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio12">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.3</td>
          <td>建立和保存生产投料记录，包括投料种类、品名、生产日期或批号、使用数量等。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio13">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.4</td>
          <td>未发现使用非食品原料、回收食品、食品添加剂以外的化学物质、超过保质期的食品原料和食品添加剂生产食品。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio14">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.5</td>
          <td>未发现超范围、超限量使用食品添加剂的情况。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio15">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.6</td>
          <td>生产或使用的新食品原料，限定于国务院卫生行政部门公告的新食品原料范围内。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio16">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.7</td>
          <td>未发现使用药品、仅用于保健食品的原料生产食品。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio17">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.8</td>
          <td>生产记录中的生产工艺和参数与企业申请许可时提供的工艺流程一致。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio18">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.9</td>
          <td>建立和保存生产加工过程关键控制点的控制情况记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio19">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.10</td>
          <td>生产现场未发现人流、物流交叉污染。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio20">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.11</td>
          <td>未发现原辅料、半成品与直接入口食品交叉污染。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio21">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.12</td>
          <td>有温、湿度等生产环境监测要求的，定期进行监测并记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio22">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio22">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.13</td>
          <td>生产设备、设施定期维护保养并做好记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio23">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio23">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.14</td>
          <td>未发现标注虚假生产日期或批号的情况。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio24">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio24">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.15</td>
          <td>工作人员穿戴工作衣帽，生产车间内未发现与生产无关的个人或者其他与生产不相关物品，员工洗手消毒后进入生产车间。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio25">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio25">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="5"><span lang="EN-US">4</span>．产品检验结果注：采取抽查方式</td>
          <td>4.1</td>
          <td>企业自检的，应具备与所检项目适应的检验室和检验能力，有检验相关设备及化学试剂，检验仪器设备按期检定。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio26">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio26">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.2</td>
          <td>不能自检的，应当委托有资质的检验机构进行检验。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio27">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio27">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.3</td>
          <td>有与生产产品相适应的食品安全标准文本，按照食品安全标准规定进行检验。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio28">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio28">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.4</td>
          <td>建立和保存原始检验数据和检验报告记录，检验记录真实、完整。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio29">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio29">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.5</td>
          <td>按规定时限保存检验留存样品并记录留样情况。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio30">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio30">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="8"><p> <span lang="EN-US">5</span>．贮存及交付控制<span lang="EN-US"> </span></p>
          <p> 注：采取抽查方式，有冷链要求的产品必须检查冷链情况。</p></td>
          <td>*5.1</td>
          <td>原辅料的贮存有专人管理，贮存条件符合要求。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio31">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio31">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*5.2</td>
          <td>食品添加剂应当专门贮存，明显标示，专人管理。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio32">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio32">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.3</td>
          <td>不合格品应在划定区域存放。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio33">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio33">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.4</td>
          <td>根据产品特点建立和执行相适应的贮存、运输及交付控制制度和记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio34">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio34">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.5</td>
          <td>仓库温湿度应符合要求。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio35">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio35">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.6</td>
          <td>生产的产品在许可范围内。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio36">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio36">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.7</td>
          <td>有销售台账，台账记录真实、完整。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio37">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio37">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.8</td>
          <td>销售台账如实记录食品的名称、规格、数量、生产日期或者生产批号、检验合格证明、销售日期以及购货者名称、地址、联系方式等内容。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio38">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio38">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="4"> 6．不合格品管理和食品召回注：采取抽查方式</td>
          <td>6.1</td>
          <td>建立和保存不合格品的处置记录，不合格品的批次、数量应与记录一致。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio39">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio39">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.2</td>
          <td>实施不安全食品的召回，有召回计划、公告等相应记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio40">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio40">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.3</td>
          <td>召回食品有处置记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio41">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio41">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.4</td>
          <td>未发现使用召回食品重新加工食品情况（对因标签存在瑕疵实施召回的除外）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio42">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio42">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="6"><span lang="EN-US">7</span>．从业人员管理</td>
          <td>7.1</td>
          <td>有食品安全管理人员、检验人员、负责人。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio43">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio43">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.2</td>
          <td>有食品安全管理人员、检验人员、负责人培训和考核记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio44">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio44">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*7.3</td>
          <td>未发现聘用禁止从事食品安全管理的人员。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio45">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio45">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.4</td>
          <td>企业负责人在企业内部制度制定、过程控制、安全培训、安全检查以及食品安全事件或事故调查等环节履行了岗位职责并有记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio46">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio46">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*7.5</td>
          <td>建立从业人员健康管理制度，直接接触食品人员有健康证明，符合相关规定。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio47">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio47">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.6</td>
          <td>有从业人员食品安全知识培训制度，并有相关培训记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio48">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio48">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="3"><span lang="EN-US">8</span>．食品安全事故处置</td>
          <td>8.1</td>
          <td>有定期排查食品安全风险隐患的记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio49">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio49">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.2</td>
          <td>有按照食品安全应急预案定期演练，落实食品安全防范措施的记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio50">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio50">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*8.3</td>
          <td>发生食品安全事故的，有处置食品安全事故记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio51">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio51">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="3"><span lang="EN-US">9</span>．食品添加剂生产者管理</td>
          <td>*9.1</td>
          <td>原料和生产工艺符合产品标准规定。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio52">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio52">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.2</td>
          <td>复配食品添加剂配方发生变化的，按规定报告。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio53">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio53">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.3</td>
          <td>食品添加剂产品标签载明&ldquo;食品添加剂&rdquo;，并标明贮存条件、生产者名称和地址、食品添加剂的使用范围、用量和使用方法。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="productionradio54">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="productionradio54">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
            <td class="  table2th text-left pl20" colspan="5" >其它需记录的问题</td>
        </tr>
        <tr>
            <td class="  text-left " colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="otherQuestion">${supervisionAndCheck.otherQuestion}</textarea></td>
        </tr>
        <tr>
            <td class="  table2th text-left pl20" colspan="5" >其他说明</td>
        </tr>
        <tr>
            <td class="  text-left p20" colspan="5" ><p> 说明：<span lang="EN-US">1.</span>上表中食品通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">21</span>项，一般项<span lang="EN-US">30</span>项，共<span lang="EN-US">51</span>项。食品添加剂通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">19</span>项，一般项<span lang="EN-US">31</span>项，共<span lang="EN-US">50</span>项。<span lang="EN-US"> </span></p>
              <p> <span lang="EN-US">2</span>．每次检查抽查重点项不少于<span lang="EN-US">10</span>个，总检查项目不少于<span lang="EN-US">20</span>个。<span lang="EN-US"> </span></p>
              <p> <span lang="EN-US">3</span>．上表中除<span lang="EN-US">1.7</span>、<span lang="EN-US">3.4</span>、<span lang="EN-US">3.5</span>、<span lang="EN-US">3.6</span>项以及<span lang="EN-US">2.1</span>项中关于&ldquo;食品相关产品&rdquo;的检查部分，其他项目均适用于食品添加剂生产者。<span lang="EN-US"> </span></p>
              <p> <span lang="EN-US">4</span>．对食品添加剂生产者每次检查，还需检查第<span lang="EN-US">9</span>项，对食品生产者的检查不需检查第<span lang="EN-US">9</span>项。<span lang="EN-US"> </span></p>
              <p> <span lang="EN-US">5</span>．如果检查项目存在合理缺项，该项无需勾选&ldquo;是或否&rdquo;，并在备注中说明，不计入不符合项数。<span lang="EN-US"> </span></p>
            <p> <span lang="EN-US">  </span></p></td>
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
            <a href="javascript:void(0)" class="form_btn  width140" onclick="updateProduction()">保 存</a>
        </div>

    </div>
</div>
<div style="display:none" id="checkProject">${supervisionAndCheck.checkProject}</div>
<script>
$(function (){
	var json = eval('(' + $("#checkProject").html() + ')');
	if($("#checkProject").html()!=""){
		$("#productionProject").find("input[type='radio']").each(function (){
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
	$("#productionProject").find("input[type='radio']").change(function(){
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
	$("#productionProject").find("input[type='radio']").each(function (){
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
function updateProduction(){
	statistics();
	upload();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/update.do",
		type:"post",
		dataType:"json",
		data:$('#addscProduction').serialize(),
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
    $('#calenderOne011').datetimepicker({
        container:'#calenderOneBox011',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
    $('#calenderOne012').datetimepicker({
        container:'#calenderOneBox012',
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