<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">抽样检查</a></li>
            <li class="active">添加抽样检查</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
    <input type="hidden" value="${param.time}" id="checkDate_sam1">
    <input type="hidden" value="${param.batch}" id="batch_sam1">
    <input type="hidden" value="${param.taskId}" id="taskId_sam1">
    <input type="hidden" value="${param.entType}" id="entType_sam1">
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select class="select_style1" disabled id="businessCategorySam1">
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单</th>
            <th class="width220 noborder ">
                <select class="select_style1 marr10" id="choose_book_sam1">
                    <option value ="choose_box1_sam1" selected="selected">抽样检验单</option>
                    <option value ="choose_box2_sam1">检验报告书</option>
                </select>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_sam1">
        <div id="choose_box2_sam1">
            <form id="sp_cy1bg1" onsubmit="return saveFjSam1();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_bg_sam1">食品检验报告书</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td  class="table3_th">报告编号</td>
                    <td width="35%"><input type="text" class="input2" name="bgbh"></td>
                    <td  class="table3_th">样品/抽样单编号</td>
                    <td><input type="text" class="input2" name="ypcydbh"></td>
                </tr>
                <tr>
                    <td  class="table3_th">样品名称</td>
                    <td width="35%"><input type="text" class="input2" name="ypmc"></td>
                    <td  class="table3_th">商标</td>
                    <td><input type="text" class="input2" name="sb"></td>

                </tr>
                <tr>
                    <td  class="table3_th">委托单位</td>
                    <td width="35%"><input type="text" class="input2" name="wtdw"></td>
                    <td  class="table3_th">检验类别</td>
                    <td><input type="text" class="input2" name="jylb"></td>

                </tr>
                <tr>
                    <td  class="table3_th">规格型号</td>
                    <td width="35%"><input type="text" class="input2" name="ggxh"></td>
                    <td  class="table3_th">产品编号/批号</td>
                    <td><input type="text" class="input2" name="cpbhph"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被检测人地址</td>
                    <td width="35%"><input type="text" class="input2" name="bjcrdz"></td>
                    <td  class="table3_th">邮政编码</td>
                    <td><input type="text" class="input2" name="yzbm"></td>

                </tr>
                <tr>
                    <td  class="table3_th">标称生产单位</td>
                    <td width="35%"><input type="text" class="input2" name="bcscdw"></td>
                    <td  class="table3_th">联系电话</td>
                    <td><input type="text" class="input2" name="bcscdwlxdh"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽检单位</td>
                    <td width="35%"><input type="text" class="input2" name="bcjdw" value="${param.entName}" id="bg_bcjdwmc_sam1"></td>
                    <td  class="table3_th">联系电话</td>
                    <td><input type="text" class="input2" name="bcjdwdh"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样日期</td>
                    <td width="35%">
                        <div id="sam1_date_calenderOneBox1" style="position:relative">
                            <input id="sam1_date_calender1" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                        </div>

                        <%--<input type="text" class="input2" name="cyrq">--%>
                    </td>
                    <td  class="table3_th">样品数量</td>
                    <td><input type="text" class="input2" name="ypsl"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样人员</td>
                    <td width="35%"><input type="text" class="input2" name="cyry"></td>
                    <td  class="table3_th">检查封样人员</td>
                    <td><input type="text" class="input2" name="jcfyry"></td>

                </tr>
                <tr>
                    <td  class="table3_th">样品送到日期</td>
                    <td width="35%">
                        <div id="sam1_date_calenderOneBox2" style="position:relative">
                            <input id="sam1_date_calender2" class="input2 bg_calender" size="16" type="text" name="ypsdrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="ypsdrq">--%>
                    </td>
                    <td  class="table3_th">样品等级</td>
                    <td><input type="text" class="input2" name="ypdj"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样基数</td>
                    <td width="35%"><input type="text" class="input2" name="cyjs"></td>
                    <td  class="table3_th">封样状态</td>
                    <td><input type="text" class="input2" name="fyzt"></td>

                </tr>
                <tr>
                    <td  class="table3_th verticalTop">检验项目</td>
                    <td  colspan="3">
                        <textarea name="jyxm"  cols="30" rows="10"  class="input2 login_textarea"></textarea>
                    </td>


                </tr>
                <tr>
                    <td  class="table3_th verticalTop">检验依据</td>
                    <td  colspan="3">
                        <textarea name="jyyj"  cols="30" rows="10"  class="input2 login_textarea "></textarea>
                    </td>

                </tr>
                <tr>
                    <td  class="table3_th verticalTop">检验结论</td>
                    <td  colspan="3" class="text-left">
                        <div class="myradio radio-inline marr10">
                            <label class=" ">
                                <input type="radio"  value="合格" name="jyjl" checked>合格
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" ">
                                <input type="radio"  value="不合格" name="jyjl">不合格
                            </label>
                        </div>

                    </td>
                </tr>
                </tbody>
            </table>
            <table class="table search_box marb0 ">
                <thead>
                <tr >
                    <th class="width70 noborder">批准人</th>
                    <th class="width220 noborder">
                        <input type="text" class="login_input width260" name="pzr">
                    </th>
                    <th class="width100 noborder text-right">审核人</th>
                    <th class="width220 noborder ">
                        <input type="text" class="login_input width260" name="shr">
                    </th>
                    <th class="noborder"></th>
                </tr>
                <tr>
                <tr>
                    <td class="noborder title_font ">上传附件</td>
                    <td>
                        <div id="reportFileSample1" class="zyupload">
                        </div>
                    </td>
                </tr>
                </tr>
                </thead>
            </table>
            <div class="btn_box marb10" >
                <div class="pull-left ">
                    <button class="form_btn  width140 title_font" type="submit">保 存</button>
                </div>
            </div>

            </form>
        </div>

        <div id="choose_box1_sam1" >
            <form id="sp_cy1" onsubmit="return saveCy1();" action="javascript:void(0)">
                <div class="titledivone marb3">
                    <div class="title_txt" id="title_cy_sam1">食品安全抽样检验抽样单</div>
                </div>
                <table class="table  table2 table-bordered">
                    <tbody>
                    <tr>
                        <td  class="th2" colspan="2">任务来源</td>
                        <td colspan="3"><input type="text" name="rwly" class="input2"></td>
                        <td width="12%"  class="th2">任务类别</td>
                        <td colspan="3" class="text-left">
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="rwlb" value="监督抽查">监督抽查
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="rwlb" value="风险监测">风险监测
                                </label>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td width="6%" rowspan="5"  class="th2">被抽样单位信息</td>
                        <td width="5%"  class="th2">单位名称</td>
                        <td colspan="3"><input type="text" class="input2" name="dwmc"  value="${param.entName}" id="cy_bcjdwmc_sam1"></td>
                        <td  class="th2">来样方式</td>
                        <td colspan="3" class="text-left">
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="lyfs" value="城市">城市
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="lyfs" value="乡村" >乡村
                                </label>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td  class="th2">单位地址</td>
                        <td colspan="7"><input type="text" class="input2" name="dwdz"></td>
                    </tr>
                    <tr>
                        <td  class="th2">法定代表人</td>
                        <td width="15%"><input type="text" class="input2" name="fddbr"></td>
                        <td width="13%" class="th2">年销售额（万元）</td>
                        <td width="16%"><input type="text" class="input2" name="nxse"></td>
                        <td  class="th2">营业执照</td>
                        <td colspan="3" class="text-left"><input type="text" class="input2" name="yyzz"></td>

                    </tr>
                    <tr>
                        <td  class="th2">联系人</td>
                        <td><input type="text" class="input2" name="lxr"></td>
                        <td class="th2">电话</td>
                        <td><input type="text" class="input2" name="dh"></td>
                        <td  class="th2">传真</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="cz"></td>
                        <td width="7%" class="th2" >邮编</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="yb"></td>
                    </tr>
                    <tr>
                        <th class="table3_th">监管单位</th>
                        </th>
                        <td  class="th2">行政区域</td>
                        <td width="13%" class="text-left">
                            <select class="select_style1 marr10 input2" name="xzqy" id="cy_xzqy_sam1">
                                <option value="">请选择</option>
                                <c:forEach items="${addressList}" var="list">
                                    <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                                </c:forEach>
                            </select>
                        <td class="th2">监管单位</td>
                        <td width="13%" class="text-left">
                            <select class="select_style1 marr10 input2" name="jgdw" id="cy_jgdw_sam1">
                                <option value="">请选择</option>
                                <c:forEach items="${unitList}" var="list">
                                    <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="6%" rowspan="5"  class="th2">抽样地点</td>
                        <td width="5%"  class="th2">生产环节</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="schj" value="原辅料库">原辅料库
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="schj" value="生产线" >生产线
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="schj" value="半成品库">半成品库
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="schj" value="成品库（待检区）">成品库（待检区）
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="schj" value="成品库（已检区）"  >成品库（已检区）
                                </label>
                            </div>                    </td>
                    </tr>
                    <tr>
                        <td  class="th2">流通环节</td>
                        <td colspan="7" class="text-left">
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="lthj" value="批发市场">
                                    批发市场
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="lthj" value="农贸市场"  >
                                    农贸市场
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="lthj" value="商场" >
                                    商场
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="lthj" value="超市" >
                                    超市
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="lthj" value="菜市场" >
                                    菜市场
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="lthj" value="小时杂店">
                                    小时杂店
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="lthj" value="网购"  >
                                    网购
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="lthj" value="其他" >
                                    其他
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3"  class="th2">餐饮环节</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="cyhj" value="餐馆">
                                餐馆
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="特大型餐馆" >
                                    特大型餐馆
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="cyhj" value="大型餐馆" >
                                    大型餐馆
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="中型餐馆"  >
                                    中型餐馆
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="小型餐馆" >
                                    小型餐馆
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="cyhj" value="食堂"  >
                                食堂
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="机关食堂"  >
                                    机关食堂
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="cyhj" value="学校/托幼食堂">
                                    学校/托幼食堂
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="企事业单位食堂" >
                                    企事业单位食堂
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="建筑工地食堂" >
                                    建筑工地食堂
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="cyhj" value="小吃店" >
                                小吃店
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="快餐店"  >
                                    快餐店
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="cyhj" value="饮品店">
                                    饮品店
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="集体用餐配送单位" >
                                    集体用餐配送单位
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="中央厨房"  >
                                    中央厨房
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="其他"  >
                                    其他
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"  class="th2">样品来源</td>
                        <td colspan="7" class="text-left">

                            非特殊用途类：

                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="yply" value="加工/自制" >
                                    加工/自制
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="yply" value="委托生产" >
                                    委托生产
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox"  name="yply" value="外购"  >
                                    外购
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="yply" value="其他"  >
                                    其他
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"  class="th2">样品属性</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="ypsx" value="普通食品">
                                普通食品
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="ypsx" value="特殊膳食食品"  >
                                    特殊膳食食品
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="ypsx" value="节令食品">
                                    节令食品
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="ypsx" value="重大活动保障食品" >
                                    重大活动保障食品
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"  class="th2">样品类型</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="yplx" value="食品农产品">
                                食品农产品
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="yplx" value="工业加工食品" >
                                    工业加工食品
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class="checkbox checkbox-inline ">
                                    <input type="checkbox" name="yplx" value="餐饮加工食品" >
                                    餐饮加工食品
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="yplx" value="食品添加剂" >
                                    食品添加剂
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox"  name="yplx" value="食品相关产品" >
                                    食品相关产品
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class="checkbox checkbox-inline">
                                    <input type="checkbox" name="yplx" value="其他"  >
                                    其他
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"  class="th2">样品名称</td>
                        <td colspan="3"><input type="text" class="input2" name="ypmc"></td>
                        <td  class="th2">商标</td>
                        <td colspan="3" class="text-left"><input type="text" class="input2" name="sb" ></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_box marb10" >
                    <div class="pull-left ">
                        <button class="form_btn  width140 title_font" type="submit">保 存</button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


