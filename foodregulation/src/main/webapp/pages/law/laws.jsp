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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/css/ykstyle.css">
    
     <script src="${pageContext.request.contextPath }/plugins/jQuery/jQuery-2.1.4.min.js"></script>
     
       
     <script src="<c:url value='/js/jedate/jquery-ui.js'/>"></script>
     <link rel="stylesheet" type="text/css" href="<c:url value='/js/jedate/jquery-ui.css'/>" /> 
     
     <script src="<c:url value='/js/jedate/jquery-ui-timepicker-addon.js'/>"></script>
     <script src="<c:url value='/js/jedate/jquery-ui-timepicker-zh-CN.js'/>"></script>
     <script src="<c:url value='/js/jedate/jquery.ui.datepicker-zh-CN.js.js'/>"></script>
     <link rel="stylesheet" type="text/css" href="<c:url value='/js/jedate/jquery-ui-timepicker-addon.css'/>" />
     
	<script src="<c:url value='/js/public/public.js'/>"></script>
   	<script type="text/javascript">
   		$(function(){
   		
			$("#time").datetimepicker();
			$("#time1").datetimepicker();
			$("#writeTime").datetimepicker();
			$("#time4").datetimepicker();
			$("#time5").datetimepicker();
			$("#time6").datetimepicker();
			$("#time7").datetimepicker();
			
			//显示提交成功
				if(${success eq null}){
	  		
		  		}else{
		  			alert("${success}");
		  		}
		});
			
			//打印
    	function print(){
    		location.href="${pageContext.request.contextPath }/pages/tables/production/downloadProduction.jsp";
    	}
    	
    	function changeFunc(){
    			var selectBox = document.getElementById("table");
    			
    			var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    			
    			var target1 =document.getElementById("div1");
    			var target2 =document.getElementById("div2");
    			var target3 =document.getElementById("div3");
    			var target4 =document.getElementById("div4");
    			var target5 =document.getElementById("div5");
    			var target6 =document.getElementById("div6");
    			var target7 =document.getElementById("div7");
    			var target8 =document.getElementById("div8");
    			var target9 =document.getElementById("div9");
    			var target10 =document.getElementById("div10");	
    			
    			
    			alert(target4.getAttribute("id"));
    			
    				if(target1.getAttribute("id")==selectedValue){
    							target1.style.display="block";
    				}else{
    					target1.style.display="none";
    				}
    				
    				if(target2.getAttribute("id")==selectedValue){
						target2.style.display="block";
					}else{
						target2.style.display="none";
					}
					
    				if(target3.getAttribute("id")==selectedValue){
						target3.style.display="block";
					}else{
						target3.style.display="none";
					}
					
    				if(target4.getAttribute("id")==selectedValue){
						target4.style.display="block";
					}else{
						target4.style.display="none";
					}
					
					
    				if(target5.getAttribute("id")==selectedValue){
						target5.style.display="block";
					}else{
						target5.style.display="none";
					}
					
    				if(target6.getAttribute("id")==selectedValue){
						target6.style.display="block";
					}else{
						target6.style.display="none";
					}
					
    				if( target7.getAttribute("id")==selectedValue){
						target7.style.display="block";
			}else{
				target7.style.display="none";
			}
    				
    				if(target8.getAttribute("id")==selectedValue){
						target8.style.display="block";
			}else{
				target8.style.display="none";
			}
    				if(target9.getAttribute("id")==selectedValue){
						target9.style.display="block";
			}else{
				target9.style.display="none";
			}
    				if(target10.getAttribute("id")==selectedValue){
						target10.style.display="block";
			}else{
				target10.style.display="none";
			}
    	} 
    	
             
   	</script>
   	

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
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header" align="center">
                  <h3>违法案件制作</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate" action="<c:url value='/ProductionServlet'/>" method="post">
                 
                 <div>
                 
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        
                         <td align="center">
                         	<b>处罚主体：</b><input type="text" style="width:280px" name="">
                         </td>
                     </tr>
                     
                     
                     <tr>
                         <td align="center" colspan="2">
                         	<b>立案时间：</b><input type="text" id="time" readonly="readonly" name="" style="width:280px" placeholder="请选择">
                         </td>
                     </tr>
                     
                     
                     <tr>
						<td align="center" colspan="2">
							<b>请选择表：</b>
							<select id="table" style="width: 280px" name="table" onchange="changeFunc();">
								<option value="div0">请选择</option>
								<option value="div1">案件来源登记表</option>
								<option value="div2">立案审批表</option>
								<option value="div3">立案通知书</option>
								<option value="div4">调查笔录</option>
								<option value="div5">现场检查笔录</option>
								<option value="div6">调取证据材料通知书</option>
								<option value="div7">证据提取凭证</option>
								<option value="div8">监督意见书</option>
								<option value="div9">非产品样品采样记录</option>
								<option value="div10">产品样品采样记录</option>
							</select>
						</td>
					</tr>
                    </tbody>
                  </table>
                  </div>	
                  </form>
                  
                  <div class="container" id="div1" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 class="yk_h2" align="center">案件来源登记表</h3>
				  					<div align="right" class="yk_yuankuohao"><input type="text">案来登<input type="text">号&nbsp;&nbsp;&nbsp;&nbsp;</div>
				                    <hr class="hrStyle"/>
				  			</div>
				  		</div>
				  			
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					案件来源:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					案件来源时间:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						联系人(单位):<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>	
				  					联系电话:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />	
				  					<br/>
				  					<br/>
				  					联系地址及邮编:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<hr style="height:2px;border:none;border-top:2px solid black;" />
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				基本情况介绍:<br>
				  				<textarea style="width: 100%;height: 100px;"></textarea><br/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			<p style="text-align: right;">记录人:<input style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;" type="text"/><br /></p>	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="writeTime" readonly="readonly" name="" style="width:120px" placeholder="请选择">(年　月　日)</p>
				  				<hr class="hrStyle"/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				处理意见:<br>
				  				<textarea style="width: 100%;height: 100px;"></textarea><br/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			<p style="text-align: right;">负责人:<input style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;" type="text"/><br /></p>	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="writeTime"  readonly="readonly" name="" style="width:120px" placeholder="请选择">(年　月　日)</p>
				  				<hr class="hrStyle"/>
				  			</div>
				  		</div>
  					</div>
                  
                  
      <!--           <div id="div1" style="display: none">
					
						<table id="" class="table table-condensed" >                   
		                    <tbody>
							 <tr>
		                        <td align="center" colspan="4"><b>案 件 来 源 登 记 表</b></td>
		                     </tr>
		                     
		                     
		                     <tr>
		                        <td>案件来源</td>
		                         <td>
		                         	<input type="text" id="time" name="" style="width:240px">
		                         </td>
		                         <td>案件来源时间</td>
								<td>
									<input type="text" id="time1" readonly="readonly" name="" style="width:240px" placeholder="请选择">
								</td>
		                     </tr>
		                     
		                     <tr>
		                        <td>联系人(单位)</td>
		                         <td>
		                         	<input type="text" id="time" name="" style="width:240px">
		                         </td>
		                         <td>联系电话</td>
								<td>
									<input type="text" name="" style="width:240px">
								</td>
		                     </tr>
		                     
		                     <tr>
								<td>联系地址及邮编</td>
		                         <td>
		                         	<input type="text" id="" name="" style="width:240px">
		                         </td>
							</tr>
							
							<tr>
								<td>基本情况介绍：</td>
							</tr>
								
							<tr>
		                         <td colspan="4">
		                         	<textarea  style="width:100%;height:100%;border: 0px" ></textarea>
		                         </td>
							</tr>
							
							<tr>
		                        <td>记录人</td>
		                         <td>
		                         	<input type="text" name="" style="width:240px">
		                         </td>
		                         <td>记录时间(年   月   日)</td>
								<td>
									<input type="text" id="writeTime" readonly="readonly" name="" style="width:240px" placeholder="请选择">
								</td>
		                     </tr>
		                     
		                     <tr>
								<td>处理意见：</td>
							</tr>
								
							<tr>
		                         <td colspan="4">
		                         	<textarea  style="width:100%;height:100%;border: 0px" ></textarea>
		                         </td>
							</tr>
							
							<tr>
		                        <td>负责人</td>
		                         <td>
		                         	<input type="text" name="" style="width:240px">
		                         </td>
		                         <td>时间(年   月   日)</td>
								<td>
									<input type="text" id="time4" readonly="readonly" name="" style="width:240px" placeholder="请选择">
								</td>
		                     </tr>
							
		                    </tbody>
		                  </table>								
				  </div>
				  
			 -->  	  
				  <!--<div id="div2" style="display: none">
					
						<table id="" class="table table-condensed" >                   
		                    <tbody>
							 <tr>
		                        <td align="center" colspan="4"><b>立 案 审 批 表</b></td>
		                     </tr>
		                     
		                     
		                     <tr>
		                        <td>案 由</td>
		                         <td>
		                         	<input type="text" id="time" name="" style="width:240px">
		                         </td>
		                         <td>当事人</td>
								<td>
									<input type="text" id="time" name="" style="width:240px">
								</td>
		                     </tr>
		                     
		                     <tr>
		                        <td>法定代表人(负责人)</td>
		                         <td>
		                         	<input type="text" id="time" name="" style="width:240px">
		                         </td>
		                         <td>地  址</td>
								<td>
									<input type="text" name="" style="width:240px">
								</td>
		                     </tr>
		                     
		                     <tr>
								<td>联系方式</td>
		                         <td>
		                         	<input type="text" id="" name="" style="width:240px">
		                         </td>
		                         <td>案件来源</td>
		                         <td>
		                         	<input type="text" id="" name="" style="width:240px">
		                         </td>
							</tr>
							
							<tr>
								<td>案情摘要：</td>
							</tr>
								
							<tr>
		                         <td colspan="4">
		                         	<textarea  style="width:100%;height:100%;border: 0px" ></textarea>
		                         </td>
							</tr>
							
							<tr>
		                        <td colspan="4">经初步调查(检查),当事人的行为涉嫌违反了<input type="text" name="" style="width:240px">的规定,
		                        	该案符合<input type="text" name="" style="width:240px">规定，申请予以立案。
		                        
		                        </td>
		                     </tr>
							
							<tr>
		                        <td>经办人</td>
		                         <td>
		                         	<input type="text" name="" style="width:240px">
		                         </td>
		                         <td>时间(年   月   日)</td>
								<td>
									<input type="text" id="time5" readonly="readonly" name="" style="width:240px" placeholder="请选择">
								</td>
		                     </tr>
		                     
		                     <tr>
		                        <td colspan="4">建议本案由<input type="text" name="" style="width:240px">承办。</td>
		                     </tr>
		                     
		                     <tr>
		                        <td>负责人</td>
		                         <td>
		                         	<input type="text" name="" style="width:240px">
		                         </td>
		                         <td>时间(年   月   日)</td>
								<td>
									<input type="text" id="time6" readonly="readonly" name="" style="width:240px" placeholder="请选择">
								</td>
		                     </tr>
		                     
		                     <tr>
								<td>审批意见：</td>
							</tr>
		                     
		                     <tr>
		                         <td colspan="4">
		                         	<textarea  style="width:100%;height:100%;border: 0px" ></textarea>
		                         </td>
							</tr>
							
							<tr>
		                        <td>主管领导</td>
		                         <td>
		                         	<input type="text" name="" style="width:240px">
		                         </td>
		                         <td>时间(年   月   日)</td>
								<td>
									<input type="text" id="time7" readonly="readonly" name="" style="width:240px" placeholder="请选择">
								</td>
		                     </tr>
							
		                    </tbody>
		                  </table>								
				  </div>
				  -->
				  
				  
				  <div class="container" id="div2" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 class="yk_h2" align="center">立案审批表</h3>
				  					<div align="right" class="yk_yuankuohao"><input type="text">立案<input type="text">号&nbsp;&nbsp;&nbsp;&nbsp;</div>
				                    <hr class="hrStyle"/>
				  			</div>
				  		</div>
				  			
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					案由:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					当事人:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						法定代表人(负责人):<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>	
				  					地址:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />	
				  					<br/>
				  					<br/>
				  					案件来源:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<hr class="hrStyle" />
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				案情摘要:<br>
				  				<textarea style="width: 100%;height: 100px;"></textarea><br/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			<p style="text-align: right;">记录人:<input style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;" type="text"/><br /></p>	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="writeTime" readonly="readonly" name="" style="width:120px" placeholder="请选择">(年　月　日)</p>
				  				<hr class="hrStyle"/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				审批意见:<br>
				  				<textarea style="width: 100%;height: 100px;"></textarea><br/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			<p style="text-align: right;">主管领导:<input style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;" type="text"/><br /></p>	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="writeTime"  readonly="readonly" name="" style="width:120px" placeholder="请选择">(年　月　日)</p>
				  				<hr class="hrStyle"/>
				  			</div>
				  		</div>
  					</div>
				  
				  
				  
				  
				  
				 <div id="div3" style="display: none">
				  		<p style="margin:0pt; text-align:center">
				  			<span style="font-family:宋体; font-size:12pt; font-weight:bold">案 件 来 源 登 记 表</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<!--<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">                       </span>
				  			<span style="font-family:宋体; font-size:18pt; font-weight:bold">案 件 来 源 登 记 表</span>
				  			<span style="font-family:宋体; font-size:10.5pt">  </span>
				  		</p>
				  		
				  		--><p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">                                        </span>
				  			<span style="font-family:宋体; font-size:10pt">（       ）   案来登〔      〕     号</span>
				  		</p>
				  			<img src="09221548492/514e8c53-f755-4272-8100-a5da3a1e5fe8.001.png" width="554" height="2" alt="" style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:7.8pt; -aw-wrap-type:none; margin-left:-0.75pt; margin-top:7.05pt; position:absolute; z-index:0" />
				  			<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  				<span style="font-family:宋体; font-size:10.5pt"> </span>
				  			</p>
				  		<p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">案件来源：</span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  		</p>
				  		
				  		<p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">案件来源时间：</span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"> </span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"> </span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  			<span style="font-family:宋体; font-size:10.5pt">联系人（单位）：</span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  		</p>
				  		
				  		<p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">联系电话：</span>
				  				<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  		</p>
				  		
				  		<p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">联系地址及邮编： </span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  		</p>
				  		
				  		<img src="09221548492/514e8c53-f755-4272-8100-a5da3a1e5fe8.001.png" width="554" height="2" alt="" style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:7.8pt; -aw-wrap-type:none; margin-left:-0.75pt; margin-top:7.05pt; position:absolute; z-index:2" />
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt"> </span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">基本情况介绍：</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">记录人：</span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">年   月   日</span>
				  		</p>
				  		
				  		<img src="09221548492/514e8c53-f755-4272-8100-a5da3a1e5fe8.001.png" width="554" height="2" alt="" style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:7.8pt; -aw-wrap-type:none; margin-left:-0.75pt; margin-top:7.05pt; position:absolute; z-index:3" />
				  			
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">处理意见：</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">负责人：</span>
				  			<span style="font-family:宋体; font-size:10.5pt; text-decoration:underline"></span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:Calibri; font-size:10.5pt">&#xa0;</span>
				  		</p>
				  		
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt"></span>
					  		<a name="OLE_LINK1">
					  			<span style="font-family:宋体; font-size:10.5pt">年   月   日</span>
					  		</a>
				  		</p>
				  		
				  			<img src="09221548492/514e8c53-f755-4272-8100-a5da3a1e5fe8.001.png" width="554" height="2" alt="" style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:7.8pt; -aw-wrap-type:none; margin-left:-0.75pt; margin-top:7.05pt; position:absolute; z-index:1" />
				  			
				  		<p style="margin:0pt; orphans:0; text-align:justify; widows:0">
				  			<span style="font-family:宋体; font-size:10.5pt">  </span>
				  		</p>
				  		
				  	</div>
				  		
				  		
				  
				  
				  
				  
		<div id="div4" style="display: none">
				
				
				<hr>
				<hr>
				<ul>
                  <li class="header">案件来源登记表</li>
                  <li>(<input style="border: 0px" type="text">  )案来登(<input style="border: 0px" type="text">)号
                  		<hr style="height:2px;border:none;border-top:2px ridge black; width:50%"/>
                  </li>
                  <li>案件来源：<input type="text"></li>
                  <li>案件来源时间：<input type="text">联系人(单位)：<input type="text"></li>
                  <li>联系电话：<input type="text"></li>
                  <li>联系地址及邮编：<input type="text"></li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?
                          Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?
                          Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?
                          Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?
                          Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?
                          Why not buy a new awesome theme?Why not buy a new awesome theme?Why not buy a new awesome theme?
                          </p>
                        </a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <h4>
                            AdminLTE Design Team
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                          </h4>
                          <p></p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
                
                  <div class="box-body">
                  <table style="width: 80%" class="table">
                    <tr>
                      <td colspan="2" align="center"><b>案件来源登记表</b></td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right">(<input style="border: 0px" type="text">  )案来登(<input style="border: 0px" type="text">)号</td>
                    </tr>
                     <tr>
                      <td colspan="2"><hr style="height:2px;border:none;border-top:2px ridge black; width:80%"/></td>
                    </tr>
                    <tr>
                      <td style="left: 10%" colspan="2">案件来源：<input type="text"></td>
                    </tr>
                    <tr>
                    	<td>案件来源时间：<input type="text"></td>
                    	<td>联系人(单位)：<input type="text"></td>
                    </tr>
                    
                    <tr>
                      <td style="left: 10%" colspan="2">联系电话：<input type="text"></td>
                    </tr>
                    
                    <tr>
                      <td style="left: 10%" colspan="2">联系地址及邮编：<input type="text"></td>
                    </tr>
                    
                    
                    
                    <tr>
                      <td>4.</td>
                      <td>Fix and squish bugs</td>
                      
                    </tr>
                  </table>
                </div><!-- /.box-body -->
                

              
                
                
