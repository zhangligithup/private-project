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
    <input type="hidden" value="${param.time}" id="checkDate_sam5">
    <input type="hidden" value="${param.batch}" id="batch_sam5">
    <input type="hidden" value="${param.taskId}" id="taskId_sam5">
    <input type="hidden" value="${param.entType}" id="entType_sam5">
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select class="select_style1" disabled id="businessCategorySam5">
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单</th>
            <th class="width220 noborder ">
                <select class="select_style1 marr10" id="choose_book_sam5">
                    <option value ="choose_box1_sam5" selected="selected">抽样检验单</option>
                    <option value ="choose_box2_sam5">检验报告书</option>
                </select>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_sam5">
       
        <div id="choose_box2_sam5">
            <form id="bjsp_cybg" onsubmit="return saveFjSam5();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_bg_sam5">保健食品检验报告</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td width="178"  class="table3_th">样品名称</td>
                    <td width="361"><input type="text" class="input2" name="ypmc"></td>
                    <td width="215"  class="table3_th">产品编号/批号</td>
                    <td width="328"><input type="text" class="input2" name="cpbhph"></td>

                </tr>
                <tr>
                    <td  class="table3_th">标称生产单位</td>
                    <td width="361"><input type="text" class="input2" name="bcscdw"></td>
                    <td  class="table3_th">生产日期</td>
                    <td>
                        <div id="sam5_date_calenderOneBox1" style="position:relative">
                            <input id="sam5_date_calender1" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="scrq">--%>
                    </td>

                </tr>
                <tr>
                    <td  class="table3_th">标称生产单位地址</td>
                    <td width="361"><input type="text" class="input2" name="bcscdwdz"></td>
                    <td  class="table3_th">规格</td>
                    <td><input type="text" class="input2" name="gg"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样单位</td>
                    <td width="361"><input type="text" class="input2" name="cydw"></td>
                    <td  class="table3_th">包装规格</td>
                    <td><input type="text" class="input2" name="bzgg"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽样单位</td>
                    <td width="361"><input type="text" class="input2" name="bcydw" value="${param.entName}"  id="bcydwmc_sam5"></td>
                    <td  class="table3_th">批准文号</td>
                    <td><input type="text" class="input2" name="pzwh"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽样单位地址</td>
                    <td width="361"><input type="text" class="input2" name="bcydwdz"></td>
                    <td  class="table3_th">功能类别</td>
                    <td><input type="text" class="input2" name="gnlb"></td>

                </tr>
                <tr>
                  <td  class="table3_th">抽样单编号</td>
                  <td width="361"><input type="text" class="input2" name="cydbh"></td>
                  <td  class="table3_th">有效期/保质期</td>
                  <td><input type="text" class="input2" name="yxqbzq"></td>
                </tr>
                <tr>
                  <td  class="table3_th">检验类别</td>
                  <td width="361"><input type="text" class="input2" name="jylb"></td>
                  <td  class="table3_th">样品数量</td>
                  <td><input type="text" class="input2" name="ypsl"></td>
                </tr>
                <tr>
                  <td  class="table3_th">抽样日期</td>
                  <td width="361">

                      <div id="sam5_date_calenderOneBox2" style="position:relative">
                          <input id="sam5_date_calender2" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                      </div>
                      <%--<input type="text" class="input2" name="cyrq">--%>
                  </td>
                  <td  class="table3_th">收验日期</td>
                  <td>
                      <div id="sam5_date_calenderOneBox3" style="position:relative">
                          <input id="sam5_date_calender3" class="input2 bg_calender" size="16" type="text" name="syrq" readonly value="">
                      </div>
                      <%--<input type="text" class="input2" name="syrq">--%>
                  </td>
                </tr>
               
                <tr>
                  <td  class="table3_th">检验项目</td>
                    <td colspan="2" class="table3_th">检验标准</td>
                    <td class="table3_th">检验结果</td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist1"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist1"></td>
                    <td><input type="text" class="input2" name="jyjglist1"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist2"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist2"></td>
                    <td><input type="text" class="input2" name="jyjglist2"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist3"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist3"></td>
                    <td><input type="text" class="input2" name="jyjglist3"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist4"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist4"></td>
                    <td><input type="text" class="input2" name="jyjglist4"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist5"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist5"></td>
                    <td><input type="text" class="input2" name="jyjglist5"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist6"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist6"></td>
                    <td><input type="text" class="input2" name="jyjglist6"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist7"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist7"></td>
                    <td><input type="text" class="input2" name="jyjglist7"></td>
                </tr>
                                <tr>
                    <td><input type="text" class="input2" name="jyxmlist8"></td>
                    <td colspan="2"><input type="text" class="input2" name="jybzlist8"></td>
                    <td><input type="text" class="input2" name="jyjglist8"></td>
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
            <table class="table search_box marb10 ">
                <thead>
                <tr >
                    <th class="width70 noborder text-right">批准人</th>
                    <th class="width220 noborder">
                        <input type="text" class="login_input width260" name="pzr">
                    </th>
                    <th class="width100 noborder text-right">审核人</th>
                    <th class="width220 noborder ">
                        <input type="text" class="login_input width260" name="shr">
                    </th>
                  </tr>
                <tr>
                    <th class="noborder title_font ">上传附件</th>
                    <th>
                        <div id="reportFileSample5" class="zyupload">
                        </div>
                    </th>
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
        <div id="choose_box1_sam5" >
            <form id="bjsp_cy" onsubmit="return saveCySam5();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_cy_sam5">保健食品抽样记录</div>
            </div>
            <table class="table  table2 table-bordered">
                <tbody>
                <tr>
                    <td width="178"   class="th2">样品名称</td>
                    <td width="361"><input type="text" class="input2" name="ypmc"></td>
                    <td width="215"  class="th2">抽样日期</td>
                    <td width="328">

                        <div id="sam5_date_calenderOneBox4" style="position:relative">
                            <input id="sam5_date_calender4" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="cyrq">--%>
                    </td>

                </tr>
                <tr>
                    <td  class="th2">产品名称</td>
                    <td width="361"><input type="text" class="input2" name="cpmc"></td>
                    <td  class="th2">商标(牌号)</td>
                    <td><input type="text" class="input2" name="sbph"></td>

                </tr>
                <tr>
                    <td  class="th2">文号持有者</td>
                    <td width="361"><input type="text" class="input2" name="whcyz"></td>
                    <td  class="th2">地址</td>
                    <td><input type="text" class="input2" name="dz"></td>

                </tr>
                <tr>
                    <td  class="th2">剂型</td>
                    <td width="361"><input type="text" class="input2" name="jx"></td>
                    <td  class="th2">规格</td>
                    <td><input type="text" class="input2" name="gg"></td>

                </tr>
                <tr>
                    <td  class="th2">包装规格</td>
                    <td width="361"><input type="text" class="input2" name="bzgg"></td>
                    <td  class="th2">批号</td>
                    <td><input type="text" class="input2" name="ph"></td>

                </tr>
                <tr>
                    <td  class="th2">生产日期</td>
                    <td width="361">
                        <div id="sam5_date_calenderOneBox5" style="position:relative">
                            <input id="sam5_date_calender5" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="scrq">--%>
                    </td>
                    <td  class="th2">有（失）效期</td>
                    <td>
                        <div id="sam5_date_calenderOneBox6" style="position:relative">
                            <input id="sam5_date_calender6" class="input2 bg_calender" size="16" type="text" name="ysxq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="ysxq">--%>
                    </td>

                </tr>
                <tr>
                  <td  class="th2">批准文号</td>
                  <td width="361"><input type="text" class="input2" name="pzwh"></td>
                  <td  class="th2">国产或进口</td>
                  <td><input type="text" class="input2" name="gchjk1"></td>
                </tr>
                <tr>
                  <td  class="th2">被抽样单位</td>
                  <td width="361"><input type="text" class="input2" name="bcydw" value="${param.entName}"  id="cy_bcydw_sam5"></td>
                  <td  class="th2">被抽样单位地址</td>
                  <td><input type="text" class="input2" name="bcydwdz"></td>
                </tr>
                <tr>
                  <td  class="th2">被抽样单位联系人</td>
                  <td width="361"><input type="text" class="input2" name="bcydwlxr"></td>
                  <td  class="th2">联系电话</td>
                  <td><input type="text" class="input2" name="lxdh"></td>
                </tr>
                <tr>
                  <td  class="th2">邮编</td>
                  <td width="361"><input type="text" class="input2" name="yb"></td>
                  <td  class="th2">国产或进口</td>
                  <td><input type="text" class="input2" name="gchjk2"></td>
                </tr>
                <tr>
                    <td  class="th2">行政区域</td>
                    <td class="text-left">
                        <select class="select_style1 marr10 input2" name="xzqy" id="cy_xzqy_sam5">
                            <option value="">请选择</option>
                            <c:forEach items="${addressList}" var="list">
                                <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="th2">监管单位</td>
                    <td class="text-left">
                        <select class="select_style1 marr10 input2" name="jgdw" id="cy_jgdw_sam5">
                            <option value="">请选择</option>
                            <c:forEach items="${unitList}" var="list">
                                <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4"  class="th2">1、功能类别</td>
                  </tr>
                <tr>
                    <td colspan="4">
                  <div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="gnlb" value="增强免疫力功能">
                      增强免疫力功能 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="环节体力疲劳功能"  >
                        环节体力疲劳功能 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="gnlb" value="抗氧化功能" >
                        抗氧化功能 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="增加骨密度功能"  >
                       增加骨密度功能</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="辅助降血脂功能" >
                        辅助降血脂功能 </label>
                    </div>
                     </td>
                  </tr>
                <tr>
                  <td colspan="4" >
                  <div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="gnlb" value="辅助降血糖功能">
                      辅助降血糖功能 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb" value="辅助降血压功能"  >
                        辅助降血压功能 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="gnlb" value="减肥功能" >
                        减肥功能 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="通便功能" >
                       通便功能</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="促消化功能" >
                        促消化功能 </label>
                    </div>
                    </td>
                </tr>
                <tr>
                  <td colspan="4" >
                  <div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="gnlb" value="改善生长发育功能" >
                      改善生长发育功能 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb" value="改善睡眠功能"   >
                        改善睡眠功能 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="gnlb" value="改善营养性贫血功能">
                        改善营养性贫血功能 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb" value="辅助改善记忆功能"  >
                       辅助改善记忆功能</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="其他"  >
                        其他 </label>
                    </div>
                     </td>
                </tr>
                <tr>
                  <td colspan="4"  class="th2">2、外包装情况</td>
                  </tr>
                <tr>
                    <td colspan="4">
                  <div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="wbzqk" value="包装无破损">
                      包装无破损 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="wbzqk" value="无水迹"  >
                        无水迹 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="wbzqk" value="无污染">
                        无污染 </label>
                    </div>
                   </td>
                  </tr>
                <tr>
                  <td colspan="4"  class="th2">3、抽样地点</td>
                  </tr>
                <tr>
                  <td colspan="4">
                  <div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox"  name="cydd" value="生产单位" >
                      生产单位 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="cydd" value="批发"  >
                        批发 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox"  name="cydd" value="零售">
                        零售 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="cydd"  value="仓库" >
                       仓库</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="cydd" value="货架"  >
                        货架 </label>
                    </div>
                     <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="cydd"  value="其他" >
                        其他 </label>
                    </div>
                    </td>
                  </tr>
                <tr>
                  <td colspan="4"  class="th2">4、抽样情况</td>
                  </tr>
                <tr>
                  <td>样品包装</td>
                  <td colspan="3">
                  <div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox"  name="ypbz" value="玻璃瓶">
                      玻璃瓶 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="ypbz" value="纸盒">
                        纸盒 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox"  name="ypbz" value="铝塑">
                        铝塑 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="ypbz" value="塑料袋" >
                       塑料袋</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="ypbz" value="其他">
                        其他 </label>
                    </div>
                     </td>
                  </tr>
                <tr>
                  <td>抽样数量</td>
                  <td colspan="3"><input type="text" class="input2" name="cysl"></td>
                  </tr>
                <tr>
                  <td>单价</td>
                  <td><input type="text" class="input2" name="dj"></td>
                  <td>总价</td>
                  <td><input type="text" class="input2" name="zj"></td>
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

        $('#sam5_date_calender1').datetimepicker({
            container:'#sam5_date_calenderOneBox1',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam5_date_calender2').datetimepicker({
            container:'#sam5_date_calenderOneBox2',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam5_date_calender3').datetimepicker({
            container:'#sam5_date_calenderOneBox3',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam5_date_calender4').datetimepicker({
            container:'#sam5_date_calenderOneBox4',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam5_date_calender5').datetimepicker({
            container:'#sam5_date_calenderOneBox5',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam5_date_calender6').datetimepicker({
            container:'#sam5_date_calenderOneBox6',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });

        var oChoose_book=document.getElementById('choose_book_sam5');
        var oChoose_box=document.getElementById('choose_box_sam5');
        selBookSam5();

        $.ajax({
            url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
            type:"post",
            data: {
                type:1
            },
            dataType: 'json',
            success: function(result){
                if(result==null){
                    alert("初始化企业类型失败！")
                }else{
                    $("#businessCategorySam5").html("");
                    $.each(result, function (i, item) {
                        if (item == null) {
                            return;
                        }
                        if($("#entType_sam5").val()==item["tDictionaryCode"]) {
                            $("<option></option>")
                                .val(item["tDictionaryCode"])
                                .text(item["tDictionaryName"])
                                .appendTo($("#businessCategorySam5"));
                        }
                    });
                }
            }
        });

        oChoose_book.onchange=selBookSam5;

        function selBookSam5() {
            var sBookValue=oChoose_book.value;
//            if(sBookValue=="choose_box2_sam5"){
//                $("#bjsp_cy")[0].reset();
//            }else {
//                $("#bjsp_cybg")[0].reset();
//            }
            for(var i=0; i<oChoose_box.children.length;i++){
                oChoose_box.children[i].style.display='none';
            }
            $('#'+sBookValue).css({display:'block'});
        };


        var title=$("#title_cy_sam5").html();
        var title2=$("#title_bg_sam5").html();
        var checkDate=$("#checkDate_sam5").val();
        var batch=$("#batch_sam5").val();
        if(checkDate==undefined|| checkDate.length==0){
            return;
        }
        if(batch==undefined|| batch.length==0){
            return;
        }
        $("#title_cy_sam5").html(title+checkDate+" 批次:"+batch);
        $("#title_bg_sam5").html(title2+checkDate+" 批次:"+batch);

    });
    function saveCybg5(url){

        var jyjl=$("input[name='jyjl']:checked").val();


        if(url == undefined){
            url='';
        }
        var checkDate=$("#checkDate_sam5").val();
        var taskId=$("#taskId_sam5").val();
        var data={
            url:url,
            businessCategory:$("#businessCategorySam5").val(),
            businessCategoryName:$("#businessCategorySam5").find("option:selected").text(),
            samplingUnit:$("#bcydwmc_sam5").val(),
            samplingType:"5",
            formType:"2",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#bjsp_cybg").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackBgSam5});

        function callBackBgSam5(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/addSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("新增成功",'alert_succ');
                        querySamTaskBasic();
                    }else{
                        alertEase("新增失败! "+data.msg,'alert_err');
                    }
                }
            });
        }

    }

    function saveCySam5(){


        var checkDate=$("#checkDate_sam5").val();
        var taskId=$("#taskId_sam5").val();
        var data={
            area:$("#cy_xzqy_sam5").val(),
            supervisory:$("#cy_jgdw_sam5").val(),
            businessCategory:$("#businessCategorySam5").val(),
            businessCategoryName:$("#businessCategorySam5").find("option:selected").text(),
            samplingUnit:$("#cy_bcydw_sam5").val(),
            samplingType:"5",
            formType:"1",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#bjsp_cy").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackCySam5});
        function callBackCySam5(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/addSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("新增成功",'alert_succ');
                        querySamTaskBasic();
                    }else{
                        alertEase("新增失败! "+data.msg,'alert_err');
                    }
                }
            });
        }
    }

    function saveFjSam5() {
        
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
                	saveCybg5(data);
                }
            },
            error:function(){
                alertEase("保存失败",2);
            }
        });
    }
    initFile5();
    function initFile5(){
     $("#reportFileSample5").html("");
     ZYFILE.uploadFile = [];
     ZYFILE.lastUploadFile = [];
     ZYFILE.perUploadFile = [];
        // 初始化插件
     $("#reportFileSample5").zyUpload({
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