<script>
    $(function(){
        $('#sam1_date_calender1').datetimepicker({
            container:'#sam1_date_calenderOneBox1',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam1_date_calender2').datetimepicker({
            container:'#sam1_date_calenderOneBox2',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        var ochoose_book1=document.getElementById('choose_book_sam1');
        var oChoose_box=document.getElementById('choose_box_sam1');
        selBook();

        $.ajax({
            url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
            type:"post",
            data: {
                type:1
            },
            dataType: 'json',
            success: function(result){
                if(result==null){
                    alertEase("初始化企业类型失败！",2);
                }else{
                    $("#businessCategorySam1").html("");
                    $.each(result, function (i, item) {
                        if (item == null) {
                            return;
                        }
                        if($("#entType_sam1").val()==item["tDictionaryCode"]){

                            $("<option></option>")
                                .val(item["tDictionaryCode"])
                                .text(item["tDictionaryName"])
                                .appendTo($("#businessCategorySam1"));
                        }
                    });
                }
            }
        });

        ochoose_book1.onchange=selBook;

        function selBook() {
            var sBookValue=ochoose_book1.value;
//            if(sBookValue=="choose_box2_sam1"){
//                $("#sp_cy1")[0].reset();
//            }else {
//                $("#sp_cy1bg1")[0].reset();
//            }
            for(var i=0; i<oChoose_box.children.length;i++){
                oChoose_box.children[i].style.display='none';
            }
            $('#'+sBookValue).css({display:'block'});
        };

        var title=$("#title_cy_sam1").html();
        var title2=$("#title_bg_sam1").html();
        var checkDate=$("#checkDate_sam1").val();
        var batch=$("#batch_sam1").val();
        if(checkDate==undefined|| checkDate.length==0){
            return;
        }
        if(batch==undefined|| batch.length==0){
            return;
        }
        $("#title_cy_sam1").html(title+checkDate+" 批次:"+batch);
        $("#title_bg_sam1").html(title2+checkDate+" 批次:"+batch);

    });
    function saveCy1bgSam1(url){

        var jyjl=$("input[name='jyjl']:checked").val();

        if(url==undefined){
            url='';
        }
        var checkDate=$("#checkDate_sam1").val();
        var taskId=$("#taskId_sam1").val();
        var data={
            url:url,
            businessCategory:$("#businessCategorySam1").val(),
            businessCategoryName:$("#businessCategorySam1").find("option:selected").text(),
            samplingUnit:$("#bg_bcjdwmc_sam1").val(),
            samplingType:"1",
            formType:"2",
            taskId:taskId,
            checkDateStr:checkDate,
            samplingForm:JSON.stringify($("#sp_cy1bg1").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackBgSam1});

        function callBackBgSam1(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/addSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("新增成功",'alert_succ');
                        querySamTaskBasic();
//                        $("li.active span:first").click();
                    }else{
                        alertEase("新增失败! "+data.msg,'alert_err');
                    }
                }
            });
        }

    }

    function saveCy1(){

        var checkDate=$("#checkDate_sam1").val();
        var taskId=$("#taskId_sam1").val();
        var data={
            area:$("#cy_xzqy_sam1").val(),
            supervisory:$("#cy_jgdw_sam1").val(),
            businessCategory:$("#businessCategorySam1").val(),
            businessCategoryName:$("#businessCategorySam1").find("option:selected").text(),
            samplingUnit:$("#cy_bcjdwmc_sam1").val(),
            samplingType:"1",
            formType:"1",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#sp_cy1").serializeJson())
        };

        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackCySam1});
        function callBackCySam1(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/addSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("新增成功",'alert_succ');
                        querySamTaskBasic();

//                        $("li.active span:first").click();
                    }else{
                        alertEase("新增失败! "+data.msg,'alert_err');
                    }
                }
            });
        }
    }
    function saveFjSam1() {
        
        var formData = new FormData();
        var num = ZYFILE.uploadFile.length;
        for(var i=0;i<num;i++){
            formData.append('fileselect',ZYFILE.uploadFile[i]);    //将文件转成二进制形式
        }
       
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/supervisionAndCheck/upload.do",
            async:false,
            contentType: false,    //这个一定要写
            processData: false, //这个也一定要写，不然会报错
            data:formData,
            dataType:'text',    //返回类型，有json，text，HTML。
            success : function(data) {
                if(data){
                	saveCy1bgSam1(data)
                }
            },
            error:function(){
                alertEase("保存失败",2);
            }
        });
    }
    initFile1();
    function initFile1(){
     $("#reportFileSample1").html("");
     ZYFILE.uploadFile = [];
     ZYFILE.lastUploadFile = [];
     ZYFILE.perUploadFile = [];
     // 初始化插件
    $("#reportFileSample1").zyUpload({
         width            :   "650px",                 // 宽度
         height           :   "400px",                 // 宽度
         itemWidth        :   "140px",                 // 文件项的宽度
         itemHeight       :   "115px",                 // 文件项的高度
         url              :   "/upload/UploadAction",  // 上传文件的路径
         fileType         :   ["jpg","png","bmp","gif"],// 上传文件的类型
         fileSize         :   51200000,                // 上传文件的大小
         multiple         :   true,                    // 是否可以多个文件上传
         dragDrop         :   false,                   // 是否可以拖动上传文件
         tailor           :   false,                   // 是否可以裁剪图片
         del              :   true,                    // 是否可以删除文件
         finishDel        :   false,                   // 是否在上传文件完成后删除预览
         /* 外部获得的回调接口 */
         onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
             console.info("当前选择了以下文件：");
             console.info(selectFiles);
         },
         onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
             console.info("当前删除了此文件：");
             console.info(file.name);
         },
         onSuccess: function(file, response){          // 文件上传成功的回调方法
             console.info("此文件上传成功：");
             console.info(file.name);
             console.info("此文件上传到服务器地址：");
             console.info(response);
             $("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
         },
         onFailure: function(file, response){          // 文件上传失败的回调方法
             console.info("此文件上传失败：");
             console.info(file.name);
         },
         onComplete: function(response){               // 上传完成的回调方法
             console.info("文件上传完成");
             console.info(response);
         }
     });
 }
</script>