<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>食品安全动态监管系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">  
    <link rel="stylesheet" href="<c:url value='/ionicons/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
    <script src="${pageContext.request.contextPath }/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.min.js"></script>
    <script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
  </head>
  <script type="text/javascript">
  
  
  	/*	
  	function onclick1(){
		var actionname = $("#actionname").val();
		if($.trim(actionname) == ""){
			alert("监管单位名称不能为空。");
			return false;
		}
		if(confirm("确认添加吗？")){
			$.ajax({
				url:"${pageContext.request.contextPath}/addActionServlet",
				data:{actionname:actionname},
				type:"post",
				async:"false",
				dataType:"json",
				success:function(jsonData){
					if(jsonData == 1){
						alert("添加成功");
					}else if(jsonData == -1){
						alert("已经存在");
					}else{
						alert("添加失败");
					}
				}
			});
		}
	}*/
	
	 $(function(){
    $("#btn").click(function(){
      $("#mymodal").modal("toggle");
    });
  });
  
  	function change(){
  		var password = $("#password").val();
  		var againPassword = $("#againPassword").val();
  		if(password != againPassword){
  			$("#font").html("两次密码不一致");
  		}else{
  			$.ajax({
				url:"${pageContext.request.contextPath}/UpdatePassword",
				data:{password:password},
				type:"post",
				async:"false",
				success:function(jsonData){
					if(jsonData == 1){
						$('#mymodal').modal('hide');
						alert("修改成功");
					}else if(jsonData == -1){
						alert("已经存在");
					}else{
						alert("添加失败");
					}
				}
			});
  		}
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
                  <h3>新增监管单位</h3>
               </div><!-- /.box-header -->
                <div class="box-body">
                <form id="formValidate" action=""  method="post">
                <table class="" style="center">
                  <tbody id="tb">
                	<tr>
                	  <td>
                	  	<label>监管单位</label>
                		<select>
                			<c:forEach items="${listAction}" var="lis">
                				<option>${lis.actionname }</option>
                			</c:forEach>
                		</select>
                	  </td>
                	</tr>
                	<tr>
                	  <td>
                	  	<label>监管单位名称</label>
                	  	<input type="text" width="150px" id="actionname" name="actionname"/>
                	  </td>
                	</tr>
                  </tbody>
               	</table>
               	
               	
               	
               	
               	<button class="btn btn-primary" id="btn" type="button">点击我</button>
<div class="modal" id="mymodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">首次登陆修改密码</h4>
			</div>
			<div class="modal-body">
						<label><font id="font" size="0.8" color="red"></font></label>
						<br/>
				新密码：<input id="password" type="text" name="password">
				<br>
				再次输入：<input id="againPassword" type="text" name="againPassword"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" >关闭</button>
				<button type="button" onclick="change()" class="btn btn-primary">保存</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


               	
               	
               	
               	
               	
               	
               	
               	
               	
               	
               	
               	
						<input type="button" class="btn btn-primary" onclick="onclick1()" width="30px" value="提交"/>
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
    
  </body>
</html>