</div>

				  
				  <div id="div5" style="display: none" class=WordSection1 style='layout-grid:15.6pt'>

<p class=p17 align=center style='margin:0cm;margin-bottom:.0001pt;text-align:
center'><b><span lang=EN-US>1.</span>案件来源登记表 <span lang=EN-US><o:p></o:p></span></b></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes">  </span></span></p>



<p class=MsoNormal><span lang=EN-US><span
style="mso-spacerun:yes">                                        </span></span><span
style='font-size:10.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-ascii-font-family:
Calibri;mso-hansi-font-family:Calibri'>（</span><span lang=EN-US
style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style="mso-spacerun:yes">       </span></span><span style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>）</span><span lang=EN-US style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style="mso-spacerun:yes">   </span></span><span
style='font-size:10.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-ascii-font-family:
Calibri;mso-hansi-font-family:Calibri'>案来登〔</span><span lang=EN-US
style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style="mso-spacerun:yes">      </span></span><span style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>〕</span><span lang=EN-US style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style="mso-spacerun:yes">     </span></span><span
style='font-size:10.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-ascii-font-family:
Calibri;mso-hansi-font-family:Calibri'>号</span></p>

<p class=MsoNormal><!--[if gte vml 1]><v:line id="Line_x0020_2" o:spid="_x0000_s1026"
 style='position:absolute;left:0;text-align:left;z-index:251508736;
 mso-wrap-style:square' from="0,7.8pt" to="414pt,7.8pt" o:allowincell="f"
 strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
