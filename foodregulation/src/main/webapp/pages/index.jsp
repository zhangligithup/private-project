<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>食品药品动态监管系统</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zoom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/imgUpload/zyupload-1.0.0.min.css">
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/fileinput.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/fileinput_locale_zh.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/echarts.min.js"></script>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zoom.js"></script>
    
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/imgUpload/zyupload.basic-1.0.0.min.js"></script>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <section class="food_section">
    <header class="food_header">
    <div class="logo pull-left">
        食药监管系统
    </div>
    <nav class="header_r pull-right">
        <ul class="header_r_ul " id="right_head_menu">
        <c:if test="${sessionAdmin.isSuper==1}">
            <li class="people dropdown" >
                <div id="dropdownMenu1" data-toggle="dropdown">人员管理 <span class="glyphicon glyphicon-chevron-down"></span></div>
                <ul class="header_r_pop  dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li id="li-9999"><a href="javascript:void(0)"  onclick="creatTabPage(9999,'${pageContext.request.contextPath }/personInfo/personInfo.do')">人员列表</a></li>
                    <li><a href="javascript:void(0)" data-toggle='modal' data-target='#mymodal105' onclick="addPersonInfo()">添加人员</a></li>
                </ul>
            </li>
            </c:if>
            <li class="admin_number">
                <div id="dropdownMenu2" data-toggle="dropdown">${sessionAdmin.username }<input type="hidden" value="${sessionAdmin.username }" name="username"><span class="glyphicon glyphicon-chevron-down"></span></div>
                <ul class="header_r_pop dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                    <li><a href="javascript:void(0)" data-toggle='modal' data-target='#mymodareset'>修改密码</a></li>
                    <li><a href="${pageContext.request.contextPath }/UserQuitServlet">退出</a></li>
                </ul>
            </li>
        </ul>

    </nav>
   </header>
    <div class="food_left_menu">
        <ul class="panel-group  food_left_ul" id="accordion">
	           
        </ul>
    </div>
    <div class="food_right_section">
        <div class="module_right_page">
            <ul class="nav nav-tabs " id="myTab">
                <li class="active"><b class="nav_bg_left"></b><a href="#div-1" data-toggle="tab" aria-expanded="true">首页</a><span class="module_span_close">X</span><b class="nav_bg_right"></b></li>
            </ul>
            <div id="myTabContent" class="tab-content">
            	<div class="tab-pane fade active in" id="div-1">  
        		<%@include file="indexContent.jsp"%>
        		</div>
           </div>
    	</div>
    </div>
    <div class="modal fade login_modal" id="mymodareset" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <!-- 模态弹出窗内容 -->
	            <div class="modal-header">
	                <div class="modal-title"><img src="${pageContext.request.contextPath}/images/ioc/lock.png" alt="">修改密码</div>
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	            </div>
	            <div class="modal-body">
	                <ul class="login_ul">
	                    <li>
	                                                                                    原始密码:<input type="password" class="login_input" name="old_password">
	                        <div>
	                            <div class="div_err" style="display: none">错误密码</div>
	                        </div>
	                    </li>
	                    <li>
	                   		    新密码: <input type="password" class="login_input " name="new_password">
	                        <div><div class="div_err" style="display: none">错误密码</div></div>
	                    </li>
	                    <li>
	                      	 确认密码: <input type="password" class="login_input " name="new_password2">
	                        <div><div class="div_err" style="display: none">错误密码</div></div>
	                    </li>
	                    <li><a href="javascript:void(0)" class="form_btn  "  onclick="validateUser()">保 存</a></li>
	                </ul>
	            </div>
	            <div class="modal-footer">
	
	            </div>
	        </div>
	    </div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	<!-- 人员添加 -->
	<div class="modal fade addsource_modal" id="mymodal105" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_person"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">添加人员信息</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            
            <form id="data_person">
                <div class="pull-left add_personl">
                            <table class="table table4 marb0">
                                <tbody>
                                <tr>
                                    <th >姓名<input type="hidden" name="personId"><input type="hidden" name="id"></th>
                                    <td><input type="text" class="login_input width260" name="personName"></td>

                                </tr>
                                <!-- <tr>
                                    <th >用户名</th>
                                    <td><input type="text" class="login_input width260" name="userName"></td>
                                </tr> -->
                                <tr>
                                    <th >单位</th>
                                    <td>
                                        <select class="select_style1 width260" id="personCompanyId" name="personCompanyId">
                                        
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th >职务</th>
                                    <td>
                                    	<select class="select_style1 width260" id="personPostId" name="personPostId">
                                        
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th >执法证号</th>
                                    <td><input type="text" class="login_input width260" name="perosnLawCard"></td>

                                </tr>
                                <tr>
                                    <th >办公电话</th>
                                    <td><input type="text" class="login_input width260" name="personOfficeTel"></td>

                                </tr>
                                <tr>
                                    <th >移动电话</th>
                                    <td><input type="text" class="login_input width260" name="perosnTel"></td>

                                </tr>
                                <tr>
			                        <th>上传图片</th>
			                        <td id="personTd">
			                             <input id="personFile" type="file" name="file" class="login_input width260">
			                        </td>
                                </tr>
                                <tr>
                                    <td class="noborder title_font" ></td>
                                    <td style="text-align: left">
                                        <a href="javascript:void(0)" class="form_btn   title_font"  id="save_person"  onclick="insertPersonInfo()">提 交</a>
                                        <a href="javascript:void(0)" class="form_btn   title_font"  id="update_person" onclick="updatePersonInfo()">修 改</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pull-left add_personr pt10" id="imgDiv">
                            <div class="choose_photo marb10">
                                <img id="personImg" src='' style='width:100%;height:100%'>
                            </div>
                        </div>
			</form>
            
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- 赋予权限 -->
	<div class="modal fade addsource_modal" id="fyqx" aria-hidden="true" data-backdrop="static" style="overflow-y:inherit">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态弹出窗内容 -->
            <div class="modal-header">
                <div class="modal-title" id="title_person"><img src="${pageContext.request.contextPath }/images/ioc/add_2.png" alt="">赋予权限</div>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
   <div >
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	 <div class="pull-left add_personl" style="margin:0 auto; width:100%; height:100%;text-align:center;">
                  <input type="hidden" id="authorizationUserId"></input>              
                  <a href="javascript:void(0)" class="form_btn  "  onclick="authorization()">授权</a>                  
      </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
	
	queryPersonInfo();  
	querySelectPersonCompany();
	querySelectPersonPost();
	initFileInput("personFile");
});
$("#mymodal105").on('hidden.bs.modal', function () {
	emptyFormPersonInfo();
})
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
//清空表单 
function emptyFormPersonInfo(){
	$("#data_person").find("input[type='text']").each(function () {//清空表单
        $(this).val("");
    });
	$("#data_person").find("input[type='hidden']").each(function () {//清空表单
        $(this).val("");
    });
	$("#personTd").html("");
    $("#personTd").html('<input id="personFile" type="file" name="file">');
    initFileInput("personFile");
	$("#personContent").html("");
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
			startNum:(pageNum-1)*10,//分页参数，将要显示的分页数
			limit:10//每页显示的条数
		},
		success : function(json) {
			var tr="";
			for(var i=0;i<json.length;i++) {		
			    tr+="<tr><td>"+(i+1)+"</td><td>"+json[i].personName+"</td><td>"+json[i].personCompanyName+"</td><td>"+json[i].personPostName+"</td><td>"+json[i].perosnLawCard+"</td><td>"+json[i].personOfficeTel+"</td><td>"+json[i].perosnTel+"</td><td class='width220'><a href='javascript:void(0)' class='editer_btns edit_btn' data-toggle='modal' data-target='#mymodal105'  onclick='findPersonInfo("+json[i].personId+")'>编辑</a><a href='javascript:void(0)' class='editer_btns del_btn' onclick='deletePersonInfo("+json[i].personId+","+json[i].id+")'>删除</a></td></tr>";	
			}
			$("#dataListTbody_person").append(tr);
		}
	});
}

