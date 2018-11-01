<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>食品药品动态监管系统</title>
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
     <script src="${pageContext.request.contextPath }/plugins/jQuery/jQuery-2.1.4.min.js"></script>
     
       
     <script src="<c:url value='/js/jedate/jquery-ui.js'/>"></script>
     <link rel="stylesheet" type="text/css" href="<c:url value='/js/jedate/jquery-ui.css'/>" /> 
     
     <script src="<c:url value='/js/jedate/jquery-ui-timepicker-addon.js'/>"></script>
     <script src="<c:url value='/js/jedate/jquery-ui-timepicker-zh-CN.js'/>"></script>
     <script src="<c:url value='/js/jedate/jquery.ui.datepicker-zh-CN.js.js'/>"></script>
     <link rel="stylesheet" type="text/css" href="<c:url value='/js/jedate/jquery-ui-timepicker-addon.css'/>" />
     
   	<script type="text/javascript">
   		$(function(){
   			
   			$("input[type=text]").addClass("sty");//添加class样式
   			
			$("#time").datetimepicker();
			$("#time1").datetimepicker();
			$("#time2").datetimepicker();
			
			//显示提交成功
				if(${success eq null}){
	  		
		  		}else{
		  			alert("${success}");
		  		}
		});
		
		function _submit(){
			var department = $("#department").val();
			 if(department == 0){
				alert("请选择批办单位");
				return false;
			}else{
				$("#formValidate").submit();
			}
		}
			
			//打印
    	function print(){
    		location.href="${pageContext.request.contextPath }/pages/tables/production/downloadProduction.jsp";
    	}
   	</script>
   	
   	
   	<style type="text/css">
   		.sty{
   			width:100%;
   			height:100%;
   			border: 0px;
   		}
   	</style>

  </head>
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
                <div class="box-header">
                  <h3>投诉举报接处单</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate" action="<c:url value='/ComplainServlet'/>" method="post">
                 <input type="hidden" name="method" value="add">
                  <table align="center" border="1" >                   
                    <tbody>
					 <tr>
                        <td align="center" colspan="2">投诉接报时间</td>
                         <td>
                         	<input type="text" id="time" readonly="readonly" name="time" style="width:280px" placeholder="请选择">
                         </td>
                         <td >受理编号</td>
                         <td><input type="text" name="number"/></td>
                     </tr>
                     
                     
                     <tr>
                         <td align="center">类型 </td>
                         <td colspan="4">
                         	 <input type="checkbox" name="type" value="食品">食品
                         	 <input type="checkbox" name="type" value="化妆品">化妆品	
                         	 <input type="checkbox" name="type" value="保健食品">保健食品
                         	 <input type="checkbox" name="type" value="药品">药品
                         	 <input type="checkbox" name="type" value="医疗器械">医疗器械
                         	 <input type="checkbox" name="type" value="计量">计量
                         	 <input type="checkbox" name="type" value="质量">质量
                         	 <input type="checkbox" name="type" value="商标">商标
                         	 <input type="checkbox" name="type" value="广告">广告
                         	 <input type="checkbox" name="type" value="特种设备">特种设备
                         	 <input type="checkbox" name="type" value="消费">消费
                         	 <input type="checkbox" name="type" value="其他">其他
                         	 
                         </td>
                     </tr>
                     
                     <tr>
                         <td align="center">方式</td>
                         <td colspan="4">
                         	 <input type="checkbox" name="mode" value="举报电话">举报电话
                         	 <input type="checkbox" name="mode" value="微信	">微信	
                         	 <input type="checkbox" name="mode" value="网站">网站
                         	 <input type="checkbox" name="mode" value="市长电话">市长电话
                         	 <input type="checkbox" name="mode" value="其他">其他
                         	 <input type="checkbox" name="mode" value="问政平台">问政平台
                         	 <input type="checkbox" name="mode" value="信访">信访
                         	 <input type="checkbox" name="mode" value="来信">来信
                         	 <input type="checkbox" name="mode" value="上级业务部门转办">上级业务部门转办
                         	 
                         </td>
                     </tr>
                     
                     
                     <tr>
						<td width="20%" rowspan="2" align="center">举报人</td>
						<td width="15%">姓名</td>
						<td width="25%"><input type="text" name="informerName"/></td>
						<td width="15%">性别</td>
						<td width="25%"><input type="text" name="sex"/></td>
					</tr>
					
					<tr>
						<td>地址</td>
						<td><input type="text" name="address"/></td>
						<td>联系电话</td>
						<td><input type="text" name="tel"/></td>
					</tr>
					
					<tr>
						<td rowspan="2" align="center">被投诉<br/>举　报<br/>单　位</td>
						<td>单位名称</td>
						<td><input type="text" name="name"/></td>
						<td>联系电话</td>
						<td><input type="text" name="phone"/></td>
					</tr>
					
					<tr>
						<td  colspan="1">地址</td>
						<td colspan="3"><input type="text" name="scaddress"/></td>
					</tr>
					
					<tr>
						<td align="center">投　诉<br/>举　报<br/>内　容</td>
						<td colspan="4"><textarea name="content" style="width:100%;height:100%;border: 0px"></textarea></td>
					</tr>
					
					<tr>
						<td  align="center">拟　办<br/>意　见</td>
						<td  colspan="4"><textarea name="idea" style="width:100%;height:100%;border: 0px"></textarea></td>
					</tr>
					
					<tr>
						<td  align="center">主要领导<br/>批办意见</td>
						<td  colspan="4" align="center">
							请<select name="department" id="department">
								<option value="0">请选择</option>
                      			<c:forEach items="${unitList}" var="list">
                        			<option  value="${list.tDictionaryCode}" >${list.tDictionaryName}</option>
                        		</c:forEach>
							</select>调查处理，按时反馈。
						</td>
					</tr>
					
					<tr>
						<td colspan="5"  align="center">承办部门办理情况回执</td>
					</tr>
					
					<tr>
                        <td align="center">承办时限</td>
                         <td colspan="2">
                         	<input type="text" name="organizerTime">
                         </td>
                         <td align="center">回复时间</td>
                         <td><input type="text" id="time1" readonly="readonly" name="replyTime" style="width:280px" placeholder="请选择"></td>
                    </tr>
                    
                    <tr>
                        <td align="center">回复方式</td>
                         <td colspan="2">
                         	<input type="text" name="replyWay">
                         </td>
                         <td align="center">是否满意</td>
                         <td><input type="text" name="yesOrNo"/></td>
                    </tr>
                    
                    <tr>
                        <td align="center">是否立案</td>
                         <td colspan="2">
                         	<input type="text" name="register">
                         </td>
                         <td align="center">承办人</td>
                         <td><input type="text" name="undertaker"/></td>
                    </tr>
                    
                    <tr>
						<td align="center">办　结<br/>情　况</td>
						<td colspan="4"><textarea style="width:100%;height:100%;border: 0px" name="situation"></textarea></td>
					</tr>
                    
                    <tr>
                        <td align="center">经办单位领导(签名)</td>
                         <td colspan="2">
                         	<input type="text" name="signature">
                         </td>
                         <td align="center">日期</td>
                         <td><input type="text" id="time2" readonly="readonly" name="signatureTime" style="width:280px" placeholder="请选择"></td>
                    </tr> 
					
                    </tbody>
                  </table>	
						<input type="button" onclick="_submit()" class="btn btn-primary" width="30px" value="保存"/>	
						<input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/>					
                  </form>
                  
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
            </div><!-- /.col -->
			
          </div><!-- /.row -->
          
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
		<div class="pull-right hidden-xs">
         <!--   <b>唐山蓝普</b>-->
        </div>      
        <strong></strong>
      </footer>
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
	</div><!-- ./wrapper -->
    <!-- jQuery 2.1.4 -->
    <!--<script src="<c:url value='/plugins/jQuery/jQuery-2.1.4.min.js'/>"></script>
    --><!-- Bootstrap 3.3.5 -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    <!-- DataTables -->
    <script src="<c:url value='/plugins/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/plugins/datatables/dataTables.bootstrap.min.js'/>"></script>
    <!-- SlimScroll -->
    <script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>"></script>
    <!-- FastClick -->
    <script src="<c:url value='/plugins/fastclick/fastclick.min.js'/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value='/dist/js/app.min.js'/>"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value='/dist/js/demo.js'/>"></script>
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
