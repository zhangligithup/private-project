<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="addscFood">
<input type = "hidden" value="enterprise_4" name="enterpriseTypeCode">
<input type = "hidden" value="${dealTaskId}" name="taskId">
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">监督检查</a></li>
            <li class="active">添加食品餐饮监督检查</li>
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
    <table class="table table-bordered table2" id="foodProject">
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
          <td ><SPAN lang="EN-US">1.</SPAN>许可管理<SPAN lang="EN-US"></SPAN></td>
            <td>1.1</td>
            <td>经营者持有的营业执照合法有效。食品经营许可证合法有效，经营场所、主体业态、经营项目等事项与食品经营许可证一致。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio1">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio1">否
                    </label>
                </div>


            </td>
            <td ><input type="text" class="input2"></td>

        </tr>
        
       
        <tr>
            <td rowspan="3"><SPAN lang="EN-US">2.</SPAN>信息公示<SPAN lang="EN-US"></SPAN></td>
            <td>2.1</td>
            <td>在经营场所醒目位置公示食品经营许可证。<SPAN lang="EN-US"></SPAN></td>
            <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio2">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio2">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>

        </tr>
        <tr>
          <td>2.2</td>
          <td>监督检查结果记录表公示的时间、位置等符合要求。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio3">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio3">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>2.3</td>
          <td>在经营场所醒目位置公示量化等级标识。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio4">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio4">否
                    </label>
                </div>


          </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="2"><SPAN lang="EN-US">3.</SPAN>制度管理<SPAN lang="EN-US"></SPAN></td>
          <td>*3.1</td>
          <td>建立从业人员健康管理、食品安全自查、进货查验记录、食品召回等食品安全管理制度。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio5">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio5">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*3.2</td>
          <td>制定食品安全事故处置方案。<SPAN lang="EN-US"></SPAN></td>
          <td> 
          <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio6">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio6">否
                    </label>
                </div></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
          <td rowspan="4"><SPAN lang="EN-US">4.</SPAN>人员管理<SPAN lang="EN-US"></SPAN></td>
          <td>*4.1</td>
          <td>主要负责人知晓食品安全责任，有食品安全管理人员。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio7">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio7">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*4.2</td>
          <td>从事接触直接入口食品工作的从业人员持有有效的健康证明。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio8">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio8">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>4.3</td>
          <td>具有从业人员食品安全培训记录。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio9">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio9">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td><4.4</td>
          <td>从业人员穿戴清洁的工作衣帽，双手清洁，保持个人卫生。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio10">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio10">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="4"><p><SPAN lang="EN-US">5.</SPAN>环境卫生<SPAN lang="EN-US"></SPAN></p></td>
          <td>5.1</td>
          <td>食品经营场所保持清洁、卫生。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio11">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio11">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.2</td>
          <td>烹饪场所配置排风设备，定期清洁。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio12">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio12">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.3</td>
          <td>用水符合生活饮用水卫生标准。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio13">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio13">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>5.4</td>
          <td>卫生间保持清洁、卫生，定期清理。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio14">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio14">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       
        <tr>
          <td rowspan="3"><SPAN lang="EN-US">6.</SPAN>原料控制（含食品添加剂）<SPAN lang="EN-US"></SPAN></td>
          <td>*6.1</td>
          <td>查验供货者的许可证和食品出厂检验合格证或其他合格证明，企业如实记录有关信息并保存相关凭证。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio15">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio15">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.2</td>
          <td>原料外包装标识符合要求，按照外包装标识的条件和要求规范贮存，并定期检查，及时清理变质或者超过保质期的食品。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio16">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio16">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>6.3</td>
          <td>食品添加剂由专人负责保管、领用、登记，并有相关记录。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio17">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio17">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        
        <tr>
          <td rowspan="6"><p align="center"><SPAN lang="EN-US">7.</SPAN>加工制作过程<SPAN lang="EN-US"></SPAN></p></td>
          <td>7.1</td>
          <td>食品原料、半成品与成品在盛放、贮存时相互分开。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio18">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio18">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.2</td>
          <td>制作食品的设施设备及加工工具、容器等具有显著标识，按标识区分使用。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio19">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio19">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.3</td>
          <td>专间内由明确的专人进行操作，使用专用的加工工具。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio20">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio20">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.4</td>
          <td>食品留样符合规范。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio21">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio21">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.5</td>
          <td>中央厨房、集体用餐配送单位配送食品的标识、储存、运输等符合要求。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio22">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio22">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>7.6</td>
          <td>有毒有害物质不得与食品一同贮存、运输。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio23">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio23">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="4"><p align="center"><SPAN lang="EN-US">8.</SPAN>设施设备及维护<SPAN lang="EN-US"></SPAN></p></td>
          <td>8.1</td>
          <td>专间内配备专用的消毒（含空气消毒）、冷藏、冷冻、空调等设施，设施运转正常。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio24">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio24">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.2</td>
          <td>食品处理区配备运转正常的洗手消毒设施。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio25">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio25">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>8.3</td>
          <td>食品处理区配备带盖的餐厨废弃物存放容器。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio26">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio26">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
         <tr>
          <td>*8.4</td>
          <td>食品加工、贮存、陈列等设施设备运转正常，并保持清洁。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio27">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio27">否
                    </label>
                </div>


           </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td rowspan="3"><p align="center"><SPAN lang="EN-US">9.</SPAN>餐饮具清洗消毒<SPAN lang="EN-US"></SPAN></p></td>
          <td>9.1</td>
          <td>集中消毒餐具、饮具的采购符合要求。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio28">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio28">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>9.2</td>
          <td>具有餐具、饮具的清洗、消毒、保洁设备设施，并运转正常。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio29">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio29">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
        <tr>
          <td>*9.3</td>
          <td>餐具、饮具和盛放直接入口食品的容器用后洗净、消毒，炊具、用具用后洗净，保持清洁。<SPAN lang="EN-US"></SPAN></td>
          <td>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="1" name="foodradio30">是
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" ">
                        <input type="radio"  value="2" name="foodradio30">否
                    </label>
                </div>


            </td>
            <td><input type="text" class="input2"></td>
        </tr>
       <tr>
            <td class="table2th text-left pl20" colspan="5" >其它需记录的问题</td>
        </tr>
        <tr>
            <td class=" text-left " colspan="5" ><textarea  cols="30" rows="10"  class="login_input login_textarea " id="otherQuestion">${supervisionAndCheck.otherQuestion}</textarea></td>
        </tr>
        <tr>
            <td class="width220 table2th text-left pl20" colspan="5" >其他说明</td>
        </tr>
        <tr>
            <td class="width220 text-left p20" colspan="5" ><p>说明：<span lang="EN-US">1.</span>表中重点项<span lang="EN-US">(*) 7</span>项<span lang="EN-US">,</span>一般项<span lang="EN-US">23</span>项<span lang="EN-US">,</span>共<span lang="EN-US">30</span>项。每次检查的重点项应不少于<span lang="EN-US">3</span>项，一般项应不少于<span lang="EN-US">7</span>项。<span lang="EN-US"> </span></p>
              <p align="left"><span lang="EN-US">2.</span>检查结果判定方法：①符合：未发现检查的重点项和一般项存在问题；②基本符合：发现检查的重点项存在<span lang="EN-US">1</span>项及以下不<span lang="EN-US"> </span>合格且<span lang="EN-US">70%</span>≤一般项合格率＜<span lang="EN-US">100%</span>；③不符合：发现检查的重点项存在<span lang="EN-US">2</span>项及以上不合格，或一般项合格率＜<span lang="EN-US">70%</span>。<span lang="EN-US"> </span></p>