function addPersonInfo(){
	$("#save_person").show();
	$("#update_person").hide();
	$("#title_person").html("添加人员信息");
	$("#imgDiv").hide();
}

function insertPersonInfo(){

	if(!$("input[name='perosnTel']").val()){
		alertEase("移动电话不能为空",'2');
		return false;
	}
	var formData = new FormData($('#data_person')[0]);
	$.ajax({
		url:"${pageContext.request.contextPath}/personInfo/insertPersonInfo.do",
		type:"post",
		async:false,
        contentType: false,   
        processData: false,
		data:formData,
		success : function(result) {
			if(result>0){
				alertEase("添加信息成功",1);
				$("#mymodal105").modal("hide");
				queryPersonInfo();
			}else{
				alertEase("添加失败,手机号已存在",2);
			}
		}
	}); 
}
//修改密码 
function samePassword(){
	if($("input[name='new_password']").val()!=$("input[name='new_password2']").val()){
		alertEase("两次密码不一致请重新输入 ",'alert_err');
		$("input[name='new_password']").val("");
		$("input[name='new_password2']").val("");
	}else{
		updatePassword();
	}
}
function validateUser(){
	if($("input[name='new_password']").val()==""){
		alertEase("请输入新密码  ",'alert_err');
	}else if($("input[name='old_password']").val()==""){
		alertEase("请输入原始密码  ",'alert_err');
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/user/validateUser.do",
			type:"post",
			dataType:"json",
			data:{
				username:$("input[name='username']").val(),
				password:$("input[name='old_password']").val()
			},
			success : function(json) {
				if(json>0){
					samePassword();
				}else{
					alertEase("密码不正确请重新输入 ",'alert_err');
					$("input[name='old_password']").val("");
				}
			}
		});
	} 
}
function updatePassword(){
	$.ajax({
		url:"${pageContext.request.contextPath}/user/updatePassword.do",
		type:"post",
		dataType:"json",
		data:{
			username:$("input[name='username']").val(),
			password:$("input[name='new_password']").val()
		},
		success : function(json) {
			if(json>0){
				alertEase("修改密码成功",'alert_succ');
				$("input[name='username']").val("");
				$("input[name='new_password']").val("");
				$("input[name='new_password2']").val("");
				$('#mymodareset').modal('hide');
			}else{
				alertEase("修改密码 失败",'alert_err');
			}
		}
	}); 
}

