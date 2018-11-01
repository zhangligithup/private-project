<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食品药品动态监管系统</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/ionicons/css/ionicons.min.css'/>">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
<script
	src="${pageContext.request.contextPath }/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!--<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script> -->
<script src="<c:url value='/js/jedate/jquery-ui.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jedate/jquery-ui.css'/>" />

<script src="<c:url value='/js/jedate/jquery-ui-timepicker-addon.js'/>"></script>
<script src="<c:url value='/js/jedate/jquery-ui-timepicker-zh-CN.js'/>"></script>
<script
	src="<c:url value='/js/jedate/jquery.ui.datepicker-zh-CN.js.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jedate/jquery-ui-timepicker-addon.css'/>" />

<link rel="stylesheet" href="jqueryui/style.css">
<link href="css/yk_style.css" rel="stylesheet">
</head>
<script type="text/javascript">
var i=1;
var count=1;
function addNew(){
	i++;
	tr=document.all.table1.insertRow();
	tr.insertCell().innerHTML='<div   align=center>'+i+'</div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6sampleno  class=tabminiinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6samplename class=tabminiinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6package class=tabminiinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6productserial class=tabminiinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6size class=tabminiinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6examedtype class=tabminiinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6productdw class=tabmidinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6exameddwname class=tabmidinputStyle></div>';
	tr.insertCell().innerHTML='<div   align=center><input   type=text  name=d6exameddwdz class=tabmidinputStyle></div>';
	tr.insertCell().innerHTML="<a href=javascript:void(0) onclick=delete1('"+"table1"+count+"')>删除</a>";
	count++;
}
function delete1(aa){
	count=1;
	document.all.table1.deleteRow(window.event.srcElement.parentElement.parentElement.rowIndex);

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
		


	}
	
$(function() {
    var availableTags = [
	<c:forEach var="item" items="${qy}">   
	  "${item.qyname}",   
	</c:forEach> +","+
	<c:forEach var="item" items="${qy1}">   
	  "${item.qyname}",   
	</c:forEach> +","+
	<c:forEach var="item" items="${qy2}">   
	  "${item.qyname}",   
	</c:forEach> 


    ];
    $( "#dwname" ).autocomplete({
    	source: function(request, response) {
		var results = $.ui.autocomplete.filter(availableTags, request.term);
			response(results.slice(0, 10));}
    }
    );
  });
  $(function(){
	  $("#d1examdate").datetimepicker();
	  $("#cjsj").datetimepicker();
	  $("#d1youxiaostart").datetimepicker();
	  $("#d1youxiaoend").datetimepicker();
	  $("#d2examtime").datetimepicker();
	  $("#d2prdctdate").datetimepicker();
	  $("#d2oktime").datetimepicker();
	  $("#d3examdate").datetimepicker();
	  $("#d3filldate").datetimepicker();
	  
  });
</script>
<style>
.tabfullStyle{
	width: 100%;
	height: 100%;
	border: 0
}
.textareaStyle {
	width: 100%;
	height: 100%;
	border: 0
}

.tablonginputStyle {
	width: 400px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}

.dzinputStyle {
	width: 400px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}

.inputStyle {
	width: 200px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}

.midinputStyle {
	width: 100px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}

.tabinputStyle {
	width: 200px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}

.miniinputStyle {
	width: 50px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}

.tabminiinputStyle {
	width: 50px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}

.tabmidinputStyle {
	width: 120px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}
