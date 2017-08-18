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
        <div id="cyjyd_div_samp2${param.id}" >
            <form id="yp_cy_see_samp2${param.id}" onsubmit="updateCySam2()" action="javascript:void(0)">
            <div class=" marb10 clearfix">
                <div class="text_head pt10">药品抽样记录及凭证 </div>
                <div class="pull-right  width300 text-right pr20">   〔<span class="p20 "></span>〕第 <span class="p20"></span> 号</div>
            </div>
            <table class="table  table2 table-bordered no_border_input">
                <tbody>
                <tr>
                    <td  >抽样单位</td>
                    <td colspan="3"><input type="text" class="input2" name="cydw"></td>
                    <td width="12%"  >抽样单位经手人签名</td>
                    <td class="text-left"><input type="text" class="input2" name="cydwjsrqm"></td>

                </tr>
                <tr>
                  <td  >抽样编号</td>
                  <td colspan="3"><input type="text" class="input2" name="cybh"></td>
                  <td width="12%"  >抽样日期</td>
                  <td class="text-left"><input type="text" class="input2" name="cyrq"></td>
                </tr>
                
                <tr>
                  <td  >药品名称</td>
                  <td width="15%"><input type="text" class="input2" name="ypmc"></td>
                    <td width="13%" >生产日期</td>
                    <td width="16%"><input type="text" class="input2" name="scrq"></td>
                    <td  >效期</td>
                    <td class="text-left"><input type="text" class="input2" name="xq"></td>

                </tr>
                <tr>
                  <td  >规格</td>
                  <td><input type="text" class="input2" name="gg"></td>
                  <td >批准文号</td>
                    <td><input type="text" class="input2" name="pzwh"></td>
                    <td colspan="2"  >&nbsp;</td>
                  </tr>
                <tr>
                    <td  >生产配置单位或产地</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="scpzdwhcd"></td>
                  </tr>
                <tr>
                  <td  >被抽样单位/被抽样场所</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="bcydwbcycs"/></td>
                </tr>
                <tr>
                  <td  >被抽样单位地址</td>
                  <td colspan="5" class="text-left"><input type="text" class="input2" name="bcydwdz"></td>
                </tr>
                <tr>
                  <td  >邮政编码</td>
                  <td colspan="3" class="text-left"><input type="text" class="input2" name="yzbm"></td>
                  <td>联系电话</td>
                  <td class="text-left"><input type="text" class="input2" name="lxdh"></td>
                  </tr>
                <tr>
                  <td  >药品种类</td>
                    <td colspan="5" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                                <input type="checkbox" name="ypzl" value="进场原料（包括化工原料、药用原料、辅料、包装材料等）">
                                进场原料（包括化工原料、药用原料、辅料、包装材料等）
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox"  name="ypzl" value="中间体（半成品）">
                                中间体（半成品）
                            </label>
                        </div>
                        <div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="ypzl" value="制剂">
                                制剂
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="ypzl" value="原料药" >
                                原料药
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox"  name="ypzl" value="药材（个子货、饮片）" >
                                药材（个子货、饮片）
                            </label>
                        </div></td>
                  </tr>
                <tr>
                  <td rowspan="4"  >外包装情况</td>
                  <td colspan="5" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                                <input type="checkbox" name="wbzqk" value="硬纸箱">
                                硬纸箱
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="wbzqk" value="麻袋"  >
                                麻袋
                            </label>
                        </div>
                        <div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="wbzqk" value="木箱">
                            木箱
                        </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="wbzqk" value="纤维桶"  >
                                纤维桶
                            </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="wbzqk" value="蛇皮袋"   >
                                蛇皮袋
                            </label>
                        </div>
                    <div class="myradio radio-inline">
                          <label class=" checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="铁桶"  >
                            铁桶 </label>
                        </div>
                    <div class="myradio radio-inline">
                          <label class=" checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="铝听"  >
                            铝听 </label>
                        </div>
                    <div class="myradio radio-inline">
                          <label class=" checkbox-inline">
                            <input type="checkbox"  name="wbzqk" value="牛皮纸袋" >
                            牛皮纸袋 </label>
                        </div>
                        <div class="myradio radio-inline">
                          <label class=" checkbox-inline">
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
                  <td  >库存是否符合要求</td>
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
                  <td rowspan="3"  >抽样情况</td>
                  <td colspan="3" class="text-left">样品包装:
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="玻瓶">
                        玻瓶 </label>
                  </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="纸盒">
                        纸盒 </label>
                  </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="ypbz" value="塑料袋">
                        塑料袋 </label>
                  </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
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
                    <td  >备注</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="bz"></td>
                  </tr>
                <tr>
                    <td  >行政区域</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="yp_cy_xzqy_sam2${param.id}"></td>
                    <td >监管单位</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="yp_cy_jgdw_sam2${param.id}"></td>
                </tr>
                <tr>
                  <td  >被抽样单位</td>
                    <td colspan="2" class="text-left"><input type="text" class="input2" name="bcydw" id="cy_bcjdwmc_seesam2${param.id}"></td>
                    <td colspan="3" class="text-left">以上抽样情况属实，样品已当场签封</td>
                  </tr>
                <tr>
                  <td  >被抽样单位经手人签名</td>
                    <td colspan="5" class="text-left"><input type="text" class="input2" name="bcydwjsrqm"></td>
                  </tr>
                <tr>
                  <td colspan="6"  >注：本凭证一式三联，第一联由抽验单位保存，第二联送被抽样单位，第三联随检品送检验单位                  </td>
                  </tr>
                </tbody>
            </table>
            </form>

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
            $('#cyjyd_div_samp2${param.id}').css({display:'none'});
            $('#jybg_div_samp2${param.id}').css({display:'block'});
        }else {
            $('#cyjyd_div_samp2${param.id}').css({display:'block'});
            $('#jybg_div_samp2${param.id}').css({display:'none'});
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
                    $("#yp_cy_bg_see_samp2${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#samp2Url${param.id}").html("<img src='"+"${pageContext.request.contextPath}/notification/download.do?url="+data.url+"'/>")
                    $("#yp_cy_bg_see_samp2${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#yp_cy_see_samp2${param.id}").setForm($.parseJSON(data.samplingForm));
                }
                $("#businessCategorySeesamp2${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesamp2${param.id}"));

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