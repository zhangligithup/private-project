<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">抽样检查</a></li>
            <li class="active">添加抽样检查</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>

    <input type="hidden" value="${param.time}" id="checkDate_sam4">
    <input type="hidden" value="${param.batch}" id="batch_sam4">
    <input type="hidden" value="${param.taskId}" id="taskId_sam4">
    <input type="hidden" value="${param.entType}" id="entType_sam4">
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select class="select_style1" disabled id="businessCategorySam4">
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单</th>
            <th class="width220 noborder ">
                <select class="select_style1 marr10" id="choose_book_sam4">
                    <option value ="choose_box1_sam4" selected="selected">抽样检验单</option>
                    <option value ="choose_box2_sam4">检验报告书</option>
                </select>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box_sam4">

        <div id="choose_box2_sam4">
            <form id="ylqx_cybg" onsubmit="return saveFjSam4();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_bg_sam4">医疗器械检验报告</div>
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
                    <td width="35%"><input type="text" class="input2" name="bcjdw" value="${param.entName}" id="bcjdw_bg_sam4"></td>
                    <td  class="table3_th">生产日期</td>
                    <td>
                        <div id="sam4_date_calenderOneBox1" style="position:relative">
                            <input id="sam4_date_calender1" class="input2 bg_calender" size="16" type="text" name="scrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="scrq"></td>--%>

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
                    <td width="35%">
                        <div id="sam4_date_calenderOneBox2" style="position:relative">
                            <input id="sam4_date_calender2" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="cyrq">--%>
                    </td>
                    <td  class="table3_th">检验地点</td>
                    <td><input type="text" class="input2" name="jydd"></td>

                </tr>
                <tr>
                    <td  class="table3_th">收样日期</td>
                    <td width="35%">
                        <div id="sam4_date_calenderOneBox3" style="position:relative">
                            <input id="sam4_date_calender3" class="input2 bg_calender" size="16" type="text" name="syrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="syrq">--%>
                    </td>
                    <td  class="table3_th">检验日期</td>
                    <td>
                        <div id="sam4_date_calenderOneBox4" style="position:relative">
                            <input id="sam4_date_calender4" class="linput2 bg_calender" size="16" type="text" name="jyrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="jyrq">--%>
                    </td>

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

                <tr>
                    <td class="noborder title_font ">上传附件</td>
                    <td>
                        <div id="reportFileSample4" class="zyupload">
                        </div>
                    </td>
                </tr>
                </thead>
            </table>
            <div class="btn_box marb10" >
                <div class="pull-left ">
                    <button class="form_btn  width140 title_font" type="submit">保 存</button>
                </div>

            </div>
            </form>
        </div>

        <div id="choose_box1_sam4" >
            <form id="ylqx_cy" onsubmit="return saveCySam4();" action="javascript:void(0)">
            <div class="titledivone marb3">
                <div class="title_txt" id="title_cy_sam4">医疗器械抽样检验抽样单</div>
            </div>
            <table class="table  table2 table-bordered">
                <tbody>
                <tr>
                    <td width="15%"  class="th2">抽样编号</td>
                    <td colspan="2"><input type="text" class="input2"  name="cybh"></td>
                    <td width="12%"  class="th2">抽样日期</td>
                    <td width="27%" class="text-left">

                        <div id="sam4_date_calenderOneBox5" style="position:relative">
                            <input id="sam4_date_calender5" class="input2 bg_calender" size="16" type="text" name="cyrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="cyrq">--%>
                    </td>

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
                    <td>
                        <div id="sam4_date_calenderOneBox6" style="position:relative">
                            <input id="sam4_date_calender6" class="input2 bg_calender" size="16" type="text" name="bcydwxx_yxqjzrq" readonly value="">
                        </div>
                        <%--<input type="text" class="input2" name="bcydwxx_yxqjzrq">--%>
                    </td>
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
                    <td colspan="3" class="text-left"><input type="text" class="input2" name="bcydwxx_dwmc" value="${param.entName}"  id="bcydwxx_dwmc_sam4"></td>
                </tr>
                <tr>
                    <td class="th2">法定代表人或负责人</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_fddbrhfzr"></td>
                    <td class="th2">邮政编码</td>
                    <td class="text-left"><input type="text" class="input2" name="bcydwxx_yzbm"></td>
                </tr>
                <tr>
                    <td  class="th2">行政区域</td>
                    <td width="13%" class="text-left">
                        <select class="select_style1 marr10 input2" name="xzqy" id="cy_xzqy_sam4">
                            <option value="">请选择</option>
                            <c:forEach items="${addressList}" var="list">
                                <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="th2">监管单位</td>
                    <td width="13%" class="text-left">
                        <select class="select_style1 marr10 input2" name="jgdw" id="cy_jgdw_sam4">
                            <option value="">请选择</option>
                            <c:forEach items="${unitList}" var="list">
                                <option  value="${list.tDictionaryName}" >${list.tDictionaryName}</option>
                            </c:forEach>
                        </select>
                    </td>
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
                <div class="pull-left ">
                    <button class="form_btn  width140 title_font" type="submit">保 存</button>
                </div>

            </div>
            </form>
        </div>
  </div>
