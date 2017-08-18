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
								<option value="div1">食品安全抽样检验告知书</option>
								<option value="div2">食品安全抽样检验抽样单</option>
								<option value="div3">食品安全抽样检验工作质量及工作纪律反馈单</option>
								<option value="div4">食品安全抽样检验样品购置费用告知书</option>
								<option value="div5">现场检查笔录</option>
								<option value="div6">食品安全抽样检验样品信息登记表</option>
								<option value="div7">食品安全抽样检验样品移交确认单</option>
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
				  					<h3 class="yk_h2" align="center">食品安全抽样检验告知书</h3>
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
				  						依据《化妆品卫生监督条例》，国家对化妆品进行定期或者不定期的抽样检验。按我局部署，现对你单位依法进行化妆品
				  						(<input type="checkbox" name="" value="">监督抽检、
				  						<input type="checkbox" name="" value="">风险监测)。
				  						请你单位认真阅读本通知书背面《化妆品抽样检验企业须知》，并予以积极配合。
				  					</p>
				  					<br/>
				  					被抽食品:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>	
				  					抽样单位:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />	
				  					<br/>
				  					<br/>
				  					抽样人员:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					抽样日期:<input type="text" id="time11" readonly="readonly" name="" style="width:240px" placeholder="年　月　日">
				  					<br/>
				  					<br/>
				  					<br/>
				  					<br/>
				  					<br/>
				  			</div>
				  		</div>
				  		
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;"><input type="text" id="time12" readonly="readonly" name="" style="width:120px" placeholder="年　月　日"></p>
				  				<p style="text-align: right;">有效期至&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				  				<input type="text" id="time13" readonly="readonly" name="" style="width:120px" placeholder="年　月　日"></p>
				  				<br>
				  				<hr class="hrStyle"/>
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
				  				
				  					<h3 class="yk_h2" align="center">食品安全抽样检验被抽样单位须知</h3>
				  					<p>
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					1．对食品进行抽样检验是食品药品监管部门依法履行监管职责的一项重要措施，任何单位和个人不得妨碍抽检工作的正常进行。被抽样单位无正当理由，对抽样工作不配合或者拒绝抽样检验的，按拒检处理。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									2．依据《中华人民共和国食品安全法》的有关规定，抽样检验的样品通过购买的方式获取,不向被抽样单位收取检验费和其他任何费用。被抽样单位应及时将《国家食品安全抽样检验样品购置费用告知书》和相应的发票送至指定单位。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									3．国家食品安全抽样检验事先不通知被抽样单位。抽样人员不得少于2名，抽样前应向被抽样单位出示注明抽检监测内容的《国家食品安全抽样检验告知书》（原件）和抽样人员有效身份证件。抽样单位为承检机构的，抽样前还应向被抽样单位出示《国家食品安全抽样检验任务委托书》(复印件)。
									样品应由抽样人员从食品生产者的成品库的待销产品、食品经营者销售的食品、餐饮服务提供者使用或销售的食品中抽取。食品标签、包装、说明书标有“试制”或者“样品”等字样的和全部用于出口的食品不在抽样范围。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									4．抽取的样品应由抽样人员自行送达或寄送至承检机构。确需被抽样单位协助寄送的，抽样人员应明确告知样品的寄、送要求。被抽样单位应在规定的时限内正确寄送，寄送样品的费用由抽样单位支付。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									5．被抽样单位应当协助抽样工作人员如实填写国家食品安全抽样检验抽样单。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									6．被抽样单位、生产者对执行此次抽检任务的单位、个人及有关抽检工作的任何意见，请填写《国家食品安全抽样检验工作质量及工作纪律反馈单》，填写完毕后寄送至指定单位。反馈意见者应留下电话、传真、Email等联系方式。
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
				  			<div class="col-lg-12 col-md-12">
				  					<h3 align="center">食品安全抽样检验抽样单</h3>
				  					<div align="right" class="yk_yuankuohao">No<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" /></div>
				  					<br>
				  			</div>
				  		</div>
				  		
				  		<div class="col-lg-12 col-md-12">
				  				<table align="center" border="1" style="width: 100%;height: 100%">
				  				
				  					<tr>
				  						<td align="center" colspan="2">任务来源</td>
				  						<td colspan="4"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">任务类别</td>
				  						<td colspan="2">
				  							&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" id="" name="" value="监督抽检">监督抽检          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" id="" name="" value="风险监测">风险监测
				  						</td>
				  					</tr>
				  				
				  					<tr>
				  						<td rowspan="4" align="center">被抽样单位信息</td>
				  						<td align="center">单位名称</td>
				  						<td colspan="4"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">区域类型</td>
				  						<td colspan="2">
				  							&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" id="" name="" value="城市">城市          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" id="" name="" value="乡村">乡村
				  						</td>
				  						
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">单位地址</td>
				  						<td colspan="7"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">法定代表人</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">年销售额(万元)</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">营业执照号</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">联 系 人</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">电    话</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">传真</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">邮编</td>
				  						<td><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center" rowspan="5">抽样地点</td>
				  						<td align="center">生产环节</td>
				  						<td colspan="7">
				  							&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="成品库">原辅料库
				  							<input type="checkbox" name="" id="" value="生产线">&nbsp;&nbsp; 生产线
				  							<input type="checkbox" name="" id="" value="半成品库">半成品库	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="待检区">成品库(待检区)	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="已检区"> 成品库(已检区)
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center" colspan="7">流通环节:</td>
				  						<td>
				  							<input type="checkbox" name="" id="" value="批发市场">批发市场	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="农贸市场">农贸市场	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="商场"> 商场	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="超市"> 超市	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="菜市场">菜市场	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="小食杂店">小食杂店	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="网购">网购	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他">其他
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td rowspan="3" align="center">餐饮环节</td>
				  						<td colspan="7">
				  							<input type="checkbox" name="" id="" value="餐馆">餐馆&nbsp;&nbsp;&nbsp;&nbsp;
				  							(<input type="checkbox" name="" id="" value="特大型餐馆">特大型餐馆&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="大型餐馆">大型餐馆&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="中型餐馆"> 中型餐馆
				  							<input type="checkbox" name="" id="" value="小型餐馆">小型餐馆	)
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="7">
				  							<input type="checkbox" name="" id="" value="食堂">食堂&nbsp;&nbsp;&nbsp;&nbsp;
				  							(<input type="checkbox" name="" id="" value="机关食堂">机关食堂&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="学校∕托幼食堂">学校∕托幼食堂&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="企事业单位食堂 "> 企事业单位食堂 
				  							<input type="checkbox" name="" id="" value="建筑工地食堂">建筑工地食堂	)
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="7">
				  							<input type="checkbox" name="" id="" value="小吃店 ">小吃店 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="快餐店">快餐店&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="饮品店">饮品店&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="集体用餐配送单位"> 集体用餐配送单位
				  							<input type="checkbox" name="" id="" value="中央厨房 ">中央厨房 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他 ">其他
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td rowspan="10" align="center">样品信息</td>
				  						<td>样品来源</td>
				  						<td colspan="7">
				  							非特殊用途类:	
				  							<input type="checkbox" name="" id="" value="加工自制">加工/自制&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="委托生产 ">委托生产 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="外购">外购&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他"> 其他
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td>样品属性</td>
				  						<td colspan="7">
				  							<input type="checkbox" name="" id="" value="普通食品 ">普通食品 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="特殊膳食食品 ">特殊膳食食品 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="节令食品">节令食品&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="重大活动保障食品">重大活动保障食品
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td>样品类型</td>
				  						<td colspan="7">
				  							<input type="checkbox" name="" id="" value="食用农产品 ">食用农产品 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="工业加工食品 ">工业加工食品 &nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="餐饮加工食品">餐饮加工食品&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="食品添加剂">食品添加剂&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="食品相关产品">食品相关产品&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="其他">其他
				  						</td>
				  					</tr>
				  					
				  					
				  					<tr>
				  						<td colspan="2" align="center">样品名称</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td colspan="2" align="center">商标</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="4" align="center">&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="生产">生产&nbsp;&nbsp;/
				  							<input type="checkbox" name="" id="" value="加工">加工&nbsp;&nbsp;/
				  							<input type="checkbox" name="" id="" value="购进日期">购进日期
				  						</td>
				  						<td colspan="2" align="center">规格型号</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">样品批号</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td colspan="2" align="center">保质期</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">执行标准∕技术文件</td>
				  						<td colspan="2"><input type="text" id="time21" readonly="readonly" name="" style="width:100%;height: 100%" placeholder="请选择"></td>
				  						<td colspan="2" align="center">质量等级</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">生产许可证编号</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">单价</td>
				  						<td> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">是否出口</td>
				  						<td> &nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="是">是&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="否">否
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">抽样基数/批量</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">抽样数</td>
				  						<td> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">备样数量</td>
				  						<td> 
				  							<input type="text" name="" id="" style="width: 100%;height: 100%;border: 0">
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">样品形态</td>
				  						<td colspan="3">
				  							&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="固体">固体	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="半固体">半固体&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="液体">液体	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="气体">气体
				  						</td>
				  						<td colspan="2" align="center">包装分类</td>
				  						<td>
				  							&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="散装">散装 	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="预包装">预包装
				  						</td>
				  					</tr>
				  					
				  					
				  					<tr>
				  						<td colspan="2" align="center">包装分类</td>
				  						<td colspan="3">
				  							&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="散装">散装 	&nbsp;&nbsp;&nbsp;&nbsp;
				  							<input type="checkbox" name="" id="" value="预包装">预包装
				  						</td>
				  						<td colspan="2" >批准文号/备案号</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">抽样数量</td>
				  						<td colspan="2"><input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td colspan="2" align="center">生产/进货数量</td>
				  						<td colspan="3"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td rowspan="2" align="center">(标称)生产者信息</td>
				  						<td colspan="2" align="center">生产企业/代理商名称</td>
				  						<td colspan="6"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="2" align="center">生产企业/代理商地址</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td colspan="2" align="center">联系电话</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td rowspan="2" align="center">抽样单位信息</td>
				  						<td colspan="2" align="center">单位名称</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td colspan="2" align="center">地址</td>
				  						<td colspan="2"> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">联系人</td>
				  						<td> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">电话</td>
				  						<td> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">传真</td>
				  						<td> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  						<td align="center">邮编</td>
				  						<td> <input type="text" name="" id="" style="width: 100%;height: 100%;border: 0"></td>
				  					</tr>
				  					
				  					<tr>
				  						<td align="center">备注</td>
				  						<td colspan="8"><textarea name="" id="" style="width: 100%;height: 100%;border: 0"></textarea></td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="5">
				  							<div>
				  								<b>被抽样单位对抽样程序、过程、封样状态及上述内容无异议</b><br>
				  								被抽样单位签名(盖章)：
					  							<br>
					  							<br>
					  							<br>
					  							<div align="right">
					  								<input type="text" id="time22" readonly="readonly" name="" style="width:120px;" placeholder="请选择">(年月日)
					  							</div>
				  								
				  							</div>
				  						</td>
				  						<td colspan="4">
				  							抽样人(签名):
				  							<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  							<br>
				  							抽样单位(公章):<br>
				  							<br>
				  							<br>
				  							<div align="right">
				  								<input type="text" id="time23" readonly="readonly" name="" style="width:120px;" placeholder="请选择">(年月日)
				  							</div>
				  						</td>
				  					</tr>
				  					
				  					<tr>
				  						<td colspan="1" align="center">
				  								样品交接情况：
				  						</td>
				  						<td colspan="4">
				  								<textarea style="width: 100%;height: 100%;border: 0"></textarea>
				  						</td>
				  						<td colspan="4">
				  							收样人(签名)：
				  							<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 180px;" name="" id="" />
				  							<br>
				  							检验机构(公章):<br>
				  							<br>
				  							<br>
				  							<div align="right">
				  								<input type="text" id="time24" readonly="readonly" name="" style="width:120px;" placeholder="请选择">(年月日)
				  							</div>
				  						</td>
				  					</tr>
				  				</table>
				  				<p>一式四联。第一联交组织抽样检验的食品药品监管（市场监管）机构；第二联交负责核查处置工作的食品药品监管（市场监管）机构；第三联抽样单位留存；第四联交被抽样单位.</p>
				  					<br>
				  					<br>
				  					<br>
				  					<h6 class="yk_h2" align="left">填写说明：</h6>
				  					<p>
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									1．本文书适用于化妆品监督抽检的抽样工作。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									2．此单一式4份。受检单位、抽样单位、负责核查处置工作的食品药品监管（市场监管）机构、组织抽样检验的食品药品监管（市场监管）机构各一份。要求给下达任务部门的为第一联。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									3．抽样单编号：编号规则举例 “13201500001”，其中13是省编号，2015是印刷年号，后五位是样品顺序号。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									4．任务来源：应当根据抽检任务性质在“□国家监督抽验 □日常监督抽验 □专项监督抽验 □有因抽检” 打“√”选择。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									5．被抽样单位：指化妆品监督抽验的直接对象。单位名称应当填写工商营业执照上的名称，被抽样单位名称应当与被抽样单位公章相同。法定代表人应当填写营业执照上的法人代表或其它法定代表人的姓名。联系人一般为从事企业质量管理的有关负责人，联系电话应当填写联系人的固定电话号码或手机号码。
									营业执照号应当填写照营业执照的注册号，不得空缺。单位地址应当填写被抽样企业详细地址，具体到门牌号。一些特殊情况如被抽样企业无名称的，单位名称应当填写单位地址，并标明到详细位置，示例“××市场××排××号”。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									6．抽样地点：在生产环节抽取，在“□成品库”应当打“√”选择，如在生产线和灌装车间取样，则在“其他（    ）”应当打“√”选择，在括号内填写具体地点，如生产线或灌装车间。在经营环节抽取，应当在相应的选项中打“√”选择。
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									7．样品信息：内容应当按照产品外包装的内容如实填写。样品类别按照所抽样品的产品类别进行勾选。样品名称应当反映产品的真实属性，如企业产品标注名称未反映产品真实属性的，应当在产品标注名称后用括弧加注产品真实属性名称，示例：香泽秀（香水）。生产批号和限期使用日期或生产日期和保质期两组中必须有一组为完整填写。
									生产许可证明文件和批准文号/备案号应当按包装填写，标识核查真实性和有效期；国产化妆品必须具备生产许可证明文件编号，国产特殊化妆品同时具备批准文号/备案号；进口化妆品只具有批准文号/备案号。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					8．抽样数量：应当包括检验样品、复检样品和确认样品。生产/进货数量，在生产环节填写生产数量，在经营环节填写进货数量，生产/进货数量是指同抽样样品批号相同的生产/进货数量。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					9．标称生产者：国产产品填写标识的生产企业信息；进口产品则填写代理商信息。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					10．抽样单位：应当完整填写抽样单位全称、地址和邮政编码，详细填写抽样人员或部门有关负责人姓名及联系电话、传真号码。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					11．抽样人签名必须要2人以上，不可代签。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					12．被抽样单位签名（盖章）：是指抽样单填好后由被抽样单位签名确认，加盖公章或其它有效印章，方能生效。如被抽样单位无法加盖公章的，由法定代表人授权经手人签字并加按指模。被抽样者系个人的，由被抽样个人签字并加按指模。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					13．检验机构（盖章）：如果抽样单位和检验机构是不同单位，应当进行样品交接。检验机构在确认样品封存完好，样品与抽样单一致后接收样品。
				  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				  					14．抽样单填写要求：抽样单填写应当字迹工整、清晰，保证一式四联记录内容清楚可见，不得使用不规范的简化字或符号、数字；抽样单内容需要更改时，只能划改，不得涂改、粘贴，且只能在抽样单第一联进行更改，第二联至第四联（如有时）相应修改内容应当为复写。在抽样现场进行的更改，应当经抽样人员与被抽样单位签字人双方签字或被抽样单位盖章确认；
				  					抽样单事后不得随意更改，确需更改的，应当附加受检单位的确认记录；抽样单不得留白，必填项内容不得空缺，非必填项栏目空白应当填上“—”表示。
				  					
				  				</p>
				  			</div>
				  </div>	
  					
  					
  					
  					<div class="container" id="div3" style="display: none">
				  		<div class="row" >
				  			<div class="col-lg-10 col-md-10">
				  					<h3 align="center">化妆品抽样检验工作质量及工作纪律反馈单</h3>
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
				  						<td align="center">对化妆品抽样检验<br>工作的意见和建议</td>
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
				  					<h3 class="yk_h2" align="center">化妆品抽样检验样品购置费用告知书</h3>
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
				  						年依法组织化妆品安全抽样检验，抽样检验化妆品相关信息详见编号为
				  						<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 120px;" name="" id="" />
				  						的《化妆品抽样检验抽样单》。按照《化妆品行政许可检验管理办法》的有关规定，化妆品抽样检验的样品以向企业购买的方式获得。现告知如下：
				  					</p>
				  					<br/>
				  					<p>
				  						1.被抽样单位须提供正式发票，如果被抽样单位不能现场提供正式发票，则在样品被抽检后1个月内将此告知书和被抽样品购置费（按照化妆品销售价格核算）的正式发票及所购样品明细邮寄到付款单位，由付款单位支付购样费（样品购置费）。
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
				  					<h3 align="center">化妆品抽样检验样品移交确认单</h3>
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
				  						<td align="center">样品批号</td>
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
				  					<h3 align="center">化妆品抽样检验样品移交确认单</h3>
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
				  					<h3 class="yk_h2" align="center">化妆品监督抽检检验结果告知书</h3>
				  					<div align="right" class="yk_yuankuohao">
				  						(<input type="text" name="" id="" style="width: 60px;border: 0px">)化检告
				  						(<input type="text" name="" id="" style="width: 60px;border: 0px">)号&nbsp;&nbsp;&nbsp;&nbsp;</div>
				                    <hr class="hrStyle"/>
				  			</div>
				  		</div>
				  			
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  					(被抽样单位/标称生产者/进口代理商):<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					<p>
				  						&nbsp;&nbsp;&nbsp;&nbsp;我单位于<input type="text" id="time" readonly="readonly" name="" style="width:150px" placeholder="请选择">(年月日)对你单位
				  						(<input type="checkbox">经销&nbsp;
				  						   <input type="checkbox">生产&nbsp;
				  						   <input type="checkbox">进口代理)的
				  						   <input type="text" style="width: 250px">(样品名称) 产品进行了监督抽检，检验报告书见附件。
				  					</p>
				  					<br/>
				  					
				  					<p>
				  						&nbsp;&nbsp;&nbsp;&nbsp;请收到此告知书后立即将《检验结果确认回执》传真或寄送回本单位。
				  						对检验结果有异议的，请在接到本告知书起7个工作日内向组织抽检部门或者其上一级食品药品监督管理部门提出书面（传真或寄送文本）意见和相关证明材料。
				  						逾期无书面反馈的，视为认可检验结果。接受复检申请的部门在收到复检申请之日起7个工作日内作出是否予以复检的决定。
				  					</p>
				  					<br/>	
				  					
				  					组织抽检部门:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />	
				  					<br/>
				  					<br/>
				  					电话:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					传真:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					<br/>
				  					<br/>
				  					地址:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
				  					邮编:<input type="text" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 240px;" name="" id="" />
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
				  			本告知书已于<input type="text" id="time82" readonly="readonly" name="" style="width:150px" placeholder="年   月   日    时    分">收到。	
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-lg-10 col-md-10">
				  				<p style="text-align: right;">接收人签字:<input type="text" name="" style="border-top: none; border-right: none; border-left: none; border-bottom:1px #0F0F0F solid;width: 120px;"></p>
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
