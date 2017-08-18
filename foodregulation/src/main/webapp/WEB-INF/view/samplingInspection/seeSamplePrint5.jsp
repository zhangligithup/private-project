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
        <div id="cyjyd_div_sam5${param.id}" >
            <form id="bjsp_cy_see_sam5${param.id}" onsubmit="updateCySam5()" action="javascript:void(0)">
            <div class=" marb10 clearfix">
                <div class="text_head pt10">保健食品抽样记录</div>
                <div class="pull-right  width300 text-right pr20">编号：<input type="text" class="input_style1 width220"/></div>
            </div>
            <table class="table  table2 table-bordered no_border_input">
                <tbody>
                <tr>
                    <td width="178"   >样品名称</td>
                    <td width="361"><input type="text" class="input2" name="ypmc"></td>
                    <td width="215"  >抽样日期</td>
                    <td width="328"><input type="text" class="input2" name="cyrq"></td>

                </tr>
                <tr>
                    <td  >产品名称</td>
                    <td width="361"><input type="text" class="input2" name="cpmc"></td>
                    <td  >商标(牌号)</td>
                    <td><input type="text" class="input2" name="sbph"></td>

                </tr>
                <tr>
                    <td  >文号持有者</td>
                    <td width="361"><input type="text" class="input2" name="whcyz"></td>
                    <td  >地址</td>
                    <td><input type="text" class="input2" name="dz"></td>

                </tr>
                <tr>
                    <td  >剂型</td>
                    <td width="361"><input type="text" class="input2" name="jx"></td>
                    <td  >规格</td>
                    <td><input type="text" class="input2" name="gg"></td>

                </tr>
                <tr>
                    <td  >包装规格</td>
                    <td width="361"><input type="text" class="input2" name="bzgg"></td>
                    <td  >批号</td>
                    <td><input type="text" class="input2" name="ph"></td>

                </tr>
                <tr>
                    <td  >生产日期</td>
                    <td width="361"><input type="text" class="input2" name="scrq"></td>
                    <td  >有（失）效期</td>
                    <td><input type="text" class="input2" name="ysxq"></td>

                </tr>
                <tr>
                  <td  >批准文号</td>
                  <td width="361"><input type="text" class="input2" name="pzwh"></td>
                  <td  >国产或进口</td>
                  <td><input type="text" class="input2" name="gchjk1"></td>
                </tr>
                <tr>
                  <td  >被抽样单位</td>
                  <td width="361"><input type="text" class="input2" name="bcydw" id="cy_bcydw_seesam5${param.id}"></td>
                  <td  >被抽样单位地址</td>
                  <td><input type="text" class="input2" name="bcydwdz"></td>
                </tr>
                <tr>
                  <td  >被抽样单位联系人</td>
                  <td width="361"><input type="text" class="input2" name="bcydwlxr"></td>
                  <td  >联系电话</td>
                  <td><input type="text" class="input2" name="lxdh"></td>
                </tr>
                <tr>
                  <td  >邮编</td>
                  <td width="361"><input type="text" class="input2" name="yb"></td>
                  <td  >国产或进口</td>
                  <td><input type="text" class="input2" name="gchjk2"></td>
                </tr>
                <tr>
                    <td  >行政区域</td>
                    <td class="text-left"><input type="text" class="input2" name="xzqy" id="bjsp_xzqy_sam5${param.id}"></td>
                    <td >监管单位</td>
                    <td class="text-left"><input type="text" class="input2" name="jgdw" id="bjsp_jgdw_sam5${param.id}"></td>
                </tr>
                <tr>
                    <td colspan="4"  >1、功能类别</td>
                  </tr>
                <tr>
                    <td colspan="4">
                  <div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="gnlb" value="增强免疫力功能">
                      增强免疫力功能 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="环节体力疲劳功能"  >
                        环节体力疲劳功能 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="gnlb" value="抗氧化功能" >
                        抗氧化功能 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="增加骨密度功能"  >
                       增加骨密度功能</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="辅助降血脂功能" >
                        辅助降血脂功能 </label>
                    </div>
                     </td>
                  </tr>
                <tr>
                  <td colspan="4" >
                  <div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="gnlb" value="辅助降血糖功能">
                      辅助降血糖功能 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb" value="辅助降血压功能"  >
                        辅助降血压功能 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="gnlb" value="减肥功能" >
                        减肥功能 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="通便功能" >
                       通便功能</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="促消化功能" >
                        促消化功能 </label>
                    </div>
                    </td>
                </tr>
                <tr>
                  <td colspan="4" >
                  <div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="gnlb" value="改善生长发育功能" >
                      改善生长发育功能 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb" value="改善睡眠功能"   >
                        改善睡眠功能 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="gnlb" value="改善营养性贫血功能">
                        改善营养性贫血功能 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb" value="辅助改善记忆功能"  >
                       辅助改善记忆功能</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="gnlb"  value="其他"  >
                        其他 </label>
                    </div>
                     </td>
                </tr>
                <tr>
                  <td colspan="4"  >2、外包装情况</td>
                  </tr>
                <tr>
                    <td colspan="4">
                  <div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="wbzqk" value="包装无破损">
                      包装无破损 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="wbzqk" value="无水迹"  >
                        无水迹 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="wbzqk" value="无污染">
                        无污染 </label>
                    </div>
                   </td>
                  </tr>
                <tr>
                  <td colspan="4"  >3、抽样地点</td>
                  </tr>
                <tr>
                  <td colspan="4">
                  <div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox"  name="cydd" value="生产单位" >
                      生产单位 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="cydd" value="批发"  >
                        批发 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox"  name="cydd" value="零售">
                        零售 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="cydd"  value="仓库" >
                       仓库</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="cydd" value="货架"  >
                        货架 </label>
                    </div>
                     <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="cydd"  value="其他" >
                        其他 </label>
                    </div>
                    </td>
                  </tr>
                <tr>
                  <td colspan="4"  >4、抽样情况</td>
                  </tr>
                <tr>
                  <td>样品包装</td>
                  <td colspan="3">
                  <div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox"  name="ypbz" value="玻璃瓶">
                      玻璃瓶 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="ypbz" value="纸盒">
                        纸盒 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox"  name="ypbz" value="铝塑">
                        铝塑 </label>
                    </div>
                   <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="ypbz" value="塑料袋" >
                       塑料袋</label>
                    </div>
                    
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
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
               <tr>
                    <td>抽样说明：</td>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">被抽样单位经手人签名（盖章）： </td>
                    <td colspan="2" class="text-left">抽样单位经手人签名（盖章）：</td>
                </tr>
                </tbody>
            </table>
            </form>
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
                    $("#sam5Url${param.id}").html("<img src='"+"${pageContext.request.contextPath}/notification/download.do?url="+data.url+"'/>")
                    $("#bjsp_cy_bg_see_sam5${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#bjsp_cy_see_sam5${param.id}").setForm($.parseJSON(data.samplingForm));

                }
                $("#businessCategorySeesam5${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesam5${param.id}"));


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