</style>
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
			<div class="row" style="text-align: center">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3>抽检报告制作</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">

							<table id="" class="table table-condensed">
								<tbody>
									<tr>
										<td><label for="dwname">1.被抽检单位</label></td>
										<td><input id="dwname" type="text" style="width: 260px"></td>
										<td><b>2.抽检时间</b></td>
										<td><input id="cjsj" type="text" style="width: 260px"
											class="" name="cjsj" readonly /></td>
									</tr>

									<tr>
										<td>请选择表：</td>
										<td><select id="table" style="width: 280px" name="table"
											onchange="changeFunc();">
												<option value="div0">请选择</option>
												<option value="div1">药品安全抽样检验告知书</option>
												<option value="div2">药品安全抽样检验抽样单</option>
												<option value="div3">药品安全抽样检验工作质量及工作纪律反馈单</option>
												<option value="div4">现场检查笔录</option>
												<option value="div5">药品安全抽样检验样品信息登记表</option>
												<option value="div6">药品安全抽样检验样品移交确认单</option>
												<option value="div7">抽验结果告知书</option>

										</select></td>
									</tr>
							</table>
							<div align="center" class="container" id="div1" style="display: none">
							<div  style="width: 60%">
								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 22.0pt; font-family: 方正小标宋简体'>药品安全抽样检验告知书<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span lang=EN-US style='font-size: 22.0pt'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align=center style='text-align: right'>
									<span lang=EN-US style='font-size: 22.0pt'><span
										style="mso-spacerun: yes">                   </span></span><span
										lang=EN-US style='font-size: 12.0pt'>No<input
										class="inputStyle" name="d1no"></span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span lang=EN-US style='font-size: 12.0pt'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align="left">
									<input class="inputStyle" name="d1to"><span
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'>：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal align="left">
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">   </span><span
										style="mso-spacerun: yes"> </span></span><span
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'>依据《中华人民共和国药品管理法》，国家对药品进行定期或者不定期的抽样检验。按我局部署，现对你单位依法进行药品安全（<input
										type="radio" name="d1examtype" value="监督抽检">监督抽检、<input
										type="radio" name="d1examtype" value="风险监测">风险监测）。请你单位认真阅读本通知书背面《药品安全抽样检验企业须知》，并予以积极配合。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span style='font-size: 15.0pt; font-family: 仿宋_GB2312'>被抽药品：<input
										class="inputStyle" name="d1exameddrug"></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span style='font-size: 15.0pt; font-family: 仿宋_GB2312'>抽样单位：<input
										class="inputStyle" name="d1examedw"></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span style='font-size: 15.0pt; font-family: 仿宋_GB2312'>抽样人员：<input
										class="inputStyle" name="d1exampepl"></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span style='font-size: 15.0pt; font-family: 仿宋_GB2312'>抽样日期：<input
										type="text" id="d1examdate" name="d1examdate" readonly /><span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">                                  
									</span></span><span style='font-size: 15.0pt; font-family: 仿宋_GB2312'>
										<input type="text" name="d1youxiaostart" id="d1youxiaostart"
										readonly />
										</span>
								</p>

								<p class=MsoNormal style='text-align: left; text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">                  </span></span><span
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'>有效期至<input
										type="text" name="d1youxiaoend" id="d1youxiaoend" readonly />
										</span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-indent: 24.0pt; mso-char-indent-count: 2.0; text-align: left'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>本告知书一式三联。第一联被抽样单位留存；第二联
										抽样单位留存；第三联组织抽样检验的食品药品监管（市场监管）部门留存<span lang=EN-US><o:p></o:p></span>
									</span>
								</p>

								<p class=MsoNormal align=center >
									<span style='font-size: 22.0pt; font-family: 方正小标宋简体'>药品安全抽样检验被抽样单位须知<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-align: left; text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'>
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>1</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．对药品进行抽样检验是
药品监管（市场监管）部门依法履行监管职责的一项重要措施，任何单位和个人不得妨碍抽检工作的正常进行。被抽样单位无正当理由，对抽样工作不配合或者拒绝抽样检验的，按拒检处理。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt; text-align: left'>
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>2</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．药品安全抽样检验事先不通知被抽样单位。抽样人员不得少于</span><span
										lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>2</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>名，抽样前应向被抽样单位出示注明抽检监测内容的《药品安全抽样检验告知书》（原件）和抽样人员有效身份证件。抽样单位为承检机构的，抽样前还应向被抽样单位出示《药品安全抽样检验任务委托书》<span
										lang=EN-US>(</span>复印件<span lang=EN-US>)</span>。样品应由抽样人员从药品生产者的成品库的待销产品、药品经营者销售的药品、医疗机构使用或销售的药品中抽取。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-align: left; text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'>
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>4</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．抽取的样品应由抽样人员自行送达或寄送至承检机构。确需被抽样单位协助寄送的，抽样人员应明确告知样品的寄、送要求。被抽样单位应在规定的时限内正确寄送。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt; text-align: left'>
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>5</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．被抽样单位应当协助抽样工作人员如实填写药品安全抽样检验抽样单。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt; text-align: left'>
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>6</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．被抽样单位、生产者对执行此次抽检任务的单位、个人及有关抽检工作的任何意见，请填写《药品安全抽样检验工作质量及工作纪律反馈单》，填写完毕后寄送至指定单位。反馈意见者应留下电话、传真、</span><span
										lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>Email</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>等联系方式。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt; text-align: left'>
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>7</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．凡在市场上抽取的或涉及委托加工的样品，生产者或委托加工方应自收到通知之日起</span><span
										lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>5</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>个工作日内反馈意见，逾期未反馈的，视为认同样品的真实性。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>
								</div>
							</div>
							<div align="center" class="container" id="div2" style="display: none">
								<div style="width: 60%">
								<p class=MsoNormal align=center
									style='text-align: center; line-height: 26.0pt; mso-line-height-rule: exactly'>
									<b style='mso-bidi-font-weight: normal'><span
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体'>药品抽样记录及凭证<span
											lang=EN-US><o:p></o:p></span></span></b>
								</p>

								<p class=MsoNormal
									style='text-align: right; mso-outline-level: 1'>
									<span lang=EN-US style='font-size: 10.0pt'><span
										style="mso-spacerun: yes">                                                             
									</span></span><span
										style='font-size: 10.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>〔</span><span
										lang=EN-US style='font-size: 10.0pt'><span
										style="mso-spacerun: yes">       </span></span><span
										style='font-size: 10.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>〕第</span><span
										lang=EN-US style='font-size: 10.0pt'><span
										style="mso-spacerun: yes">   </span></span><span
										style='font-size: 10.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>号</span><span
										lang=EN-US style='font-size: 10.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal>
									<!--[if gte vml 1]><v:line id="Line_x0020_216" o:spid="_x0000_s1055"
 style='position:absolute;left:0;text-align:left;z-index:251671040' from="0,8.25pt"
 to="414pt,8.25pt" strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251671040'><span
										style='left: 0px; position: absolute; left: -5px; top: -13px; width: 421px; height: 7px'>
											<hr class="hrStyle" />
									</span>
								</p>

								<br style='mso-ignore: vglayout' clear=ALL>

								<p class=MsoNormal
									style='text-align: left; margin-left: -5.95pt; text-indent: 27.0pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样单位：</span><input
										name="d2examdw" class="midinputStyle"><span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"> </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样单位经手人签名：</span><input
										class="midinputStyle" name="d2exampeplsign"><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: -5.95pt; text-indent: 27.0pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样编号：</span><input
										class="midinputStyle" name="d2examserial"><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"> </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样日期：</span><input
										type="text" id="d2examtime" name="d2examtime" readonly />
									<o:p></o:p>
									</span>
								</p>

								<hr class="minihrStyle" />
								<p class=MsoNormal align="left"
									style='margin-left: -5.95pt; text-indent: 23.95pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:line id="Line_x0020_160" o:spid="_x0000_s1026"
 style='position:absolute;left:0;text-align:left;z-index:251641344' from="0,4.65pt"
 to="414pt,4.65pt" o:allowincell="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251641344'><span
										style='left: 0px; position: absolute; left: -4px; top: -40px; width: 419px; height: 5px'>
									</span></span>
									<![endif]>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>药品名称：</span>
									<input class="tabmidinputStyle" name="d2drugname" /><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>生产日期：</span><input
										id="d2prdctdate" name="d2prdctdate" readonly /><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>效期：</span><input
										type="text" id="d2oktime" name="d2oktime" readonly />
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: -5.95pt; text-indent: 23.95pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>规格：</span>
									<input class="tabmidinputStyle" name="d2size"> <span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>批准文号：</span><input
										class="tanmidinputStyle" name="d2allowno">
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: -5.95pt; text-indent: 23.95pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>生产、配制单位或产地：</span>
									<input class="inputStyle" name="d2productsite"> <span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 18.0pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被抽样单位</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>/</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被抽样场所：</span>
									<input class="inputStyle" name="d2examedsite"> <span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"> </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 18.0pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被抽样单位地址：</span>
									<input class="inputStyle" name="d2exameddwaddr"> <span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">   </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 18.0pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>邮政编码：</span>
									<input class="midinputStyle" id="d2mailcode" name="d2mailcode">
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">            </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>联系电话：</span>
									<input class="midinputStyle" id="d2tele" name="d2tele">
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>
								<hr class="minihrStyle" />

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; text-indent: 6.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:line id="Line_x0020_161" o:spid="_x0000_s1027"
 style='position:absolute;left:0;text-align:left;z-index:251642368' from="0,5.05pt"
 to="414pt,5.05pt" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251642368'><span
										style='left: 0px; position: absolute; left: -4px; top: -100px; width: 419px; height: 5px'>
									</span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>1.
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>药品种类：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">                           </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>注：</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>是</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
									</span><span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: Wingdings; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-char-type: symbol; mso-symbol-font-family: Wingdings'><span
										style='mso-char-type: symbol; mso-symbol-font-family: Wingdings'>þ</span></span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">  </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>否</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
									</span><span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: Wingdings; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-char-type: symbol; mso-symbol-font-family: Wingdings'><span
										style='mso-char-type: symbol; mso-symbol-font-family: Wingdings'>ý</span></span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">  </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 36.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_186" o:spid="_x0000_s1052" style='position:absolute;
 left:0;text-align:left;margin-left:365.25pt;margin-top:30.65pt;width:12.05pt;
 height:10.45pt;z-index:251667968' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251667968'><span
										style='left: 0px; position: absolute; left: 362px; top: -83px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_185" o:spid="_x0000_s1051" style='position:absolute;
 left:0;text-align:left;margin-left:3in;margin-top:30.65pt;width:12.05pt;
 height:10.45pt;z-index:251666944' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251666944'><span
										style='left: 0px; position: absolute; left: 213px; top: -83px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_166" o:spid="_x0000_s1032" style='position:absolute;
 left:0;text-align:left;margin-left:2in;margin-top:30.65pt;width:12.05pt;
 height:10.45pt;z-index:251647488' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251647488'><span
										style='left: 0px; position: absolute; left: 141px; top: -83px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_164" o:spid="_x0000_s1030" style='position:absolute;
 left:0;text-align:left;margin-left:90pt;margin-top:30.65pt;width:12.05pt;
 height:10.45pt;z-index:251645440' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251645440'><span
										style='left: 0px; position: absolute; left: 87px; top: -83px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_162" o:spid="_x0000_s1028" style='position:absolute;
 left:0;text-align:left;margin-left:346.5pt;margin-top:5.95pt;width:12.05pt;
 height:10.45pt;z-index:251643392' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251643392'><span
										style='left: 0px; position: absolute; left: 343px; top: -108px; width: 16px; height: 13px'></span></span>
									<![endif]>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>进厂原料（包括化工原料、药用原料、辅料、包装材料等）</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2drugtype" value="进厂原料"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；中间体（半成品）</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2drugtype" value="中间体"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；制剂</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2drugtype" value="制剂"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；原料药</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2drugtype" value="原料药"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；药材（个子货、饮片）</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2drugtype" value="药材"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>。</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<o:p></o:p>
									</span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: -5.95pt; text-indent: 23.95pt; line-height: 20.0pt'>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>2.
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>外包装情况：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_176" o:spid="_x0000_s1042" style='position:absolute;
 left:0;text-align:left;margin-left:369pt;margin-top:7.6pt;width:12.05pt;
 height:10.45pt;z-index:251657728' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251657728'><span
										style='left: 0px; position: absolute; left: 366px; top: -126px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_184" o:spid="_x0000_s1050" style='position:absolute;
 left:0;text-align:left;margin-left:315pt;margin-top:7.6pt;width:12.05pt;
 height:10.45pt;z-index:251665920' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251665920'><span
										style='left: 0px; position: absolute; left: 312px; top: -126px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_174" o:spid="_x0000_s1040" style='position:absolute;
 left:0;text-align:left;margin-left:243pt;margin-top:7.6pt;width:12.05pt;
 height:10.45pt;z-index:251655680' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251655680'><span
										style='left: 0px; position: absolute; left: 240px; top: -126px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_163" o:spid="_x0000_s1029" style='position:absolute;
 left:0;text-align:left;margin-left:180pt;margin-top:7.6pt;width:12.05pt;
 height:10.45pt;z-index:251644416' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251644416'><span
										style='left: 0px; position: absolute; left: 177px; top: -126px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_172" o:spid="_x0000_s1038" style='position:absolute;
 left:0;text-align:left;margin-left:126pt;margin-top:7.6pt;width:12.05pt;
 height:10.45pt;z-index:251653632' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251653632'><span
										style='left: 0px; position: absolute; left: 123px; top: -126px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_170" o:spid="_x0000_s1036" style='position:absolute;
 left:0;text-align:left;margin-left:1in;margin-top:7.6pt;width:12.05pt;
 height:10.45pt;z-index:251651584' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251651584'><span
										style='left: 0px; position: absolute; left: 69px; top: -126px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>(1)
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>硬纸箱</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2packtype" value="硬纸箱"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；麻袋</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2packtype" value="麻袋"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；木箱</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2packtype" value="木箱"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；纤维桶</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="radio"
											name="d2packtype" value="纤维桶"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；蛇皮袋</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span style="mso-spacerun: yes"></span><span lang=EN-US><span
											style="mso-spacerun: yes"><input type="radio"
												name="d2packtype" value="蛇皮袋"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；铁桶</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"><input
												type="radio" name="d2packtype" value="铁桶"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_167" o:spid="_x0000_s1033" style='position:absolute;
 left:0;text-align:left;margin-left:2in;margin-top:9pt;width:12.05pt;height:10.45pt;
 z-index:251648512' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251648512'><span
										style='left: 0px; position: absolute; left: 141px; top: -135px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_165" o:spid="_x0000_s1031" style='position:absolute;
 left:0;text-align:left;margin-left:63pt;margin-top:9pt;width:12.05pt;height:10.45pt;
 z-index:251646464' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251646464'><span
										style='left: 0px; position: absolute; left: 60px; top: -135px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">   </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>铝听</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span style="mso-spacerun: yes"> </span><span lang=EN-US><span
											style="mso-spacerun: yes"><input type="radio"
												name="d2packtype" value="铝听"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；牛皮纸袋</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"></span><input
											type="radio" name="d2packtype" value="牛皮纸袋"></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；其他</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input name="d2packtypeother"
											class="tabmidinputStyle"></span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_179" o:spid="_x0000_s1045" style='position:absolute;
 left:0;text-align:left;margin-left:334.45pt;margin-top:10.4pt;width:12.05pt;
 height:10.45pt;z-index:251660800' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251660800'><span
										style='left: 0px; position: absolute; left: 331px; top: -144px; width: 16px; height: 14px'></span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>(2)
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>药品名称、批号、生产厂家、批准文号、商标、生产日期</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="checkbox"
											name="d2xiangfu" value="相符"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>是否相符</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">  </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_215" o:spid="_x0000_s1054" style='position:absolute;
 left:0;text-align:left;margin-left:152.25pt;margin-top:31.1pt;width:10.5pt;
 height:10.45pt;z-index:251670016' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251670016'><span
										style='left: 0px; position: absolute; left: 149px; top: -133px; width: 14px; height: 14px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_177" o:spid="_x0000_s1043" style='position:absolute;
 left:0;text-align:left;margin-left:342.7pt;margin-top:11.8pt;width:12.05pt;
 height:10.45pt;z-index:251658752' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251658752'><span
										style='left: 0px; position: absolute; left: 340px; top: -152px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_187" o:spid="_x0000_s1053" style='position:absolute;
 left:0;text-align:left;margin-left:235.55pt;margin-top:11.8pt;width:12.05pt;
 height:10.45pt;z-index:251668992' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251668992'><span
										style='left: 0px; position: absolute; left: 233px; top: -152px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_173" o:spid="_x0000_s1039" style='position:absolute;
 left:0;text-align:left;margin-left:135.05pt;margin-top:5.2pt;width:10.5pt;
 height:10.45pt;z-index:251654656' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251654656'><span
										style='left: 0px; position: absolute; left: 132px; top: -159px; width: 14px; height: 14px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_178" o:spid="_x0000_s1044" style='position:absolute;
 left:0;text-align:left;margin-left:38.25pt;margin-top:31.1pt;width:12.05pt;
 height:10.45pt;z-index:251659776' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251659776'><span
										style='left: 0px; position: absolute; left: 35px; top: -133px; width: 15px; height: 14px'></span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_175" o:spid="_x0000_s1041" style='position:absolute;
 left:0;text-align:left;margin-left:235.55pt;margin-top:11.8pt;width:12.05pt;
 height:10.45pt;z-index:251656704' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251656704'><span
										style='left: 0px; position: absolute; left: 233px; top: -152px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>(3)
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>包装有（无）破损</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"><input
												type="checkbox" name="d2packstate" value="有破损"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；有（无）水迹</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span style="mso-spacerun: yes"> </span><span lang=EN-US><span
											style="mso-spacerun: yes"><input type="checkbox"
												name="d2packstate" value="有水迹"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；有（无）霉变</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"><input
												type="checkbox" name="d2packstate" value="有霉变"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；有（无）虫蛀</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"><input
												type="checkbox" name="d2packstate" value="有虫蛀"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；有（无）污染</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"><input
												type="checkbox" name="d2packstate" value="有污染"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">   </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>其他</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input
											class="tabmidinputStyle" name="d2packstateother"></span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_171" o:spid="_x0000_s1037" style='position:absolute;
 left:0;text-align:left;margin-left:2in;margin-top:7pt;width:12.05pt;height:10.45pt;
 z-index:251652608' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251652608'><span
										style='left: 0px; position: absolute; left: 141px; top: -177px; width: 15px; height: 13px'></span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>3.</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>库存条件是否符合要求</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
										<span lang=EN-US><span style="mso-spacerun: yes"><input
												type="checkbox" name="d2storage" value="符合"></span></span>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>。库存温湿度：</span>
									<input class="inputStyle" name="d2storagetem"> <span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 20.0pt'>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>4.</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样情况：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_181" o:spid="_x0000_s1047" style='position:absolute;
 left:0;text-align:left;margin-left:297pt;margin-top:9.6pt;width:12.05pt;
 height:10.45pt;z-index:251662848' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251662848'><span
										style='left: 0px; position: absolute; left: 294px; top: -194px; width: 15px; height: 13px'>

									</span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_180" o:spid="_x0000_s1046" style='position:absolute;
 left:0;text-align:left;margin-left:243pt;margin-top:9.6pt;width:12.05pt;
 height:10.45pt;z-index:251661824' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251661824'><span
										style='left: 0px; position: absolute; left: 240px; top: -194px; width: 15px; height: 13px'>

									</span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_169" o:spid="_x0000_s1035" style='position:absolute;
 left:0;text-align:left;margin-left:171pt;margin-top:9.6pt;width:12.05pt;
 height:10.45pt;z-index:251650560' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251650560'><span
										style='left: 0px; position: absolute; left: 168px; top: -194px; width: 15px; height: 13px'>

									</span></span>
									<![endif]>
									<!--[if gte vml 1]><v:rect
 id="Rectangle_x0020_168" o:spid="_x0000_s1034" style='position:absolute;
 left:0;text-align:left;margin-left:117pt;margin-top:9.6pt;width:12.05pt;
 height:10.45pt;z-index:251649536' filled="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251649536'><span
										style='left: 0px; position: absolute; left: 114px; top: -194px; width: 15px; height: 13px'>

									</span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>(1)
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>样品包装：玻瓶</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="checkbox"
											name="d2samplepack" value="玻瓶"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；纸盒</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="checkbox"
											name="d2samplepack" value="纸盒"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；塑料袋</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="checkbox"
											name="d2samplepack" value="塑料袋"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；铝塑</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes"><input type="checkbox"
											name="d2samplepack" value="铝塑"></span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>；其他</span>
									<input class="midinputStyle" name="d2samplepackother">
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>(2)
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样数量</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>/</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>生产、配制或购进数量：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p>
											<input class="miniinputStyle" name="d2samplesum">
										</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>(3)
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>抽样说明：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p>
											<input class="dzinputStyle" name="d2examdexplan">
										</o:p></span>
								</p>
								<hr class="minihrStyle" />

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:line
 id="Line_x0020_182" o:spid="_x0000_s1048" style='position:absolute;left:0;
 text-align:left;z-index:251663872' from="-15pt,7.7pt" to="443.3pt,7.7pt"
 strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251663872'><span
										style='left: 0px; position: absolute; left: -19px; top: -227px; width: 463px; height: 5px'>
									</span></span>
									<![endif]>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>备</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'>
									</span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>注：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p>

										</o:p></span>
								</p>

								<p class=MsoNormal
									style='margin-left: 12.0pt; line-height: 20.0pt'>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p>
											<textarea style="resize: none" class="textareaStyle"
												name="d2remarks"></textarea>
										</o:p></span>
								</p>

								<hr class="minihrStyle" />
								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:line
 id="Line_x0020_183" o:spid="_x0000_s1049" style='position:absolute;left:0;
 text-align:left;z-index:251664896' from="-15pt,1.25pt" to="443.3pt,1.3pt"
 o:allowincell="f" strokeweight="1pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251664896'><span
										style='left: 0px; position: absolute; left: -19px; top: -250px; width: 463px; height: 5px'>
									</span></span>
									<![endif]>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被抽样单位：以上抽样情况属实</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">     </span></span><span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>，样品已当场签封</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><span
										style="mso-spacerun: yes">    </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<span
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被抽样单位经手人签名（盖章）：</span><span
										lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p>
											<input class="tabmidinputStyle" name="d2exameddwsign">
										</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align: left; margin-left: 12.0pt; line-height: 20.0pt'>
									<!--[if gte vml 1]><v:line
 id="Line_x0020_227" o:spid="_x0000_s1058" style='position:absolute;left:0;
 text-align:left;z-index:251674112' from="-15pt,17.9pt" to="443.3pt,17.9pt"
 strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251674112'><span
										style='left: 0px; position: absolute; left: -20px; top: -254px; width: 465px; height: 7px'>
											<hr class="hrStyle" />
									</span></span>
									<![endif]>
									<span lang=EN-US
										style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt'><o:p>&nbsp;</o:p></span>
								</p>

								<br style='mso-ignore: vglayout' clear=ALL>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; letter-spacing: -.8pt'>注：本凭证一式三联，第一联抽样单位留存，第二联送被抽样单位，第三联随检品送检</span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; letter-spacing: -.5pt'>验单位。</span><span
										lang=EN-US style='letter-spacing: -.5pt'><o:p></o:p></span>
								</p>

								<p class=MsoNormal>
									<!--[if gte vml 1]><v:line id="Line_x0020_225" o:spid="_x0000_s1056"
 style='position:absolute;left:0;text-align:left;z-index:251672064' from="-15pt,1.05pt"
 to="443.3pt,1.05pt" strokeweight="1.5pt"/><v:line id="Line_x0020_226" o:spid="_x0000_s1057"
 style='position:absolute;left:0;text-align:left;z-index:251673088' from="-15pt,1.05pt"
 to="437.25pt,1.05pt" strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251672064'><span
										style='left: 0px; position: absolute; left: -20px; top: -283px; width: 465px; height: 7px'>
											<hr class="hrStyle" />
									</span></span>
									<![endif]>
									<span lang=EN-US style='letter-spacing: -.5pt'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
								</div>
							</div>
							<div align="center" class="container" id="div3" style="display: none">
								<div style="width: 60%">
								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 16.0pt; font-family: 方正小标宋简体'>药品安全抽样检验工作质量及工作纪律反馈单<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align="right">
									<span lang=EN-US><span style="mso-spacerun: yes">                                                   
									</span><span style="mso-spacerun: yes">   </span><span
										style="mso-spacerun: yes">  </span></span><span lang=EN-US
										style='mso-bidi-font-size: 10.5pt; font-family: "Monotype Corsiva"'>N</span><span
										lang=EN-US
										style='font-size: 7.5pt; font-family: "Monotype Corsiva"'>O</span><span
										lang=EN-US
										style='font-size: 7.5pt; font-family: "Monotype Corsiva"'>
									</span><input class="midinputStyle" name="d3no">
								</p>

								<table style="text-align: left"  border=1 cellspacing=0 cellpadding=0 align="center">
									<tr
										style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 38.55pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样检验产品名称<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=189
											style='width: 189.0pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
		
													<input style="width: 100%;height: 100%;border: 0" name="d3examedname">
											
										</td>
										<td width=62
											style='width: 62.15pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样日期<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=127
											style='width: 126.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											
												<input class="tabfullStyle" id="d3examdate" name="d3examdate" readonly/>
											
										</td>
									</tr>
									<tr style='mso-yfti-irow: 1; height: 46.1pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 46.1pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样单位名称<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 46.1pt'>
											<input class="tabfullStyle" name="d3examdwname">
										</td>
									</tr>
									<tr style='mso-yfti-irow: 2; height: 38.9pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.9pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样人员姓名<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.9pt'>
											<input class="tabfullStyle" name="d3exampepl">
										</td>
									</tr>
									<tr style='mso-yfti-irow: 3; height: 170.4pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 170.4pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>对抽样单位抽样工作的评价<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3 valign=top
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 170.4pt'>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>1.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（<input type="radio" name="d3examid" value="是">是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span><input type="radio" name="d3examid" value="否">否）抽样人员抽样前，是否出示有效工作证？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>2.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（<input type="radio" name="d3examid" value="是">是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span><input type="radio" name="d3examid" value="否">否）抽样人员是否对所抽取的样品全部当场进行封样？是否对样品采取了防拆封措施？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>3.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（<input type="radio" name="d3storage" value="是">是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span><input type="radio" name="d3storage" value="否">否）抽样人员是否按产品标签中标注的保存条件及其他特殊要求对所抽取的样品进行保存？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>4.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（<input type="radio" name="d3fair" value="是">是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span><input type="radio" name="d3fair" value="否">否）抽样人员在抽样过程中是否廉洁公正？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>上述选项中填写“否”的，请简要描述抽样人员的违规行为：<span
														lang=EN-US><o:p></o:p></span></span></b>
											</p>
											<p class=MsoNormal>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（本处填写不下的，可另附书面说明）</span></b><span
													lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p></o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 4; height: 100.4pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 100.4pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>对药品抽样<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>检验工作的<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>意见和建议<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3 valign=top
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 100.4pt'>
											<input class="tabfullStyle" name="d3advise">
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 5; mso-yfti-lastrow: yes; height: 89.0pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 89.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>被抽样单位<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3 valign=top
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 89.0pt'>
											<p class=MsoNormal>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>电话：
												<input class="tabmidinputStyle" id="d3tele" name="d3tele">
												E-Mail:<o:p><input class="tabmidinputStyle" name="d3email"></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>传真：<input class="tabmidinputStyle" id="d3fax" name="d3fax">
													<o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal
												style='text-indent: 114.0pt; mso-char-indent-count: 9.5'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>法定代表人或负责人签字：<span
													lang=EN-US><o:p><input class="tabmidinputStyle" name="d3legaldelegatesign"></o:p></span></span>
											</p>
											<p class=MsoNormal
												style='text-indent: 114.0pt; mso-char-indent-count: 9.5'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
													style="mso-spacerun: yes">              </span></span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>填表日期：
													<input class="tabmidinputStyle" id="d3filldate" name="d3filldate" readonly/>
													</span>
											</p>
											<p class=MsoNormal
												style='text-indent: 114.0pt; mso-char-indent-count: 9.5'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
													style="mso-spacerun: yes">                </span></span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（单位公章）<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
									</tr>
								</table>

								<p align="left" class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>说明：如对抽样工作有异议，请被抽样单位将本表填写好并加盖公章后，按以下联系方式寄送或传真本表。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p align="left" class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>反馈受理单位：<span
										lang=EN-US><o:p><input class="tabinputStyle" name="d3examdw"></o:p></span></span>
								</p>

								<p align="left" class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>通讯地址及邮编：<span
										lang=EN-US><o:p><input class="tablonginputStyle" name="d3examdwaddr"></o:p></span></span>
								</p>

								<p align="left" class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>联系电话：<span
										lang=EN-US><o:p><input class="tabmidinputStyle" name="d3examtele"></o:p></span></span>
								</p>

								<p align="left" class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>传<span
										lang=EN-US><span style="mso-spacerun: yes">    </span></span>真：<span
										lang=EN-US><o:p><input class="tabmidinputStyle" name="d3examfax"></o:p></span></span>
								</p>
								</div>
							</div>
							<div align="center" class="container" id="div4" style="display: none">
							<div style="width: 60%">
								<p class=MsoNormal>
									<b style='mso-bidi-font-weight: normal'><span lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p>&nbsp;</o:p></span></b>
								</p>

								<p class=MsoNormal>
									<b style='mso-bidi-font-weight: normal'><span
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>现场检查笔录</span></b><b
										style='mso-bidi-font-weight: normal'><span lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span></b>
								</p>



								<hr class="hrStyle"/>
								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被检查单位</span><span
										lang=EN-US>(</span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>人</span><span
										lang=EN-US>)</span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>：</span><input id="d4exameddw" name="d4exameddw" class="inputStyle"><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>陪同人员</span>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>：</span><input name="d4ptpepld" class="inputStyle">
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检查现场：</span><input class="inputStyle" name="d4examsite">
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>法定代表人（负责人）：</span><input class="inputStyle" id="d4legaldelegate" name="d4legaldelegate"><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>联系方式：</span><input class="inputStyle" id="d4legalcontact" name="d4legalcontact"><span lang=EN-US><span
										style="mso-spacerun: yes"> </span><u><o:p></o:p></u></span>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检查人：</span><input id="d4examer" name="d4examer" class="inputStyle"><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>记录人：</span><input id="d4noter" name="d4noter" class="inputStyle"><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>监督检查类别：</span><input class="miniinputStyle" name="d4examtype" id="d4examtype">
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检查时间：</span>
										<input type="text" id="d4examtimestart" name="d4examtimestart" readonly/>至<input type="text" id="d4examtimeend" name="d4examtimeend" readonly/>
								</p>
								<hr class="hrStyle">


								<p class=MsoNormal align="left">
									<span lang=EN-US><span style="mso-spacerun: yes">     
									</span></span>
								</p>

								<p class=MsoNormal style='text-indent: 21.0pt' align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>我们是</span><input class="inputStyle" name="d4examdw"><span
										lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>的执法人员</span><span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'><input class="miniinputStyle" name="d4exampepl1">、<input class="miniinputStyle" name="d4exampepl2"></span><span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
	
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>执法证件名称、编号是：</span>
										<input class="inputStyle" name="d4legalid"><span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>，请你确认。</span><u><span
										lang=EN-US><o:p></o:p></span></u>
								</p>

								<p class=MsoNormal style='text-indent: 21.0pt' align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>我们依法就</span>
									<input class="inputStyle" name="d4problem"><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>有关问题，进行现场检查，请予配合。根据《中华人民共和国行政处罚法》第三十七条第三款的规定，如果你认为检查人员与当事人有直接利害关系的，你有申请检查人员回避的权利。</span>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0'
									align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>问：你是否申请检查人员回避？</span>
								</p>

								<p class=MsoNormal align="left">
									<span lang=EN-US><span style="mso-spacerun: yes">   
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>答：</span>
								</p>
								<textarea style="resize: none; width: 600px; height: 100px;" name="d4huida"></textarea>
								<p class=MsoNormal align="left">
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align="left">
									<span lang=EN-US><span style="mso-spacerun: yes">   
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>现场检查记录：</span>
								</p>
								<textarea style="resize: none; width: 600px; height: 200px;" name="d4examnote"></textarea>

								<br style='mso-ignore: vglayout' clear=ALL>
								<hr class="hrStyle"/>
								<p class=MsoNormal style='line-height: 150%' align="left">
									<span
										style='font-size: 10.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>注：本文书一式二联，第一联存档，第二联交被检查单位。被检查人在检查笔录上逐页签字，在修改处签字或者按指纹，并在笔录终了处注明对笔录真实性的意见；检查人应在笔录终了处签字。</span><span
										style='font-size: 10.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%'>
										<span lang=EN-US><o:p></o:p></span>
									</span>
								</p>
								<hr class="hrStyle"/>
								<p align="left">
								<span
										style='font-size: 10.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>
								被检查人签字：</span><input class="tabmidinputStyle" name="d1examedpeplsign">
								</p>
							</div>
						</div>
						<div class="container" id="div5" style="display: none">
								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 22.0pt; font-family: 方正小标宋_GBK'>药品安全抽样检验样品信息登记表<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<span
										style='mso-bidi-font-size: 10.5pt; font-family: 仿宋_GB2312'>采样单位：（公章）<input name="d6cydw" class="inputStyle"><span lang=EN-US><span
											style="mso-spacerun: yes">    </span><span
											style="mso-spacerun: yes"> </span></span>采样人：<input class="midinputStyle" name="d6cypepl"><span
										lang=EN-US><span style="mso-spacerun: yes">    </span><span
											style="mso-spacerun: yes">      </span></span>采样时间：<input type="text" id="d6examtime" name="d6examtime" readonly/>
								</p>

								<table id="table1" class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
									style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
									<tr
										style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 39.35pt; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>序号<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>样品编号<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>样品名称<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>批准文号</span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>生产日期</span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>规格<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>药品种类<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>生产、配制单位或产地<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>被采样单位名称<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>被采样单位地址<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width="15%"> <a href="javascript:void(0)"   onclick="addNew()">添加明细</a></td>
									</tr>
									<tr
										style='mso-yfti-irow: 1; height: 1.0cm; mso-height-rule: exactly'>
										<td>
										<div align="center">
												1
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6sampleno"  class="tabminiinputStyle">
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6samplename" class="tabminiinputStyle">
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6package" class="tabminiinputStyle">
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6productserial" class="tabminiinputStyle">
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6size" class="tabminiinputStyle" >
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6examedtype" class="tabminiinputStyle" >
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6productdw" class="tabmidinputStyle" >
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6exameddwname" class="tabmidinputStyle">
											</div>
										</td>
										<td>
										<div align="center">
												<input name="d6exameddwdz" class="tabmidinputStyle">
											</div>
										</td>
										<td><a href=javascript:void(0) onclick=delete1(this)>删除</a></td> 
									</tr>
									
								</table>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
							
							</div>
						
						<div align="center" class="container" id="div6" style="display: none">
							<div style="width: 60%">
								<table  class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
									style='border-collapse: collapse; mso-table-layout-alt: fixed; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0cm 5.4pt 0cm 0cm; margin-left: 50pt;text-align: left'>
									<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
										<td width=426 colspan=4 valign=top
											style='width: 426.1pt; border: none; padding: 0cm 5.4pt 0cm 0cm'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-size: 16.0pt; font-family: 方正小标宋_GBK; mso-bidi-font-weight: bold'>药品安全抽样检验样品移交确认单<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 1; height: 29.5pt'>
										<td width=306 colspan=3 valign=bottom
											style='width: 305.7pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 29.5pt'>
											<p class=MsoNormal style='line-height: 150%'>
												<span lang=EN-US></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman";text-align: left'><input
													class="inputStyle" name="d6to">：</span><u><span lang=EN-US><o:p></o:p></span></u>
											</p>
										</td>
										<td width=120 valign=bottom
											style='width: 120.4pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 29.5pt'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 2; height: 34.0pt'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>收样时间</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<input type="text" name="d6sytime" id="d6sytime" class="tabinputStyle" readonly />
										</td>
									</tr>
									<tr style='mso-yfti-irow: 3; height: 34.0pt'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品件数（含备用样品）</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p><input name="d6samplecount" class="tabinputStyle"></o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 4; height: 34.0pt'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品抽样单编号</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p><input name="d6sampleno" class="tabinputStyle"></o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 5; height: 34.0pt'>
										<td width=130 rowspan=4
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品检查记录</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>封</span><span
													lang=EN-US><span style="mso-spacerun: yes">   
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>条：<input type="radio" name="d6fentiao" value="完好"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>完好</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6fentiao" value="有破损"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>有破损</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 6; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品包装：<input type="radio" name="d6samplepack" value="完好"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>完好</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6samplepack" value="有破损"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>有破损</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 7; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品数量：<input type="radio" name="d6sampleamount" value="满足要求"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>满足要求</span><span
													lang=EN-US><span style="mso-spacerun: yes">        
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6sampleamount" value="不满足"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>不满足</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 8; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品状态：<input type="radio" name="d6samplestate" value="正常"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>正常</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6samplestate" value="异常"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>异常</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 9; height: 34.0pt'>
										<td width=130 rowspan=2
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>文书检查记录</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>文书数量：<input type="radio" name="d6ppworknum" value="齐全"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>齐全</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6ppworknum" value="不齐全"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>不齐全</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 10; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>文书信息：<input type="radio" name="d6ppworkok" value="与样品相符"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>与样品相符</span><span
													lang=EN-US><span style="mso-spacerun: yes">      
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6ppworkok" value="与样品不符"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>与样品不符</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 11'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品移交确认结果</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6result" value="接受"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>接受</span><span
													lang=EN-US><span style="mso-spacerun: yes">     
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'><input type="radio" name="d6result" value="拒收"></span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>拒收</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>拒收理由：</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p><input class="inputStyle" name="d6reject"></o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 12; height: 168.8pt'>
										<td width=182 colspan=2 valign=top
											style='width: 181.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 168.8pt'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>抽样单位：<input class="midinputStyle" name="d6examdw"></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p></o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品移交人签字：<input class="midinputStyle" name="d6sampletrans"></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=244 colspan=2 valign=top
											style='width: 244.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 168.8pt'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>承检机构样品确认人签字（盖章）：<input class="midinputStyle" name="d6comfirmer"></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 13; mso-yfti-lastrow: yes; height: 23.1pt'>
										<td width=426 colspan=4
											style='width: 426.1pt; border: none; mso-border-top-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 23.1pt'>
											<p class=MsoNormal>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>注：本单据一式两联，由承检机构、抽样单位分别保留。</span>
											</p>
										</td>
									</tr>
									<![if !supportMisalignedColumns]>
									<tr height=0>
										<td width=130 style='border: none'></td>
										<td width=52 style='border: none'></td>
										<td width=124 style='border: none'></td>
										<td width=120 style='border: none'></td>
									</tr>
									<![endif]>
								</table>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
							</div>
							</div>
							<div align="center" class="container" id="div7" style="display: none">
							<div style="width: 60%">
								<p class=MsoNormal align=center style='text-align: center'>
									<b><span lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p>&nbsp;</o:p></span></b>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<b><span
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检验结果告知书</span></b><b><span
										lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span></b>
								</p>
