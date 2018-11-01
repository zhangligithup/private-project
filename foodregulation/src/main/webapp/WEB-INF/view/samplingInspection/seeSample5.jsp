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
                <select id="businessCategorySeesam5${param.id}" disabled class="select_style1">
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单：</th>
            <th class="width220 noborder ">
                <input class="select_style1 marr10" readonly="true" value="${param.formType == '1'?'抽样检验单':'检验报告书'}"/>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_see_sam5${param.id}">
       
        <div id="jybg_div_sam5${param.id}">
            <form id="bjsp_cy_bg_see_sam5${param.id}"  onsubmit="updateCybg5()"  action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">保健食品检验报告</div>
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
                    <td><input type="text" class="input2" name="scrq"></td>

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
                    <td width="361"><input type="text" class="input2" name="bcydw" id="bcydwmc_seesam5${param.id}"></td>
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
                  <td width="361"><input type="text" class="input2" name="cyrq"></td>
                  <td  class="table3_th">收验日期</td>
                  <td><input type="text" class="input2" name="syrq"></td>
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
                </thead>               
            </table>

                <div class="marb10" height="360" width="360" id="sam5Url${param.id}">

                </div>
                <%--<div class="btn_box marb10" >--%>
                    <%--<div class="pull-left ">--%>
                        <%--<button class="form_btn  width140 title_font" type="submit">保 存</button>--%>
                    <%--</div>--%>

                <%--</div>--%>
            </form>
        </div>
        <div id="cyjyd_div_sam5${param.id}" >
            <form id="bjsp_cy_see_sam5${param.id}" onsubmit="updateCySam5()" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">保健食品抽样记录</div>
            </div>
            <table class="table  table2 table-bordered">
                <tbody>
                <tr>
                    <td width="178"   class="th2">样品名称</td>
                    <td width="361"><input type="text" class="input2" name="ypmc"></td>
                    <td width="215"  class="th2">抽样日期</td>
                    <td width="328"><input type="text" class="input2" name="cyrq"></td>

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
                    <td width="361"><input type="text" class="input2" name="scrq"></td>
                    <td  class="th2">有（失）效期</td>
                    <td><input type="text" class="input2" name="ysxq"></td>

                </tr>
                <tr>
                  <td  class="th2">批准文号</td>
                  <td width="361"><input type="text" class="input2" name="pzwh"></td>
                  <td  class="th2">国产或进口</td>
                  <td><input type="text" class="input2" name="gchjk1"></td>
                </tr>
                <tr>
                  <td  class="th2">被抽样单位</td>
                  <td width="361"><input type="text" class="input2" name="bcydw" id="cy_bcydw_seesam5${param.id}"></td>
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
                    <td class="text-left"><input type="text" class="input2" name="xzqy" id="bjsp_xzqy_sam5${param.id}"></td>
                    <td class="th2">监管单位</td>
                    <td class="text-left"><input type="text" class="input2" name="jgdw" id="bjsp_jgdw_sam5${param.id}"></td>
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
            $('#cyjyd_div_sam5${param.id}').css({display:'none'});
            $('#jybg_div_sam5${param.id}').css({display:'block'});
        }else {
            $('#jybg_div_sam5${param.id}').css({display:'none'});
            $('#cyjyd_div_sam5${param.id}').css({display:'block'});
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
                    $("#bjsp_cy_bg_see_sam5${param.id}").setForm($.parseJSON(data.samplingForm));
                    var imgUrls = data.url.split(",");
                    var imgA="";
                    for(var j=0;j<imgUrls.length;j++) {
                        if(imgUrls[j]){
                              imgA+="<div style='display:inline;width:200px;height:200px' class='col-md-1'><img style='display:block;width:140px;height:140px' src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"'></div>";
                        }
                    }
                    $("#sam5Url${param.id}").html(imgA);
                    $("#bjsp_cy_bg_see_sam5${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#bjsp_cy_see_sam5${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#bjsp_cy_see_sam5${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });

                }
                $("#businessCategorySeesam5${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesam5${param.id}"));


            }
        });


    });

    function updateCybg5(){

        var jyjl=$("input[name='jyjl']:checked").val();


        var data={
            id:${param.id},
            businessCategory:$("#businessCategorySeesam5${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam5${param.id}").find("option:selected").text(),
            samplingUnit:$("#bcydwmc_seesam5${param.id}").val(),
            samplingType:"5",
            formType:"2",
            samplingForm:JSON.stringify($("#bjsp_cy_bg_see_sam5${param.id}").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackBgSeeSam5});

        function callBackBgSeeSam5(){
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

    function updateCySam5(){

        var data={
            id:${param.id},
            area:$("#bjsp_xzqy_sam5${param.id}").val(),
            supervisory:$("#bjsp_jgdw_sam5${param.id}").val(),
            businessCategory:$("#businessCategorySeesam5${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam5${param.id}").find("option:selected").text(),
            samplingUnit:$("#cy_bcydw_seesam5${param.id}").val(),
            samplingType:"5",
            formType:"1",
            samplingForm:JSON.stringify($("#bjsp_cy_see_sam5${param.id}").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackCySeeSam5});
        function callBackCySeeSam5(){
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