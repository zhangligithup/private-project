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
<OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT>
<!--startprint-->
        <div id="choose_box1_see_samp1${param.id}" >
        <form id="sp_cy_see_samp1${param.id}" onsubmit="return updateCy1Bd()" action="javascript:void(0)">
                <div class=" marb10 clearfix">
                    <div class="text_head pt10">食品安全抽样检验抽样单</div>
                    <div class="pull-left width550 pl20">抽样单编号：<input type="text" class="input_style1 width220"/></div>
                    <div class="pull-right  width300 text-right pr20">NO:<input type="text" class="input_style1 width220"/></div>
                </div>
                <table class="table  table2 table-bordered no_border_input" >
                    <tbody>
                    <tr>
                        <td   colspan="2">任务来源</td>
                        <td colspan="3"><input type="text" name="rwly" class="input2"></td>
                        <td width="12%"  >任务类别</td>
                        <td colspan="3" class="text-left">
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="rwlb" value="监督抽查">监督抽查
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="rwlb" value="风险监测">风险监测
                                </label>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td width="6%" rowspan="5"  >被抽样单位信息</td>
                        <td width="5%"  >单位名称</td>
                        <td colspan="3"><input type="text" class="input2" name="dwmc"></td>
                        <td  >来样方式</td>
                        <td colspan="3" class="text-left">
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="lyfs" value="城市">城市
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="lyfs" value="乡村" >乡村
                                </label>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td  >单位地址</td>
                        <td colspan="7"><input type="text" class="input2" name="dwdz"></td>
                    </tr>
                    <tr>
                        <td  >法定代表人</td>
                        <td width="15%"><input type="text" class="input2" name="fddbr"></td>
                        <td width="13%" >年销售额（万元）</td>
                        <td width="16%"><input type="text" class="input2" name="nxse"></td>
                        <td  >营业执照</td>
                        <td colspan="3" class="text-left"><input type="text" class="input2" name="yyzz"></td>

                    </tr>
                    <tr>
                        <td  >联系人</td>
                        <td><input type="text" class="input2" name="lxr"></td>
                        <td >电话</td>
                        <td><input type="text" class="input2" name="dh"></td>
                        <td  >传真</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="cz"></td>
                        <td width="7%"  >邮编</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="yb"></td>

                    </tr>
                    <tr>
                        <td  >行政区域</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="xzqy" id="sp_cy_xzqy_sam1${param.id}"></td>
                        <td >监管单位</td>
                        <td width="13%" class="text-left"><input type="text" class="input2" name="jgdw" id="sp_cy_jgdw_sam1${param.id}"></td>
                    </tr>
                    <tr>
                        <td width="6%" rowspan="5"  >抽样地点</td>
                        <td width="5%"  >生产环节</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="schj" value="原辅料库">原辅料库
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="schj" value="生产线" >生产线
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="schj" value="半成品库">半成品库
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="schj" value="成品库（待检区）">成品库（待检区）
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="schj" value="成品库（已检区）"  >成品库（已检区）
                                </label>
                            </div>                    </td>
                    </tr>
                    <tr>
                        <td  >流通环节</td>
                        <td colspan="7" class="text-left">
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="lthj" value="批发市场">
                                    批发市场
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="lthj" value="农贸市场"  >
                                    农贸市场
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="lthj" value="商场" >
                                    商场
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="lthj" value="超市" >
                                    超市
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="lthj" value="菜市场" >
                                    菜市场
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="lthj" value="小时杂店">
                                    小时杂店
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="lthj" value="网购"  >
                                    网购
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="lthj" value="其他" >
                                    其他
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3"  >餐饮环节</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="cyhj" value="餐馆">
                                餐馆
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="特大型餐馆" >
                                    特大型餐馆
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="cyhj" value="大型餐馆" >
                                    大型餐馆
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="中型餐馆"  >
                                    中型餐馆
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="小型餐馆" >
                                    小型餐馆
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="cyhj" value="食堂"  >
                                食堂
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="机关食堂"  >
                                    机关食堂
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="cyhj" value="学校/托幼食堂">
                                    学校/托幼食堂
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="企事业单位食堂" >
                                    企事业单位食堂
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="建筑工地食堂" >
                                    建筑工地食堂
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="cyhj" value="小吃店" >
                                小吃店
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="快餐店"  >
                                    快餐店
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="cyhj" value="饮品店">
                                    饮品店
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="集体用餐配送单位" >
                                    集体用餐配送单位
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="cyhj" value="中央厨房"  >
                                    中央厨房
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="cyhj" value="其他"  >
                                    其他
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"  >样品来源</td>
                        <td colspan="7" class="text-left">

                            非特殊用途类：

                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="yply" value="加工/自制" >
                                    加工/自制
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="yply" value="委托生产" >
                                    委托生产
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox"  name="yply" value="外购"  >
                                    外购
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="yply" value="其他"  >
                                    其他
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"  >样品属性</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="ypsx" value="普通食品">
                                普通食品
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="ypsx" value="特殊膳食食品"  >
                                    特殊膳食食品
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="ypsx" value="节令食品">
                                    节令食品
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="ypsx" value="重大活动保障食品" >
                                    重大活动保障食品
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"  >样品类型</td>
                        <td colspan="7" class="text-left"><div class="myradio checkbox-inline marr10">
                            <label class=" checkbox-inline ">
                                <input type="checkbox" name="yplx" value="食品农产品">
                                食品农产品
                            </label>
                        </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="yplx" value="工业加工食品" >
                                    工业加工食品
                                </label>
                            </div>
                            <div class="myradio checkbox-inline marr10">
                                <label class=" checkbox-inline ">
                                    <input type="checkbox" name="yplx" value="餐饮加工食品" >
                                    餐饮加工食品
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="yplx" value="食品添加剂" >
                                    食品添加剂
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox"  name="yplx" value="食品相关产品" >
                                    食品相关产品
                                </label>
                            </div>
                            <div class="myradio radio-inline">
                                <label class=" checkbox-inline">
                                    <input type="checkbox" name="yplx" value="其他"  >
                                    其他
                                </label>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"  >样品名称</td>
                        <td colspan="3"><input type="text" class="input2" name="ypmc"></td>
                        <td  >商标</td>
                        <td colspan="3" class="text-left"><input type="text" class="input2" name="sb" ></td>
                    </tr>
                  <tr>
            <td colspan="2" >备注</td>
            <td colspan="7"></td>
        </tr>
        <tr>
            <td colspan="3" class="text-left">
                被抽样单位对抽样程序、过程、封样状态及
                上述内容意见：<br>
                <div class="myradio radio-inline">
                    <label class=" checkbox-inline">
                        <input type="checkbox">
                        无异议
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" checkbox-inline">
                        <input type="checkbox">
                        有异议
                    </label>
                </div>
                <div>被抽样单位签名（盖章）：</div>
            </td>
            <td colspan="3" class="text-left">
                生产者对抽样程序、过程、封样状态及上述
                内容意见：<br>
                <div class="myradio radio-inline">
                    <label class=" checkbox-inline">
                        <input type="checkbox">
                        无异议
                    </label>
                </div>
                <div class="myradio radio-inline">
                    <label class=" checkbox-inline">
                        <input type="checkbox">
                        有异议
                    </label>
                </div>
                <div>生产者签名（盖章）：</div>
            </td>
            <td colspan="3" class="text-left">
                抽样人（签名）：<br>
                抽样单位（公章）：<br>
                  　　  年　　    月   　　   日
            </td>
        </tr>
        </tbody>
    </table>
    <div class="text-center marb10">此单一式五份。第一联交组织抽样检验的食品药品监管部门；第二联交承检机构；第三联交食品标示生产者；第四
        联抽样单位留存；第五联交被抽样单位。</div>
    <table class="table  table2 table-bordered">
        <tbody>
        <tr>
            <td width="33%">年 　　　   月   　　　   日</td>
            <td width="33%">年  　　　  月     　　　 日</td>
            <td></td>
        </tr>
        </tbody>
    </table>
    <div class="text_head">填表说明</div>
    <div class="content_text p20">
        <p>1．本文书是抽样单位在执行抽样任务时所使用的文书。</p>
        <p> 2．“抽样编号”为抽样单位内部对所采集样品的编号，按《国家食品安全抽样检验抽样单编号规则》编
            制填写，一个样品有唯一抽样编号。</p>
        <p>3．“No”为抽样单印制的流水号。</p>
        <p>4．“任务来源”要求填写出具《国家食品安全抽样检验告知书》的食品药品监管部门的名称。</p>
        <p>5．“任务类别” 在“监督抽检、风险监测”中选择，仅含有风险监测项目的食品样品抽取时选择风险监测，
            其他选择监督抽检。</p>
        <p>6．“被抽样单位名称”按照工商行政部门核发的营业执照标示名称填写。</p>
        <p>7．“被抽样单位地址”按照省（区、市）、地区（市、州、盟）、县（市、区）、乡（镇）、具体地址的格
            式填写被抽样单位的实际地址，若在批发市场等流通环节抽样时，应记录被抽样单位摊位号。</p>
        <p>8．“区域类型”在“城镇、乡村、景点”中选择，其中：“城市”为县中心城区及县级市以上的城（市）区域
            范围，“乡镇”为城（市）区域以外范围，“景点”为旅游景点范围，选择“景点”时，应同时选择“城市”或“乡镇”。</p>
        <p>9．“年销售额”在生产加工环节抽样时填写。</p>
        <p>10．“抽样地点”：当单位类型为“生产”时，在“原辅料库、生产线、半成品库、成品库（□待检区、□已
            检区）”选择其一；当单位类型为“流通”时，在“农贸市场、菜市场、批发市场、商场、超市、小食杂店、网
            购、其他”中选择其一；当单位类型为“餐饮”时，在“餐馆、食堂、小吃店、快餐店、饮品店、集体用餐配
            送单位、中央厨房、其他”中选择其一，当选择“餐馆”时还要在“特大型餐馆、大型餐馆、中型餐馆、小型
            餐馆”中进行选择，当选择“食堂”时还要在“机关食堂、学校/托幼食堂、企事业单位食堂、建筑工地食堂”
            进行选择。</p>
        <p>11．“样品来源、样品属性、样品类型”在相应的□中打“√”即可。</p>
        <p>12．“样品名称、规格型号、商标、生产许可证编号、样品批号、执行标准/技术文件、保质期、质量等
            级、单价、标示生产者名称、标示生产者地址、生产者联系人、联系电话”，按实际样品包装标签或销售价
            签、菜单等标示的名称填写。对食用农产品、餐饮食品等非预包装食品，无明确标示内容的项目，填写“/”，
            不得留空白。</p>
        <p>13．“生产/加工/购进日期”原则上：对预包装食品按包装标签上标示的生产日期填写，散装食品按进货
            单标示的生产日期填写，餐饮自制食品按实际加工日期填写，餐饮环节抽取的食用农产品等，按购进日期
            填写。</p>
        <p>14．“是否出口”在相应□内打“√”即可。此处所指出口，是指同批次产品既在国内销售，又有部分用于
            出口。同一批次产品全部用于出口的不予抽样。</p>
        <p>15．“抽样基数/批量、抽样数量、备样数量”按照相应产品的抽样检验实施细则中要求的数量抽样并据
            实填写，数量的单位应与规格型号中的单位一致。</p>
        <p>16．“样品形态、包装分类、抽样时样品的储存条件、抽样方式、抽样样品包装”在相应□内打“√”即可。</p>
        <p>17．“寄送样品截止日期”，原则上被抽样品应在 5 日内送至承检机构，特殊情况下根据实际填写。“寄送
            样品地址”，抽样人员自行送达承检机构的，填写“/”,寄送样品的，需填写样品接受单位和地址。</p>
        <p>18．“抽样单位信息”按抽样参加人员所在单位的具体情况填写。</p>
        <p>19．备注：填写其他需要说明或采集的信息，如“进口食品”、“热加工”（糕点）等，具体参照各类食品抽
            样检验实施细则填写。</p>
        <p>20．抽样人签名必须要两人以上，并加盖抽样单位公章；被抽样单位和生产者须有工作人员签字确认，
            并加盖被抽样单位公章或其他合法印章。对特殊情况可签字并加按指模确认。</p>
    </div>
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
            $('#choose_box1_see_samp1${param.id}').css({display:'none'});
            $('#choose_box2_see_samp1${param.id}').css({display:'block'});
        }else {
            $('#choose_box1_see_samp1${param.id}').css({display:'block'});
            $('#choose_box2_see_samp1${param.id}').css({display:'none'});
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
                    $("#sp_cy_bg_see_samp1${param.id}").setForm($.parseJSON(data.samplingForm));
                    $("#samp1Url${param.id}").html("<img src='"+"${pageContext.request.contextPath}/notification/download.do?url="+data.url+"'/>")
                    $("#sp_cy_bg_see_samp1${param.id}").find(':input').each(function(){
                        $(this).attr("disabled",true);
                    });
                }else {
                    $("#sp_cy_see_samp1${param.id}").setForm($.parseJSON(data.samplingForm))
                }
                $("#businessCategorySeesamp1${param.id}").html("");
                $("<option></option>")
                    .val(data.businessCategoryName)
                    .text(data.businessCategoryName)
                    .appendTo($("#businessCategorySeesamp1${param.id}"));


            }
        });



    });
    function doPrint() { 
    	$("#printDiv").hide();
    	window.print();
    	window.close();
    }
</script>
</body>
</html>