</div>
<script>
    $(function(){

        $('#sam4_date_calender1').datetimepicker({
            container:'#sam4_date_calenderOneBox1',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam4_date_calender2').datetimepicker({
            container:'#sam4_date_calenderOneBox2',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam4_date_calender3').datetimepicker({
            container:'#sam4_date_calenderOneBox3',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam4_date_calender4').datetimepicker({
            container:'#sam4_date_calenderOneBox4',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam4_date_calender5').datetimepicker({
            container:'#sam4_date_calenderOneBox5',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#sam4_date_calender6').datetimepicker({
            container:'#sam4_date_calenderOneBox6',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        var oChoose_book=document.getElementById('choose_book_sam4');
        var oChoose_box=document.getElementById('choose_box_sam4');
        selBookSam4();

        $.ajax({
            url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
            type:"post",
            data: {
                type:1
            },
            dataType: 'json',
            success: function(result){
                if(result==null){
                    alert("初始化企业类型失败！")
                }else{
                    $("#businessCategorySam4").html("");
                    $.each(result, function (i, item) {
                        if (item == null) {
                            return;
                        }
                        if($("#entType_sam4").val()==item["tDictionaryCode"]) {
                            $("<option></option>")
                                .val(item["tDictionaryCode"])
                                .text(item["tDictionaryName"])
                                .appendTo($("#businessCategorySam4"));
                        }
                    });
                }
            }
        });

        oChoose_book.onchange=selBookSam4;

        function selBookSam4() {
            var sBookValue=oChoose_book.value;
//            if(sBookValue=="choose_box2_sam4"){
//                $("#ylqx_cy")[0].reset();
//            }else {
//                $("#ylqx_cybg")[0].reset();
//            }
            for(var i=0; i<oChoose_box.children.length;i++){
                oChoose_box.children[i].style.display='none';
            }
            $('#'+sBookValue).css({display:'block'});
        };



        var title=$("#title_cy_sam4").html();
        var title2=$("#title_bg_sam4").html();
        var checkDate=$("#checkDate_sam4").val();
        var batch=$("#batch_sam4").val();
        if(checkDate==undefined|| checkDate.length==0){
            return;
        }
        if(batch==undefined|| batch.length==0){
            return;
        }
        $("#title_cy_sam4").html(title+checkDate+" 批次:"+batch);
        $("#title_bg_sam4").html(title2+checkDate+" 批次:"+batch);
    });
    function saveCybg4(url){

        var jyjl=$("input[name='jyjl']:checked").val();

        if(url == undefined){
            url='';
        }

        var checkDate=$("#checkDate_sam4").val();
        var taskId=$("#taskId_sam4").val();
        var data={
            url:url,
            businessCategory:$("#businessCategorySam4").val(),
            businessCategoryName:$("#businessCategorySam4").find("option:selected").text(),
            samplingUnit:$("#bcjdw_bg_sam4").val(),
            samplingType:"4",
            formType:"2",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#ylqx_cybg").serializeJson()),
            result:jyjl
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackBgSam4});

        function callBackBgSam4(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/addSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("新增成功",'alert_succ');
                        querySamTaskBasic();
                    }else{
                        alertEase("新增失败! "+data.msg,'alert_err');
                    }
                }
            });
        }

    }

    function saveCySam4(){
        var checkDate=$("#checkDate_sam4").val();
        var taskId=$("#taskId_sam4").val();


        var data={
            area:$("#cy_xzqy_sam4").val(),
            supervisory:$("#cy_jgdw_sam4").val(),
            businessCategory:$("#businessCategorySam4").val(),
            businessCategoryName:$("#businessCategorySam4").find("option:selected").text(),
            samplingUnit:$("#bcydwxx_dwmc_sam4").val(),
            samplingType:"4",
            formType:"1",
            checkDateStr:checkDate,
            taskId:taskId,
            samplingForm:JSON.stringify($("#ylqx_cy").serializeJson())
        };


        confirmMessage('con_punishBasis','确定要新增吗',{width:300,height:150,sure:callBackCySam4});
        function callBackCySam4(){
            $.ajax({
                url:"${pageContext.request.contextPath }/samplingInspection/addSamplingInspection.do",
                type:"post",
                dataType:"json",
                data:data,
                success : function(data) {
                    if(data.result=="true"){
                        alertEase("新增成功",'alert_succ');
                        querySamTaskBasic();
                    }else{
                        alertEase("新增失败! "+data.msg,'alert_err');
                    }
                }
            });
        }
    }

    function saveFjSam4() {
        
        var formData = new FormData();
        var num = ZYFILE.uploadFile.length;
        for(var i=0;i<num;i++){
            formData.append('fileselect',ZYFILE.uploadFile[i]);    //将文件转成二进制形式
        }
       
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/supervisionAndCheck/upload.do",
            async:false,
            contentType: false,    //这个一定要写
            processData: false, //这个也一定要写，不然会报错
            data:formData,
            dataType:'text',    //返回类型，有json，text，HTML。
            success : function(data) {
                if(data){
                	saveCybg4(data);
                }
            },
            error:function(){
                alertEase("保存失败",2);
            }
        });
    }
    initFile4();
    function initFile4(){
    	$("#reportFileSample4").html("");
    	ZYFILE.uploadFile = [];
        ZYFILE.lastUploadFile = [];
        ZYFILE.perUploadFile = [];
        // 初始化插件
     $("#reportFileSample4").zyUpload({
         width            :   "650px",                 // 宽度
         height           :   "400px",                 // 宽度
         itemWidth        :   "140px",                 // 文件项的宽度
         itemHeight       :   "115px",                 // 文件项的高度
         url              :   "/upload/UploadAction",  // 上传文件的路径
         fileType         :   ["jpg","png","bmp","gif"],// 上传文件的类型
         fileSize         :   51200000,                // 上传文件的大小
         multiple         :   true,                    // 是否可以多个文件上传
         dragDrop         :   false,                   // 是否可以拖动上传文件
         tailor           :   false,                   // 是否可以裁剪图片
         del              :   true,                    // 是否可以删除文件
         finishDel        :   false,                   // 是否在上传文件完成后删除预览
         /* 外部获得的回调接口 */
         onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
             console.info("当前选择了以下文件：");
             console.info(selectFiles);
         },
         onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
             console.info("当前删除了此文件：");
             console.info(file.name);
         },
         onSuccess: function(file, response){          // 文件上传成功的回调方法
             console.info("此文件上传成功：");
             console.info(file.name);
             console.info("此文件上传到服务器地址：");
             console.info(response);
             $("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
         },
         onFailure: function(file, response){          // 文件上传失败的回调方法
             console.info("此文件上传失败：");
             console.info(file.name);
         },
         onComplete: function(response){               // 上传完成的回调方法
             console.info("文件上传完成");
             console.info(response);
         }
     });
 }
</script>