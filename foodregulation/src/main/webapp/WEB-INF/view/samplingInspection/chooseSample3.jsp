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
    <input type="hidden" value="${param.time}" id="checkDate_sam3">
    <input type="hidden" value="${param.batch}" id="batch_sam3">
    <input type="hidden" value="${param.taskId}" id="taskId_sam3">
    <input type="hidden" value="${param.entType}" id="entType_sam3">
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select class="select_style1" disabled id="businessCategorySam3">
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单</th>
            <th class="width220 noborder ">
                <select class="select_style1 marr10" id="choose_book_sam3">
                    <option value ="choose_box1_sam3" selected="selected">抽样检验单</option>
                    <option value ="choose_box2_sam3">检验报告书</option>
                </select>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_sam3">

        <div id="choose_box2_sam3">
            <form id="hzp_cybg" onsubmit="return saveFjSam3();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_bg_sam3">化妆品检验报告</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td width="178"  class="table3_th">样品名称</td>
                    <td width="361" colspan="3"><input type="text" class="input2" name="ypmc"></td>
                    <td width="215"  class="table3_th">产品编号/批号</td>
                    <td width="328" colspan="4"><input type="text" class="input2" name="cpbhph"></td>

                </tr>
                <tr>
                    <td  class="table3_th">规格</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="gg"></td>
                    <td  class="table3_th">生产日期</td>
                    <td colspan="2">
                        <div id="sam3_date_calenderOneBox1" style="position:relative">
                            <input id="sam3_date_calender1" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="scrq">--%>
                    </td>

                </tr>
                <tr>
                    <td  class="table3_th">生产单位</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="scdw"></td>
                    <td  class="table3_th">有效期至</td>
                    <td colspan="2"><input type="text" class="input2" name="yxqz"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽样单位</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="bcydw"  value="${param.entName}" id="bg_bcjdwmc_sam3"></td>
                    <td  class="table3_th">包装</td>
                    <td colspan="2"><input type="text" class="input2" name="bz"></td>

                </tr>
                <tr>
                    <td  class="table3_th">检验目的</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="jymd"></td>
                    <td  class="table3_th">样品数量</td>
                    <td colspan="2"><input type="text" class="input2" name="ypsl"></td>

                </tr>
                <tr>
                    <td  class="table3_th">检验项目</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="jyxm"></td>
                    <td  class="table3_th">抽样日期</td>
                    <td colspan="2">
                        <div id="sam3_date_calenderOneBox2" style="position:relative">
                            <input id="sam3_date_calender2" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="cyrq">--%>
                    </td>

                </tr>
                <tr>
                    <td  class="table3_th">检验依据</td>
                    <td colspan="5"><input type="text" class="input2" name="jyyj"></td>
                  </tr>
                <tr>
                    <td  class="table3_th">抽样单位</td>
                    <td colspan="5"><input type="text" class="input2" name="cydw"></td>
                  </tr>
                <tr>
                  <td  class="table3_th">检验项目</td>
                    <td class="table3_th">单位</td>
                    <td class="table3_th">检验结果</td>
                    <td class="table3_th">检验方法</td>
                    <td class="table3_th">检出值</td>
                    <td class="table3_th">限值</td>

                </tr>
                <tr>
                    <td><input type="text" class="input2" name="jyxmlist1"></td>
                    <td><input type="text" class="input2" name="dwlist1"></td>
                    <td><input type="text" class="input2" name="jyjglist1"></td>
                    <td><input type="text" class="input2" name="jyfflist1"></td>
                    <td><input type="text" class="input2" name="jczlist1"></td>
                    <td><input type="text" class="input2" name="xzlist1"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist2"></td>
                    <td><input type="text" class="input2" name="dwlist2"></td>
                    <td><input type="text" class="input2" name="jyjglist2"></td>
                    <td><input type="text" class="input2" name="jyfflist2"></td>
                    <td><input type="text" class="input2" name="jczlist2"></td>
                    <td><input type="text" class="input2" name="xzlist2"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist3"></td>
                    <td><input type="text" class="input2" name="dwlist3"></td>
                    <td><input type="text" class="input2" name="jyjglist3"></td>
                    <td><input type="text" class="input2" name="jyfflist3"></td>
                    <td><input type="text" class="input2" name="jczlist3"></td>
                    <td><input type="text" class="input2" name="xzlist3"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist4"></td>
                    <td><input type="text" class="input2" name="dwlist4"></td>
                    <td><input type="text" class="input2" name="jyjglist4"></td>
                    <td><input type="text" class="input2" name="jyfflist4"></td>
                    <td><input type="text" class="input2" name="jczlist4"></td>
                    <td><input type="text" class="input2" name="xzlist4"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist5"></td>
                    <td><input type="text" class="input2" name="dwlist5"></td>
                    <td><input type="text" class="input2" name="jyjglist5"></td>
                    <td><input type="text" class="input2" name="jyfflist5"></td>
                    <td><input type="text" class="input2" name="jczlist5"></td>
                    <td><input type="text" class="input2" name="xzlist5"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist6"></td>
                    <td><input type="text" class="input2" name="dwlist6"></td>
                    <td><input type="text" class="input2" name="jyjglist6"></td>
                    <td><input type="text" class="input2" name="jyfflist6"></td>
                    <td><input type="text" class="input2" name="jczlist6"></td>
                    <td><input type="text" class="input2" name="xzlist6"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist7"></td>
                    <td><input type="text" class="input2" name="dwlist7"></td>
                    <td><input type="text" class="input2" name="jyjglist7"></td>
                    <td><input type="text" class="input2" name="jyfflist7"></td>
                    <td><input type="text" class="input2" name="jczlist7"></td>
                    <td><input type="text" class="input2" name="xzlist7"></td>
                </tr>
                                 <tr>
                    <td><input type="text" class="input2" name="jyxmlist8"></td>
                    <td><input type="text" class="input2" name="dwlist8"></td>
                    <td><input type="text" class="input2" name="jyjglist8"></td>
                    <td><input type="text" class="input2" name="jyfflist8"></td>
                    <td><input type="text" class="input2" name="jczlist8"></td>
                    <td><input type="text" class="input2" name="xzlist8"></td>
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
                        <div id="reportFileSample3" class="zyupload">
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
        <div id="choose_box1_sam3" >
            <form id="hzp_cy" onsubmit="return saveCySam3();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_cy_sam3">化妆品监督抽检抽样单</div>
            </div>
                           <table class="table  table2 table-bordered">
                    <tbody>
                   <tr>
                  <td  class="th2" colspan="2">任务来源</td>
                  <td colspan="5" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="rwly" value="国家监督抽验">
                      国家监督抽验 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="rwly" value="日常监督抽验" >
                          日常监督抽验 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="rwly" value="专项监督抽验" >
                          专项监督抽验 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="rwly" value="有因抽验"   >
                        有因抽验 </label>
                  </div></td>
                </tr>
                    <tr>
                  <td width="6%" rowspan="5"  class="th2">被抽样单位信息</td>
                  <td width="5%"  class="th2">单位名称</td>
                  <td colspan="5"><input type="text" class="input2" name="bcydwmc"  value="${param.entName}" id="cy_bcjdwmc_sma3"></td>
                </tr>
                <tr>
                  <td  class="th2">单位地址</td>
                  <td  width="70" colspan="5"><input type="text" class="input2" name="bcydwdz"></td>
                </tr>
                <tr>
                  <td  class="th2">法定代表人</td>
                  <td width="15%"><input type="text" class="input2" name="bcyfddbr"></td>
                  <td width="15%" class="th2">联系人</td>
                  <td ><input type="text" class="input2" name="bcylxr"></td>
                  <td width="15%"  class="th2">营业执照号</td>
                  <td   ><input type="text" class="input2" name="bcyyyzzh"></td>
                </tr>
                   <tr>
                        <td  class="th2">电话</td>
                        <td width="15%"><input type="text" class="input2" name="bcydh"></td>
                        <td width="13%" class="th2">传真</td>
                        <td width="16%"><input type="text" class="input2" name="bcycz"></td>
                        <td  class="th2">邮编</td>
                        <td  class="text-left"><input type="text" class="input2" name="bcyyb"></td>

                    </tr>
                   <tr>
                       <td  class="th2">行政区域</td>
                       <td width="13%" class="text-left">
                           <select class="select_style1 marr10 input2" name="xzqy" id="cy_xzqy_sam3">
                               <option value="">请选择</option>
                               <c:forEach items="${addressList}" var="list">
                                   <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                               </c:forEach>
                           </select>
                       </td>
                       <td class="th2">监管单位</td>
                       <td width="13%" class="text-left">
                           <select class="select_style1 marr10 input2" name="jgdw" id="cy_jgdw_sam3">
                               <option value="">请选择</option>
                               <c:forEach items="${unitList}" var="list">
                                   <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                               </c:forEach>
                           </select>
                       </td>
                   </tr>
                    <tr>
                  <td width="6%" rowspan="2"  class="th2">抽样地点</td>
                  <td  class="th2">生产环节</td>
                  <td colspan="5"  class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="schj" value="成品库">
                      成品库 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="schj" value="其他"  >
                        其他 </label>
                    </div>
                    </td>
                </tr>
                <tr>
                  <td  class="th2">经营环节</td>
                  <td colspan="5"  class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="jyhj" value="批发市场">
                      批发市场 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="jyhj" value="小商店"  >
                        小商店 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                          <input type="checkbox" name="jyhj" value="商场" >
                        商场 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="超市" >
                        超市 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="专卖店" >
                        专卖店 </label>
                    </div>
                     <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="药店" >
                        药店 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="jyhj" value="网购" >
                        网购 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="jyhj" value="美容美发场所"  >
                        美容美发场所 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="其他" >
                        其他 </label>
                    </div>
                    </td>
                </tr>
                <tr>
                  <td width="6%" rowspan="7"  class="th2">样品信息</td>
                  <td width="5%"  rowspan="2" class="th2">样品类别</td>
                    <td width="5%"  class="th2">非特殊用途类</td>
                    <td colspan="4"  class="text-left">
                    <div class="myradio checkbox-inline marr10">
                        <label class="checkbox checkbox-inline ">
                            <input type="checkbox" name="yplbftsl" value="发用类">
                            发用类 </label>
                    </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="yplbftsl" value="护肤类"  >
                                护肤类 </label>
                        </div>
                        <div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="yplbftsl" value="美容修饰类" >
                                美容修饰类 </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox"  name="yplbftsl" value="其他" >
                                其他 </label>
                        </div>
                    </td>
                </tr>
                <tr>
                  <td  class="th2">特殊用途类</td>
                  <td colspan="4" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class="checkbox checkbox-inline ">
                      <input type="checkbox" name="yplbtsl" value="育发" >
                        育发 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="染发"   >
                          染发 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox"  name="yplbtsl" value="烫发" >
                          烫发 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="脱毛" >
                          脱毛 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="美乳" >
                          美乳 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class="checkbox checkbox-inline ">
                        <input type="checkbox" name="yplbtsl" value="健美">
                          健美 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox" name="yplbtsl" value="除臭"  >
                          除臭</label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="祛斑" >
                          祛斑 </label>
                    </div>
                      <div class="myradio radio-inline">
                      <label class="checkbox checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="防晒" >
                          防晒 </label>
                    </div>
                  </td>
                </tr>
                <tr>
                    <td width="13%" class="th2">样品名称</td>
                    <td width="25%" colspan="1"><input type="text" class="input2" name="yomc"></td>
                    <td width="13%" class="th2">样品批号</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="ypph"></td>
                </tr>
                 <tr>
                    <td width="13%" class="th2">生产日期</td>
                    <td width="25%" colspan="1">
                        <div id="sam3_date_calenderOneBox3" style="position:relative">
                            <input id="sam3_date_calender3" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="scrq">--%>
                    </td>
                    <td width="13%" class="th2">限期使用日期/保质期</td>
                    <td width="26%" colspan="3">
                        <div id="sam3_date_calenderOneBox4" style="position:relative">
                            <input id="sam3_date_calender4" class="input2 bg_calender" size="16" type="text" name="xqsyrqbzq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="xqsyrqbzq">--%>
                    </td>
                </tr>
                <tr>
                    <td width="13%" class="th2">生产许可证明文件号</td>
                    <td width="25%" colspan="1"><input type="text" class="input2" name="scxkzmwjh"></td>
                    <td width="13%" class="th2">批准文号/备案号</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="pzwhbah"></td>
                </tr>
                <tr>
                    <td width="13%" class="th2">包装分类</td>
                    <td width="25%" colspan="5" class="text-left">
                        <div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="bzfl" value="散装">
                                散装 </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="bzfl" value="护肤类"  >
                                预包装 </label>
                        </div>
                    </td>
                </tr>
                 <tr>
                    <td width="13%" class="th2">抽样数量</td>
                    <td width="25%"><input type="text" class="input2" name="cysl"></td>
                    <td width="13%" class="th2">生产/进货数量</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="scjhsl"></td>
                </tr>
                 <tr>
                    <td width="6%" rowspan="2"  class="th2">(标称)生产者信息</td>
                    <td width="5%"  class="th2">生产企业/代理商名称</td>
                    <td colspan="5"><input type="text" class="input2" name="bcsczxxscqydlsmc"></td>
                </tr>
                 <tr>
                    <td  class="th2">生产企业/代理商地址</td>
                    <td ><input type="text" class="input2" name="bcsczxxscqydlsdz"></td>
                    <td  class="th2">联系电话</td>
                    <td colspan="3" ><input  type="text" class="input2" name="bcsczxxlxdh"></td>
                </tr>
                <tr>
                    <td width="6%" rowspan="3"  class="th2">抽样单位信息</td>
                    <td width="13%" class="th2">单位名称</td>
                    <td width="25%"><input type="text" class="input2" name="cydwxxdwmc"></td>
                    <td width="13%" class="th2">地址</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="cydwxxdz"></td>
                </tr>
                <tr>
                    <td  class="th2">联系人</td>
                    <td><input type="text" class="input2" name="cydwxxlxr"></td>
                    <td class="th2">电话</td>
                    <td colspan="3"><input type="text" class="input2" name="cydwxxdh"></td>
                    
                </tr>
                  
                <tr>
                	<td  class="th2">传真</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="cydwxxcz"></td>
                    <td width="7%" class="th2" >邮编</td>
                    <td colspan="3" width="13%" class="text-left"><input type="text" class="input2" name="cydwxxyb"></td>
                </tr>
                  <tr>
                  <td class="th2">备注</td>
                  <td colspan="6"><input type="text" class="input2" name="bz"></td>
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
        $('#sam3_date_calender1').datetimepicker({
            container:'#sam3_date_calenderOneBox1',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam3_date_calender2').datetimepicker({
            container:'#sam3_date_calenderOneBox2',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam3_date_calender3').datetimepicker({
            container:'#sam3_date_calenderOneBox3',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam3_date_calender4').datetimepicker({
            container:'#sam3_date_calenderOneBox4',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });

        var oChoose_book=document.getElementById('choose_book_sam3');
        var oChoose_box=document.getElementById('choose_box_sam3');
        selBookSam3();

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
                    $("#businessCategorySam3").html("");
                    $.each(result, function (i, item) {
                        if (item == null) {
                            return;
                        }

                        if($("#entType_sam3").val()==item["tDictionaryCode"]) {
                            $("<option></option>")
                                .val(item["tDictionaryCode"])
                                .text(item["tDictionaryName"])
                                .appendTo($("#businessCategorySam3"));
                        }
                    });
                }
            }
        });

        oChoose_book.onchange=selBookSam3;

        function selBookSam3() {
            var sBookValue=oChoose_book.value;
//            if(sBookValue=="choose_box2_sam3"){
//                $("#hzp_cy")[0].reset();
//            }else {
//                $("#hzp_cybg")[0].reset();
//            }
            for(var i=0; i<oChoose_box.children.length;i++){
                oChoose_box.children[i].style.display='none';
            }
            $('#'+sBookValue).css({display:'block'});
        };

        var title=$("#title_cy_sam3").html();
        var title2=$("#title_bg_sam3").html();
        var checkDate=$("#checkDate_sam3").val();
        var batch=$("#batch_sam3").val();
        if(checkDate==undefined|| checkDate.length==0){
            return;
        }
        if(batch==undefined|| batch.length==0){
            return;
        }
        $("#title_cy_sam3").html(title+checkDate+" 批次:"+batch);
        $("#title_bg_sam3").html(title2+checkDate+" 批次:"+batch);

    });
    function saveCybgSam3(url){

        var jyjl=$("input[name='jyjl']:checked").val();
        if(url == undefined){
            url='';
        }

        var checkDate=$("#checkDate_sam3").val();
        var taskId=$("#taskId_sam3").val();

        var data={
            url:url,
            businessCategory:$("#businessCategorySam3").val(),
            businessCategoryName:$("#businessCategorySam3").find("option:selected").text(),
            samplingUnit:$("#bg_bcjdwmc_sam3").val(),
            samplingType:"3",
            formType:"2",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#hzp_cybg").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackBgSam3});

        function callBackBgSam3(){
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

    function saveCySam3(){
        var checkDate=$("#checkDate_sam3").val();
        var taskId=$("#taskId_sam3").val();
        var data={
            area:$("#cy_xzqy_sam3").val(),
            supervisory:$("#cy_jgdw_sam3").val(),
            businessCategory:$("#businessCategorySam3").val(),
            businessCategoryName:$("#businessCategorySam3").find("option:selected").text(),
            samplingUnit:$("#cy_bcjdwmc_sma3").val(),
            samplingType:"3",
            formType:"1",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#hzp_cy").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackCy});
        function callBackCy(){
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
    function saveFjSam3() {
        
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
                	saveCybgSam3(data);
                }
            },
            error:function(){
                alertEase("保存失败",2);
            }
        });
    }
    initFile3();
    function initFile3(){
    	$("#reportFileSample3").html("");
    	ZYFILE.uploadFile = [];
        ZYFILE.lastUploadFile = [];
        ZYFILE.perUploadFile = [];
        // 初始化插件
     $("#reportFileSample3").zyUpload({
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