position:absolute;z-index:251508736;left:0px;margin-left:-2px;margin-top:6px;
width:421px;height:7px'><img width=421 height=7 
src="%E6%89%A7%E6%B3%95%E6%96%87%E4%B9%A6%EF%BC%88%E9%A3%9F%E8%8D%AF%E7%9B%91%EF%BC%89.files/image001.png"
v:shapes="Line_x0020_2"></span><![endif]><span lang=EN-US><span
style="mso-spacerun:yes"> </span></span></p>

<p class=MsoNormal style='line-height:150%'><span style='font-family:宋体;
mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>案件来源：</span><u><span
lang=EN-US><span
style="mso-spacerun:yes">                                                                    
</span><o:p></o:p></span></u></p>

<p class=MsoNormal style='line-height:150%'><span style='font-family:宋体;
mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>案件来源时间：</span><u> <span
style="mso-spacerun:yes"> </span><span lang=EN-US><span
style="mso-spacerun:yes">                      </span></span></u><span
style='font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>联系人（单位）：</span><u><span
lang=EN-US><span style="mso-spacerun:yes">        </span><span
style="mso-spacerun:yes">           </span><span
style="mso-spacerun:yes">            </span><o:p></o:p></span></u></p>

<p class=MsoNormal style='line-height:150%'><span style='font-family:宋体;
mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>联系电话：</span><u><span
lang=EN-US><span style="mso-spacerun:yes">                                
</span><o:p></o:p></span></u></p>

