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
			$("#time11").datetimepicker();
			$("#time12").datetimepicker();
			$("#time13").datetimepicker();
			$("#time21").datetimepicker();
			$("#time22").datetimepicker();
			$("#time23").datetimepicker();
			$("#time24").datetimepicker();
			$("#time31").datetimepicker();
			$("#time32").datetimepicker();
			$("#time41").datetimepicker();
			$("#time42").datetimepicker();
			$("#time5").datetimepicker();
			$("#time51").datetimepicker();
			$("#time52").datetimepicker();
			$("#time6").datetimepicker();
			$("#time7").datetimepicker();
			$("#time81").datetimepicker();
			$("#time82").datetimepicker();
			
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
                  <h3>抽检报告制作</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               <form id="formValidate" action="<c:url value='/ProductionServlet'/>" method="post">
                 
                 <div>
                 
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        
                         <td align="center">
                         	<b>被抽检单位：</b><input type="text" style="width:280px" name="">
                         </td>
                     </tr>
                     
                     
                     <tr>
                         <td align="center" colspan="2">
                         	<b>抽检时间：</b><input type="text" id="time" readonly="readonly" name="" style="width:280px" placeholder="请选择">
                         </td>
                     </tr>
                     
                     
                     <tr>
						<td align="center" colspan="2">
							<b>请选择表：</b>
							<select id="table" style="width: 280px" name="table" onchange="changeFunc();">
								<option value="div0">请选择</option>
								<option value="div1">保健食品安全抽样检验告知书</option>
								<option value="div2">保健食品抽样记录</option>
								<option value="div3">保健食品安全抽样检验工作质量及工作纪律反馈单</option>
								<option value="div4">保健食品安全抽样检验样品购置费用告知书</option>
								<option value="div5">现场检查笔录</option>
								<option value="div6">保健食品安全抽样检验样品信息登记表</option>
								<option value="div7">保健食品安全抽样检验样品移交确认单</option>
								<option value="div8">检验结果告知书</option>
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
				  					<h3 class="yk_h2" align="center">保健食品安全抽样检验告知书</h3>
				  					<div align="right" class="yk_yuankuohao">No<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />&nbsp;&nbsp;&nbsp;&nbsp;</div>
				                    <hr class="hrStyle"/>
				  			</div>
				  		</div>
				  			
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					
				  					<p>
				  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  						依据《中华人民共和国食品安全法》，国家对保健食品进行定期或者不定期的抽样检验。按我局部署，现对你单位依法进行保健食品安全
				  						(<input type="checkbox" name="" value="">监督抽检、
				  						<input type="checkbox" name="" value="">风险监测)。
				  						请你单位认真阅读本通知书背面《保健食品安全抽样检验企业须知》，并予以积极配合。
				  					</p>
				  					<br/>
				  					被抽保健食品:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>	
				  					抽样单位:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />	
				  					<br/>
				  					<br/>
				  					抽样人员:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					抽样日期:<input type="text" id="time11" readonly="readonly" name="" style="width:240px" placeholder="年    月    日">
				  					<br/>
				  					<br/>
				  					<br/>
				  					<br/>
				  					<br/>
				  			</div>
				  		</div>
				  		
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="time12" readonly="readonly" name="" style="width:120px" placeholder="年    月    日"></p>
				  				<p style="text-align: right;">有效期至&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				  				<input type="text" id="time13" readonly="readonly" name="" style="width:120px" placeholder="年    月    日"></p>
				  				<hr class="hrStyle"/>
				  				<br>
				  				<br>
				  				<br>
				  				<br>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p>
				  					&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  					本告知书一式三联。第一联被抽样单位留存；第二联 抽样单位留存；第三联组织抽样检验的食品药品监管部门（市场监管部门）留存
				  				</p>
				  				<br>
				  				<br>
				  				<br>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				
				  					<h3 class="yk_h2" align="center">保健食品安全抽样检验被抽样单位须知</h3>
				  					<p>
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					1．对保健食品进行抽样检验是食品药品监管（市场监管）部门依法履行监管职责的一项重要措施，任何单位和个人不得妨碍抽检工作的正常进行。被抽样单位无正当理由，对抽样工作不配合或者拒绝抽样检验的，按拒检处理。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									2．依据《中华人民共和国食品安全法》的有关规定，抽样检验的样品通过购买的方式获取,不向被抽样单位收取检验费和其他任何费用。被抽样单位应及时将《保健食品安全抽样检验样品购置费用告知书》和相应的发票送至指定单位。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									3．保健食品安全抽样检验事先不通知被抽样单位。抽样人员不得少于2名，抽样前应向被抽样单位出示注明抽检监测内容的《保健食品安全抽样检验告知书》（原件）和抽样人员有效身份证件。抽样单位为承检机构的，抽样前还应向被抽样单位出示《保健食品安全抽样检验任务委托书》(复印件)。
									样品应由抽样人员从保健食品生产者的成品库的待销产品、保健食品经营者销售的食品中抽取。保健食品标签、包装、说明书标有“试制”或者“样品”等字样的和全部用于出口的保健食品不在抽样范围。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									4．抽取的样品应由抽样人员自行送达或寄送至承检机构。确需被抽样单位协助寄送的，抽样人员应明确告知样品的寄、送要求。被抽样单位应在规定的时限内正确寄送，寄送样品的费用由抽样单位支付。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									5．被抽样单位应当协助抽样工作人员如实填写保健食品安全抽样检验抽样单。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									6．被抽样单位、生产者对执行此次抽检任务的单位、个人及有关抽检工作的任何意见，请填写《保健食品安全抽样检验工作质量及工作纪律反馈单》，填写完毕后寄送至指定单位。反馈意见者应留下电话、传真、Email等联系方式。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									7．凡在市场上抽取的或涉及委托加工的样品，生产者或委托加工方应自收到通知之日起5个工作日内反馈意见，逾期未反馈的，视为认同样品的真实性。
				  				</p>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			</div>
				  		</div>
  					</div>
  					
  				 
  				 <div class="container" id="div2" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 align="center">保 健 食 品 抽 样 记 录</h3>
				  					<div align="right" class="yk_yuankuohao">编号:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" /></div>
				  					<br>
				  			</div>
				  		</div>
				  		
				  		<div class="col-lg-10 col-md-10">
				  				<table align="center" border="1" style="width: 100%;height: 100%">
				  					
				  					
				  					<tr>
				  						<td align="center">抽样单位</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">抽样日期</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">产品名称</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">商标(牌号)</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">文号持有者</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">地址</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">剂型</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">规格</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">包 装 规  格</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">批号</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">生产日期</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center"> 有（失）效期</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">批准文号</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">国产或进口</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">被抽样单位</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">被抽样单位地址</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">被抽样单位联系人</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">联系电话</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">邮编</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">国产或进口</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4" align="center">1.功能类别</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="增强免疫力功能">增强免疫力功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="缓解体力疲劳功能">缓解体力疲劳功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="抗氧化功能"> 抗氧化功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="增加骨密度功能"> 增加骨密度功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="辅助降血脂功能"> 辅助降血脂功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="辅助降血糖功能">辅助降血糖功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="辅助降血压功能">辅助降血压功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="减肥功能"> 减肥功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="通便功能 "> 通便功能 	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="促进消化功能"> 促进消化功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="改善生长发育功能">改善生长发育功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="改善睡眠功能">改善睡眠功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="改善营养性贫血功能"> 改善营养性贫血功能	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="辅助改善记忆功能 "> 辅助改善记忆功能 	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他"> 其他	&nbsp;&nbsp;&nbsp;&nbsp;
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4" align="center">2.外包装情况</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="包装无破损">包装无破损	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="无水迹">无水迹	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="无污染"> 无污染	&nbsp;&nbsp;&nbsp;&nbsp;
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4" align="center">3.抽样地点</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="生产单位">生产单位	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="批发">批发	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="零售"> 零售	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value=" 仓库 ">  仓库 	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="货架"> 货架	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他"> 其他	&nbsp;&nbsp;&nbsp;&nbsp;
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4" align="center">4.抽样情况</td>
				  					</tr>
				  					
				  					
				  					
				  					
				  					<tr>
				  						<td align="center">样品包装</td>
				  						<td colspan="3">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="玻璃瓶 ">  玻璃瓶 	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="纸盒"> 纸盒	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="铝塑"> 铝塑	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="塑料袋"> 塑料袋	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他"> 其他	&nbsp;&nbsp;&nbsp;&nbsp;
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">抽样数量</td>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">单价</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">总价</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">抽样说明</td>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">被抽样单位经手人签名</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">抽样单位经手人签名</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  				</table>
				  			</div>
				  </div>	
  					
  					
  					
  					<div class="container" id="div3" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 align="center">保健食品安全抽样检验工作质量及工作纪律反馈单</h3>
				  					<div align="right" class="yk_yuankuohao">No<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" /></div>
				  					<br>
				  			</div>
				  		</div>
				  		
				  		<div class="col-lg-10 col-md-10">
				  				<table align="center" border="1" style="width: 100%;height: 70%">
				  				
				  					<tr>
				  						<td align="center">抽样检验产品名称</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">抽样日期</td>
				  						<td><input type="text" id="time31" readonly="readonly" name="" style="width: 100%;height: 100%;" placeholder="年   月   日"></td>
				  					</tr>
				  				
				  					<tr>
				  						<td align="center">抽样单位名称</td>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">抽样人员姓名</td>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center" rowspan="11">对抽样单位<br>抽样工作的评价</td>
				  						<td colspan="3">
				  							1.(&nbsp;
				  							<input type="checkbox" name="" id="" value="">是	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="">否	)&nbsp;&nbsp;&nbsp;&nbsp;抽样人员抽样前，是否出示有效工作证？
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3">
				  							2.(&nbsp;
				  							<input type="checkbox" name="" id="" value="">是	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="">否	)&nbsp;&nbsp;&nbsp;&nbsp;抽样人员是否向你单位说明样品通过购买取得（或送达《化妆品抽样检验样品购置费用告知书》）？
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3">
				  							3.(&nbsp;
				  							<input type="checkbox" name="" id="" value="">是	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="">否	)&nbsp;&nbsp;&nbsp;&nbsp;抽样人员是否对所抽取的样品全部当场进行封样？是否对样品采取了防拆封措施？
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3">
				  							4.(&nbsp;
				  							<input type="checkbox" name="" id="" value="">是	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="">否	)&nbsp;&nbsp;&nbsp;&nbsp;抽样人员是否按产品标签中标注的保存条件及其他特殊要求对所抽取的样品进行保存？
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3">
				  							5.(&nbsp;
				  							<input type="checkbox" name="" id="" value="">是	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="">否	)&nbsp;&nbsp;&nbsp;&nbsp;抽样人员在抽样过程中是否廉洁公正？
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					<tr>
				  						<td colspan="3">上述选项中填写“否”的，请简要描述抽样人员的违规行为。</td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">对保健食品抽样检验工作的意见和建议</td>
				  						<td colspan="3"><textarea name="" id="" style="width: 100%;height: 100%;border: 0px"></textarea> </td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">被抽样单位</td>
				  						<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0">
				  							<div>
				  								电话：<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  								E-Mail：<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  								<br>
				  								传真：<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  								<br>
				  								<div align="center">
				  									法定代表人或负责人签字：
				  									<input type="text" style="border: 0px;width: 180px;" name="" id="" />
				  								</div>
				  								<div align="right">
					  								填表日期：<input type="text" id="time32" readonly="readonly" name="" style="width:120px;" placeholder="年   月   日">
					  							</div>
				  							</div>
				  						</td>
				  					</tr>
				  				</table>
				  				<p>说明：如对抽样工作有异议，请被抽样单位将本表填写好并加盖公章后，按以下联系方式寄送或传真本表。</p>
				  				反馈受理单位：
				  				<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
								通讯地址及邮编：
								<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
								联系电话：
								<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
								传    真：
								<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  			</div>
				  </div>	
				  				
				  																<!--  4 -->
				  <div class="container" id="div4" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 class="yk_h2" align="center">保健食品安全抽样检验样品购置费用告知书</h3>
				  			</div>
				  		</div>
				  			
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />:
				  					<br/>
				  					<br/>
				  					<p>
				  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						食品药品监督管理（市场监督管理）局在
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 120px;" name="" id="" />
				  						年依法组织保健食品安全抽样检验，抽样检验保健食品相关信息详见编号为
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 120px;" name="" id="" />
				  						的《保健食品安全抽样检验抽样单》。按照《中华人民共和国食品安全法》的有关规定，保健食品抽样检验的样品以向企业购买的方式获得。现告知如下：
				  					</p>
				  					<br/>
				  					<p>
				  						1.被抽样单位须提供正式发票，如果被抽样单位不能现场提供正式发票，则在样品被抽检后1个月内将此告知书和被抽样品购置费（按照食品销售价格核算）的正式发票及所购样品明细邮寄到付款单位，由付款单位支付购样费（样品购置费）。
				  					</p>
				  					<br/>
				  					2.发票抬头填写：
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
									项目填写：
									<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
									税务登记号：
									<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
									开户行名称：
									<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" /><br><br>
									账号(含税号)：
									<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					3.此次抽样检验的样品购置费用：<br>
				  					<table align="center" border="1" style="width: 100%;height: 35%">
				  						<tr>
				  							<th align="center">样品名称</th>
				  							<th align="center">单价（元）</th>
				  							<th align="center">数量</th>
				  							<th align="center">金额（元）</th>
				  						</tr>
				  						<tr>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						
				  						<tr>
				  							<td align="center">总计:(大写)</td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td>小写：</td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  					</table>
				  					<br/>
				  					4.付款单位信息<br>
				  					<br/>
				  					<table align="center" border="1" style="width: 100%;height: 10%">
				  						<tr>
				  							<td align="center">单位名称  </td>
				  							<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td align="center">地址及邮编  </td>
				  							<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td align="center">联系人  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td align="center">电话  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  					</table>
				  					<br/>
				  					5.企业收款信息（由被抽样单位自行填写完整的正确信息）<br><br/>
				  					<table align="center" border="1" style="width: 100%;height: 15%">
				  						<tr>
				  							<td align="center">企业全称  </td>
				  							<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td align="center">开户行名称 </td>
				  							<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td align="center">银行账号 </td>
				  							<td colspan="3"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  						<tr>
				  							<td align="center">企业联系人 </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  							<td align="center">电话  </td>
				  							<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0px">  </td>
				  						</tr>
				  					</table>
				  					<br/><br/>
				  					<table align="center" style="width: 100%;border=0px">
				  						<tr>
				  							<td>
				  								<div align="center">
				  									被抽样单位签字（盖章）<br><br>
				  									<input type="text" id="time41" readonly="readonly" name="" style="width:120px;" placeholder="年   月   日">
				  								</div>
				  							</td>
				  							<td>
				  								<div align="center">
				  									被抽样单位签字（盖章）<br><br>
				  									<input type="text" id="time42" readonly="readonly" name="" style="width:120px;" placeholder="年   月   日">
				  								</div>
				  							</td>
				  						</tr>
				  					</table>
				  			</div>
				  		</div>
  					</div>
				  													<!-- -                     div5 									-->
				  <div class="container" id="div5" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 class="yk_h2" align="center">现场检查笔录</h3>
				                    <hr class="hrStyle"/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					被检查单位(人):<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					陪同人员:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					检查现场:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>	
				  					法定代表人(负责人):<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					联系方式:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />	
				  					<br/>
				  					<br/>
				  					检查人:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					记录人:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					监督检查类别:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					检查时间:
				  					<input type="text" id="time51" readonly="readonly" name="" style="width:120px" placeholder="请选择">
				  					至<input type="text" id="time52" readonly="readonly" name="" style="width:120px" placeholder="请选择">
				  					<hr style="height:2px;border:none;border-top:2px solid black;" />
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p>
				  					&nbsp;&nbsp;&nbsp;&nbsp;
				  					我们是<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />的执法人员:
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />、
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />执法证件名称、编号是：
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />                                           ，请你确认。
									我们依法就 <br/><br/>
									<textarea style="width: 100%;height: 75px"></textarea><br><br>
									有关问题，进行现场检查，请予配合。根据《中华人民共和国行政处罚法》第三十七条第三款的规定，如果你认为检查人员与当事人有直接利害关系的，你有申请检查人员回避的权利。
									<br>
									<br>
									&nbsp;&nbsp;&nbsp;&nbsp;
									问：你是否申请检查人员回避？<br/><br/>
									&nbsp;&nbsp;&nbsp;&nbsp;
									答：<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
									<br><br>
									现场检查记录：<br><br/>
									<textarea style="width: 100%;height: 150px"></textarea>
				  				</p>
				  			</div>
				  		</div>
				  		
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<hr class="hrStyle"/>
				  				<p>注：本文书一式二联，第一联存档，第二联交被检查单位。被检查人在检查笔录上逐页签字，在修改处签字或者按指纹，并在笔录终了处注明对笔录真实性的意见；检查人应在笔录终了处签字。</p>
				  				<hr class="hrStyle"/>
				  				<br>
				  				被检查人签字：
				  				<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  			</div>
				  		</div>
  					</div>
				  <!-- -                     div6 									-->
				  <div class="container" id="div6" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 align="center">保健食品安全抽样检验样品信息登记表</h3>
				  			</div>
				  		</div>
				  		
				  		<div class="col-lg-12 col-md-12">
				  				<table align="center" border="1" style="width: 100%;height: 60%">
				  					<tr>
				  						<td>采样单位</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td>采样人</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td>采样时间(年月日)</td>
				  						<td colspan="2"><input type="text" id="time6" readonly="readonly" name="" style="width:100%;height: 100%;border: 0" placeholder="请选择"></td>
				  					</tr>
				  				
				  					<tr>
				  						<td align="center">样品编号</td>
				  						<td align="center">样品名称</td>
				  						<td align="center">生产单位</td>
				  						<td align="center">生产日期</td>
				  						<td align="center">规格</td>
				  						<td align="center">抽样数量</td>
				  						<td align="center">生产单位名称</td>
				  						<td align="center">被采样单位名称</td>
				  						<td align="center">被采样单位地址</td>
				  					</tr>
				  				
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  				</table>
				  			</div>
				  </div>
				  
				  <!-- -                     div7 									-->
				  
				  <div class="container" id="div7" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 align="center">保健食品安全抽样检验样品移交确认单</h3>
				  			</div>
				  		</div>
				  		
				  		<div class="col-lg-10 col-md-10">
				  				<table align="center" border="1" style="width: 100%;height: 70%">
				  					<tr>
				  						<td colspan="3"><input type="text" style="width: 100%;height: 100%;border: 0" name="" id=""></td>
				  					</tr>
				  					<tr>
				  						<td>抽样时间</td>
				  						<td colspan="2"><input type="text" id="time7" readonly="readonly" name="" style="width:100%;height: 100%;border: 0" placeholder="年	月	日	时	分"></td>
				  					</tr>
				  					<tr>
				  						<td>样品件数（含备用样品）</td>
				  						<td colspan="2"><input type="text" name="" style="width: 100%;height: 100%;border: 0"/></td>
				  					</tr>
				  					<tr>
				  						<td>样品抽样单编号</td>
				  						<td colspan="2"><input type="text" name="" style="width: 100%;height: 100%;border: 0"/></td>
				  					</tr>
				  					<tr>
				  						<td rowspan="4">样品检查记录</td>
				  						<td>封条</td>
				  						<td>
				  							<input type="radio" name="fengTiao" id="">完好&nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="fengTiao" id="">有破损
				  						</td>
				  					</tr>
				  					<tr>
				  						<td>样品包装</td>
				  						<td>
				  							<input type="radio" name="pack" id="">完好&nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="pack" id="">有破损
				  						</td>
				  					</tr>
				  					<tr>
				  						<td>样品数量</td>
				  						<td>
				  							<input type="radio" name="num" id="">满足要求&nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="num" id="">不满足
				  						</td>
				  					</tr>
				  					<tr>
				  						<td>样品状态</td>
				  						<td>
				  							<input type="radio" name="state" id="">正常&nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="state" id="">异常
				  						</td>
				  					</tr>
				  					<tr>
				  						<td rowspan="2">文书检查记录</td>
				  						<td>文书数量</td>
				  						<td>
				  							<input type="radio" name="writNum" id="">齐全&nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="writNum" id="">不齐全
				  						</td>
				  					</tr>
				  					<tr>
				  						<td>文书信息</td>
				  						<td>
				  							<input type="radio" name="writInfor" id="">与样品相符&nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="writInfor" id="">与样品不符
				  						</td>
				  					</tr>
				  					<tr>
				  						<td rowspan="2">样品移交确认结果</td>
				  						<td colspan="2">
				  							<input type="radio" name="result" id="">接受 &nbsp;&nbsp;&nbsp;
				  							<input type="radio" name="result" id="">拒收
				  						</td>
				  					</tr>
				  					<tr>
				  						<td>拒绝理由</td>
				  						<td><textarea style="width: 100%;height: 100%;border: 0;"> </textarea></td>
				  					</tr>
				  					<tr>
				  						<td>抽样单位</td>
				  						<td><input type="text" name="" style="width: 100%;height: 100%;border: 0"/></td>
				  						<td rowspan="2">承检机构样品确认人签字（盖章）</td>
				  					</tr>
				  					<tr>
				  						<td>样品移交人签字</td>
				  						<td><input type="text" name="" style="width: 100%;height: 100%;border: 0"/></td>
				  					</tr>
				  				</table>
				  				<p>注：本单据一式两联，由承检机构、抽样单位分别保留。</p>	
				  			</div>
				  </div>
				  
				  
				  
				  <div class="container" id="div8" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 class="yk_h2" align="center">检验结果告知书</h3>
				  					<div align="right" class="yk_yuankuohao">
				  					(<input type="text" name="" id="" style="width: 80px;border: 0px">)检结告
				  					(<input type="text" name="" id="" style="width: 80px;border: 0px">)号&nbsp;&nbsp;&nbsp;&nbsp;</div>
				                    <hr class="hrStyle"/>
				  			</div>
				  		</div>
				  			
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />:
				  					<br/>
				  					<br/>
				  					<p>
				  						&nbsp;&nbsp;&nbsp;&nbsp;本机关依法对你单位
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						进行抽样并委托有关单位进行了检验，检验报告书见附件。
				  						<br>
				  					</p>
				  					<br/>
				  					
				  					<p>
				  						&nbsp;&nbsp;&nbsp;&nbsp;依据 
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						的规定，如对本检验结果有异议，可在收到检验报告书之日起
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						内向
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  						提出书面复检申请并申明理由。逾期视为放弃该项权利。
				  					</p>
				  					<br/>	
				  					
				  					<br/>
				  					<br/>
				  						<p>&nbsp;&nbsp;&nbsp;&nbsp;特此告知。</p>
				  					<br/>
				  					
				  					<br/>
				  					<br/>
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			<p style="text-align: right;">(公章):<br /></p>	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="time81" readonly="readonly" name="" style="width:120px" placeholder="年    月    日"></p>
				  				<hr class="hrStyle"/>
				  			</div>
				  		</div>
				  		
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  			<p style="text-align: center;">检查结果确认回执<br /></p>
				  			<br>
				  			<br>
				  			本告知书已于<input type="text" id="time82" readonly="readonly" name="" style="width:150px" placeholder="年   月    日     时    分">收到。	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;">接收人签字:<input type="text" name="" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 120px;"></p>
				  				<hr class="hrStyle"/>
				  				<p>注：本文书一式二联，第一联存档，第二联交被抽样单位。</p>
				  				<hr class="hrStyle"/>
				  			</div>
				  		</div>
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