function resetPassword(){
	$.ajax({
		url:"${pageContext.request.contextPath}/user/updatePassword.do",
		type:"post",
		dataType:"json",
		data:{
			username:$("input[name='username']").val(),
			password:"123456"
		},
		success : function(json) {
			if(json>0){
				alertEase("重置密码成功",'alert_succ');
			}else{
				alertEase("重置密码 失败",'alert_err');
			}
		}
	}); 
}
//处理全局ajax session超时事件
$.ajaxSetup({
	contentType : "application/x-www-form-urlencoded;charset=utf-8",
	complete : function(XMLHttpRequest, textStatus) {
		var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus"); // 通过XMLHttpRequest取得响应头，sessionstatus，
		if (sessionstatus == "timeout") {
			window.location.replace("${pageContext.request.contextPath}/login.jsp");
		}
	}
});

//ztree
		function getMenu(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/menu/getMenu.do",
				type:"post",
				data:{userId:id},
				dataType:"json",
				success : function(json) {
					$("#authorizationUserId").val(id);
					var setting = {
							check: {
								enable: true,
								chkStyle :"checkbox"
							},
							data: {
								simpleData: {
									enable: true
								}
							}
						};

						var zNodes =json;
						
						var code;
						
						function setCheck() {
							var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
							type = { "Y":"ps", "N":"ps"};
							zTree.setting.check.chkboxType = type;
							showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
						}
						function showCode(str) {
							if (!code) code = $("#code");
							code.empty();
							code.append("<li>"+str+"</li>");
						}
						
						$(document).ready(function(){
							$.fn.zTree.init($("#treeDemo"), setting, zNodes);
							setCheck();
						});
				}
			});
		}
		
		function authorization(){
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			var str = "";
			var id = $("#authorizationUserId").val();
			if(nodes==""||nodes==null){
				alert("请选择权限");
				return;
			}else{
				  $.each(nodes,function(index,element) {
					  str+=element.id+",";
			        });
				 
					$.ajax({
						url:"${pageContext.request.contextPath}/user/addUserMenu.do",
						type:"post",
						data:{menus:str,userId:id},
						dataType:"json",
						success : function(json) {
							if(json){
								$('#fyqx').modal('hide');
								alertEase("赋权成功",'alert_succ');
							}
						}
					});
			}
		}
		function getUserMenus(){
			$.ajax({
				url:"${pageContext.request.contextPath}/menu/getUserMenu.do",
				type:"post",
				dataType:"json",
				success : function(json) {
					$("#accordion").html("");
					var str = "";
					if(json==null||json.length<1){
						return;
					}
					for(i=0;i<json.length;i++){
						var levenOneMenu = json[i];
						str+="<li class='panel'>";
						str+="<a data-toggle='collapse' data-parent='#accordion'  href='#collapse"+levenOneMenu.id+"'class='"+levenOneMenu.style+"'>"+levenOneMenu.name+" <span class='pull-right glyphicon glyphicon-chevron-right'></span></a>";
						str+="<ul id='collapse"+levenOneMenu.id+"' class='panel-collapse collapse'>";
						var levenTwoMenu = levenOneMenu.levenTwoMenu;
						for(j=0;j<levenTwoMenu.length;j++){
							var lt = levenTwoMenu[j];
							str+="<li id='li-"+lt.id+"'>";
							if(lt.url!=""&&lt.url!=""){
								str+="<a href='javascript:void(0)' onclick=\"creatTabPage("+lt.id+",'${pageContext.request.contextPath }"+lt.url+"')\">"+lt.name+"</a>";
							}else{
								str+=lt.name;
								str+="<ul>";
								var levenThreeMenu = lt.levenThreeMenu;
								if(levenThreeMenu!=null&&levenThreeMenu.length>0){
									for(k=0;k<levenThreeMenu.length;k++){
										str+="<li id='li-"+levenThreeMenu[k].id+"'><a href='javascript:void(0)' onclick=\"creatTabPage("+levenThreeMenu[k].id+",'${pageContext.request.contextPath }"+levenThreeMenu[k].url+"')\">"+levenThreeMenu[k].name+"</a></li>";
									}
								}
								
								str+="</ul>";
							}
							str+="</li>";
						}
						str+="</ul>";
						str+="</li>";
					}
					
					$("#accordion").html(str);
					
				}
			});
		}
		//文件上传控件初始化
		function initFileInput(ctrlName) {    
		var control = $('#' + ctrlName); 
		control.fileinput({
		    language: 'zh', //设置语言
		    showUpload: false, //是否显示上传按钮
		    showPreview:false,//是否显示文件预览图
		    showCaption: true,//是否显示文件标题
		   // allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀格式名
		    browseClass: "btn btn-primary", //按钮样式             
		    previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
		});
		}
</script>
	
    <!-- Bootstrap 3.3.5 -->
    <script src="<c:url value='/plugins/chartjs/Chart.min.js'/>"></script>
    <!-- Sparkline -->
    <script src="<c:url value='/plugins/sparkline/jquery.sparkline.min.js'/>"></script>
    <!-- jvectormap -->
    <script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'/>"></script>
    <script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'/>"></script>
    <!-- jQuery Knob Chart -->
    <script src="<c:url value='/plugins/knob/jquery.knob.js'/>"></script>
    <!-- daterangepicker -->
    <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>-->
    <script src="<c:url value='/plugins/daterangepicker/daterangepicker.js'/>"></script>
    <!-- datepicker -->
    <script src="<c:url value='/plugins/datepicker/bootstrap-datepicker.js'/>"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="<c:url value='/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js'/>"></script>
    <!-- Slimscroll -->
    <script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>"></script>
    <!-- FastClick -->
    <script src="<c:url value='/plugins/fastclick/fastclick.min.js'/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value='/dist/js/app.min.js'/>"></script>
    
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value='/dist/js/demo.js'/>"></script>
</body>
</html>
