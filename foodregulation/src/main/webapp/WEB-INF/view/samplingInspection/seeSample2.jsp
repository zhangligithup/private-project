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
                <select id="businessCategorySeesam2${param.id}" disabled class="select_style1">
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
    <div id="choose_box_see_sam2${param.id}">
        <div id="jybg_div_sam2${param.id}">
            <form id="yp_cy_bg_see_sam2${param.id}" onsubmit="updateCybg2()" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">药品检验报告</div>
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
                    <td><input type="text" class="input2" name="scrq"></td>

                </tr>
                <tr>
                    <td  class="table3_th">标示生产单位</td>
                    <td width="361"><input type="text" class="input2" name="bsscdw"></td>
                    <td  class="table3_th">有效期至</td>
                    <td><input type="text" class="input2" name="yxqz"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽样单位</td>
                    <td width="361"><input type="text" class="input2" name="bcydw" id="bg_bcjdwmc_seesam2${param.id}" ></td>
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
                    <td><input type="text" class="input2" name="cyrq"></td>

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
                </tbody>
            </table>
                <div class="marb10" height="360" width="360" id="sam2Url${param.id}">

                </div>
                <%--<div class="btn_box marb10" >--%>
                    <%--<div class="pull-left ">--%>
                        <%--<button class="form_btn  width140 title_font" type="submit">保 存</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </form>
        </div>

        <div id="cyjyd_div_sam2${param.id}" >
            <form id="yp_cy_see_sam2${param.id}" onsubmit="updateCySam2()" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">药品抽样记录及凭证</div>
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
                  <td class="text-left"><input type="text" class="input2" name="cyrq"></td>
                </tr>
                
                <tr>
                  <td  class="th2">药品名称</td>
                  <td width="15%"><input type="text" class="input2" name="ypmc"></td>
                    <td width="13%" class="th2">生产日期</td>
                    <td width="16%"><input type="text" class="input2" name="scrq"></td>
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
                    <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="yp_cy_xzqy_sam2${param.id}"></td>
                    <td class="th2">监管单位</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="yp_cy_jgdw_sam2${param.id}"></td>
                </tr>
                <tr>
                  <td  class="th2">被抽样单位</td>
                    <td colspan="2" class="text-left"><input type="text" class="input2" name="bcydw" id="cy_bcjdwmc_seesam2${param.id}"></td>
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
                <%--<div class="btn_box marb10" >--%>
                    <%--<div class="pull-left ">--%>
                        <%--<button class="form_btn  width140 title_font" type="submit">保 存</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </form>

        </div>
    </div>
</div>

<script>
    $(function(){
        var samId=${param.id};
        var type= ${param.formType};
        if(type=="2") {
            $('#cyjyd_div_sam2${param.id}').css({display:'none'});
            $('#jybg_div_sam2${param.id}').css({display:'block'});
        }else {
            $('#cyjyd_div_sam2${param.id}').css({display:'block'});
            $('#jybg_div_sam2${param.id}').css({display:'none'});
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
                    $("#yp_cy_bg_see_sam2${param.id}").setForm($.parseJSON(data.samplingForm));
                    var imgUrls = data.url.split(",");
                    var imgA="";
                    for(var j=0;j<imgUrls.length;j++) {
                        if(imgUrls[j]){
                              imgA+="<div style='display:inline;width:200px;height:200px' class='col-md-1'><img style='display:block;width:140px;height:140px' src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"'></div>";
                        }
                    }
                    $("#sam2Url${param.id}").html(imgA);
                    $("#yp_cy_bg_see_sam2${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#yp_cy_see_sam2${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#yp_cy_bg_see_sam2${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }
                $("#businessCategorySeesam2${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesam2${param.id}"));

            }
        });


    });

    function updateCybg2(){

        var jyjl=$("input[name='jyjl']:checked").val();

        var data={
            id:${param.id},
            businessCategory:$("#businessCategorySeesam2${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam2${param.id}").find("option:selected").text(),
            samplingUnit:$("#bg_bcjdwmc_seesam2${param.id}").val(),
            samplingType:"2",
            formType:"2",
            samplingForm:JSON.stringify($("#yp_cy_bg_see_sam2${param.id}").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackBgSeeSam2});

        function callBackBgSeeSam2(){
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

    function updateCySam2(){


        var data={
            id:${param.id},
            area:$("#yp_cy_xzqy_sam2${param.id}").val(),
            supervisory:$("#yp_cy_jgdw_sam2${param.id}").val(),
            businessCategory:$("#businessCategorySeesam2${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam2${param.id}").find("option:selected").text(),
            samplingUnit:$("#cy_bcjdwmc_seesam2${param.id}").val(),
            samplingType:"2",
            formType:"1",
            samplingForm:JSON.stringify($("#yp_cy_see_sam2${param.id}").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackCySeeSam2});
        function callBackCySeeSam2(){
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