<div>
<div  style="text-align:right;" class="yk_yuankuohao">&#40;<input class="tabminiinputStyle" name="d8exam">&#41;检结告&#40;<input class="tabminiinputStyle" name="d8inforno">&#41;&nbsp;&nbsp;&nbsp;&nbsp;号</div>
                    <hr class="hrStyle"/>
                    </div>
								<p class=MsoNormal style='line-height: 150%;text-align:left'>
									<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'><input class="inputStyle" name="d8infored">：</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align:left;text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									&nbsp;&nbsp;本机关依法对你单位<input class="inputStyle" id="d8examedqy" name="d8examedqy">进行抽样并委托有关单位进行了检验，检验报告书见附件。
								</p>

								<p class=MsoNormal
									style='text-align:left;text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									&nbsp;&nbsp;依据<input class="inputStyle" name="d8rule">
										的规定，如对本检验结果有异议，可在收到检验报告书之日起<input class="midinputStyle" name="d8limit">
									内向<input class="inputStyle" name="d8to">提出书面复检申请并申明理由。逾期视为放弃该项权利。
								</p>

								<p class=MsoNormal
									style='text-indent: 28.5pt; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 28.5pt; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-align:left;text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									&nbsp;&nbsp;特此告知。
								</p>

								<p class=MsoNormal
									style='text-indent: 28.5pt; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><span style="mso-spacerun: yes">                                                 
									</span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><span style="mso-spacerun: yes">                                                 
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>（公</span>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>章）</span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									&nbsp;&nbsp;<input type="text" id="d8date" name="d8date" readonly/>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<span lang=EN-US style='font-family: 宋体'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
								<hr class="hrStyle"/>
									<span lang=EN-US style='font-family: 宋体'><o:p>&nbsp;</o:p></span>
								</p>

								<br style='mso-ignore: vglayout' clear=ALL>

								<p class=MsoNormal style='text-align:left;line-height: 150%'>
									<span style='text-align:left;font-family: 宋体'>本告知书已于
									<input type="text" name="d8recivedate" id="d8recivedate" readonly/>分收到。
									</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 278.25pt; mso-char-indent-count: 26.5; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>接收人签字：</span><input class="midinputStyle" name="d8reciversign">
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<hr class="hrStyle"/>
								</p>

								<p align="left" class=MsoNormal
									style='margin-top: 3.1pt; mso-para-margin-top: .2gd; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>注：本文书一式二联，第一联存档，第二联交被抽样单位。</span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
								<hr class="hrStyle"/>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<!--  <b>唐山蓝普</b>-->
		</div>
		<strong></strong> </footer>
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 2.1.4 -->
	<!--<script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    -->
	<!-- Bootstrap 3.3.5 -->
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath }/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.min.js"></script>
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