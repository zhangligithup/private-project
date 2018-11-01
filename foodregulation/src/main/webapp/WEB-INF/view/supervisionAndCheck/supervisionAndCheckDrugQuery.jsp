<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form id="addscDrug">
<input type = "hidden" value="enterprise_9" name="enterpriseTypeCode">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">药品销售监督检查</li>
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
            	<div id="calenderOneBox031" style="position:relative">
                            <input id="calenderOne031" name="checkDate" class="input2 bg_calender" size="16" type="text" value="${supervisionAndCheck.checkDate}">
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
    <table class="table table-bordered table2" id="drugProject">
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
          <td rowspan="3"><span lang="EN-US">1</span>．<span lang="EN-US"> </span>经营资质<span lang="EN-US"> </span></td>
            <td>*1.1</td>
            <td>查《药品经营许可证》、《药品经营质量管理规范认证证书》、《营业执照》，核实经营范围。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>1.2</td>
          <td>查证照有效期，看是否过期；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio2">否
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
                        <input type="radio"  value="1" name="drugradio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio3">否
                    </label>
                </div>


          </td>
            <td ><input type="text" class="input2"></td>
        </tr>
       
        <tr>
            <td rowspan="2"><span lang="EN-US">2.</span><span lang="EN-US"> </span>人员公示牌，执业药师证书</td>
            <td>2.1</td>
            <td>查看有无人员公示牌，注意核实人员公示牌上的人员与实际在岗人员是否一致。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio4">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>2.2</td>
          <td>查看执业药师注册证（或药学技术人员资格证）是否悬挂，悬挂的执业药师注册证等与实际人员是否相符；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio5">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="7"><span lang="EN-US">3</span>．食品标签等外观质量状况</td>
          <td>3.1</td>
          <td>查营业场所是否明亮、卫生、整洁；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio6">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.2</td>
          <td>查营业场所门、窗是否严密，是否采取有效措施避免阳光直射到药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio7">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.3</td>
          <td>查是否公布药品监管部门投诉举报电话（12331），是否设置顾客意见簿，药品质量的投诉是否及时处理；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio8">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.4</td>
          <td>查店堂内是否存放与经营活动无关的物品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio9">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.5</td>
          <td>查是否设置温湿度计，是否每天上下各一次记录温湿度，温湿度超标是否采取调控措施，是否达到常温要求（温度：10-20℃，相对湿度35%-75%）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio10">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.6</td>
          <td>查是否有空调；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio11">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.7</td>
          <td>查有无违法药品广告。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio12">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
       
        <tr>
          <td rowspan="4"><span lang="EN-US">4</span>．人员行为规范</td>
          <td>4.1</td>
          <td>查工作人员是否穿着整洁、卫生的工作服；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio13">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.2</td>
          <td>查现场，是否上岗营业人员均佩戴有照片、姓名、岗位等内容的工作牌，执业药师和药学技术人员工作牌是否标明执业资格或药学技术职称；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio14">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.3</td>
          <td>查药品陈列区域是否存放与经营活动无关的物品及私人用品：如水杯、水壶、包、饭菜等；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio15">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       <tr>
          <td>4.4</td>
          <td>查是否在工作区域内吸烟、用餐、干与工作无关的事情。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio16">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="2"><p> <span lang="EN-US">5</span>．人员健康管理</p></td>
          <td>5.1</td>
          <td>查健康检查记录，从业人员是否每年进行健康检查；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio17">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.2</td>
          <td>患有传染病或者其他可能污染药品的疾病的人员是否仍从事直接接触药品的工作。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio18">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        
       
        <tr>
          <td rowspan="11"> 6．<span lang="EN-US"> </span>药品陈列</td>
          <td>6.1</td>
          <td>检查货架和柜台是否满足药品陈列展示和分类管理要求；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio19">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.2</td>
          <td>查看是否按剂型、用途分类陈列药品，有无类别标签，标签放置是否准确；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio20">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.3</td>
          <td>经营生物制品，查是否配备冷藏柜（冷藏温度<span lang="EN-US">2-10<span lang="EN-US"><span lang="EN-US">℃</span></span><span lang="EN-US">，设备是否完好，是否对</span></span>冷藏设备温度进行监测和记录（每天上下各一次），有无需冷藏保存药品未按规定保存；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio21">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.4</td>
          <td>查是否配备阴凉陈列柜或设置阴凉区（阴凉保存：温度≤<span lang="EN-US">20</span>℃，相对湿度<span lang="EN-US">35%-75%</span>），是否对温湿度进行监测和记录（每天上下各一次），阴凉陈列柜或阴凉区能否满足经营需求，有无需阴凉保存药品未按规定保存；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio22">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio22">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.5</td>
          <td>查处方药与非处方药是否分区陈列，有无标志；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio23">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio23">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.6</td>
          <td>查看非药品与药品区域是否物理隔离；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio24">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio24">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.7</td>
          <td>查看药品区、非药品区是否有醒目标志；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio25">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio25">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.8</td>
          <td>查看药品摆放是否整齐，无污染；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio26">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio26">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.9</td>
          <td>查看货架、柜台是否清洁卫生；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio27">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio27">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.10</td>
          <td>查看处方药是否开架销售；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio28">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio28">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.11</td>
          <td>查是否在货架、柜台以外的地方存放药品（如店堂内、货架背后、办公场所、货架顶部等）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio29">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio29">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
         <tr>
          <td rowspan="1"> 7．<span lang="EN-US"> </span>药品陈列</td>
          <td>7.1</td>
          <td>查执业药师或药学技术人员是否在职在岗；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio30">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio30">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="6"> 8．<span lang="EN-US"> </span>拆零专柜</td>
          <td>8.1</td>
          <td>查有无拆零专柜；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio31">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio31">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.2</td>
          <td>查拆零药品是否集中存放拆零专柜；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio32">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio32">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.3</td>
          <td>查有无调配工具；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio33">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio33">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*8.4</td>
          <td>查有无拆零销售记录，记录包括拆零起始日期、药品的通用名称、规格、批号、生产厂商、有效期、销售数量、销售日期、分拆及复核人员等内容；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio34">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio34">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.5</td>
          <td>查是否使用洁净、卫生的包装，包装上是否注明药品名称、规格、数量、用法、用量、批号、有效期以及药店名称等内容；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio35">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio35">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.6</td>
          <td>查拆零销售的药品是否保留药品原包装和说明书。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio36">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio36">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
         <tr>
          <td rowspan="5"> 9．国家专门管理药品</td>
          <td>9.1</td>
          <td>查销售复方甘草片、复方地芬诺酯片、含麻黄碱类复方制剂、含麻醉药品和曲马多口服复方制剂是否设置专柜并专人管理、专册登记；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio37">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio37">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.2</td>
          <td>查销售含麻黄碱类复方制剂是否严格执行不得超过<span lang="EN-US">2</span>个最小包装的管控规定；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio38">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio38">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*9.3</td>
          <td>查销售含麻黄碱类复方制剂是否认真查验购买者身份证并登记在册；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio39">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio39">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.4</td>
          <td>查含麻醉药品和曲马多口服复方制剂是否无医师处方销售；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio40">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio40">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.5</td>
          <td>查禁止销售含可待因复方口服溶液是否得到落实。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio41">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio41">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
         <tr>
          <td rowspan="7"> 10．<span lang="EN-US"> </span>中药饮片管理</td>
          <td>10.1</td>
          <td>查看中药饮片斗柜数量是否符合企业经营情况；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio42">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio42">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>10.2</td>
          <td>查看斗前是否正名正字；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio43">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio43">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*10.3</td>
          <td>查看斗内中药饮片有无包装或保留外包装标签；有无用中药材代替中药饮片（可以和采购与验收环节抽查品种合并检查随货通行、验收记录等来判断）；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio44">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio44">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>10.4</td>
          <td>查看有无借斗、串斗现象；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio45">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio45">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>10.5</td>
          <td>查中药饮片有无清斗记录；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio46">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio46">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>10.6</td>
          <td>查不同批号的饮片装斗前有无清斗记录；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio47">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio47">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>10.7</td>
          <td>查看有无霉烂、变质、虫蛀、掺杂、染色、增重等现象。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio48">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio48">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
         <tr>
          <td rowspan="4"> 11．处方药销售</td>
          <td>11.1</td>
          <td>查处方审核、调配人员是否在处方上签字；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio49">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio49">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.2</td>
          <td>查处方或其复印件是否按规定保留；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio50">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio50">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*11.3</td>
          <td>查必须凭处方销售药品是否凭处方销售（可以和采购与验收环节抽查品种合并检查）；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio51">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio51">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.4</td>
          <td>查处方药销售是否登记（可以和采购与验收环节抽查品种合并检查）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio52">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio52">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="4"> 12．国家明令禁止销售的药品</td>
          <td>12.1</td>
          <td>查是否销售蛋肽类药品（胰岛素除外）、终止妊娠药品、疫苗；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio53">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio53">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>12.2</td>
          <td>查是否经营二类精神药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio54">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio54">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>12.3</td>
          <td>查是否经营医疗用毒性药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio55">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio55">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>12.4</td>
          <td>查是否销售含可待因复方口服溶液（本市规定禁止销售）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio56">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio56">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="6"> 13．采购与验收</td>
          <td>13.1</td>
          <td>随机抽查若干品种（尽可能包括经营范围内的品种），查供货单位的随货同行单（票）内容是否与实物一致，是否索取同批号检验报告书，是否有采购发票；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio57">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio57">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*13.2</td>
          <td><p>查有无验收记录；验收记录是否包括药品的通用名称、剂型、规格、批准文号、批号、生产日期、有效期、生产厂商、供货单位、到货数量、到货日期、验收合格数量、验收结果等内容；<span lang="EN-US"> </span></p>
          <p>中药饮片验收记录应当包括品名、规格、批号、产地、生产日期、生产厂商、供货单位、到货数量、验收合格数量等内容，实施批准文号管理的中药饮片还应当记录批准文号。验收人员是否在验收记录上签署姓名和验收日期。</p></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio58">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio58">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.3</td>
          <td>查生物制品有无《生物制品批签发合格证》，是否对其运输方式及运输过程的温度记录、运输时间等质量控制状况进行重点检查并记录，是否核查并留存运输过程和到货时的温度记录；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio59">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio59">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.4</td>
          <td>查进口药品有无《进口药品注册证》（国外药品）或《医药产品注册证》（港、澳、台药品），口岸所检验报告书或进口通关单；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio60">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio60">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.5</td>
          <td>查首营企业审核资料，包括：《药品生产许可证》或者《药品经营许可证》复印件，营业执照及其年检证明复印件，《药品生产质量管理规范》认证证书或者《药品经营质量管理规范》认证证书复印件，相关印章、随货同行单（票）样式，开户户名、开户银行及账号，《税务登记证》和《组织机构代码证》复印件；销售人员委托书；质量保证协议；是否审批，是否审批后采购药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio61">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio62">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.6</td>
          <td>查首营品种审核资料，应包括药品生产或者进口批准证明文件复印件；是否审批，是否审批后采购药品。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio63">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio63">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
         <tr>
          <td rowspan="1"> 14．<span lang="EN-US"> </span>计算机系统</td>
          <td>14.1</td>
          <td>根据上述抽查的品种，查看计算机系统中有无采购、收货、验收、销售记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio64">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio64">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
         <tr>
          <td rowspan="4"> 15．电子监管</td>
          <td>15.1</td>
          <td>抽查带有电子监管码的药品，查药店是否加入中国药品电子监管网；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio65">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio65">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>15.2</td>
          <td>查是否具有电子扫码设备；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio66">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio66">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>15.3</td>
          <td>查采购有没有核注；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio67">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio67">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>15.4</td>
          <td>查销售有没有核销。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio68">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio68">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="2"> 16．销售凭证</td>
          <td>16.1</td>
          <td>查销售药品是否开具销售凭证；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio69">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio69">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*16.2</td>
          <td>查销售凭证内容是否包括：药品名称、生产厂商、数量、价格、批号、规格等。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio70">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio70">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="1"> 17．<span lang="EN-US"> </span><span lang="EN-US"> </span>陈列药品检查记录</td>
          <td>17.1</td>
          <td>查是否按月对陈列药品进行检查。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio71">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio71">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
         <tr>
          <td rowspan="1"> 18．近效期药品销售</td>
          <td>18.1</td>
          <td>查近效期药品销售是否告知顾客有效使用期限，采取什么方式告知。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio72">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio72">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="2"> 19．超范围、超方式经营</td>
          <td>19.1</td>
          <td>根据总体检查情况判断有无超范围经营情况；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio73">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio73">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>19.2</td>
          <td>根据检查情况判断有无从事批发业务。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio74">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio74">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
         <tr>
          <td rowspan="5"> 20．销售假劣药品的违法行为</td>
          <td>20.1</td>
          <td>查有无过期失效、被污染、霉烂变质、掺杂等药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio75">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio75">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*20.2</td>
          <td>查有无未标明生产批号、有效期，涂改生产批号、有效期药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio76">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio76">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>20.3</td>
          <td>查有无无药品批准文号的药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio77">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio77">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>20.4</td>
          <td>查有无自己配制的药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio78">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio78">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>20.5</td>
          <td>根据有关文件、公报中公布的不合格药品核查药店是否经营。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio79">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio79">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        
        <tr>
        
          <th colspan="5"  class="table2th" >医疗机构药品检查项目（<span lang="EN-US">33</span>项）</th>
          </tr>
        <tr>
            <th class="width220 table2th" >检查项目</th>
            <th class="width100 table2th">序号</th>
            <th class="table2th">检查内容</th>
            <th class="width140 table2th">评价</th>
            <th class="width220 table2th">备注</th>
        </tr>
        <tr>
          <td rowspan="2"><span lang="EN-US">1</span>．<span lang="EN-US"> </span>执业许可证</td>
          <td>*1.1</td>
          <td>查《医疗机构执业许可证》执业范围；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio80">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio80">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.2</td>
          <td>查《医疗机构执业许可证》有效期；是否过期。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio81">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio81">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="1"> 2．药品质量管理人员</td>
          <td>2.1</td>
          <td>查是否配备专职（或兼职）的药学或医学技术人员负责药品质量管理工作。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio82">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio82">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="1"> 3．处方审核和调配人员</td>
          <td>*3.1</td>
          <td>查审核和调配处方药剂的人员是否药学技术人员。（村卫生室、单位医务室、社区卫生服务机构、个体诊所等缺乏资格认定药学技术人员的，由经县级以上药监部门组织的药学法律和专业知识考试合格人员担任。）</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio83">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio83">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="1"> 4．健康检查</td>
          <td>4.1</td>
          <td>查直接接触药品的人员是否每年进行健康检查并建立健康档案。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio84">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio84">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="1"> 5．质量管理制度</td>
          <td>*5.1</td>
          <td>查是否制定质量管理制度，制度应包括药品采购、验收、贮存、养护；拆零管理；特殊管理药品的管理；不合格药品的管理。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio85">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio85">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="3"><span lang="EN-US">6</span>．药房设施设备</td>
          <td>6.1</td>
          <td>查是否设置独立的药房（库），与诊疗业务相适应（乡镇卫生院不少于<span lang="EN-US">20</span>平方米，存卫生室不少于<span lang="EN-US">8</span>平方米），满足常温：<span lang="EN-US">10-30<span lang="EN-US"><span lang="EN-US">℃</span></span><span lang="EN-US">，阴凉：≤20<span lang="EN-US"><span lang="EN-US">℃</span></span><span lang="EN-US">，冷藏：2-10<span lang="EN-US"><span lang="EN-US">℃</span></span><span lang="EN-US">；相对湿度为35%</span></span></span></span>～<span lang="EN-US">75%</span>条件。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio86">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio86">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.2</td>
          <td>查四种设备：药房必须配备空调、冰箱、温湿度计、货架。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio87">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio87">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.3</td>
          <td>查温湿度记录（包括药房（库）、冰箱）：一日二次，温湿度超标采取调控措施并记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio88">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio88">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="6"><span lang="EN-US">7</span>．食品贮存和运输经营者</td>
          <td>*7.1</td>
          <td>查是否从合法的药品生产、经营单位购进，并有合法票据。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio89">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio89">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*7.2</td>
          <td>查是否索取并留存药品生产、经营许可证，营业执照，<span lang="EN-US">GMP</span>或<span lang="EN-US">GSP</span>认证证书复印件，与供货单位签订的质量保证协议书，索取企业法定代表签字（或加盖原印章<span lang="EN-US">)</span>的&ldquo;授权委托书&rdquo;及销售人员身份证复印件。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio90">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio90">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.3</td>
          <td>查进口药品是否索取《进口药品注册证》（或《医药产品注册证》）和《进口药品检验报告书》（或注明&ldquo;已抽样&rdquo;的《进口药品通关单》）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio91">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio91">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*7.4</td>
          <td>查有无验收记录，验收记录应包括购进药品的通用名称、剂型、规格、生产批号、有效期、生产厂商、供货单位、购进数量、购进日期等内容。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio92">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio92">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.5</td>
          <td>中药饮片验收记录应当包括品名、规格、批号、产地、生产日期、生产厂商、供货单位、到货数量、验收合格数量等内容，实施批准文号管理的中药饮片还应当记录批准文号。购进验收记录应保存<span lang="EN-US">3</span>年以上。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio93">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio93">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*7.6</td>
          <td>查生物制品、疫苗有无《生物制品批签发合格证》，是否对其运输方式及运输过程的温度记录、运输时间等质量控制状况进行重点检查并记录，是否核查并留存运输过程和到货时的温度记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio94">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio94">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="4"><span lang="EN-US">8</span>．中药饮片管理</td>
          <td>8.1</td>
          <td>查看斗前是否正名正字；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio95">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio95">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*8.2</td>
          <td>查看斗内中药饮片有无包装或保留外包装标签；有无用中药材代替中药饮片（可以和采购与验收环节抽查品种合并检查随货通行、验收记录等来判断）；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio96">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio96">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.3</td>
          <td>查看有无借斗、串斗现象；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio97">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio97">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.4</td>
          <td>查看有无霉烂、变质、虫蛀、掺杂、染色、增重等现象。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio98">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio98">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="5"><span lang="EN-US">9</span>．药品储存与陈列</td>
          <td>9.1</td>
          <td>查药品是否实行色标管理：合格区为绿色、不合格区为红色、待验（退货）区为黄色。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio99">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio99">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.2</td>
          <td>查药品堆放是否符合要求：药品应与墙、屋顶（梁）的间距不小于<span lang="EN-US">30cm</span>，与地面间距不小于<span lang="EN-US">10cm</span>。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio100">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio100">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.3</td>
          <td>查药品与非药品、内服药与外用药、中药饮片<span lang="EN-US">HiFi</span>分开，高危（急救）药品是否单独存放，并有明显标志。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio101">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio101">否
                    </label>
                </div>


        </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*9.4</td>
          <td>查看是否按剂型、用途分类陈列药品，有无类别标签，标签放置是否准确；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio102">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio102">否
                    </label>
                </div>


          </td>
          <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.5</td>
          <td>麻醉药品、一类精神药品、医疗用毒性药品应专柜存放，双人双锁保管，专帐记录，帐物相符（乡镇卫生院）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio103">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio103">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
         <tr>
          <td rowspan="1"> 10．特殊药品管理</td>
          <td>10.1</td>
          <td>特殊管理的药品，应严格使用专用处方，且限量供应，调配人员应在处方上签字或盖章（乡镇卫生院）。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio104">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio104">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="2"><span lang="EN-US">11</span>．<span lang="EN-US"> </span>拆零管理</td>
          <td>11.1</td>
          <td>查是否配备拆零药品专柜和拆零工具，拆零设施应符合卫生要求。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio105">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio105">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.2</td>
          <td>查拆零药品的药袋上应写明药品名称、规格、用法、用量、有效期等内容。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio106">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio106">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="1"> 12．药品养护</td>
          <td>12.1</td>
          <td>对陈列和储存的药品应定期进行检查，做好养护记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio107">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio107">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        
        
        
          <tr>
          <td rowspan="5"><span lang="EN-US">13</span>．<span lang="EN-US"> </span>销售假劣药品的违法行为</td>
          <td>13.1</td>
          <td>查有无过期失效、被污染、霉烂变质、掺杂等药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio108">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio108">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*13.2</td>
          <td>查有无未标明生产批号、有效期，涂改生产批号、有效期药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio109">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio109">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.3</td>
          <td>查有无无药品批准文号的药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio110">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio110">否
                    </label>
                </div>


        </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.4</td>
          <td>查有无自己配制的药品；</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio111">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio111">否
                    </label>
                </div>


          </td>
          <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>13.5</td>
          <td>根据有关文件、公报中公布的不合格药品核查是否使用。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="drugradio112">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="drugradio112">否
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
            <td class="width220 text-left p20" colspan="5" ><p>说明：<span lang="EN-US">1. </span>药店药品通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">13</span>项，一般项<span lang="EN-US">61</span>项，共<span lang="EN-US">74</span>项。医疗机构药品通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">10</span>项，一般项<span lang="EN-US">23</span>项，共<span lang="EN-US">33</span>项。重点项目应逐项检查，一般项可视情况随机抽查。<span lang="EN-US"> </span></p>
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
            <a href="javascript:void(0)" class="form_btn  width140" onclick="updateDrug()">保 存</a>
        </div>

    </div>

</div>
<div style="display:none" id="checkProject">${supervisionAndCheck.checkProject}</div>
<script>
$(function (){
	var json = eval('(' + $("#checkProject").html() + ')');
	if($("#checkProject").html()!=""){
		$("#drugProject").find("input[type='radio']").each(function (){
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
	$("#drugProject").find("input[type='radio']").change(function(){
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
	$("#drugProject").find("input[type='radio']").each(function (){
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
function updateDrug(){
	statistics();
	upload();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/update.do",
		type:"post",
		dataType:"json",
		data:$('#addscDrug').serialize(),
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
    $('#calenderOne031').datetimepicker({
        container:'#calenderOneBox031',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
	    format:'yyyy-mm-dd'
    });
    $('#calenderOne032').datetimepicker({
        container:'#calenderOneBox032',
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