<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="breadcrumb_box">
	<div class="breadcrumb_box_l">
		<ol class="breadcrumb">
			<li><a href="#">首页</a></li>
			<li><a href="#">抽样检查</a></li>
			<li class="active">抽样检查信息列表</li>
		</ol>
	</div>
</div>
<div class="content_box">
	<table class="table search_box marb10">
		<thead>
			<tr>
				<th>
					<div class="search_parent">
						<input id="samplingInspectionIndex_searchBusiness${param.taskId}" type="text" class="search_input" placeholder="搜索抽检单位">
					</div>
				</th>
				<th>企业类别</th>
				<th><select id="samplingInspectionIndex_businessCategory${param.taskId}" class="select_style1">
				</select></th>
				<th>抽检日期</th>
				<th>
					<div id="samplingInspectionIndex_calenderOneBox1${param.taskId}" style="position: relative">
						<input id="samplingInspectionIndex_calenderOne${param.taskId}" class="bg_calender" size="16" type="text"
							value="">
					</div>

				</th>
				<th><a class="form_btn2" href="javascript:void(0)" onclick="searchSamplingInspectionList${param.taskId}()">搜索</a></th>
			</tr>
		</thead>
		<input id="samplingInspectionIndex_pageIndex${param.taskId}"  type="hidden" value="1">
		<input id="samplingInspectionIndex_pageSize${param.taskId}"  type="hidden" value="10">
	</table>
	<table class="table table-bordered table2">
		<thead>
			<tr>
				<th class="width60">ID</th>
				<th>抽检单位</th>
				<th>抽样检验单类别</th>
				<th>企业类别</th>
				<th>抽检时间</th>
				<th>执法人员</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="samplingInspectiontable${param.taskId}">
		
		</tbody>
	</table>
<div id="samplingPage${param.taskId}"></div>
</div>
<script>
    $(function(){
        $('#samplingInspectionIndex_calenderOne${param.taskId}').datetimepicker({
            container:'#samplingInspectionIndex_calenderOneBox1${param.taskId}',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
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
               	 $("#samplingInspectionIndex_businessCategory${param.taskId}").html("");
                 $("<option></option>") .val("").text("请选择").appendTo("#samplingInspectionIndex_businessCategory${param.taskId}");
                 $.each(result, function (i, item) {
                     if (item == null) {
                         return;
                     }
                     $("<option></option>")
                             .val(item["tDictionaryCode"])
                             .text(item["tDictionaryName"])
                             .appendTo($("#samplingInspectionIndex_businessCategory${param.taskId}"));
                 });
               	}
               }
      	});
  		searchSamplingInspectionList${param.taskId}();
    });
    function searchSamplingInspectionList${param.taskId}(cur){
    	if(cur){
    		$("#samplingInspectionIndex_pageIndex${param.taskId}").val(cur);
    	}
    	var pageIndex = $("#samplingInspectionIndex_pageIndex${param.taskId}").val();
    	var pageSize = $("#samplingInspectionIndex_pageSize${param.taskId}").val();
    	var searchBusiness = $("#samplingInspectionIndex_searchBusiness${param.taskId}").val();
    	var businessCategory = $("#samplingInspectionIndex_businessCategory${param.taskId}").val();
    	var calenderOne = $("#samplingInspectionIndex_calenderOne${param.taskId}").val();
    	
		$.ajax({
     		 url: "${pageContext.request.contextPath}/samplingInspection/getSamplingInspectionList.do",
              type:"post",
              data: {
             	 pageIndex:pageIndex,
             	 pageSize:pageSize,
             	 businessCategory:businessCategory,
             	 samplingUnit:searchBusiness,
             	 operateTime:calenderOne,
				  taskId:${param.taskId}
              },
              dataType: 'json',
              success: function(result){
            	
              	if(result!=null&&result.errorCode==200){
              	var total = result.count;
              	$("#samplingPage${param.taskId}").html("");
              	page("samplingPage",total,10,10,searchSamplingInspectionList${param.taskId});
              	$("#samplingInspectiontable${param.taskId}").html("");
              	var html="";
              	  $.each(result.result, function (i, item) {
                      if (item == null) {
                          return;
                      }
                  	html+="<tr>";
                  	html+="<td>"+item.id+"</td>";
                  	html+="<td>"+item.samplingUnit+"</td>";
                  	if(item.formType==1){
                  		html+="<td>抽样检验单</td>";
                  	}else if(item.formType==2){
                  		html+="<td>检验报告书</td>";
                  	}
                  	html+="<td>"+item.businessCategoryName+"</td>";
				    var newDate = new Date(item.createTime);

                  	html+="<td>"+newDate.toLocaleDateString()+"</td>";
                  	html+="<td>"+item.operatorName+"</td>";
    				html+="<td class='width220'>";
    				html+="<ul id='collapse2'><li id='li-cyjc-"+item.id+"'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='seeSample("+item.id+","+item.samplingType+","+item.formType+")'>查看</a></li>";
    				if(item.formType==1){
    				    html+="<li id='li-cyjcp-"+item.id+"'><a href='javascript:void(0)' class='editer_btns look_btn' onclick='printShowSample("+item.id+","+item.samplingType+","+item.formType+")'>打印预览</a></li>";
    				}
    				html+="</ul><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deleteSamplingInspectionById("+item.id+")'>删除</a></td>";
    				html+="</tr>";
                  });
              	$("#samplingInspectiontable${param.taskId}").html(html);
              	}
              }
     	});
    }
    
    function deleteSamplingInspectionById(id){
    	confirmMessage("deleteSamplingInspectionById","确认要删除吗？",{width:300,height:150,sure:callBack});
    	function callBack(){
    		$.ajax({
         		 url: "${pageContext.request.contextPath}/samplingInspection/deleteSamplingInspectionById.do",
                  type:"post",
                  data: {
                  	samplingInspectionId:id
                  },
                  success: function(result){
                  	if(result>0){
                  		alertEase("删除成功！",1);
                  		searchSamplingInspectionList();
                  	}else{
                  		alertEase("删除失败！",2);
                  	}
                  }
         	});
    	}
    
    	
    }

    function seeSample(id, samplingType, formType) {
		creatTabPage("cyjc-"+id,'${pageContext.request.contextPath }/samplingInspection/jump.do?url=seeSample'+samplingType+'&random='+Math.random()+'&id='+id+"&formType="+formType);
	}
    function printShowSample(id, samplingType, formType) {
		window.open('${pageContext.request.contextPath }/samplingInspection/jumpPrint.do?url=seeSamplePrint'+samplingType+'&random='+Math.random()+'&id='+id+"&formType="+formType);
	}
</script>