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
</div>
<div class="content_box">
    <table class="table search_box marb0 ">
        <thead>
        <tr >
            <th class="width70 noborder">企业类别</th>
            <th class="width220 noborder">
                <select class="select_style1" id="choose_family">
                    <option value ="chooseSample1" >食品安全抽样检验抽样单</option>
                    <option value ="chooseSample2">药品安全抽样检验单</option>
                    <option value="chooseSample3">化妆品安全抽样检验单</option>
                    <option value="chooseSample4">医疗器械抽样检验单</option>
                    <option value="chooseSample5">保健食品抽样检验单</option>
                </select>
            </th>
            <th class="width100 noborder text-right">抽样检验表单</th>
            <th class="width220 noborder ">
                <select class="select_style1 marr10" id="choose_book">
                    <option value ="choose_box1" selected="selected">抽样检验单</option>
                    <option value ="choose_box2">检验报告书</option>
                </select>
            </th>
            <th class="noborder"></th>
        </tr>
        </thead>
    </table>
    <div id="choose_box">
        
    </div>
</div>
<script>
    $(function(){
        var oChooseFamily=document.getElementById('choose_family');
        var oChoose_book=document.getElementById('choose_book');
        var oChoose_box=document.getElementById('choose_box');
        $.get("${pageContext.request.contextPath}/samplingInspection/jump.do?url=chooseSample1&random="+Math.random(),function(data){
            $("#choose_box").html(data);
            selBook();
        });
        oChooseFamily.onchange=function(){
            var url=this.value;
            $.get("${pageContext.request.contextPath}/samplingInspection/jump.do?url="+url+'&random='+Math.random(),function(data){
                $("#choose_box").html(data);
                selBook();
            });
        };
        oChoose_book.onchange=selBook;

        function selBook() {
            var sBookValue=oChoose_book.value;
            for(var i=0; i<oChoose_box.children.length;i++){
                oChoose_box.children[i].style.display='none';
            }
            $('#'+sBookValue).css({display:'block'});
        };
    });
</script>