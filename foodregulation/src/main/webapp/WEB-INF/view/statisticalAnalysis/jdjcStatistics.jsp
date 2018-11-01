<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.base64.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/tableExport.js"></script>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">统计分析 </a></li>
            <li class="active">企业监督检查统计</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:void(0)" onclick="searchjdjcStatistics()"><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
   
    <table class="table search_box marb10 ">
        <thead>
        <tr >	<!-- <th>
					<div class="search_parent">
						<input id="jdjcStatistics_jcrName" type="text" class="search_input" placeholder="搜索监管单位/检查人员"> 
					</div>
				</th> -->
            <th class="width70 ">开始时间</th>
            <th class="width220 ">
                <div id="jdjcStatistics_count_calenderOneBox1" style="position:relative">
                    <input id="jdjcStatistics_count_calenderOne" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="width70  text-right">截止时间</th>
            <th class="width220  ">
                <div id="jdjcStatistics_count_calenderOneBox2" style="position:relative">
                    <input id="jdjcStatistics_count_calenderTwo" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="text-left"><a class="form_btn2" href="javascript:void(0)" onclick="searchjdjcStatistics()">搜索</a></th>
        </tr>
        </thead>
    </table>
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void(0)" onclick="$('#tableData').tableExport({ type: 'excel', separator: ';', escape: 'false' });" class="form_btn2"><img src="${pageContext.request.contextPath}/images/ioc/export.png" alt="">导出Excel</a>
            <a class="form_btn2" href="javascript:void(0)" onclick="showdiv(0)">查看表格</a> <a class="form_btn2" href="javascript:void(0)" onclick="showdiv(1)">查看柱形图</a>
        </div>
    </div>
    <div class="count_tab" >
        <div id="myTabContent2" class="tab-content">
            <div class="tab-pane  in active" id="jdjcOne">
            </div>
            <div class="tab-pane  in active" id="jdjcOneTu" style="width:100%;height:100%;">
                <div id="jdjcOneTu1"></div>
                <div id="jdjcOneTu2"></div>
            </div>
         </div>

        </div>
        <div id="statisticalJdjc_canvasDiv"></div>
    </div>