<p class=MsoNormal style='line-height:150%'><span style='font-family:宋体;
mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>联系地址及邮编：</span> <u><span
lang=EN-US><span
style="mso-spacerun:yes">                                                              </span></span></u></p>

<p class=MsoNormal><!--[if gte vml 1]><v:line id="Line_x0020_4" o:spid="_x0000_s1027"
 style='position:absolute;left:0;text-align:left;z-index:251510784;
 mso-wrap-style:square' from="0,7.8pt" to="414pt,7.8pt" o:allowincell="f"
 strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
position:absolute;z-index:251510784;left:0px;margin-left:-2px;margin-top:6px;
width:421px;height:7px'><img width=421 height=7
src="%E6%89%A7%E6%B3%95%E6%96%87%E4%B9%A6%EF%BC%88%E9%A3%9F%E8%8D%AF%E7%9B%91%EF%BC%89.files/image002.png"
v:shapes="Line_x0020_4"></span><![endif]><span lang=EN-US><span
style="mso-spacerun:yes"> </span></span></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes">   </span></span></p>

<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>基本情况介绍：</span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes">  </span></span></p>

<p class=MsoNormal><span lang=EN-US><span
style="mso-spacerun:yes">                                               
</span></span><span style='font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>记录人：</span><u><span lang=EN-US><span
style="mso-spacerun:yes">                 </span><o:p></o:p></span></u></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes"> </span></span></p>

