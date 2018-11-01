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
                    <select id="businessCategorySeesam1${param.id}" disabled class="select_style1">
                    </select>
            </th>
            <th class="width220 noborder text-right">抽样检验表单：</th>
            <th class="width220 noborder ">
                <input id="form_type_see_samp1" class="select_style1 marr10" readonly="true" value="${param.formType == '1'?'抽样检验单':'检验报告书'}"/>

            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_see_sam1${param.id}">
        <div id="choose_box2_see_sam1${param.id}">
            <form id="sp_cy_bg_see_sam1${param.id}" onsubmit="return  updateCy1Sam();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">食品检验报告书</div>
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
                    <td width="35%"><input type="text" class="input2" name="bcjdw" id="bg_bcjdwmc_seesam1${param.id}"></td>
                    <td  class="table3_th">联系电话</td>
                    <td><input type="text" class="input2" name="bcjdwdh"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样日期</td>
                    <td width="35%"><input type="text" class="input2" name="cyrq"></td>
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
                    <td width="35%"><input type="text" class="input2" name="ypsdrq"></td>
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
                </thead>
            </table>
                <div class="marb10" height="360" width="360" id="sam1Url${param.id}">

                </div>
                <%--<div class="btn_box marb10" >--%>
                    <%--<div class="pull-left ">--%>
                        <%--<button class="form_btn  width140 title_font" type="submit">保 存</button>--%>
                    <%--</div>--%>

                <%--</div>--%>
            </form>
        </div>

        <div id="choose_box1_see_sam1${param.id}" >
            <form id="sp_cy_see_sam1${param.id}" onsubmit="return updateCy1Bd()" action="javascript:void(0)">
                <div class="titledivone marb3">
                    <div class="title_txt">食品安全抽样检验抽样单</div>
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
                        <td colspan="3"><input type="text" class="input2" name="dwmc"></td>
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
                        <td  class="th2">行政区域</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="sp_cy_xzqy_sam1${param.id}"></td>
                        <td class="th2">监管单位</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="sp_cy_jgdw_sam1${param.id}"></td>
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
            $('#choose_box1_see_sam1${param.id}').css({display:'none'});
            $('#choose_box2_see_sam1${param.id}').css({display:'block'});
        }else {
            $('#choose_box1_see_sam1${param.id}').css({display:'block'});
            $('#choose_box2_see_sam1${param.id}').css({display:'none'});
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
                    $("#sp_cy_bg_see_sam1${param.id}").setForm($.parseJSON(data.samplingForm));
                    var imgUrls = data.url.split(",");
                    var imgA="";
                    for(var j=0;j<imgUrls.length;j++) {
                        if(imgUrls[j]){
                              imgA+="<div style='display:inline;width:200px;height:200px' class='col-md-1'><img style='display:block;width:140px;height:140px' src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"'></div>";
                        }
                    }
                    $("#sam1Url${param.id}").html(imgA);
                    $("#sp_cy_bg_see_sam1${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#sp_cy_see_sam1${param.id}").setForm($.parseJSON(data.samplingForm))
                    $("#sp_cy_see_sam1${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }
                $("#businessCategorySeesam1${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesam1${param.id}"));


            }
        });



    });




    function updateCy1Sam(){

        var jyjl=$("input[name='jyjl']:checked").val();

        var data={
            id:${param.id},
            businessCategory:$("#businessCategorySeesam1${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam1${param.id}").find("option:selected").text(),
            samplingUnit:$("#bg_bcjdwmc_seesam1${param.id}").val(),
            samplingType:"1",
            formType:"2",
            samplingForm:JSON.stringify($("#sp_cy_bg_see_sam1${param.id}").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackBgSeeSam1});

        function callBackBgSeeSam1(){
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

    function updateCy1Bd(){

        var data={
            id:${param.id},
            area:$("#sp_cy_xzqy_sam1${param.id}").val(),
            supervisory:$("#sp_cy_jgdw_sam1${param.id}").val(),
            businessCategory:$("#businessCategorySeesam1${param.id}").val(),
            businessCategoryName:$("#businessCategorySeesam1${param.id}").find("option:selected").text(),
            samplingUnit:$("input[name='dwmc']").val(),
            samplingType:"1",
            formType:"1",
            samplingForm:JSON.stringify($("#sp_cy_see_sam1${param.id}").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackCySeeSam1});
        function callBackCySeeSam1(){
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