<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>食品安全动态监管系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">  
    <link rel="stylesheet" href="<c:url value='/ionicons/css/ionicons.min.css'/>">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
	 <script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	 <!--<script type="text/javascript" src="<c:url value='/js/personnel.js'/>"></script>
  --></head>
  <script type="text/javascript">
  	
  	function get(){
  		$("#exists").html("");
  	}
  	function lost(){
  		var user = $("#username").val();
  		var username = user.trim();
  		if(username == ""){
  			$("#exists").html("用户名不能为空！！！");
  		}else{
  			$.ajax({
	  			url:"${pageContext.request.contextPath}/userNameExists",
	  			data:{username:username},
	  			type:"post",
	  			async:"false",
	  			success:function(data){
	  				$("#exists").html(data);
	  			}
  			});
  		}
  	}
  	function _go(select){
  		var index = select.selectedIndex;//选中的option的下标
  		var option = select.options[index];//通过下标得到option对象
  		var value = option.value;//通过option元素值得到value值
  		location="${pb.url}&pageCode=" + value;
  	}
  	$(function(){
  		/*
		var actionname;
		$.ajax({
			url:"${pageContext.request.contextPath}/ActionServlet",
			data:{},
			type:"post",
			async:"false",
			dataType:"json",
			success:function(jsonData){
				actionname = jsonData.list[0].actionname;
				var htmlStr = "";
				htmlStr += "<label style='text-align: left'>选择权限：</label><br>"
				for(var i = 0; i < jsonData.list.length; i++){
					htmlStr += "<input type='checkbox' name='groupid' value='" + jsonData.list[i].department + "'/>" +
					 			"&nbsp&nbsp" + jsonData.list[i].actionname + "&nbsp&nbsp&nbsp&nbsp&nbsp";
					if((i + 1)%8==0){
						htmlStr += "<br>";
					}
				}
				htmlStr += "<br><br>";
				$("#divAction").append(htmlStr);
			}
		});*/
		
		if(${success eq null}){
  		
  		}else{
  			alert("${success}");
  		}
	});
	
	function _submit(){
		var val = $("#selectId").val();
		var valRole = $("#selectRole").val();
		var username = $("#username").val()
		if(username.trim() == ""){
			alert("请填写用户名");
			return false;
		}else if(val == 0){
			alert("请选择所属单位");
			return false;
		}else if(valRole == 0){
			alert("请选择职位");
			return false;
		}else{
			$("#formValidate").submit();
			return true;
		}
	}
	
	//下面用于图片上传预览功能
            function setImagePreview(avalue) {
           		 //input
                var docObj = document.getElementById("file");
				//img
                var imgObjPreview = document.getElementById("preview");
                //div
                var divs = document.getElementById("imgPreview");
                
                if(docObj.value ==''){
                	alert("请上传图片");  
        			return false;
     			}else if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(docObj.value)){
		         	alert("图片类型必须是.gif,jpeg,jpg,png中的一种"); 
		        	return false;
		       }
                
                
                if (docObj.files && docObj.files[0]) {
                    //火狐下，直接设img属性
                    imgObjPreview.style.display = 'block';
                    imgObjPreview.style.width = '130px';
                    imgObjPreview.style.height = '160px';
                    //imgObjPreview.src = docObj.files[0].getAsDataURL();
                    //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                   imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
                } else {
                    //IE下，使用滤镜
                    docObj.select();
                    var imgSrc = document.selection.createRange().text;
                    var localImagId = document.getElementById("imgPreview");
                    //必须设置初始大小
                    localImagId.style.width = "130px";
                    localImagId.style.height = "160px";
                    //图片异常的捕捉，防止用户修改后缀来伪造图片
                    try {
                        localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                        localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                    } catch(e) {
                        alert("您上传的图片格式不正确，请重新选择!");
                        return false;
                    }
                    imgObjPreview.style.display = 'none';
                    document.selection.empty();
                }
                return true;
            }
  	
  </script>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
       <!--  <section class="content-header">
          <h1>
            Data Tables
            <small>advanced tables</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Tables</a></li>
            <li class="active">Data tables</li>
          </ol>
        </section> -->

        <!-- Main content -->
        <section class="content">
		
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div >
                  <h3>食品安全监管人员信息登记表</h3>
               </div><!-- /.box-header -->
                <div class="box-body">
                <form id="formValidate" action="${pageContext.request.contextPath }/UserAdd" enctype="multipart/form-data" method="post">
                	<input type="hidden" name="token" value="${tokenU }">
                  <table  class="table table-condensed" >                   
                    <tbody id="tb">
					<tr>
                     </tr>
					 <tr>
					 	<td>姓名：</td>
						<td><input type="text" style="width:240px" id="name" name="name">
						</td>
						 <td height="101" align="right" rowspan="6" colspan="2">
	                        <div id="localImag">
	                             <img id="preview" src="" width="130" height="160" style="display: block;border: 1px solid blue;" />
	                        </div>
                    	</td> 
					 </tr>
					 
					 <tr>
					 	<td>上传头像：</td>
					 	<td>
					 		<input id="file" type="file"  name="image" onchange="javascript:setImagePreview();">
					 	</td>
					 </tr>
					 
					  <tr>
					 	<td>用户名：</td>
						<td>
							<input type="text" style="width:240px" id="username" name="username" onblur="lost()" onfocus="get()">
							<font color="red" size="0.9e"><span id="exists"></span></font>
						</td>
					 </tr>
                      <tr>
						<td>单位：</td>
						<td>
						   <select style="width:240px" id="selectId" name="department">
                  			      <option value="0">请选择...</option>
                 			  <c:forEach items="${unitList }" var="lis">
                  		          <option id="${lis.id }" value="${lis.department }">${lis.department }</option>
                 			  </c:forEach>	
                           </select>
                        </td>
					 </tr>
					 <tr>
					 	<td>职务：</td>
						<td>
						   <select id="selectRole" style="width:240px" name="role">
                  			      <option value="0">请选择...</option>
                 			  <c:forEach items="${listPos }" var="lis">
                  		          <option id="${lis.id }" value="${lis.job }" >${lis.job }</option>
                 			  </c:forEach>	
                           </select>
                        </td>
					 </tr>
					 
					 <tr>
					 	<td>执法证号：</td>
						<td><input type="text" style="width:240px" id="zhiFaNumber" name="zhiFaNumber"></td>
					 </tr>
					 
					 <tr>
					 	<td>办公电话：</td>
						<td><input type="text" style="width:240px" id="name" name="phone"></td>
					 </tr>
					 
					 <tr>
					 	<td>移动电话：</td>
						<td><input type="text" style="width:240px" id="name" name="tel"></td>
					 </tr>
					 	
					 
                  </table>
                  <div id="divAction" style="text-align: left;">
                  	<font size="1.2" color="red">须知：上传图片类型必须是.gif，jpeg，jpg，png中的一种；
					 		图片尺寸最大为350*350px；不得高于1M</font>
                  </div>
						<input type="button" class="btn btn-primary" onclick="_submit()" width="30px" value="提交"/>
                  </form>
                  
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
            </div><!-- /.col -->
			
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <!--<b>唐山蓝普</b>
        --></div>
        <strong></strong>
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
   </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath }/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="${pageContext.request.contextPath }/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
    <!-- page script -->
    <script>
      $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
          "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false
        });
      });
    </script>
  </body>
</html>
