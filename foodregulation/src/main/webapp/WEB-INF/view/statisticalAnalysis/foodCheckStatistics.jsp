<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.base64.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/tableExport.js"></script>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">统计分析 </a></li>
            <li class="active">食品快检统计</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:void(0)" onclick="searchfoodcheckStatistics()"><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
   
    <table class="table search_box marb10 ">
        <thead>
        <tr >
            <th class="width70 ">开始时间</th>
            <th class="width220 ">
                <div id="foodcheckStatistics_count_calenderOneBox1" style="position:relative">
                    <input id="foodcheckStatistics_count_calenderOne" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="width70  text-right">截止时间</th>
            <th class="width220  ">
                <div id="foodcheckStatistics_count_calenderOneBox2" style="position:relative">
                    <input id="foodcheckStatistics_count_calenderTwo" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="text-left"><a class="form_btn2" href="javascript:void(0)" onclick="searchfoodcheckStatistics()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <div class="count_tab" >
        <div class="tab-content">
            <div class="tab-pane  in active" style="width:100%;height:100%;">
                <div id="qualifiedResult" style="width: 600px;height:300px;"></div>
                <div id="projectResult" style="width: 1800px;height:300px;"></div>
                <div id="sampleResult" style="width: 1800px;height:300px;"></div>
                <div id="detectionResult" style="width: 1800px;height:300px;"></div>
            </div>
         </div>
    </div>
</div>
<script>
$(function(){
    $('#foodcheckStatistics_count_calenderOne').datetimepicker({
        container:'#foodcheckStatistics_count_calenderOneBox1',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format:'yyyy-mm-dd'
    });
    $('#foodcheckStatistics_count_calenderTwo').datetimepicker({
        container:'#foodcheckStatistics_count_calenderOneBox2',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format:'yyyy-mm-dd'
    });
    searchfoodcheckStatistics();
});
function searchfoodcheckStatistics(){
    var startDate = $("#foodcheckStatistics_count_calenderOne").val();
    var endDate = $("#foodcheckStatistics_count_calenderTwo").val();
    $.ajax({
         url: "${pageContext.request.contextPath}/statistics/checkfoodStatistics.do",
            type:"post",
            data: {
                startDate:startDate,
                endDate:endDate
            },
            dataType: 'json',
            success: function(resultData){
                createQualifiedResultEcharts('qualifiedResult',resultData.qualifiedResult);
                createCommonEcharts('projectResult',resultData.projectResult,"项目概况");
                createCommonEcharts('sampleResult',resultData.sampleResult,"样品概况");
                createCommonEcharts('detectionResult',resultData.detectionResult,"检测企业概况");
            }
        
    });
}
function createQualifiedResultEcharts(id,data){
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById(id));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '食检总概况'
        },
        tooltip: {},
        legend: {
            data:['合格数', '不合格数']
        },
        xAxis: {
            data: ["食检总概况"]
        },
        yAxis: {},
        series: [{
            name: '合格数',
            type: 'bar',
            data: [data.qualified],
            itemStyle: {
                // 普通样式。
                normal: {
                    // 点的颜色。
                    color: '#8b97e4'
                }/* ,
                // 高亮样式。
                emphasis: {
                    // 高亮时点的颜色。
                    color: 'blue'
                } */
            }
        },
        {
            name: '不合格数',
            type: 'bar',
            data: [data.noQualified],
            itemStyle: {
                // 普通样式。
                normal: {
                    // 点的颜色。
                    color: '#8be49e'
                }/* ,
                // 高亮样式。
                emphasis: {
                    // 高亮时点的颜色。
                    color: 'blue'
                } */
            }
        }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}
function createCommonEcharts(id,data,title){
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById(id));
    var xAxis = [];
    var qualified = [];
    var noQualified = [];
    for(var i=0;i<data.length;i++){
        xAxis.push(data[i].name);
        qualified.push(data[i].qualified);
        noQualified.push(data[i].noQualified);
    }
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: title
        },
        tooltip: {},
        legend: {
            data:['合格数', '不合格数']
        },
        xAxis: {
            data: xAxis,
            axisTick: {
                alignWithLabel: true
            },
            axisLabel:{
                interval:0,
                rotate:-30,
            }
        },
        yAxis: {},
        series: [{
            name: '合格数',
            type: 'bar',
            data: qualified,
            itemStyle: {
                // 普通样式。
                normal: {
                    // 点的颜色。
                    color: '#8b97e4'
                }/* ,
                // 高亮样式。
                emphasis: {
                    // 高亮时点的颜色。
                    color: 'blue'
                } */
            }
        },
        {
            name: '不合格数',
            type: 'bar',
            data: noQualified,
            itemStyle: {
                // 普通样式。
                normal: {
                    // 点的颜色。
                    color: '#8be49e'
                }/* ,
                // 高亮样式。
                emphasis: {
                    // 高亮时点的颜色。
                    color: 'blue'
                } */
            }
        }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}
</script>
