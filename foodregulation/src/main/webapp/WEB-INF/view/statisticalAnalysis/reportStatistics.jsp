<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">统计分析 </a></li>
            <li class="active">投诉举报统计</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href="javascript:void(0)" onclick="searchReportStaisticsList()"><img src="${pageContext.request.contextPath}/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<div class="content_box">
    <table class="table search_box marb10 ">
        <thead>
        <tr ><!-- <th>
					<div class="search_parent">
						<input id="reportStatistics_address" type="text" class="search_input" placeholder="搜索行政区"> 
					</div>
				</th>
            <th>投诉类别</th>
			<th><select id="reportStatistics_reportTypeId" class="select_style1">
			<option value="">请选择投诉类别</option>
			<option value="47">食品</option>
			<option value="48">药品</option>
			
			</select> -->
            <th class="width70 ">开始时间</th>
            <th class="width220 ">
                <div id="reportStatistics_count_calenderOneBox1" style="position:relative">
                    <input id="reportStatistics_count_calenderOne" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="width70  text-right">截止时间</th>
            <th class="width220  ">
                <div id="reportStatistics_count_calenderOneBox2" style="position:relative">
                    <input id="reportStatistics_count_calenderTwo" class="login_input bg_calender  width260" size="16" type="text" value="">
                </div>
            </th>
            <th class="text-left"><a class="form_btn2" href="javascript:void(0)" onclick="searchReportStaisticsList()">搜索</a>  <a class="form_btn2" href="javascript:void(0)" onclick="drawStatisticalReport()">查看柱形图</a></th>
        </tr>
        </thead>
    </table>
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void(0)" onclick="exportReport()" class="form_btn2"><img src="${pageContext.request.contextPath}/images/ioc/export.png" alt="">导出Excel</a>
        </div>
    </div>
    <div class="count_tab">
        <ul id="myTab2" class="nav nav-tabs">
            <li class="active">
                <a href="#reportOne" onclick="changereportStatisticsTab(1)" data-toggle="tab">按行政区域</a>
            </li>
            <li>
                <a href="#reportTwo" onclick="changereportStatisticsTab(2)" data-toggle="tab">按投诉类型</a>
            </li>
            <li>
                <a href="#reportThree" onclick="changereportStatisticsTab(3)" data-toggle="tab">按监管单位</a>
            </li>
        </ul>
        <div id="myTabContent2" class="tab-content">
            <div class="tab-pane  in active" id="reportOne">
                <table class="table table-bordered table2">
                <thead>
                    <tr id="reportAreaTh">
                        <th> 工业区</th>
                        <th>南堡开发区</th>
                        <th>生态城</th>
                        <th>唐海镇</th>
                        <th>柳赞镇</th>
                        <th>滨海镇</th>
                        <th>一农场</th>
                        <th>三农场</th>
                        <th>四农场</th>
                        <th>五农场</th>
                        <th>六农场</th>
                        <th>七农场</th>
                        <th>八农场</th>
                        <th>九农场</th>
                        <th>十农场</th>
                        <th>十一农场</th>
                        <th>八里滩</th>
                        <th>石里海</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="reportAreaStatistics">
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
                        <td></td>
                    </tr>
                    </tbody>
                  
                </table>
            </div>
            <div class="tab-pane " id="reportTwo">
                <table class="table table-bordered table2">
                      <thead>
                    <tr id="reportTypeTh">
                        <th>食品</th>
                        <th>药品</th>
                        <th>保健食品</th>
                        <th>化妆品</th>
                        <th>医疗器械</th>
                        <th>其他</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="reportTypeStatistics">
                        <td></td>
                        <td></td>
                    </tr>
               
                    </tbody>
                </table>
            </div>
             <div class="tab-pane " id="reportThree">
                <table class="table table-bordered table2">
                      <thead>
                    <tr id="reportUnitTh">
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
                    <tr id="reportUnitStatistics">
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
 <div id="statisticalReport_canvasDiv"></div>
