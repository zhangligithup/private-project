<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>&nbsp;</title>
    <link rel="stylesheet" href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">  
    <link rel="stylesheet" href="<c:url value='/ionicons/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/dist/css/AdminLTE.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/dist/css/skins/_all-skins.min.css' />">
    <link rel="stylesheet" href="<c:url value='/plugins/iCheck/flat/blue.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/morris/morris.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/datepicker/datepicker3.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/daterangepicker/daterangepicker-bs3.css'/>">
    <link rel="stylesheet" href="<c:url value='/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">  
    <link rel="stylesheet" href="<c:url value='/ionicons/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fileinput.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/fileinput.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/fileinput_locale_zh.js"></script>
    <!--日历插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap-datetimepicker.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/extendPagination.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/ichart.1.2.1.src.js"></script>
    <!-- ztree --> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.core.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.excheck.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>
    
    <script src="<c:url value='/plugins/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/plugins/datatables/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>"></script>
    <script src="<c:url value='/plugins/fastclick/fastclick.min.js'/>"></script>
    <script src="<c:url value='/dist/js/app.min.js'/>"></script>
    <script src="<c:url value='/dist/js/demo.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jquery.validate.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/messages_zh.js'/>"></script>
    <script src="<c:url value='/js/public/public.js'/>"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dmm9c58sobIwy0mGVtwruvnaZZMQdBVx"></script>   
  </head>
<body>
<!--startprint-->
        <div id="cyjyd_div_samp4${param.id}" >
            <form id="ylqx_cy_see_samp4${param.id}"   onsubmit="updateCySam4()"   action="javascript:void(0)">
           <div class=" marb10 clearfix">
                <div class="text_head pt10">医疗器械抽样记录及凭证 </div>
                <div class="pull-right  width300 text-right pr20">   〔<span class="p20 "></span>〕第 <span class="p20"></span> 号</div>
            </div>
            <table class="table  table2 table-bordered no_border_input">
                <tbody>
                <tr>
                    <td width="15%"  >抽样编号</td>
                    <td colspan="2"><input type="text" class="input2"  name="cybh"></td>
                    <td width="12%"  >抽样日期</td>
                    <td width="27%" class="text-left"><input type="text" class="input2" name="cyrq"></td>

                </tr>
                <tr>
                    <td rowspan="11"  >被抽样单位信息</td>
                    <td >标示产品名称</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_bscpmc"></td>
                </tr>
                <tr>
                    <td >产品注册证</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_cpzcz"></td>
                </tr>
                <tr>
                    <td >产品执行标准</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_cpzxbz"></td>
                </tr>
                <tr>
                    <td >标示生产单位</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_bsscdw"></td>
                </tr>
                <tr>
                    <td >地址</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_dz"></td>
                </tr>
                <tr>
                    <td >电话</td>
                    <td width="26%"><input type="text" class="input2" name="bcydwxx_dh"></td>
                    <td >传真</td>
                    <td><input type="text" class="input2" name="bcydwxx_cz"></td>
                </tr>
                <tr>
                    <td >规格/型号</td>
                    <td><input type="text" class="input2" name="bcydwxx_ggxh"></td>
                    <td >生产日期/批号/出厂编号</td>
                    <td><input type="text" class="input2" name="bcydwxx_scrqphccbh"></td>
                </tr>
                <tr>
                    <td >抽样数量</td>
                    <td><input type="text" class="input2" name="bcydwxx_cysl"></td>
                    <td >有效期截止日期</td>
                    <td><input type="text" class="input2" name="bcydwxx_yxqjzrq"></td>
                </tr>
                <tr>
                    <td >生产或购进数量</td>
                    <td ><input type="text" class="input2" name="bcydwxx_schgjsl"></td>
                    <td  >已售或使用数量</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_yshsysl"></td>

                </tr>
                <tr>
                    <td >库存数量</td>
                    <td><input type="text" class="input2" name="bcydwxx_kcsl"></td>
                    <td >商标</td>
                    <td><input type="text" class="input2" name="bcydwxx_sb"></td>
                </tr>
                <tr>
                    <td >抽样地点</td>
                    <td colspan="3"><input type="text" class="input2" name="bcydwxx_cydd"></td>
                </tr>
                <tr>
                    <td rowspan="4"  >被抽样单位情况</td>
                    <td colspan="2" class="text-left">
                        <div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="bcydwxx_status" value="生产">
                                生产</label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="bcydwxx_status" value="经营">
                                经营</label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="bcydwxx_status" value="使用">
                                使用</label>
                        </div>
                    </td>
                    <td >许可证号</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_xkzh"></td>
                </tr>
                <tr>
                    <td  >单位名称</td>
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="bcydwxx_dwmc" id="bcydwxx_dwmc_seesam4${param.id}"></td>
                </tr>
                <tr>
                    <td >法定代表人或负责人</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_fddbrhfzr"></td>
                    <td >邮政编码</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_yzbm"></td>
                </tr>
                <tr>
                    <td  >行政区域</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="ylqx_xzqy_sam4${param.id}"></td>
                    <td >监管单位</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="ylqx_jgdw_sam4${param.id}"></td>
                </tr>
                <tr>
                    <td rowspan="4"  >抽样单位情况</td>
                    <td >单位名称</td>
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="cydwqk_dwmc"></td>
                </tr>
                <tr>
                    <td >地址</td>
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="cydwqk_dz"></td>
                </tr>
                <tr>
                    <td >联系人</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_lxr"></td>
                    <td >邮政编码</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_yzbm"></td>
                </tr>
                <tr>
                    <td >电话</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_dh"></td>
                    <td >传真</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwqk_cz"></td>
                </tr>
           <tr>
                    <td class="th2">备注</td>
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td colspan="3" class="text-left">
                        抽样单位（盖章）：</br>
                        抽样人员签名：</br>
                    </td>
                    <td colspan="2" class="text-left">
                        被抽样单位（盖章）：</br>
                        有关负责人签名：</br>
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
            <div class="text-center marb10">
                注：本凭证一式四联，第一联（白）存根，第二联（绿）随样品封样寄往承检机构，
                第三联（红）随总结材料上报，第四联（兰）留被抽样单位。
            </div>
  </div>
  <!--endprint-->
  <div class="btn_box marb10" id="printDiv">
                    <div class="pull-left">
                        <a class="form_btn  width140 title_font" href="javascript:void(0)" onclick="doPrint()">打印</a>
                    </div>

                </div>
<script>
    $(function(){
        var samId=${param.id};
        var type= ${param.formType};
        if(type=="2") {
            $('#cyjyd_div_samp4${param.id}').css({display:'none'});
            $('#jybg_div_samp4${param.id}').css({display:'block'});
        }else {
            $('#cyjyd_div_samp4${param.id}').css({display:'block'});
            $('#jybg_div_samp4${param.id}').css({display:'none'});
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
                    $("#ylqx_cy_bg_see_samp4${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#samp4Url${param.id}").html("<img src='"+"${pageContext.request.contextPath}/notification/download.do?url="+data.url+"'/>")
                    $("#ylqx_cy_bg_see_samp4${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#ylqx_cy_see_samp4${param.id}").setForm($.parseJSON(data.samplingForm));
                }

                $("#businessCategorySeesamp4${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesamp4${param.id}"));

            }
        });


    });
    function doPrint() { 
    	$("#printDiv").hide();
        window.print();
    }
</script>
</body>
</html>