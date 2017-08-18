<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">抽样检查</a></li>
            <li class="active">抽样检查详情</li>
        </ol>
    </div>
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select id="businessCategorySeesam3${param.id}" disabled class="select_style1">
                </select>
            </th>
            <th class="width220 noborder text-right">抽样检验表单：</th>
            <th class="width220 noborder ">
                <input class="select_style1 marr10" readonly="true" value="${param.formType == '1'?'抽样检验单':'检验报告书'}"/>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_see_sam3${param.id}">

        <div id="jybg_div_sam3${param.id}">
            <form id="hzp_cy_bg_see_sam3${param.id}" onsubmit="updateCybgSam3()" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">化妆品检验报告</div>
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
                    <td colspan="2"><input type="text" class="input2" name="scrq"></td>

                </tr>
                <tr>
                    <td  class="table3_th">生产单位</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="scdw"></td>
                    <td  class="table3_th">有效期至</td>
                    <td colspan="2"><input type="text" class="input2" name="yxqz"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽样单位</td>
                    <td width="361" colspan="2"><input type="text" class="input2" name="bcydw" id="bg_bcjdwmc_seesam3${param.id}"></td>
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
                    <td colspan="2"><input type="text" class="input2" name="cyrq"></td>

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
                </tbody>
            </table>
                <div class="marb10" height="360" width="360" id="sam3Url${param.id}">

                </div>
                <div class="btn_box marb10" >
                    <div class="pull-left ">
                        <button class="form_btn  width140 title_font" type="submit">保 存</button>
                    </div>
                </div>
            </form>
        </div>
        <div id="cyjyd_div_sam3${param.id}" >
            <form id="hzp_cy_see_sam3${param.id}" onsubmit="updateCySam3()" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">化妆品监督抽检抽样单</div>
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
                  <td colspan="5"><input type="text" class="input2" name="bcydwmc" id="cy_bcjdwmc_seesma3${param.id}" ></td>
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
                       <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="hzp_xzqy_sam3${param.id}"></td>
                       <td class="th2">监管单位</td>
                       <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="hzp_jgdw_sam3${param.id}"></td>
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
                    <td width="25%" colspan="1"><input type="text" class="input2" name="scrq"></td>
                    <td width="13%" class="th2">限期使用日期/保质期</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="xqsyrqbzq"></td>
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
                    <%--<div class="pull-left ">--%>
                        <%--<button class="form_btn  width140 title_font" type="submit">保 存</button>--%>
                    <%--</div>--%>
                </div>
            </form>
        </div>

    </div>
</div>

<script>
    $(function(){
        var samId=${param.id};
        var type= ${param.formType};
        if(type=="2") {
            $('#cyjyd_div_sam3${param.id}').css({display:'none'});
            $('#jybg_div_sam3${param.id}').css({display:'block'});
        }else {
            $('#cyjyd_div_sam3${param.id}').css({display:'block'});
            $('#jybg_div_sam3${param.id}').css({display:'none'});
        }

        var reqData={
            samplingInspectionId:samId
        };
        $.ajax({
            url:"${pageContext.request.contextPath }/samplingInspection/getSamplingInspectionById.do",
            type:"post",
            dataType:"json",
            data:reqData,
            success : function(data) {

                if(type=="2") {
                    $("#hzp_cy_bg_see_sam3${param.id}").setForm($.parseJSON(data.samplingForm));
                    var imgUrls = data.url.split(",");
                    var imgA="";
                    for(var j=0;j<imgUrls.length;j++) {
                        if(imgUrls[j]){
                              imgA+="<div style='display:inline;width:200px;height:200px' class='col-md-1'><img style='display:block;width:140px;height:140px' src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"'></div>";
                        }
                    }
                    $("#sam3Url${param.id}").html(imgA);
                    $("#hzp_cy_bg_see_sam3${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#hzp_cy_see_sam3${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#hzp_cy_see_sam3${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }
                $("#businessCategorySeesam3${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesam3${param.id}"));

            }
        });


    });


    function updateCybgSam3(){

        var jyjl=$("input[name='jyjl']:checked").val();

        var data={
            id:${param.id},
            businessCategory:$("#businessCategorySeesam3${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam3${param.id}").find("option:selected").text(),
            samplingUnit:$("#bg_bcjdwmc_seesam3${param.id}").val(),
            samplingType:"3",
            formType:"2",
            samplingForm:JSON.stringify($("#hzp_cy_bg_see_sam3${param.id}").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackBgSeeSam3});

        function callBackBgSeeSam3(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/updateSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("保存成功",'alert_succ');
                    }else{
                        alertEase("保存失败! "+data.msg,'alert_err');
                    }
                }
            });
        }

    }

    function updateCySam3(){


        var data={
            id:${param.id},
            area:$("#hzp_xzqy_sam3${param.id}").val(),
            supervisory:$("#hzp_jgdw_sam3${param.id}").val(),
            businessCategory:$("#businessCategorySeesam3${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam3${param.id}").find("option:selected").text(),
            samplingUnit:$("#cy_bcjdwmc_seesma3${param.id}").val(),
            samplingType:"3",
            formType:"1",
            samplingForm:JSON.stringify($("#hzp_cy_see_sam3${param.id}").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackCySeeSam3});
        function callBackCySeeSam3(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/updateSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("保存成功",'alert_succ');
                    }else{
                        alertEase("保存失败! "+data.msg,'alert_err');
                    }
                }
            });
        }
    }
</script>