<p class=MsoNormal><span lang=EN-US><span
style="mso-spacerun:yes">                 </span><span
style="mso-spacerun:yes">                                         </span></span><span
style='font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>年</span><span
lang=EN-US><span style="mso-spacerun:yes">   </span></span><span
style='font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>月</span><span
lang=EN-US><span style="mso-spacerun:yes">   </span></span><span
style='font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>日</span></p>

<p class=MsoNormal><!--[if gte vml 1]><v:line id="Line_x0020_5" o:spid="_x0000_s1028"
 style='position:absolute;left:0;text-align:left;z-index:251511808;
 mso-wrap-style:square' from="0,7.8pt" to="414pt,7.8pt" o:allowincell="f"
 strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
position:relative;z-index:251511808;left:-2px;top:6px;width:421px;height:13px'><img
width=421 height=7 src="%E6%89%A7%E6%B3%95%E6%96%87%E4%B9%A6%EF%BC%88%E9%A3%9F%E8%8D%AF%E7%9B%91%EF%BC%89.files/image003.png"
v:shapes="Line_x0020_5"></span><![endif]><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<br style='mso-ignore:vglayout' clear=ALL>

<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>处理意见：</span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes">  </span></span></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes">  </span></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><span
style="mso-spacerun:yes">                                               
</span></span><span style='font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>负责人：</span><u><span lang=EN-US><span
style="mso-spacerun:yes">                  </span><o:p></o:p></span></u></p>

