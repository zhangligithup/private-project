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
    <input type="hidden" value="${param.time}" id="checkDate_sam2">
    <input type="hidden" value="${param.batch}" id="batch_sam2">
    <input type="hidden" value="${param.taskId}" id="taskId_sam2">
    <input type="hidden" value="${param.entType}" id="entType_sam2">
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select class="select_style1" disabled id="businessCategorySam2">
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单</th>
            <th class="width220 noborder ">
                <select class="select_style1 marr10" id="choose_book_sam2">
                    <option value ="choose_box1_sam2" selected="selected">抽样检验单</option>
                    <option value ="choose_box2_sam2">检验报告书</option>
                </select>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_sam2">
        <div id="choose_box2_sam2">
            <form id="yp_cybg" onsubmit="return saveFjSam2();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_bg_sam2">药品检验报告</div>
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
                    <td  class="table3_th">规格</td>
                    <td width="361"><input type="text" class="input2" name="gg"></td>
                    <td  class="table3_th">生产日期</td>
                    <td>
                        <div id="sam2_date_calenderOneBox1" style="position:relative">
                            <input id="sam2_date_calender1" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="scrq">--%>
                    </td>

                </tr>
                <tr>
                    <td  class="table3_th">标示生产单位</td>
                    <td width="361"><input type="text" class="input2" name="bsscdw"></td>
                    <td  class="table3_th">有效期至</td>
                    <td><input type="text" class="input2" name="yxqz"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽样单位</td>
                    <td width="361"><input type="text" class="input2" name="bcydw" value="${param.entName}" id="bg_bcjdwmc_sam2"></td>
                    <td  class="table3_th">包装</td>
                    <td><input type="text" class="input2" name="bz"></td>

                </tr>
                <tr>
                    <td  class="table3_th">检验目的</td>
                    <td width="361"><input type="text" class="input2" name="jymd"></td>
                    <td  class="table3_th">样品数量</td>
                    <td><input type="text" class="input2" name="ypsl"></td>

                </tr>
                <tr>
                    <td  class="table3_th">检验项目</td>
                    <td width="361"><input type="text" class="input2" name="ypxm"></td>
                    <td  class="table3_th">抽样日期</td>
                    <td>
                        <div id="sam2_date_calenderOneBox2" style="position:relative">
                            <input id="sam2_date_calender2" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="cyrq">--%>
                    </td>

                </tr>
                <tr>
                    <td  class="table3_th">检验依据</td>
                    <td colspan="3"><input type="text" class="input2" name="jyyj"></td>
                  </tr>
                <tr>
                    <td  class="table3_th">抽样单位</td>
                    <td colspan="3"><input type="text" class="input2" name="cydw"></td>
                  </tr>
                <tr>
                    <td  class="table3_th">检验项目</td>
                    <td colspan="2" class="table3_th">标准规定</td>
                    <td class="table3_th">检验结果</td>

                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist1"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist1"></td>
                    <td><input type="text" class="input2" name="jyjglist1"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist2"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist2"></td>
                    <td><input type="text" class="input2" name="jyjglist2"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist3"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist3"></td>
                    <td><input type="text" class="input2" name="jyjglist3"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist4"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist4"></td>
                    <td><input type="text" class="input2" name="jyjglist4"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist5"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist5"></td>
                    <td><input type="text" class="input2" name="jyjglist5"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist6"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist6"></td>
                    <td><input type="text" class="input2" name="jyjglist6"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist7"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist7"></td>
                    <td><input type="text" class="input2" name="jyjglist7"></td>
                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist8"></td>
                    <td colspan="2"><input type="text" class="input2" name="bzgdlist8"></td>
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
                <tr>
                    <td class="noborder title_font ">上传附件</td>
                    <td>
                        <div id="reportFileSample2" class="zyupload">
                        </div>
                    </td>
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

        <div id="choose_box1_sam2" >
            <form id="yp_cy" onsubmit="return saveCySam2();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_cy_sam2">药品抽样记录及凭证</div>
            </div>
            <table class="table  table2 table-bordered">
                <tbody>
                <tr>
                    <td  class="th2">抽样单位</td>
                    <td colspan="3"><input type="text" class="input2" name="cydw"></td>
                    <td width="12%"  class="th2">抽样单位经手人签名</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwjsrqm"></td>

                </tr>
                <tr>
                  <td  class="th2">抽样编号</td>
                  <td colspan="3"><input type="text" class="input2" name="cybh"></td>
                  <td width="12%"  class="th2">抽样日期</td>
                  <td class="text-left">
                      <div id="sam2_date_calenderOneBox3" style="position:relative">
                          <input id="sam2_date_calender3" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                      </div>
                      <%--<input type="text" class="input2" name="cyrq">--%>
                  </td>
                </tr>
                
                <tr>
                  <td  class="th2">药品名称</td>
                  <td width="15%"><input type="text" class="input2" name="ypmc"></td>
                    <td width="13%" class="th2">生产日期</td>
                    <td width="16%">
                        <div id="sam2_date_calenderOneBox4" style="position:relative">
                            <input id="sam2_date_calender4" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>

                        <%--<input type="text" class="input2" name="scrq">--%>
                    </td>
                    <td  class="th2">效期</td>
                    <td class="text-left"><input type="text" class="input2" name="xq"></td>

                </tr>
                <tr>
                  <td  class="th2">规格</td>
                  <td><input type="text" class="input2" name="gg"></td>
                  <td class="th2">批准文号</td>
                    <td><input type="text" class="input2" name="pzwh"></td>
                    <td colspan="2"  class="th2">&nbsp;</td>
                  </tr>
                <tr>
                    <td  class="th2">生产配置单位或产地</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="scpzdwhcd"></td>
                  </tr>
                <tr>
                  <td  class="th2">被抽样单位/被抽样场所</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="bcydwbcycs"/></td>
                </tr>
                <tr>
                  <td  class="th2">被抽样单位地址</td>
                  <td colspan="5" class="text-left"><input type="text" class="input2" name="bcydwdz"></td>
                </tr>
                <tr>
                  <td  class="th2">邮政编码</td>
                  <td colspan="3" class="text-left"><input type="text" class="input2" name="yzbm"></td>
                  <td>联系电话</td>
                  <td class="text-left"><input type="text" class="input2" name="lxdh"></td>
                  </tr>
                <tr>
                  <td  class="th2">药品种类</td>
                    <td colspan="5" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="ypzl" value="进场原料（包括化工原料、药用原料、辅料、包装材料等）">
                                进场原料（包括化工原料、药用原料、辅料、包装材料等）
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox"  name="ypzl" value="中间体（半成品）">
                                中间体（半成品）
                            </label>
                        </div>
                        <div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="ypzl" value="制剂">
                                制剂
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="ypzl" value="原料药" >
                                原料药
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox"  name="ypzl" value="药材（个子货、饮片）" >
                                药材（个子货、饮片）
                            </label>
                        </div></td>
                  </tr>
                <tr>
                  <td rowspan="4"  class="th2">外包装情况</td>
                  <td colspan="5" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="wbzqk" value="硬纸箱">
                                硬纸箱
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="wbzqk" value="麻袋"  >
                                麻袋
                            </label>
                        </div>
                        <div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="wbzqk" value="木箱">
                            木箱
                        </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="wbzqk" value="纤维桶"  >
                                纤维桶
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="wbzqk" value="蛇皮袋"   >
                                蛇皮袋
                            </label>
                        </div>
                    <div class="myradio radio-inline">
                          <label class="checkbox checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="铁桶"  >
                            铁桶 </label>
                        </div>
                    <div class="myradio radio-inline">
                          <label class="checkbox checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="铝听"  >
                            铝听 </label>
                        </div>
                    <div class="myradio radio-inline">
                          <label class="checkbox checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="牛皮纸袋" >
                            牛皮纸袋 </label>
                        </div>
                        <div class="myradio radio-inline">
                          <label class="checkbox checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="其他"  >
                            其他 </label>
                        </div></td>
                </tr>
                <tr>
                  <td colspan="5" class="text-left">
                  <span class="marr10 pull-left pl20">药品名称、批号、生产厂家、批准文号、商标、生产日期，是否相符</span> 
                  <div class="myradio radio-inline marr10 no_bold">
                            <label class="  no_bold">
                                <input type="radio"  value="是" name="sfxf" checked>是
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="  no_bold">
                                <input type="radio"  value="否" name="sfxf">否
                            </label>
                        </div>
                        </td>
                </tr>
                <tr>
                  <td colspan="5" class="text-left">
                  	 <span class="marr10 pl20">包装有无破损</span> 
                     <div class="myradio radio-inline no_bold">
                            <label class="  no_bold">
                                <input type="radio"  value="有" name="bzywps">
                                有</label></div>
                        <div class="myradio radio-inline">
                            <label class="  no_bold">
                                <input type="radio"  value="无" name="bzywps" checked>
                                无</label></div>
                         <span class="marr10  pl20">有无水迹</span> 
                         <div class="myradio radio-inline no_bold">
                            <label class="  no_bold">
                                <input type="radio"  value="有" name="ywsj">
                                有</label></div>
                        <div class="myradio radio-inline">
                            <label class="  no_bold">
                                <input type="radio"  value="无" name="ywsj" checked>
                                无</label></div>
                         <span class="marr10  pl20">有无霉变</span> 
                         <div class="myradio radio-inline no_bold">
                            <label class="  no_bold">
                                <input type="radio"  value="有" name="ywmb">
                                有</label></div>
                        <div class="myradio radio-inline">
                            <label class="  no_bold">
                                <input type="radio"  value="无" name="ywmb" checked>
                                无
                            </label>
                        </div>
                         <span class="marr10 pl20">有无虫蛀</span> 
                         <div class="myradio radio-inline  no_bold">
                            <label class="  no_bold">
                                <input type="radio"  value="有" name="ywcz">
                                有
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="  no_bold">
                                <input type="radio"  value="无" name="ywcz" checked>
                                无</label>
                        </div>
                         <span class="marr10 pl20">有无污染</span> 
                         <div class="myradio radio-inline   no_bold">
                            <label class="  no_bold">
                                <input type="radio"  value="有" name="ywwr">
                                有</label></div>
                        <div class="myradio radio-inline">
                            <label class="  no_bold">
                                <input type="radio"  value="无" name="ywwr" checked>
                                无
                            </label>
                        </div>
                  </td>
                </tr>
                <tr>
                  <td>其他</td>
                  <td colspan="4" class="text-left"><input type="text" class="input2" name="wbzqkqt"></td>
                  </tr>
                <tr>
                  <td  class="th2">库存是否符合要求</td>
                  <td colspan="3" class="text-left">
                  <div class="myradio radio-inline">
                   <label class="  no_bold">
                      <input type="radio"  value="是" name="kcsffhyq" checked>
                      是</label>                    
                  </div>
                  <div class="myradio radio-inline">
                   <label class="  no_bold">
                      <input type="radio"  value="否" name="kcsffhyq">
                      否</label>                    
                  </div>
                  </td>
                  <td>库存温湿度</td>
                  <td class="text-left"><input type="text" class="input2" name="kcwsd"></td>
                </tr>
                <tr>
                  <td rowspan="3"  class="th2">抽样情况</td>
                  <td colspan="3" class="text-left">样品包装:
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="玻瓶">
                        玻瓶 </label>
                  </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="纸盒">
                        纸盒 </label>
                  </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="塑料袋">
                        塑料袋 </label>
                  </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="铝塑">
                        铝塑 </label>
                  </div></td>
                  <td>其他</td>
                  <td class="text-left"><input type="text" class="input2" name="cyqkqt"></td>
                  </tr>
                <tr>
                  <td colspan="2">抽样数量/生产、配置或购进数量</td>
                  <td colspan="3" class="text-left"><input type="text" class="input2" name="cyslscpzhgjsl"></td>
                  </tr>
                <tr>
                  <td>抽样说明</td>
                  <td colspan="4" class="text-left"><input type="text" class="input2" name="cysm"></td>
                  </tr>
                <tr>
                    <td  class="th2">备注</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="bz"></td>
                  </tr>
                <tr>
                    <td  class="th2">行政区域</td>
                    <td width="13%" class="text-left">
                        <select class="select_style1 marr10 input2" name="xzqy" id="cy_xzqy_sam2">
                            <option value="">请选择</option>
                            <c:forEach items="${addressList}" var="list">
                                <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                            </c:forEach>
                        </select>
                    <td class="th2">监管单位</td>
                    <td width="13%" class="text-left">
                        <select class="select_style1 marr10 input2" name="jgdw" id="cy_jgdw_sam2">
                            <option value="">请选择</option>
                            <c:forEach items="${unitList}" var="list">
                                <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                  <td  class="th2">被抽样单位</td>
                    <td colspan="2" class="text-left"><input type="text" class="input2" name="bcydw"  value="${param.entName}" id="cy_bcjdwmc_sam2"></td>
                    <td colspan="3" class="text-left">以上抽样情况属实，样品已当场签封</td>
                  </tr>
                <tr>
                  <td  class="th2">被抽样单位经手人签名</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="bcydwjsrqm"></td>
                  </tr>
                <tr>
                  <td colspan="6"  class="th2">注：本凭证一式三联，第一联由抽验单位保存，第二联送被抽样单位，第三联随检品送检验单位                  </td>
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

        $('#sam2_date_calender1').datetimepicker({
            container:'#sam2_date_calenderOneBox1',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam2_date_calender2').datetimepicker({
            container:'#sam2_date_calenderOneBox2',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam2_date_calender3').datetimepicker({
            container:'#sam2_date_calenderOneBox3',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam2_date_calender4').datetimepicker({
            container:'#sam2_date_calenderOneBox4',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });

        var oChoose_book=document.getElementById('choose_book_sam2');
        var oChoose_box=document.getElementById('choose_box_sam2');
        selBookSam2();

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
                    $("#businessCategorySam2").html("");
                    $.each(result, function (i, item) {
                        if (item == null) {
                            return;
                        }

                        if($("#entType_sam2").val()==item["tDictionaryCode"]) {
                            $("<option></option>")
                                .val(item["tDictionaryCode"])
                                .text(item["tDictionaryName"])
                                .appendTo($("#businessCategorySam2"));
                        }
                    });
                }
            }
        });

        oChoose_book.onchange=selBookSam2;

        function selBookSam2() {
            var sBookValue=oChoose_book.value;
//            if(sBookValue=="choose_box2_sam2"){
//                $("#yp_cy")[0].reset();
//            }else {
//                $("#yp_cybg")[0].reset();
//            }
            for(var i=0; i<oChoose_box.children.length;i++){
                oChoose_box.children[i].style.display='none';
            }
            $('#'+sBookValue).css({display:'block'});
        };


        var title=$("#title_cy_sam2").html();
        var title2=$("#title_bg_sam2").html();
        var checkDate=$("#checkDate_sam2").val();
        var batch=$("#batch_sam2").val();
        if(checkDate==undefined|| checkDate.length==0){
            return;
        }
        if(batch==undefined|| batch.length==0){
            return;
        }
        $("#title_cy_sam2").html(title+checkDate+" 批次:"+batch);
        $("#title_bg_sam2").html(title2+checkDate+" 批次:"+batch);
    });
    function saveCybg2(url){

        var jyjl=$("input[name='jyjl']:checked").val();
        if(url == undefined){
            url='';
        }

        var checkDate=$("#checkDate_sam2").val();
        var taskId=$("#taskId_sam2").val();

        var data={
            url:url,
            businessCategory:$("#businessCategorySam2").val(),
            businessCategoryName:$("#businessCategorySam2").find("option:selected").text(),
            samplingUnit:$("#bg_bcjdwmc_sam2").val(),
            samplingType:"2",
            formType:"2",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#yp_cybg").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackBgSam2});

        function callBackBgSam2(){
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

    function saveCySam2(){

        var checkDate=$("#checkDate_sam2").val();
        var taskId=$("#taskId_sam2").val();
        var data={
            area:$("#cy_xzqy_sam2").val(),
            supervisory:$("#cy_jgdw_sam2").val(),
            businessCategory:$("#businessCategorySam2").val(),
            businessCategoryName:$("#businessCategorySam2").find("option:selected").text(),
            samplingUnit:$("#cy_bcjdwmc_sam2").val(),
            samplingType:"2",
            formType:"1",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#yp_cy").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackCySam2});
        function callBackCySam2(){
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

    function saveFjSam2() {
        
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
                	saveCybg2(data);
                }
            },
            error:function(){
                alertEase("保存失败",2);
            }
        });
    }
    initFile2();
    function initFile2(){
    $("#reportFileSample2").html("");
    ZYFILE.uploadFile = [];
    ZYFILE.lastUploadFile = [];
    ZYFILE.perUploadFile = [];
        // 初始化插件
    $("#reportFileSample2").zyUpload({
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
    ZYFILE.uploadFile = [];
    ZYFILE.lastUploadFile = [];
    ZYFILE.perUploadFile = [];
 }
</script>