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
                <select id="businessCategorySeesam4${param.id}" disabled class="select_style1">
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
    <div id="choose_box_see_sam4${param.id}">

        <div id="jybg_div_sam4${param.id}">
            <form id="ylqx_cy_bg_see_sam4${param.id}" onsubmit="updateCybg4()" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">医疗器械检验报告</div>
            </div>
            <table class="table  table3">
                <tbody>
                <tr>
                    <td class="table3_th">报告编号</td>
                    <td >
                        <input type="text" class="input2" name="bgbh">
                    </td>
                </tr>
                <tr>
                    <td  class="table3_th">样品名称</td>
                    <td width="35%"><input type="text" class="input2" name="ypmc"></td>
                    <td rowspan="2"  class="table3_th">样品编号</td>
                    <td rowspan="2"><input type="text" class="input2" name="ypbh"></td>

                </tr>
                <tr>
                    <td  class="table3_th">来样方式</td>
                    <td width="35%"><input type="text" class="input2" name="lyfs"></td>
                </tr>
                <tr>
                    <td  class="table3_th">委托单位</td>
                    <td width="35%"><input type="text" class="input2" name="wtdw"></td>
                    <td  class="table3_th">检验类别</td>
                    <td><input type="text" class="input2" name="jylb"></td>

                </tr>
                <tr>
                    <td  class="table3_th">委托单位地址</td>
                    <td width="35%"><input type="text" class="input2" name="wtdwdz"></td>
                    <td  class="table3_th">产品编号/批号</td>
                    <td><input type="text" class="input2" name="cpbhph"></td>

                </tr>
                <tr>
                    <td  class="table3_th">生产单位</td>
                    <td width="35%"><input type="text" class="input2" name="scdw"></td>
                    <td  class="table3_th">抽样单编号</td>
                    <td><input type="text" class="input2" name="cydbh"></td>

                </tr>
                <tr>
                    <td  class="table3_th">被抽检单位</td>
                    <td width="35%"><input type="text" class="input2" name="bcjdw" id="bcjdw_bg_seesam4${param.id}"></td>
                    <td  class="table3_th">生产日期</td>
                    <td><input type="text" class="input2" name="scrq"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样单位</td>
                    <td width="35%"><input type="text" class="input2" name="cydw"></td>
                    <td  class="table3_th">样品数量</td>
                    <td><input type="text" class="input2" name="ypsl"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样地点</td>
                    <td width="35%"><input type="text" class="input2" name="cydd"></td>
                    <td  class="table3_th">抽样基数</td>
                    <td><input type="text" class="input2" name="cyjs"></td>

                </tr>
                <tr>
                    <td  class="table3_th">抽样日期</td>
                    <td width="35%"><input type="text" class="input2" name="cyrq"></td>
                    <td  class="table3_th">检验地点</td>
                    <td><input type="text" class="input2" name="jydd"></td>

                </tr>
                <tr>
                    <td  class="table3_th">收样日期</td>
                    <td width="35%"><input type="text" class="input2" name="syrq"></td>
                    <td  class="table3_th">检验日期</td>
                    <td><input type="text" class="input2" name="jyrq"></td>

                </tr>
                <tr>
                    <td  class="table3_th verticalTop">检验项目</td>
                    <td  colspan="3">
                        <textarea cols="30" rows="10"  name="jyxm" class="input2 login_textarea"></textarea>
                    </td>


                </tr>
                <tr>
                    <td  class="table3_th verticalTop">检验依据</td>
                    <td  colspan="3">
                        <textarea cols="30" rows="10"  name="jyyj" class="input2 login_textarea "></textarea>
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
                        <input type="text"  name="pzr" class="login_input width260">
                    </th>
                    <th class="width100 noborder text-right">审核人</th>
                    <th class="width220 noborder ">
                        <input type="text"  name="shr" class="login_input width260">
                    </th>
                    <th class="noborder"></th>
                </tr>
                </thead>
            </table>
                <div class="marb10" height="360" width="360" id="sam4Url${param.id}">

                </div>
                <%--<div class="btn_box marb10" >--%>
                    <%--<div class="pull-left ">--%>
                        <%--<button class="form_btn  width140 title_font" type="submit">保 存</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </form>
        </div>

        <div id="cyjyd_div_sam4${param.id}" >
            <form id="ylqx_cy_see_sam4${param.id}"   onsubmit="updateCySam4()"   action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt">医疗器械抽样检验抽样单</div>
            </div>
            <table class="table  table2 table-bordered">
                <tbody>
                <tr>
                    <td width="15%"  class="th2">抽样编号</td>
                    <td colspan="2"><input type="text" class="input2"  name="cybh"></td>
                    <td width="12%"  class="th2">抽样日期</td>
                    <td width="27%" class="text-left"><input type="text" class="input2" name="cyrq"></td>

                </tr>
                <tr>
                    <td rowspan="11"  class="th2">被抽样单位信息</td>
                    <td class="th2">标示产品名称</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_bscpmc"></td>
                </tr>
                <tr>
                    <td class="th2">产品注册证</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_cpzcz"></td>
                </tr>
                <tr>
                    <td class="th2">产品执行标准</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_cpzxbz"></td>
                </tr>
                <tr>
                    <td class="th2">标示生产单位</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_bsscdw"></td>
                </tr>
                <tr>
                    <td class="th2">地址</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_dz"></td>
                </tr>
                <tr>
                    <td class="th2">电话</td>
                    <td width="26%"><input type="text" class="input2" name="bcydwxx_dh"></td>
                    <td class="th2">传真</td>
                    <td><input type="text" class="input2" name="bcydwxx_cz"></td>
                </tr>
                <tr>
                    <td class="th2">规格/型号</td>
                    <td><input type="text" class="input2" name="bcydwxx_ggxh"></td>
                    <td class="th2">生产日期/批号/出厂编号</td>
                    <td><input type="text" class="input2" name="bcydwxx_scrqphccbh"></td>
                </tr>
                <tr>
                    <td class="th2">抽样数量</td>
                    <td><input type="text" class="input2" name="bcydwxx_cysl"></td>
                    <td class="th2">有效期截止日期</td>
                    <td><input type="text" class="input2" name="bcydwxx_yxqjzrq"></td>
                </tr>
                <tr>
                    <td class="th2">生产或购进数量</td>
                    <td ><input type="text" class="input2" name="bcydwxx_schgjsl"></td>
                    <td  class="th2">已售或使用数量</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_yshsysl"></td>

                </tr>
                <tr>
                    <td class="th2">库存数量</td>
                    <td><input type="text" class="input2" name="bcydwxx_kcsl"></td>
                    <td class="th2">商标</td>
                    <td><input type="text" class="input2" name="bcydwxx_sb"></td>
                </tr>
                <tr>
                    <td class="th2">抽样地点</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_cydd"></td>
                </tr>
                <tr>
                    <td rowspan="4"  class="th2">被抽样单位情况</td>
                    <td colspan="2" class="text-left">
                        <div class="myradio checkbox-inline marr10">
                            <label class="checkbox checkbox-inline ">
                                <input type="checkbox" name="bcydwxx_status" value="生产">
                                生产</label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="bcydwxx_status" value="经营">
                                经营</label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class="checkbox checkbox-inline">
                                <input type="checkbox" name="bcydwxx_status" value="使用">
                                使用</label>
                        </div>
                    </td>
                    <td class="th2">许可证号</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_xkzh"></td>
                </tr>
                <tr>
                    <td class="th2" >单位名称</td>
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="bcydwxx_dwmc" id="bcydwxx_dwmc_seesam4${param.id}"></td>
                </tr>
                <tr>
                    <td class="th2">法定代表人或负责人</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_fddbrhfzr"></td>
                    <td class="th2">邮政编码</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_yzbm"></td>
                </tr>
                <tr>
                    <td  class="th2">行政区域</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="ylqx_xzqy_sam4${param.id}"></td>
                    <td class="th2">监管单位</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="ylqx_jgdw_sam4${param.id}"></td>
                </tr>
                <tr>
                    <td rowspan="4"  class="th2">抽样单位情况</td>
                    <td class="th2">单位名称</td>
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="cydwqk_dwmc"></td>
                </tr>
                <tr>
                    <td class="th2">地址</td>
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="cydwqk_dz"></td>
                </tr>
                <tr>
                    <td class="th2">联系人</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_lxr"></td>
                    <td class="th2">邮政编码</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_yzbm"></td>
                </tr>
                <tr>
                    <td class="th2">电话</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_dh"></td>
                    <td class="th2">传真</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_cz"></td>
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
            $('#cyjyd_div_sam4${param.id}').css({display:'none'});
            $('#jybg_div_sam4${param.id}').css({display:'block'});
        }else {
            $('#cyjyd_div_sam4${param.id}').css({display:'block'});
            $('#jybg_div_sam4${param.id}').css({display:'none'});
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
                    $("#ylqx_cy_bg_see_sam4${param.id}").setForm($.parseJSON(data.samplingForm));
                    var imgUrls = data.url.split(",");
                    var imgA="";
                    for(var j=0;j<imgUrls.length;j++) {
                        if(imgUrls[j]){
                              imgA+="<div style='display:inline;width:200px;height:200px' class='col-md-1'><img style='display:block;width:140px;height:140px' src='http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+imgUrls[j]+"'></div>";
                        }
                    }
                    $("#sam4Url${param.id}").html(imgA);
                    $("#ylqx_cy_bg_see_sam4${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#ylqx_cy_see_sam4${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#ylqx_cy_see_sam4${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }

                $("#businessCategorySeesam4${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesam4${param.id}"));

            }
        });


    });

    function updateCybg4(){

        var jyjl=$("input[name='jyjl']:checked").val();

        var data={
            id:${param.id},
            businessCategory:$("#businessCategorySeeSam4${param.id}").val(),
            businessCategoryName:$("#businessCategorySeeSam4${param.id}").find("option:selected").text(),
            samplingUnit:$("#bcjdw_bg_seesam4${param.id}").val(),
            samplingType:"4",
            formType:"2",
            samplingForm:JSON.stringify($("#ylqx_cy_bg_see_sam4${param.id}").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackBgSam4});

        function callBackBgSam4(){
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

    function updateCySam4(){


        var data={
            id:${param.id},
            area:$("#ylqx_xzqy_sam4${param.id}").val(),
            supervisory:$("#ylqx_jgdw_sam4${param.id}").val(),
            businessCategory:$("#businessCategorySeeSam4${param.id}").val(),
            businessCategoryName:$("#businessCategorySeeSam4${param.id}").find("option:selected").text(),
            samplingUnit:$("#bcydwxx_dwmc_seesam4${param.id}").val(),
            samplingType:"4",
            formType:"1",
            samplingForm:JSON.stringify($("#ylqx_cy_see_sam4${param.id}").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要保存吗',{width:300,height:150,sure:callBackCySeeSam4});
        function callBackCySeeSam4(){
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