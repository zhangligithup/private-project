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
        <div id="cyjyd_div_samp3${param.id}" >
            <form id="hzp_cy_see_samp3${param.id}" onsubmit="updateCySam3()" action="javascript:void(0)">
            <div class=" marb10 clearfix">
                <div class="text_head pt10">化妆品监督抽检抽样单</div>
                <div class="pull-right  width300 text-right pr20">NO:<input type="text" class="input_style1 width220"/></div>
            </div>
            <table class="table  table2 table-bordered no_border_input">
                    <tbody>
                   <tr>
                  <td   colspan="2">任务来源</td>
                  <td colspan="5" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="rwly" value="国家监督抽验">
                      国家监督抽验 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="rwly" value="日常监督抽验" >
                          日常监督抽验 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="rwly" value="专项监督抽验" >
                          专项监督抽验 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="rwly" value="有因抽验"   >
                        有因抽验 </label>
                  </div></td>
                </tr>
                    <tr>
                  <td width="6%" rowspan="5"  >被抽样单位信息</td>
                  <td width="5%"  >单位名称</td>
                  <td colspan="5"><input type="text" class="input2" name="bcydwmc" id="cy_bcjdwmc_seesma3${param.id}" ></td>
                </tr>
                <tr>
                  <td  >单位地址</td>
                  <td  width="70" colspan="5"><input type="text" class="input2" name="bcydwdz"></td>
                </tr>
                <tr>
                  <td  >法定代表人</td>
                  <td width="15%"><input type="text" class="input2" name="bcyfddbr"></td>
                  <td width="15%" >联系人</td>
                  <td ><input type="text" class="input2" name="bcylxr"></td>
                  <td width="15%"  >营业执照号</td>
                  <td   ><input type="text" class="input2" name="bcyyyzzh"></td>
                </tr>
                   <tr>
                        <td  >电话</td>
                        <td width="15%"><input type="text" class="input2" name="bcydh"></td>
                        <td width="13%" >传真</td>
                        <td width="16%"><input type="text" class="input2" name="bcycz"></td>
                        <td  >邮编</td>
                        <td  class="text-left"><input type="text" class="input2" name="bcyyb"></td>

                    </tr>
                   <tr>
                       <td  >行政区域</td>
                       <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="hzp_xzqy_sam3${param.id}"></td>
                       <td >监管单位</td>
                       <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="hzp_jgdw_sam3${param.id}"></td>
                   </tr>
                    <tr>
                  <td width="6%" rowspan="2"  >抽样地点</td>
                  <td  >生产环节</td>
                  <td colspan="5"  class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="schj" value="成品库">
                      成品库 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="schj" value="其他"  >
                        其他 </label>
                    </div>
                    </td>
                </tr>
                <tr>
                  <td  >经营环节</td>
                  <td colspan="5"  class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="jyhj" value="批发市场">
                      批发市场 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="jyhj" value="小商店"  >
                        小商店 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                          <input type="checkbox" name="jyhj" value="商场" >
                        商场 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="超市" >
                        超市 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="专卖店" >
                        专卖店 </label>
                    </div>
                     <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="药店" >
                        药店 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="jyhj" value="网购" >
                        网购 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="jyhj" value="美容美发场所"  >
                        美容美发场所 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="jyhj" value="其他" >
                        其他 </label>
                    </div>
                    </td>
                </tr>
                <tr>
                  <td width="6%" rowspan="7"  >样品信息</td>
                  <td width="5%"  rowspan="2" >样品类别</td>
                    <td width="5%"  >非特殊用途类</td>
                    <td colspan="4"  class="text-left">
                    <div class="myradio checkbox-inline marr10">
                        <label class=" checkbox-inline ">
                            <input type="checkbox" name="yplbftsl" value="发用类">
                            发用类 </label>
                    </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="yplbftsl" value="护肤类"  >
                                护肤类 </label>
                        </div>
                        <div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="yplbftsl" value="美容修饰类" >
                                美容修饰类 </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox"  name="yplbftsl" value="其他" >
                                其他 </label>
                        </div>
                    </td>
                </tr>
                <tr>
                  <td  >特殊用途类</td>
                  <td colspan="4" class="text-left"><div class="myradio checkbox-inline marr10">
                    <label class=" checkbox-inline ">
                      <input type="checkbox" name="yplbtsl" value="育发" >
                        育发 </label>
                  </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="染发"   >
                          染发 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox"  name="yplbtsl" value="烫发" >
                          烫发 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="脱毛" >
                          脱毛 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="美乳" >
                          美乳 </label>
                    </div>
                    <div class="myradio checkbox-inline marr10">
                      <label class=" checkbox-inline ">
                        <input type="checkbox" name="yplbtsl" value="健美">
                          健美 </label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox" name="yplbtsl" value="除臭"  >
                          除臭</label>
                    </div>
                    <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="祛斑" >
                          祛斑 </label>
                    </div>
                      <div class="myradio radio-inline">
                      <label class=" checkbox-inline">
                        <input type="checkbox"  name="yplbtsl" value="防晒" >
                          防晒 </label>
                    </div>
                  </td>
                </tr>
                <tr>
                    <td width="13%" >样品名称</td>
                    <td width="25%" colspan="1"><input type="text" class="input2" name="yomc"></td>
                    <td width="13%" >样品批号</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="ypph"></td>
                </tr>
                 <tr>
                    <td width="13%" >生产日期</td>
                    <td width="25%" colspan="1"><input type="text" class="input2" name="scrq"></td>
                    <td width="13%" >限期使用日期/保质期</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="xqsyrqbzq"></td>
                </tr>
                <tr>
                    <td width="13%" >生产许可证明文件号</td>
                    <td width="25%" colspan="1"><input type="text" class="input2" name="scxkzmwjh"></td>
                    <td width="13%" >批准文号/备案号</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="pzwhbah"></td>
                </tr>
                <tr>
                    <td width="13%" >包装分类</td>
                    <td width="25%" colspan="5" class="text-left">
                        <div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="bzfl" value="散装">
                                散装 </label>
                        </div>
                        <div class="myradio radio-inline">
                            <label class=" checkbox-inline">
                                <input type="checkbox" name="bzfl" value="护肤类"  >
                                预包装 </label>
                        </div>
                    </td>
                </tr>
                 <tr>
                    <td width="13%" >抽样数量</td>
                    <td width="25%"><input type="text" class="input2" name="cysl"></td>
                    <td width="13%" >生产/进货数量</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="scjhsl"></td>
                </tr>
                 <tr>
                    <td width="6%" rowspan="2"  >(标称)生产者信息</td>
                    <td width="5%"  >生产企业/代理商名称</td>
                    <td colspan="5"><input type="text" class="input2" name="bcsczxxscqydlsmc"></td>
                </tr>
                 <tr>
                    <td  >生产企业/代理商地址</td>
                    <td ><input type="text" class="input2" name="bcsczxxscqydlsdz"></td>
                    <td  >联系电话</td>
                    <td colspan="3" ><input  type="text" class="input2" name="bcsczxxlxdh"></td>
                </tr>
                <tr>
                    <td width="6%" rowspan="3"  >抽样单位信息</td>
                    <td width="13%" >单位名称</td>
                    <td width="25%"><input type="text" class="input2" name="cydwxxdwmc"></td>
                    <td width="13%" >地址</td>
                    <td width="26%" colspan="3"><input type="text" class="input2" name="cydwxxdz"></td>
                </tr>
                <tr>
                    <td  >联系人</td>
                    <td><input type="text" class="input2" name="cydwxxlxr"></td>
                    <td >电话</td>
                    <td colspan="3"><input type="text" class="input2" name="cydwxxdh"></td>
                    
                </tr>
                  
                <tr>
                	<td  >传真</td>
                    <td width="13%" class="text-left"><input type="text" class="input2" name="cydwxxcz"></td>
                    <td width="7%"  >邮编</td>
                    <td colspan="3" width="13%" class="text-left"><input type="text" class="input2" name="cydwxxyb"></td>
                </tr>
                  <tr>
                  <td >备注</td>
                  <td colspan="6"><input type="text" class="input2" name="bz"></td>
                </tr>
         <tr>
                  <td colspan="7 " class="text-left">
                      被抽样单位对抽样程序、过程、封样状态及上述内容无异议</br>
                      被抽样单位签名（盖章）：</br>
                      <div class="pull-right pr20">年　　月　　日</div>
                  </td>
                  <td colspan="4" class="text-left">
                      抽样人（签名）：</br>
                      抽样单位（公章）：</br>
                      <div class="pull-right pr20">年　　月　　日</div>
                  </td>
              </tr>
                <tr>
                    <td colspan="7 " class="text-left">
                        样品交接情况：
                    </td>
                    <td colspan="4" class="text-left">
                        收样人（签名）：</br>
                        检验机构（盖章）：</br>
                        <div class="pull-right pr20">年　　月　　日</div>
                    </td>
                </tr>
              </tbody>
            </table>
            </form>
            <div class="text-center marb10">一式四联。第一联交组织抽样检验的食品药品监管（市场监管）机构；第二联交负责核查处置工作的食品药品监
                管（市场监管）机构；第三联抽样单位留存；第四联交被抽样单位.</div>
            <div class="content_text p20">
                <p>填写说明：</p>
                <p>1．本文书适用于化妆品监督抽检的抽样工作。</p>
                <p>2．此单一式 4 份。受检单位、抽样单位、负责核查处置工作的食品药品监管（市场监管）机构、组织抽样检验的食品药品监管（市场监管）机构各一份。
                要求给下达任务部门的为第一联。</p>
                <p>3．抽样单编号：编号规则举例 “13201500001”，其中 13 是省编号，2015是印刷年号，后五位是样品顺序号。</p>
                <p>4．任务来源：应当根据抽检任务性质在“□国家监督抽验 □日常监督抽验□专项监督抽验 □有因抽检” 打“√”选择。</p>
                <p>5．被抽样单位：指化妆品监督抽验的直接对象。单位名称应当填写工商营业执照上的名称，被抽样单位名称应当与被抽样单位公章相同。法定代表人应当
                填写营业执照上的法人代表或其它法定代表人的姓名。联系人一般为从事企业质量管理的有关负责人，联系电话应当填写联系人的固定电话号码或手机号码。营
                业执照号应当填写照营业执照的注册号，不得空缺。单位地址应当填写被抽样企业详细地址，具体到门牌号。一些特殊情况如被抽样企业无名称的，单位名称应
                当填写单位地址，并标明到详细位置，示例“××市场××排××号”。</p>
                <p>6．抽样地点：在生产环节抽取，在“□成品库”应当打“√”选择，如在生产线和灌装车间取样，则在“£其他（ ）”应当打“√”选择，在括号内
                填写具体地点，如生产线或灌装车间。在经营环节抽取，应当在相应的选项中打
                “√”选择。</p>
                <p>7．样品信息：内容应当按照产品外包装的内容如实填写。样品类别按照所抽
                样品的产品类别进行勾选。样品名称应当反映产品的真实属性，如企业产品标注
                名称未反映产品真实属性的，应当在产品标注名称后用括弧加注产品真实属性名
                称，示例：香泽秀（香水）。生产批号和限期使用日期或生产日期和保质期两组中
                必须有一组为完整填写。生产许可证明文件和批准文号/备案号应当按包装填写，
                标识核查真实性和有效期；国产化妆品必须具备生产许可证明文件编号，国产特
                殊化妆品同时具备批准文号/备案号；进口化妆品只具有批准文号/备案号。</p>
                <p>— 3 ——</p>
                <p>8．抽样数量：应当包括检验样品、复检样品和确认样品。生产/进货数量，
                在生产环节填写生产数量，在经营环节填写进货数量，生产/进货数量是指同抽
                样样品批号相同的生产/进货数量。</p>
                <p>9．标称生产者：国产产品填写标识的生产企业信息；进口产品则填写代理
                商信息。</p>
                <p>10．抽样单位：应当完整填写抽样单位全称、地址和邮政编码，详细填写抽
                样人员或部门有关负责人姓名及联系电话、传真号码。</p>
                <p>11．抽样人签名必须要 2 人以上，不可代签。</p>
                <p>12．被抽样单位签名（盖章）：是指抽样单填好后由被抽样单位签名确认，
                加盖公章或其它有效印章，方能生效。如被抽样单位无法加盖公章的，由法定代
                表人授权经手人签字并加按指模。被抽样者系个人的，由被抽样个人签字并加按
                指模。</p>
                <p>13．检验机构（盖章）：如果抽样单位和检验机构是不同单位，应当进行样
                品交接。检验机构在确认样品封存完好，样品与抽样单一致后接收样品。</p>
                <p>14．抽样单填写要求：抽样单填写应当字迹工整、清晰，保证一式四联记录
                内容清楚可见，不得使用不规范的简化字或符号、数字；抽样单内容需要更改时，
                只能划改，不得涂改、粘贴，且只能在抽样单第一联进行更改，第二联至第四联
                （如有时）相应修改内容应当为复写。在抽样现场进行的更改，应当经抽样人员
                与被抽样单位签字人双方签字或被抽样单位盖章确认；抽样单事后不得随意更
                改，确需更改的，应当附加受检单位的确认记录；抽样单不得留白，必填项内容
                不得空缺，非必填项栏目空白应当填上“—”表示。</p>
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
            $('#cyjyd_div_samp3${param.id}').css({display:'none'});
            $('#jybg_div_samp3${param.id}').css({display:'block'});
        }else {
            $('#cyjyd_div_samp3${param.id}').css({display:'block'});
            $('#jybg_div_samp3${param.id}').css({display:'none'});
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
                    $("#hzp_cy_bg_see_samp3${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#samp3Url${param.id}").html("<img src='"+"${pageContext.request.contextPath}/notification/download.do?url="+data.url+"'/>")
                    $("#hzp_cy_bg_see_samp3${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#hzp_cy_see_samp3${param.id}").setForm($.parseJSON(data.samplingForm));
                }
                $("#businessCategorySeesamp3${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesamp3${param.id}"));

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