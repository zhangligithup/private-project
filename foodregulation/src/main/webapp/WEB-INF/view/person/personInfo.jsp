<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

                
<div class="breadcrumb_box">
    <div class="breadcrumb_box_l">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li class="active">人员信息列表</li>
        </ol>
    </div>
    <div class="breadcrumb_box_r">
        <div class="pull-right">
            <a href=""><img src="${pageContext.request.contextPath }/images/ioc/fresh.jpg" class="fresh_btn"></a>
        </div>
    </div>
</div>
<table class="table search_box marb10">
        <thead>
        <tr>
            <!-- 隐藏域 登录人单位code -->
            <input type="hidden" id="taskUnitCode" value="${uitcode}">
            <th>姓名</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="name">
                </div>
            </th>
            <th>单位</th>
            <th>
                <select class="select_style1" id="edepartment">
                        <option value="" selected>请选择</option>                      
                </select>
            </th>
            <th>执法证号</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="zfzh">
                </div>
            </th>
            <th>手机</th>
            <th>
                <div class="search_parent">
                    <input type="text" class="search_input" id="mobile">
                </div>
            </th>
            <th><a class="form_btn" href="#" onclick="queryPersonInfo()">筛选</a></th>
        </tr>
        </thead>
    </table>
<div class="content_box">                      
    <div class="btn_box marb10" >
        <div class="pull-left ">
            <a href="javascript:void (0)" class="form_btn2" data-toggle='modal' data-target='#mymodal105' onclick="addPersonInfo()"><img src="${pageContext.request.contextPath }/images/ioc/add.png"> 添加人员信息</a>
          
        </div>
        <div class="pull-right">
           <div class="r_txt">共有数据 <font id="total_person"></font>条</div>
        </div>
    </div>
    <table class="table table-bordered table2">
        <thead>
        <tr>
            <th class="width60">编号</th>
            <th>姓名</th>
            <th>单位</th>
            <th>职务</th>
            <th>执法证号</th>
            <th>办公电话</th>
            <th>移动电话</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="dataListTbody_person">

        </tbody>
    </table>
    <div id="page_person"></div>
</div>


<script>
$(document).ready(function(){
	queryPersonInfo();  
	querySelectPersonCompany();
	querySelectPersonPost();
	querySelectDepartment();
});

//查询加载单位  下拉框
function querySelectPersonCompany(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:2
		},
		success : function(json) {
			$("#personCompanyId").empty();
			for(var i=0;i<json.length;i++) {
				$("#personCompanyId").append("<option value='"+json[i].id+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}

//查询加载职位 下拉框
function querySelectPersonPost(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
		type:"post",
		dataType:"json",
		data:{
			type:4
		},
		success : function(json) {
			$("#personPostId").empty();
			for(var i=0;i<json.length;i++) {
				$("#personPostId").append("<option value='"+json[i].id+"'>"+json[i].tDictionaryName+"</option>");
			}
		}
	});
}

function queryPersonInfo(curr){
	$("#dataListTbody_person tr").remove();
	var pageNum = 1;
	if(!curr){
		//初始化分页
		$.ajax({
			url : "${pageContext.request.contextPath}/personInfo/selectPersonInfoTotal.do",
			type : "post",
			dataType : "json",
			async: false,
			data:{
				name:$("#name").val(),
				edepartment:$("#edepartment").val(),
				zfzh:$("#zfzh").val(),
				mobile:$("#mobile").val()
			},
			success : function(total) {
				$("#total_person").html(total);
				page("page_person",total,10,10,queryPersonInfo);
			}
		});
	}else{
		pageNum = curr;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/personInfo/selectPersonInfo.do",
		type:"post",
		dataType:"json",
		data:{
			name:$("#name").val(),
            edepartment:$("#edepartment").val(),
            zfzh:$("#zfzh").val(),
            mobile:$("#mobile").val(),
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+(i+1)+"</td><td>"+json[i].personName+"</td><td>"+(json[i].personCompanyName==null?"":json[i].personCompanyName)+"</td><td>"+(json[i].personPostName==null?"":json[i].personPostName)+"</td><td>"+(json[i].perosnLawCard==null?"":json[i].perosnLawCard)+"</td><td>"+(json[i].personOfficeTel==null?"":json[i].personOfficeTel)+"</td><td>"+(json[i].perosnTel==null?"":json[i].perosnTel)+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal105'  onclick='findPersonInfo("+json[i].personId+")'>编辑</a><a href='javascript:void(0)' class='editer_btns edit_btn' onclick='resetPassword()'>重置密码</a><a href='javascript:void(0)' class='editer_btns look_btn' data-toggle='modal' data-target='#fyqx' onclick='getMenu("+json[i].id+")'>赋予权限</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deletePersonInfo("+json[i].personId+","+json[i].id+")'>删除</a></td></tr>";	
			}
			$("#dataListTbody_person").append(tr);
		}
	});
}