<input id="jdjc_tab"  type="hidden" value="1">
<input id="statisticalJdjc_draw"  type="hidden" value="0">
</div>
<script>
function showdiv(type){
	if(type==0){
		$("#jdjcOne").show();
		$("#jdjcOneTu").hide();
	}else{
		$("#jdjcOne").hide();
        $("#jdjcOneTu").show();
	}
}
    var data;
    $(function(){
        $('#jdjcStatistics_count_calenderOne').datetimepicker({
            container:'#jdjcStatistics_count_calenderOneBox1',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#jdjcStatistics_count_calenderTwo').datetimepicker({
            container:'#jdjcStatistics_count_calenderOneBox2',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        searchjdjcStatistics();
    });
function searchjdjcStatistics(){
	var startTime = $("#jdjcStatistics_count_calenderOne").val();
	var endTime = $("#jdjcStatistics_count_calenderTwo").val();
	var jcrName = $("#jdjcStatistics_jcrName").val();
	$.ajax({
   		 url: "${pageContext.request.contextPath}/statistics/jdjcStatistics.do",
            type:"post",
            data: {
           	 startTime:startTime,
           	 endTime:endTime,
           	 jcrName:jcrName
            },
            dataType: 'json',
            success: function(resultData){
            	createTableData('jdjcOne', resultData);
            	createParentEcharts('jdjcOneTu1',resultData);
                createChildEcharts('jdjcOneTu2',resultData);
                $("#jdjcOneTu").hide();
            }
        
   	});
}
    function exportjdjcStatistics(){
    	var startTime = $("#jdjcStatistics_count_calenderOne").val();
    	var endTime = $("#jdjcStatistics_count_calenderTwo").val();
    	var jcrName = $("#jdjcStatistics_jcrName").val();
      $('<form method="post" action="' + "${pageContext.request.contextPath}/statistics/exportJdjcStatistics.do" + '"></form>').appendTo('body').append("<input type='text' name='startTime' value='"+startTime+"'/>")
       .append("<input type='text' name='endTime' value='"+endTime+"'/>")
       .append("<input type='text' name='jcrName' value='"+jcrName+"'/>")
   .submit();
    }
    function GetPercent(num, total) {
    	num = parseFloat(num);
    	total = parseFloat(total);
    	if (isNaN(num) || isNaN(total)) {
    	return "-";
    	}
    	return total <= 0 ? "0%" : (Math.round(num / total * 10000) / 100.00 + "%");
    	} 
    
    function drawStatisticalJdjc(){
    	var tab = $("#jdjc_tab").val();
    	var title="";
    	var width;
    	if(tab==1){
    		title="按企业类别统计";
    		width=1600;
    	}else{
    		title="按监督单位统计";
    		width=2400;
    	}
        var max = getMax(data,'value');
        var length = max.toString().length;
        var number = max.toString().substring(0,1);
        if(parseInt(number)<9){
        	max=parseInt((parseInt(number)+1)+"0000000000".substring(0,length-1))
        }else{
        	max=parseInt(10+"0000000000".substring(0,length-1))
        }
			var chart = new iChart.Column2D({
				render : 'statisticalJdjc_canvasDiv',//渲染的Dom目标,canvasDiv为Dom的ID
				data: data,//绑定数据
				title : title,//设置标题
				width : width,//设置宽度，默认单位为px
				height : 400,//设置高度，默认单位为px
				shadow:true,//激活阴影
				shadow_color:'#c7c7c7',//设置阴影颜色
				coordinate:{//配置自定义坐标轴
					scale:[{//配置自定义值轴
						 position:'left',//配置左值轴	
						 start_scale:0,//设置开始刻度为0
						 end_scale:max,//设置结束刻度为26
						 scale_space:max/10,//设置刻度间距
						 listeners:{//配置事件
							parseText:function(t,x,y){//设置解析值轴文本
								return {text:t}
							}
						}
					}]
				},
				
			});
			//利用自定义组件构造左侧说明文本
			chart.plugin(new iChart.Custom({
					drawFn:function(){
						//计算位置
						var coo = chart.getCoordinate(),
							x = coo.get('originx'),
							y = coo.get('originy');
						//在左上侧的位置，渲染一个单位的文字
						chart.target.textAlign('start')
						.textBaseline('bottom')
						.textFont('600 11px Verdana')
						.fillText('已监督检查企业数(次)',x-40,y-10,false,'#6d869f');
						
					}
			}));

			//调用绘图方法开始绘图
			chart.draw();
			$("#statisticalJdjc_draw").val(1);
	
    }
    
    function getMax(arr, prop) {
        var max;
        for (var i=0 ; i<arr.length ; i++) {
            if (!max || parseInt(arr[i][prop]) > parseInt(max))
                max = arr[i][prop];
        }
        return max;
    }

    function createTableData(id, data) {
        var oContent = document.getElementById(id);
        var oTable = $('<table border="1" cellspacing="0" cellpadding="5" id="tableData" class="table table-bordered table2"></table>');
        var oHead = $('<thead></thead>');
        var oBody = $('<tbody></tbody>');
        var formatRes=formatData(data);
        var total=formatRes.total;
        var company=formatRes.company;
        var oTHeadtr='<tr><td></td>';
        var oTboydyFrist='<tr><td>企业概况</td>';
        for(var j=0; j<total.companyName.length; j++){
            oTHeadtr+='<th >'+total.companyName[j]+'</th>';
            oTboydyFrist+='<td ><p>已监督检查企业数：'+total.companyNum[j]+'</p> <p>监督检查率：'+total.companyJcl[j]+'% </p></td>';

        }
        oTHeadtr+='</tr>';
        oTboydyFrist+='</tr>';
        oHead.html(oTHeadtr);
        oBody.html(oTboydyFrist);
        for(var i=0; i<company[0].companyName.length; i++){
            var templateTr='<tr><td>'+company[0].companyName[i]+'</td>';

            for(var j=0; j<total.companyName.length; j++){
                var templateData=company[j];
                templateTr+='<td><p>已监督检查企业数：'+templateData.companyNum[i]+'</p><p>监督检查率：'+templateData.companyJcl[i]+'% </p> </td>'
            }
            templateTr+='</tr>';
            $(templateTr).appendTo(oBody);
        }

        oTable.append(oHead).append(oBody);
        oTable.appendTo(oContent);

    }

    /*创建单位的Echarts图表
      传入 id 外面空div 的id  和符合结构的data数据
     */
    function createChildEcharts(id,data){
        var oContent=document.getElementById(id);
        var option = {
            title: {
                show:true,
                left:'50',
                top:0,
                text: '柱状图动画延迟'
            },
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['已监督检查企业数', '监督检查率']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '25%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : ['单位1', '单位2', '单位3', '单位4', '单位5', '单位6', '单位7'],
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel:{
                        interval:0,
                        rotate:-30,
                    }

                }
            ],
            yAxis : [
                {
                    type : 'value'
                },
                {
                    type : 'value'
                }
            ],

            series : [
                {
                    name:'已监督检查企业数',
                    type:'bar',
                    itemStyle: {

                        normal: {
                            color:'#8b97e4'
                        }
                    },

                    /* barWidth: '60%',*/
                    data:[1330, 4000, 20000, 7000, 800, 1000, 3000]
                },
                {
                    name:'监督检查率',
                    type:'bar',
                    //barMinHeight:10,
                    itemStyle: {

                        normal: {
                            color:'#8be49e'
                        },

                    },

                    /* barWidth: '60%',*/
                    yAxisIndex: 1,
                    data:[0.3, 0.4, 0.5,0.7, 0.8, 1, 0.3]
                },


            ]
        };
        var companyData=formatData(data).company;
        for(var n=0; n<companyData.length;n++){
            var oDiv=document.createElement('div');
            oDiv.style.width='95%';
            oDiv.style.height='300px';
            oDiv.style.float='left';
            oContent.appendChild(oDiv);
            var myChart=echarts.init(oDiv);
            option.xAxis[0].data=companyData[n].companyName;
            option.series[0].data=companyData[n].companyNum;
            option.series[1].data=companyData[n].companyJcl;
            option.title.text=companyData[n].name;
            myChart.setOption(option);
        }
    }

    /*创建企业的Echarts图表
     传入 id 外面空div 的id  和符合结构的data数据
     */
    function createParentEcharts(id,data){
        var oContent=document.getElementById(id);
        var option = {
            title: {
                show:true,
                left:'50',
                top:0,
                text: '柱状图动画延迟'
            },
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['已监督检查企业数', '监督检查率']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '25%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : ['单位1', '单位2', '单位3', '单位4', '单位5', '单位6', '单位7'],
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel:{
                        interval:0,
                        rotate:-30,
                    }

                }
            ],
            yAxis : [
                {
                    type : 'value'
                },
                {
                    type : 'value'
                }
            ],

            series : [
                {
                    name:'已监督检查企业数',
                    type:'bar',
                    itemStyle: {

                        normal: {
                            color:'#8b97e4'
                        }
                    },

                    /* barWidth: '60%',*/
                    data:[1330, 4000, 20000, 7000, 800, 1000, 3000]
                },
                {
                    name:'监督检查率',
                    type:'bar',
                    //barMinHeight:10,
                    itemStyle: {

                        normal: {
                            color:'#8be49e'
                        },

                    },

                    /* barWidth: '60%',*/
                    yAxisIndex: 1,
                    data:[0.3, 0.4, 0.5,0.7, 0.8, 1, 0.3]
                },


            ]
        };
        var companyData=formatData(data).total;
        var oDiv=document.createElement('div');
        oDiv.style.width='95%';
        oDiv.style.height='300px';
        oDiv.style.float='left';
        oContent.appendChild(oDiv);
        var myChart=echarts.init(oDiv);
        option.xAxis[0].data=companyData.companyName;
        option.series[0].data=companyData.companyNum;
        option.series[1].data=companyData.companyJcl;
        option.title.text=companyData.name;
        myChart.setOption(option);
    }
    //格式化数据，返回企业和单位的数据
    function formatData(data){
        var total={
            name:"企业概况",
            companyName:[],
            companyNum:[],
            companyJcl:[]
        };
        var  company=[];
        for(var i=0; i<data.length; i++){
            total.companyName.push(data[i].entTypeName);
            total.companyNum.push(data[i].hasTotal);
            total.companyJcl.push(data[i].jcl);

            if(data[i].list!='undefined'){
                var companyDetail={
                    name:data[i].entTypeName,
                    companyName:[],
                    companyNum:[],
                    companyJcl:[]
                };
                var template=data[i].list;
                for(var j=0; j<template.length; j++){
                    companyDetail.companyName.push(template[j].unitName);
                    companyDetail.companyNum.push(template[j].hasTotal);
                    companyDetail.companyJcl.push(template[j].jcl);
                }
                company.push(companyDetail);
            }
        }
        return {
            total:total,
            company:company
        }
    }
</script>