<p class=MsoNormal><span lang=EN-US><span style="mso-spacerun:yes">  </span></span></p>

<p class=MsoNormal><span lang=EN-US><span
style="mso-spacerun:yes">                                                         
</span></span><span style='font-family:宋体;mso-ascii-font-family:Calibri;
mso-hansi-font-family:Calibri'>年</span><span lang=EN-US><span
style="mso-spacerun:yes">   </span></span><span style='font-family:宋体;
mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>月</span><span
lang=EN-US><span style="mso-spacerun:yes">   </span></span><span
style='font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri'>日</span></p>

<p class=MsoNormal><!--[if gte vml 1]><v:line id="Line_x0020_3" o:spid="_x0000_s1029"
 style='position:absolute;left:0;text-align:left;z-index:251509760;
 mso-wrap-style:square' from="0,7.8pt" to="414pt,7.8pt" o:allowincell="f"
 strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
position:absolute;z-index:251509760;left:0px;margin-left:-2px;margin-top:6px;
width:421px;height:7px'><img width=421 height=7
src="%E6%89%A7%E6%B3%95%E6%96%87%E4%B9%A6%EF%BC%88%E9%A3%9F%E8%8D%AF%E7%9B%91%EF%BC%89.files/image004.png"
v:shapes="Line_x0020_3"></span><![endif]><span lang=EN-US><span
style="mso-spacerun:yes">  </span></span></p>

</div>
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
                  
                  
                  
                  
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
