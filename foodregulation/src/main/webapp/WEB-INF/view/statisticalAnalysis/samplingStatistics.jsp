<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">统计分析 </a></li>
            <li class="active">企业抽样检查统计</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:void(0)" onclick="searchSamplingStatisticsList()"><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <table class="table search_box marb10 ">
        <thead>
        <tr >
            <th class="width70 ">开始时间</th>
            <th class="width220 ">
                <div id="samplingStatistics_count_calenderOneBox1" style="position:relative">
                    <input id="samplingStatistics_count_calenderOne" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="width70  text-right">截止时间</th>
            <th class="width220  ">
                <div id="samplingStatistics_count_calenderOneBox2" style="position:relative">
                    <input id="samplingStatistics_count_calenderTwo" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="text-left"><a class="form_btn2" href="javascript:void(0)" onclick="searchSamplingStatisticsList()">搜索</a>   <a class="form_btn2" href="javascript:void(0)" onclick="drawStatisticalSampling()">查看柱形图</a></th>
        </tr>
        </thead>
    </table>
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void(0)" onclick="exportSamplingStatistics()" class="form_btn2"><img src="${pageContext.request.contextPath}/images/ioc/export.png" alt="">导出Excel</a>
        </div>
    </div>
    <div class="count_tab">
     <ul id="myTab2" class="nav nav-tabs">
            <li class="active">
                <a href="#samplingOne" onclick="changeSamplingTab(1)" data-toggle="tab">按企业类别</a>
            </li>
            <li>
                <a href="#samplingTwo" onclick="changeSamplingTab(2)" data-toggle="tab">按委托单位</a>
            </li>
        </ul>
        <div id="myTabContent2" class="tab-content">
            <div class="tab-pane  in active" id="samplingOne">
                <table class="table table-bordered table2">
                    <thead>
                    <tr id="samplingTh">
                        <th>
                            食品生</br>
                            产企业</th>
                        <th>食品流</br>
                            通企业</th>
                        <th>食品餐</br>
                            饮企业</th>
                        <th>食品五</br>
                            小行业</th>
                        <th>酒类销</br>
                            售企业</th>
                        <th>保健食品</br>
                            销售企业</th>
                        <th>
                            化妆品</br>
                            销售企业</th>
                        <th>药品零</br>
                            售企业</th>
                        <th>医疗器械</br>
                            销售企业</th>
                        <th>医疗器械</br>
                            使用企业</th>
                        <th>食用农产</br>
                            品经营户</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="samplingStatistics">
                        <td> &nbsp;</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
               
                    </tbody>
                </table>
            </div>
                   <div class="tab-pane " id="samplingTwo">
                <table class="table table-bordered table2">
                                   <thead>
                    <tr id="samplingUnitTh">
                        <th>局领导</th>
                        <th>第一分局</th>
                        <th>第二分局</th>
                        <th>第三分局</th>
                        <th>第四分局</th>
                        <th>第五分局</th>
                        <th>第六分局</th>
                        <th>第七分局</th>
                        <th>稽查局</th>
                        <th>食品安全综合协调科</th>
                        <th>食品生产监管科</th>
                        <th>食品流通监管科</th>
                        <th>食品餐饮监管科</th>
                        <th>食品监管所</th>
                        <th>药品医疗器械监管科</th>
                        <th>化妆保健食品监管科</th>
                        <th>酒类监管科</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="samplingUnitStatistics">
                        <td> &nbsp;</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
     <div id="statisticalSampling_canvasDiv"></div>
