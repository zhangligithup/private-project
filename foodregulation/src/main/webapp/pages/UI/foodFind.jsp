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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
	 <script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <script type="text/javascript">
		  	function onclick1(id){
		  			$("#id").attr("value",id);
		  			$("#inforForm").submit();
		  			
					//window.location.href="${pageContext.request.contextPath}/servlet/CriculateServlet1?method=infor&id=" + id +"&item=${item}&pageCode=${pb.pageCode}";  			
		  	}
		  	function _page(page){
		  			$("#page").attr("value",page);
		  			alert($("#page").val());
		  			$("#formPage").submit();
		  	}
		  	function _go(select){
		  		var index = select.selectedIndex;//选中的option的下标
		  		var option = select.options[index];//通过下标得到option对象
		  		var value = option.value;//通过option元素值得到value值
		  		location="${pb.url}&pageCode=" + value;
		  	}
		  	function myonchange(select){
		  		var index = select.selectedIndex;//选中的option的下标
		  		var option = select.options[index];//通过下标得到option对象
		  		var item = option.value;//通过option元素值得到value值
		  		if(index == 0){
		  			//$("#formPage").submit();
		  			location="${pageContext.request.contextPath}/FoodServlet?method=find";
		  		}else{
		  			location="${pageContext.request.contextPath}/FoodServlet?method=findName&item=" + item;
		  		}
		  	}
		  	function _onclick(){
		  		var value = $("#queryQyName").val();
		  		location="${pageContext.request.contextPath}/servlet/FoodServlet?method=queryByName&queryQyName=" + value;
		  	}
  </script>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="<c:url value='/pages/index.jsp'/>" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>食品安全动态监管</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
         
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>信息录入</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">              
				 <li><a href="${pageContext.request.contextPath }/ProductionFormServlet"><i class="fa fa-circle-o"></i>生产企业</a></li>
				 <li><a href="${pageContext.request.contextPath }/CriculateFormServlet"><i class="fa fa-circle-o"></i>流通企业</a></li>
				  <li><a href="${pageContext.request.contextPath }/FoodFormServlet"><i class="fa fa-circle-o"></i>餐饮企业</a></li>
				   <li><a href="#"><i class="fa fa-circle-o"></i>五小行业</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>信息查询</span> <i class="fa fa-angle-left pull-right"></i>               
              </a>
               <ul class="treeview-menu">
			  <li><a href="${pageContext.request.contextPath }/ProductionServlet?method=find"><i class="fa fa-circle-o"></i>生产企业</a></li>
                <li class="active"><a href="${pageContext.request.contextPath }/servlet/CriculateServlet1?method=find"><i class="fa fa-circle-o"></i>流通企业</a></li>
				<li class="active"><a href="#"><i class="fa fa-circle-o"></i>餐饮企业</a></li>
				<li class="active"><a href="#"><i class="fa fa-circle-o"></i>五小行业</a></li>
              </ul>
            </li>
            <li>
              <a href="#">
                <i class="fa fa-th"></i> <span>监督检查</span>
              </a>
            </li>
			<li class="treeview active">
              <a href="#">
                <i class="fa fa-table"></i> <span>抽样检验</span>
                <!--<i class="fa fa-angle-left pull-right"></i>
              --></a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>违法查处</span><!--
                <i class="fa fa-angle-left pull-right"></i>
              --></a>
            </li>
           <li class="treeview">
              <a href="javascript:void(0)">
                <i class="fa fa-files-o"></i>
                <span>系统设置</span><i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
			  <li><a href="<c:url value='/FormServlet'/>"><i class="fa fa-circle-o"></i>人员登记</a></li>
                <li class="active"><a href="<c:url value='/UserFindServlet'/>"><i class="fa fa-circle-o"></i>人员查询</a></li>
				<!--<li class="active"><a href="${pageContext.request.contextPath }/FoodServlet?method=find"><i class="fa fa-circle-o"></i>餐饮企业</a></li>
				<li class="active"><a href="#"><i class="fa fa-circle-o"></i>五小行业</a></li>
              --></ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>电子地图</span>
                <!--<i class="fa fa-angle-left pull-right"></i>
              --></a>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
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
                <div class="box-header">
                  <h3>食品餐饮企业信息表</h3>
                </div><!-- /.box-header -->
                
                <div style="text-align: left;">
                  <input type="text" id="queryQyName" name="queryQyName"/>
                  <input type="button" class="btn btn-primary"  value="搜索" onclick="_onclick()"></input>
                  </div>
                  <div style="text-align: right;">
                  <select id="selectId" onchange="myonchange(this)">
                  		<option>请选择...</option>
                 	 <c:forEach items="${listActionF }" var="lis">
                  		<option id="${lis.department}" value="${lis.department }" <c:if test="${item eq lis.department }">selected='selected'</c:if> >${lis.actionname }</option>
                 	 </c:forEach>	
                  </select>
                  </div>
                
                <div class="box-body">
                <form id="inforForm" action="${pageContext.request.contextPath}/FoodServlet" method="post">
                	<input type="hidden" name="method" value="infor">
                	<input type="hidden" id="id" name="id">
                	<input id="item" type="hidden" name="item" value="${item }">
                  <table  class="table table-condensed" >                   
                    <tbody id="tb">
					<tr>
                        <td><b>一、餐饮服务经营户基本情况</b></td>                 
                     </tr>
					 <tr>
					 	<td><b>企业名称</b></td>						 
						 <td><b>企业代码</b></td>
                         <td><b>经营场所</b></td>
                         <td><b>联系电话</b></td>
					 </tr>
					 
                     <c:forEach items="${pb.datas }" var="lis">
                      <tr onclick="onclick1(${lis.id })">
			    		<td>${lis.qyname }</td>
			    		<td>${lis.qycode }</td>
			    		<td>${lis.jyaddress }</td>
			    		<td>${lis.phone }</td>
					 </tr>
					 </c:forEach> 
                  </table>
                  	第${pb.pageCode }页/共${pb.totalPage }页
                  	<a href="${pb.url }">首页</a>
                  	<c:if test="${pb.pageCode > 1}">
                  		<a href="${pb.url }&pageCode=${pb.pageCode-1}">上一页</a>
                  	</c:if>
                  	
                  	<c:set var="begin" value="1"/>
                  	<c:set var="end" value="10"/>
                  	<c:choose>
                  		<c:when test="${pb.totalPage <= 10}">
                  			<c:set var="begin" value="1"/>
                  			<c:set var="end" value="${pb.totalPage}"/>
                  		</c:when>
                  		<c:otherwise>
                  		   <c:choose>
                  			<c:when test="${pb.pageCode - 4 < 1}">
                  				<c:set var="begin" value="1"/>
                  				<c:set var="end" value="10"/>
                  			</c:when>
                  			<c:when test="${pb.pageCode + 5 > pb.totalPage}">
                  				<c:set var="begin" value="${pb.totalPage - 9}"/>
                  				<c:set var="end" value="${pb.totalPage}"/>
                  			</c:when>
                  			<c:otherwise>
                  				<c:set var="begin" value="${pb.pageCode - 4}"/>
                  				<c:set var="end" value="${pb.pageCode + 5}"/>
                  			</c:otherwise>
                  			</c:choose>
                  		</c:otherwise>
                  	</c:choose>
                  	<c:forEach begin="${begin}" end="${end}" var="i">
                  		<c:choose>
                  			<c:when test="${pb.pageCode eq i }">${i}</c:when>
                  			<c:otherwise>
                  				<a href="${pb.url }&pageCode=${i}">[${i }]</a>
                  			</c:otherwise>
                  		</c:choose>
                  	</c:forEach>
                  	
                  	<c:if test="${pb.pageCode < pb.totalPage}">
                  		<a href="${pb.url }&pageCode=${pb.pageCode+1}">下一页</a>
                  	</c:if>
                  	<a href="${pb.url }&pageCode=${pb.totalPage }">尾页</a>
                  	<select name="pageCode" onchange="_go(this)">
                  		<c:forEach begin="1" end="${pb.totalPage}" var="i">
                  			<option value="${i }" <c:if test="${pb.pageCode eq i }">selected='selected'</c:if>>${i }</option>
                  		</c:forEach>
                  	</select>
                  </form>
                  
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
              </div><!-- /.box -->
            </div><!-- /.col -->
			
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
           <!--  <b>唐山蓝普</b> -->
        </div>
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