</div>
<input id="reportStatistics_tab"  type="hidden" value="1">
<input id="statisticalReport_draw"  type="hidden" value="0">
<script>
var data;
    $(function(){
        $('#reportStatistics_count_calenderOne').datetimepicker({
            container:'#reportStatistics_count_calenderOneBox1',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#reportStatistics_count_calenderTwo').datetimepicker({
            container:'#reportStatistics_count_calenderOneBox2',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        searchReportStaisticsList();
    });
    function searchReportStaisticsList(){
    	var tab = $("#reportStatistics_tab").val();
    	var startTime = $("#reportStatistics_count_calenderOne").val();
    	var endTime = $("#reportStatistics_count_calenderTwo").val();
    	var reportTypeId = $("#reportStatistics_reportTypeId").val();
    	var address = $("#reportStatistics_address").val();
    	if(tab==2){
    		$.ajax({
        		 url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
                 type:"post",
                 data: {
                	 type:3
                 },
                 dataType: 'json',
                  success: function(result){
                     	$.ajax({
                      		 url: "${pageContext.request.contextPath}/statistics/reportTypeStatistics.do",
                               type:"post",
                               data: {
                              	 startTime:startTime,
                              	 endTime:endTime,
                              	 address:address,
                              	 reportTypeId
                              	
                               },
                               dataType: 'json',
                               success: function(resultData){
                             	 $("#reportTypeStatistics").html("");
                             	 $("#reportTypeTh").html("");
                           	  	 var html="";
                           	  	 var th="";
                           	  	 data=[];
                           	  $.each(result, function (i, item) {
                                  if (item == null) {
                                      return;
                                  }
                                  th+="<th>"+item.tDictionaryName+"</th>"
                                  var num;
                                  if(resultData[item.tDictionaryCode]){
                               	  num=resultData[item.tDictionaryCode];
                                  }else{
                               	  num=0;
                                  }
                                  html+="<td>"+num+"</td>"; 
                                  var d = {name :item.tDictionaryName,value : num,color:'#a5c2d5'};
                                  data.push(d);
                              });
                       	  	  $("#reportTypeStatistics").html(html);
                       	      $("#reportTypeTh").html(th);
                             	
                           	if($("#statisticalReport_draw").val()==1){
                              		drawStatisticalReport();
                              	}
                               	}
                           
                      	});
                	  }
                  });
 
    	}else if(tab==1){
    		$.ajax({
        		 url: "${pageContext.request.contextPath}/dictionary/getDictionary.do",
                 type:"post",
                 data: {
                	 type:0
                 },
                 dataType: 'json',
                 success: function(result){
                 	if(result==null){
                 		alert("按行政区域统计失败！")
                 	}else{
                 		$.ajax({
                     		 url: "${pageContext.request.contextPath}/statistics/reportAreaStatistics.do",
                              type:"post",
                              data: {
                             	 startTime:startTime,
                             	 endTime:endTime,
                             	 address:address,
                             	 reportTypeId
                              },
                              dataType: 'json',
                              success: function(resultData){
                            	 $("#reportAreaStatistics").html("");
                            	 $("#reportAreaTh").html("");
                           	     var html="";
                           	     var th="";
                           	  	  data=[];
                           	  $.each(result, function (i, item) {
                                      if (item == null) {
                                          return;
                                      }
                                      th+="<th>"+item.tDictionaryName+"</th>"
                                      var num;
                                      if(resultData[item.tDictionaryCode]){
                                   	  num=resultData[item.tDictionaryCode];
                                      }else{
                                   	  num=0;
                                      }
                                      html+="<td>"+num+"</td>"; 
                                      var d = {name :item.tDictionaryName,value : num,color:'#a5c2d5'};
                                      data.push(d);
                                  });
                            	$("#reportAreaStatistics").html(html);
                            	$("#reportAreaTh").html(th);
                           	if($("#statisticalReport_draw").val()==1){
                              		drawStatisticalReport();
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
                 		alert("按企业类别统计失败！")
                 	}else{
                 		$.ajax({
                    		 url: "${pageContext.request.contextPath}/statistics/reportUnitStatistics.do",
                             type:"post",
                             data: {
                           	  startTime:startTime,
                               	 endTime:endTime,
                               	 address:address,
                               	 reportTypeId
                             },
                             dataType: 'json',
                             success: function(resultData){
                             $("#jdjcUnitStatistics").html("");
                             $("#jdjcUnitTh").html("");
                       	  	 var html="";
                       	     var th="";
                       	     data=[];
                       	  $.each(result, function (i, item) {
                                  if (item == null) {
                                      return;
                                  }
                                  th+="<th>"+item.tDictionaryName+"</th>"
                                  var num;
                                  if(resultData[item.tDictionaryCode]){
                               	  num=resultData[item.tDictionaryCode];
                                  }else{
                               	  num=0;
                                  }
                                  html+="<td>"+num+"</td>"; 
                                  var d = {name :item.tDictionaryName,value : num,color:'#a5c2d5'};
                                  data.push(d);
                              });
                           	$("#reportUnitStatistics").html(html);
                        	$("#reportUnitTh").html(th);
                          	
                          	if($("#statisticalReport_draw").val()==1){
                          		drawStatisticalReport();
                          	}
                             	}
                         
                    	});
                 		}
                 	}});
    	
    	}

    }
    function changereportStatisticsTab(index){
    	$("#reportStatistics_tab").val(index);
    	searchReportStaisticsList()
    }
    function exportReport(){
    	var startTime = $("#reportStatistics_count_calenderOne").val();
    	var endTime = $("#reportStatistics_count_calenderTwo").val();
    	var reportTypeId = $("#reportStatistics_reportTypeId").val();
    	var address = $("#reportStatistics_address").val();

   	 
   	$('<form method="post" action="' + "${pageContext.request.contextPath}/statistics/exportReportStatistics.do" + '"></form>').appendTo('body').append("<input type='text' name='startTime' value='"+startTime+"'/>")
    .append("<input type='text' name='endTime' value='"+endTime+"'/>")
    .append("<input type='text' name='reportTypeId' value='"+reportTypeId+"'/>")
    .append("<input type='text' name='address' value='"+address+"'/>").submit().remove();
    }
    function getMax(arr, prop) {
        var max;
        for (var i=0 ; i<arr.length ; i++) {
            if (!max || parseInt(arr[i][prop]) > parseInt(max))
                max = arr[i][prop];
        }
        return max;
    }
    function drawStatisticalReport(){
    	var tab = $("#reportStatistics_tab").val();
    	var title="";
    	var width;
    	if(tab==1){
    		title="按行政区统计";
    		width=1600;
    	}else if(tab==3){
    		title="按监督单位统计";
    		width=2400;
    	}else{
    		title="按投诉类型统计";
    		width=800;
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
				render : 'statisticalReport_canvasDiv',//渲染的Dom目标,canvasDiv为Dom的ID
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
						.fillText('投诉举报次数(次)',x-40,y-10,false,'#6d869f');
						
					}
			}));

			//调用绘图方法开始绘图
			chart.draw();
			$("#statisticalReport_draw").val(1);
    }
</script>
