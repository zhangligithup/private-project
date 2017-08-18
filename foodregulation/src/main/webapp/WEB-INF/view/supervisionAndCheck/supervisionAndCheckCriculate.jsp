<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="addscCriculate">
<input type = "hidden" value="enterprise_3" name="enterpriseTypeCode">
<input type = "hidden" value="${dealTaskId}" name="taskId">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">添加食品销售监督检查</li>
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
    <table class="table table-bordered table2" id="criculateProject">
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
            <td>1.1</td>
            <td>经营者持有的营业执照是否合法有效。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>1.2</td>
          <td>经营者持有的食品经营许可证是否合法有效。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio2">否
                    </label>
                </div>


          </td>
            <td ><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>1.3</td>
          <td>食品经营许可证载明的有关内容与实际经营是否相符。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio3">否
                    </label>
                </div>


          </td>
            <td ><input type="text" class="input2"></td>
        </tr>
       
        <tr>
            <td rowspan="3"> 2．经营资质</td>
            <td>2.1</td>
            <td>是否具有与经营的食品品种、数量相适应的场所。</td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio4">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>2.2</td>
          <td>经营场所环境是否整洁，是否与污染源保持规定的距离。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio5">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>2.3</td>
          <td>是否具有与经营的食品品种、数量相适应的生产经营设备或者设施。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio6">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="11"><span lang="EN-US">3</span>．食品标签等外观质量状况</td>
          <td>*3.1</td>
          <td>检查的食品是否在保质期内。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio7">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.2</td>
          <td>检查的食品感官性状是否正常。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio8">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.3</td>
          <td>经营的肉及肉制品是否具有检验检疫证明。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio9">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.4</td>
          <td>检查的食品是否符合国家为防病等特殊需要的要求。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio10">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.5</td>
          <td>经营的预包装食品、食品添加剂的包装上是否有标签，标签标明的内容是否符合食品安全法等法律法规的规定。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio11">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.6</td>
          <td>经营的食品的标签、说明书是否清楚、明显，生产日期、保质期等事项是否显著标注，容易辨识。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio12">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.7</td>
          <td>销售散装食品，是否在散装食品的容器、外包装上标明食品的名称、生产日期或者生产批号、保质期以及生产经营者名称、地址、联系方式等内容。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio13">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.8</td>
          <td>经营食品标签、说明书是否涉及疾病预防、治疗功能。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio14">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>3.9</td>
          <td>经营场所设置或摆放的食品广告的内容是否涉及疾病预防、治疗功能。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio15">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.10</td>
          <td>经营的进口预包装食品是否有中文标签<span lang="EN-US">,</span>并载明食品的原产地以及境内代理商的名称、地址、联系方式。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio16">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.11</td>
          <td>经营的进口预包装食品是否有国家出入境检验检疫部门出具的入境货物检验检疫证明。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio17">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="3"><span lang="EN-US">4</span>．食品安全管理机构和人员</td>
          <td>4.1</td>
          <td>食品经营企业是否有专职或者兼职的食品安全专业技术人员、食品安全管理人员和保证食品安全的规章制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio18">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.2</td>
          <td>食品经营企业是否有食品安全管理人员。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio19">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.3</td>
          <td>食品经营企业是否存在经食品药品监管部门抽查考核不合格的食品安全管理人员在岗从事食品安全管理工作的情况。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio20">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="4"><p> <span lang="EN-US">5</span>．从业人员管理</p></td>
          <td>5.1</td>
          <td>食品经营者是否建立从业人员健康管理制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio21">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.2</td>
          <td>在岗从事接触直接入口食品工作的食品经营人员是否取得健康证明。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio22">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio22">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.3</td>
          <td>在岗从事接触直接入口食品工作的食品经营人员是否存在患有国务院卫生行政部门规定的有碍食品安全疾病的情况。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio23">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio23">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.4</td>
          <td>食品经营企业是否对职工进行食品安全知识培训和考核。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio24">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio24">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="10"> 6．<span lang="EN-US"> </span>经营过程控制情况</td>
          <td>*6.1</td>
          <td>是否按要求贮存食品。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio25">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio25">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.2</td>
          <td>是否定期检查库存食品，及时清理变质或者超过保质期的食品。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio26">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio26">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.3</td>
          <td>食品经营者是否按照食品标签标示的警示标志、警示说明或者注意事项的要求贮存和销售食品。对经营过程有温度、湿度要求的食品的，是否有保证食品安全所需的温度、湿度等特殊要求的设备，并按要求贮存。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio27">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio27">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.4</td>
          <td>食品经营者是否建立食品安全自查制度，定期对食品安全状况进行检查评价。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio28">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio28">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.5</td>
          <td>发生食品安全事故的，是否建立和保存处置食品安全事故记录，是否按规定上报所在地食品药品监督部门。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio29">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio29">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.6</td>
          <td>食品经营者采购食品（食品添加剂），是否查验供货者的许可证和食品出厂检验合格证或者其他合格证明<span lang="EN-US">(</span>以下称合格证明文件<span lang="EN-US">)</span>。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio30">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio30">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.7</td>
          <td>是否建立食用农产品进货查验记录制度，如实记录食用农产品的名称、数量、进货日期以及供货者名称、地址、联系方式等内容，并保存相关凭证。记录和凭证保存期限不得少于六个月。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio31">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio31">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*6.8</td>
          <td>食品经营企业是否建立并严格执行食品进货查验记录制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio32">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio32">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.9</td>
          <td>是否建立并执行不安全食品处置制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio33">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio33">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.10</td>
          <td>从事食品批发业务的经营企业是否建立并严格执行食品销售记录制度。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio34">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio34">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>6.11</td>
          <td>食品经营者是否张贴并保持上次监督检查结果记录。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio35">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio35">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
        
          <th colspan="5"  class="table2th" >特殊场所和特殊食品检查项目（<span lang="EN-US">19</span>项）</th>
          </tr>
        <tr>
            <th class="width220 table2th" >检查项目</th>
            <th class="width100 table2th">序号</th>
            <th class="table2th">检查内容</th>
            <th class="width140 table2th">评价</th>
            <th class="width220 table2th">备注</th>
        </tr>
        <tr>
          <td rowspan="2"><span lang="EN-US">7</span>．市场开办者、柜台出租者和展销会举办者</td>
          <td>7.1</td>
          <td>集中交易市场的开办者、柜台出租者和展销会举办者，是否依法审查入场食品经营者的许可证，明确其食品安全管理责任。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio36">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio36">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.2</td>
          <td>是否定期对入场食品经营者经营环境和条件进行检查。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio37">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio37">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="2"><span lang="EN-US">8</span>．网络食品交易第三方平台提供者</td>
          <td>8.1</td>
          <td>网络食品交易第三方平台提供者是否对入网食品经营者进行许可审查或实行实名登记。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio38">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio38">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.2</td>
          <td>网络食品交易第三方平台提供者是否明确入网经营者的食品安全管理责任。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio39">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio39">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="3"><span lang="EN-US">9</span>．食品贮存和运输经营者</td>
          <td>9.1</td>
          <td>贮存、运输和装卸食品的容器、工具和设备是否安全、无害，保持清洁。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio40">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio40">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.2</td>
          <td>容器、工具和设备是否符合保证食品安全所需的温度、湿度等特殊要求。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio41">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio41">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.3</td>
          <td>食品是否与有毒、有害物品一同贮存、运输。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio42">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio42">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="2"><span lang="EN-US">10</span>．食用农产品批发市场</td>
          <td>10.1</td>
          <td>食用农产品批发市场是否配备检验设备和检验人员或者委托符合本法规定的食品检验机构，对进入该批发市场销售的食用农产品进行抽样检验。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio43">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio43">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>10.2</td>
          <td>发现不符合食品安全标准的食用农产品时，是否要求销售者立即停止销售，并向食品药品监督管理部门报告。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio44">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio44">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="10"><span lang="EN-US">11</span>．特殊食品</td>
          <td>11.1</td>
          <td>是否经营未按规定注册或备案的保健食品、特殊医学用途配方食品、婴幼儿配方乳粉。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio45">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio45">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.2</td>
          <td>经营的保健食品的标签、说明书是否涉及疾病预防、治疗功能，内容是否真实，是否载明适宜人群、不适宜人群、功效成分或者标志性成分及其含量等，并声明&ldquo;本品不能代替药物&rdquo;，与注册或者备案的内容相一致。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio46">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio46">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.3</td>
          <td>经营保健食品是否设专柜销售，并在专柜显著位置标明&ldquo;保健食品&rdquo;字样。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio47">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio47">否
                    </label>
                </div>


        </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.4</td>
          <td>是否存在经营场所及其周边，通过发放、张贴、悬挂虚假宣传资料等方式推销保健食品的情况。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio48">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio48">否
                    </label>
                </div>


          </td>
          <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.5</td>
          <td>经营的保健食品是否索取并留存批准证明文件以及企业产品质量标准。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio49">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio49">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.6</td>
          <td>经营的保健食品广告内容是否真实合法，是否含有虚假内容，是否涉及疾病预防、治疗功能，是否声明&ldquo;本品不能代替药物&rdquo;；其内容是否经生产企业所在地省、自治区、直辖市人民政府食品药品监督管理部门审查批准，取得保健食品广告批准文件。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio50">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio50">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.7</td>
          <td>经营的进口保健食品是否未按规定注册或备案。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio51">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio51">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.8</td>
          <td>特殊医学用途配方食品是否经国务院食品药品监督管理部门注册。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio52">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio52">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.9</td>
          <td>特殊医学用途配方食品广告是否符合《中华人民共和国广告法》和其他法律、行政法规关于药品广告管理的规定。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio53">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio53">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>11.10</td>
          <td>专供婴幼儿和其他特定人群的主辅食品，其标签是否标明主要营养成分及其含量。</td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="criculateradio54">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="criculateradio54">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
            <td class="table2th text-left pl20" colspan="5" >其它需记录的问题</td>
        </tr>
        <tr>
            <td class="text-left " colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="otherQuestion"></textarea></td>
        </tr>
        <tr>
            <td class=" table2th text-left pl20" colspan="5" >其他说明</td>
        </tr>
        <tr>
            <td class=" text-left p20" colspan="5" ><p>说明：<span lang="EN-US">1. </span>食品通用检查项目：重点项（<span lang="EN-US">*</span>）<span lang="EN-US">12</span>项，一般项<span lang="EN-US">23</span>项，共<span lang="EN-US">35</span>项。特殊场所和特殊食品检查项目：共<span lang="EN-US">19</span>项。重点项目应逐项检查，一般项可视情况随机抽查；第二部分为特殊场所和特殊食品检查项目，不区分重点项和一般项，应逐项检查。<span lang="EN-US"> </span></p>
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
                    <input type="radio"  value="3" name="resultHandle">食品生产经营者立即停止食品生产经营活动 
                </label>
            </li>
        </ul>
    </div>
    <input type="hidden" value="" name="checkProject">
<input type="hidden" value="" name="otherQuestion">
<input type="hidden" value="" name="zhongdianQuestion">
<input type="hidden" value="" name="yibanQuestion">
    <div id="criculateDiv">
    <%@ include file="/pages/document.jsp" %>  
    </div>
    <div class="btn_box marb10" >
        <div style="text-align: center">
            <a href="javascript:void(0)" class="form_btn  width140" onclick="saveCriculate()">保 存</a>
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
	$("#criculateProject").find("input[type='radio']").change(function(){
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
	$("#criculateProject").find("input[type='radio']").each(function (){
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
function saveCriculate(){
	upload();
	statistics();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/add.do",
		type:"post",
		dataType:"json",
		data:$('#addscCriculate').serialize(),
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
    $('#calenderOne038').datetimepicker({
        container:'#calenderOneBox038',
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