<p align="left"><span lang="EN-US">3</span>．当次检查发现的不合格项目，应列入下次检查必查项目。<span lang="EN-US"> </span></p>
            <p align="left"><span lang="EN-US">4</span>．存在合理缺项时，一般项合格率的计算方法为：合格项目数<span lang="EN-US">/</span>（检查的项目数－合理缺项的项目数）×<span lang="EN-US">100%</span>。</p></td>
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
                    <input type="radio"  value="3" name="resultHandle">	餐饮服务经营者立即停止餐饮服务经营活动
                </label>
            </li>
        </ul>
    </div>
    <input type="hidden" value="" name="checkProject">
<input type="hidden" value="" name="otherQuestion">
<input type="hidden" value="" name="zhongdianQuestion">
<input type="hidden" value="" name="yibanQuestion">
    <div id="foodDiv">
    <%@ include file="/pages/document.jsp" %>  
    </div>
    <div class="btn_box marb10" >
        <div style="text-align: center">
            <a href="javascript:void(0)" class="form_btn  width140" onclick="saveFood()">保 存</a>
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
	$("#foodProject").find("input[type='radio']").change(function(){
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
	$("#foodProject").find("input[type='radio']").each(function (){
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
function saveFood(){
	statistics();
	upload();
	$("input[name='otherQuestion']").val($("#otherQuestion").val());
	$("input[name='zhongdianQuestion']").val($("#zhongdianQuestion").val());
	$("input[name='yibanQuestion']").val($("#yibanQuestion").val());
	$.ajax({
		url:"${pageContext.request.contextPath}/supervisionAndCheck/add.do",
		type:"post",
		dataType:"json",
		data:$('#addscFood').serialize(),
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
    $('#calenderOne030').datetimepicker({
        container:'#calenderOneBox030',
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