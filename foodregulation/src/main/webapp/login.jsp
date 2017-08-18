<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="logoin_html">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap.js"></script>
    <!--日历插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins-js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <title>食药监管系统</title>
</head>
<body class="login_body" onkeydown="keyLogin(event)">
	 <div class="login_div">
        <div class="login_content">
        <form id="formValidate" action="${pageContext.request.contextPath }/AdminServlet" method="post">
            <div class="login_l">
                <div class="login_body_content">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                    <p>食药监管系统</p>
                </div>
            </div>
            <div class="login_r">
                <h3 class="login_h3">账户登录</h3>
                <span style="color:red">${msg}</span>
                <div class="login_error">
                    <p style="display: block"></p>
                </div>
                <div class="inputdiv login_user">
                   <input type="text" name="username" id="username" value="" placeholder="请输入用户名">
                </div>
                <div class="inputdiv login_password">
                    <input type="password" name="password" id="password" placeholder="请输入密码" value="">
                </div>
                <a href="#" class="login_btn" onclick="check();">登 录</a>
            </div>
             </form>
        </div>
    </div>
    <div class="login_bottom">
        Copyright © 2006-2016 </br>
        京ICP备11017824号-4 / 京ICP证130164号    北京市公安局朝阳分局备案编号:110105000501
    </div>
<script type="text/javascript">
function keyLogin(event){
	if(event.keyCode==13){
		check();
	}
}
//客户端校验
function check() {

	var result = true;

	if ($("#username").val() == "") {
		alertEase("用户名不能为空",2);
		$("#username").focus();
		result = false;
	} else {
		$("#username").val(jQuery.trim($('#username').val()));
	}

	if ($("#password").val() == "") {
		alertEase("密码不能为空",2);
		$("#password").focus();
		result = false;
	}

	if(result == true){
		$("#formValidate").submit();			
	}
} 
</script>
</body>
</html>