function insertPersonInfo(){
	var perosnTel = $("#perosnTel").val();
	if(perosnTel==""){
		alertEase("移动电话不能为空",'alert_err');
		return;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/personInfo/insertPersonInfo.do",
		type:"post",
		dataType:"json",
		data:$('#data_person').serialize(),
		success : function(json) {
			if(json>0){
				alertEase("添加信息成功",'alert_succ');
			}else{
				alertEase("添加信息失败",'alert_err');
			}
			emptyFormPersonInfo();
			queryPersonInfo();
		}
	}); 
}

function findPersonInfo(personId){
	$("#save_person").hide();
	$("#update_person").show();
	$("#title_person").html("修改人员信息 ");
	$("#imgDiv").show();
	$.ajax({
		url:"${pageContext.request.contextPath}/personInfo/findPersonInfo.do",
		type:"post",
		dataType:"json",
		data:{
			personId:personId
		},
		success : function(json) {
			$("input[name='personId']").val(json.personId);
			$("input[name='personName']").val(json.personName);
			$("input[name='perosnLawCard']").val(json.perosnLawCard);
			$("input[name='personOfficeTel']").val(json.personOfficeTel);
			$("input[name='perosnTel']").val(json.perosnTel);
			$("input[name='userName']").val(json.userName);
			$("input[name='id']").val(json.id);
			$("#personImg").attr("src","http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+json.imgUrl);
			$("#personCompanyId").find("option").each(function(){  
                if(json.personCompanyId == $(this).val()){  
                   $(this).attr("selected","selected");  
                   return false;  
                }  
            });
			$("#personPostId").find("option").each(function(){  
                if(json.personPostId == $(this).val()){  
                   $(this).attr("selected","selected");  
                   return false;  
                }  
            });
		}
	});
}

function updatePersonInfo(){
	var formData = new FormData($('#data_person')[0]);
	$.ajax({
		url:"${pageContext.request.contextPath}/personInfo/updatePersonInfo.do",
		type:"post",
		async:false,
        contentType: false,   
        processData: false,
		data:formData,
		success : function(result) {
			if(result>0){
				alertEase("修改信息成功",1);
				$("#mymodal105").modal("hide");
				queryPersonInfo();
			}else{
				alertEase("修改信息失败",2);
			}
		}
	});
}

function deletePersonInfo(personId,id){
	confirmMessage('con_person','你确实要删除吗',{width:300,height:150,sure:callBack}); 
	function callBack(){
		$.ajax({
			url:"${pageContext.request.contextPath}/personInfo/deletePersonInfo.do",
			type:"post",
			dataType:"json",
			data:{
				personId:personId,
				id:id
			},
			success : function(json) {
				if(json>0){
					alertEase("删除信息成功",'alert_succ');
				}else{
					alertEase("删除信息失败",'alert_err');
				}
				queryPersonInfo();
			}
		});	
	}
}
//查询加载监管单位  下拉框
function querySelectDepartment(){
    $.ajax({
        url:"${pageContext.request.contextPath}/dictionary/getDictionary.do",
        type:"post",
        dataType:"json",
        data:{
            type:2
        },
        success : function(json) {
            for(var i=0;i<json.length;i++) {
                $("#edepartment").append("<option value='"+json[i].id+"'>"+json[i].tDictionaryName+"</option>");
            }
        }
    });
}
</script>