<input id="sampling_tab"  type="hidden" value="1">
<input id="statisticalSampling_draw"  type="hidden" value="0">
</div>
<script>
    var data;
	function changeSamplingTab(index){
		$("#sampling_tab").val(index);
		searchSamplingStatisticsList();
	}
    $(function(){
        $('#samplingStatistics_count_calenderOne').datetimepicker({
            container:'#samplingStatistics_count_calenderOneBox1',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#samplingStatistics_count_calenderTwo').datetimepicker({
            container:'#samplingStatistics_count_calenderOneBox2',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        searchSamplingStatisticsList();
    });
    function searchSamplingStatisticsList(){
    	var startTime = $("#samplingStatistics_count_calenderOne").val();
    	var endTime = $("#samplingStatistics_count_calenderTwo").val();
    	var tab = $("#sampling_tab").val();
    	if(tab==1){
    		$.ajax({
       		 url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
                type:"post",
                data: {
               	 type:1
                },
                dataType: 'json',
                success: function(result){
                	if(result==null){
                		alert("按企业类别统计失败！")
                	}else{
                		$.ajax({
                     		 url: "${pageContext.request.contextPath}/statistics/samplingStatistics.do",
                              type:"post",
                              data: {
                             	 startTime:startTime,
                             	 endTime:endTime
                              },
                              dataType: 'json',
                              success: function(resultData){
                            	 $("#samplingStatistics").html("");
                            	 $("#samplingTh").html("");
                            	 var successEnterpriseTypeStatistics = resultData.successEnterpriseTypeStatistics;
                            	 resultData = resultData.allEnterpriseTypeStatistics;
                            	 var html="";
                           	  	 var th="";
                           	 	 data=[];
                           	 	$.each(result, function (i, item) {
                                    if (item == null) {
                                        return;
                                    }
                                    th+="<th>"+item.tDictionaryName+"</th>"
                                    var num;
                                    var successNum;
                                    if(resultData[item.tDictionaryCode]){
                                 	  num=resultData[item.tDictionaryCode];
                                    }else{
                                 	  num=0;
                                    }
                                    if(successEnterpriseTypeStatistics[item.tDictionaryCode]){
                                  	  successNum=successEnterpriseTypeStatistics[item.tDictionaryCode];
                                      }else{
                                    	  successNum=0;
                                      }
                                    html+="<td>抽检数量:"+num+"</BR>合格率"+GetPercent(successNum,num)+"</td>";
                                    var d = {name :item.tDictionaryName,value : num,color:'#a5c2d5'};
                                    data.push(d);
                                });
                            	$("#samplingStatistics").html(html);
                            	$("#samplingTh").html(th);
                           	if($("#statisticalSampling_draw").val()==1){
                           		drawStatisticalSampling();
                           	}
                              }
                          
                     	});
                		}
                	}});
    	  	
    	}else{
    		$.ajax({
          		 url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
                   type:"post",
                   data: {
                  	 type:2
                   },
                   dataType: 'json',
                   success: function(result){
                   	if(result==null){
                   		alert("按委托单位统计失败！")
                   	}else{
                   		$.ajax({
                    		 url: "${pageContext.request.contextPath}/statistics/samplingUnitStatistics.do",
                             type:"post",
                             data: {
                            	 startTime:startTime,
                            	 endTime:endTime
                             },
                             dataType: 'json',
                             success: function(resultData){
                           	 $("#samplingUnitStatistics").html("");
                           	 $("#samplingUnitTh").html("");
                           	 var successEnterpriseTypeStatistics = resultData.successEnterpriseTypeStatistics;
                           	 resultData = resultData.allEnterpriseTypeStatistics;
                           	 var html="";
                       	  	 var th="";
                       	 	 data=[];
                       	 	$.each(result, function (i, item) {
                                if (item == null) {
                                    return;
                                }
                                th+="<th>"+item.tDictionaryName+"</th>"
                                var num;
                                var successNum;
                                if(resultData[item.tDictionaryCode]){
                             	  num=resultData[item.tDictionaryCode];
                                }else{
                             	  num=0;
                                }
                                if(successEnterpriseTypeStatistics[item.tDictionaryCode]){
                              	  successNum=successEnterpriseTypeStatistics[item.tDictionaryCode];
                                  }else{
                                	  successNum=0;
                                  }
                                html+="<td>抽检数量:"+num+"</BR>合格率"+GetPercent(successNum,num)+"</td>";
                                var d = {name :item.tDictionaryName,value : num,color:'#a5c2d5'};
                                data.push(d);
                            });
                           	$("#samplingUnitStatistics").html(html);
                        	$("#samplingUnitTh").html(th);
                           	if($("#statisticalSampling_draw").val()==1){
                           		drawStatisticalSampling();
                           	}
                             }
                         
                    	});
                   		}
                   	}});
    	  	
    	}
      
               

    }
    function exportSamplingStatistics(){
    	var startTime = $("#samplingStatistics_count_calenderOne").val();
    	var endTime = $("#samplingStatistics_count_calenderTwo").val();
        $('<form method="post" action="' + "${pageContext.request.contextPath}/statistics/exportSamplingStatistics.do" + '"></form>').appendTo('body').append("<input type='text' name='startTime' value='"+startTime+"'/>")
       .append("<input type='text' name='endTime' value='"+endTime+"'/>")
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
    
    function drawStatisticalSampling(){
    	var tab = $("#sampling_tab").val();
    	var title="";
    	var width;
    	if(tab==1){
    		title="按企业类别统计";
    		width=1600;
    	}else if(tab==2){
    		title="按委托单位统计";
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
				render : 'statisticalSampling_canvasDiv',//渲染的Dom目标,canvasDiv为Dom的ID
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
						.fillText('抽样数(次)',x-40,y-10,false,'#6d869f');
						
					}
			}));

			//调用绘图方法开始绘图
			chart.draw();
			$("#statisticalSampling_draw").val(1);
    }
    function getMax(arr, prop) {
        var max;
        for (var i=0 ; i<arr.length ; i++) {
            if (!max || parseInt(arr[i][prop]) > parseInt(max))
                max = arr[i][prop];
        }
        return max;
    }
</script>
