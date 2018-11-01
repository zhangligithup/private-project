<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0126)http://sjz.ycfoodsafety.cn/index.php/spe/publicity?no=48%E5%8F%B7&code=EA0C2A74-1CDD-E7B5-7335-570BF6E363B9&from=singlemessage -->
<html lang="zh-cn" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<title>食用农产品二维码溯源管理系统|信息公示</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="keywords" content="">
<meta name="description" content="">
<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/flexible.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <div class="page-title">${agricultural.qyname}</div>
        <div class="header-bg"></div>
    </div>
    <div class="page-content">
        <div class="container-fluid">
                  <div class="card">
                <div class="card-title">
                    <div class="caption">
                        <span class="label-name">经营主体：</span>
                        <div class="marquee-box" style="width:2.6rem;height:.4rem;">
                            <span>${agricultural.qyname}</span>
                        </div>
                    </div>
                    <div class="tools">
                        <i class="icon-certificate1"></i>                    
                    </div>
                </div>
                <div class="line"></div>
                <div class="card-body">
                    <table>
                        <tbody>
                        <tr>
                            <td class="label"><i class="icon-person"></i></td>
                            <td class="item">经&nbsp;&nbsp;营&nbsp;&nbsp;人：</td>
                            <td class="item_value">${agricultural.qydelegate}</td>
                        </tr>
                        <tr>
                            <td class="label"><i class="icon-phone"></i></td>
                            <td class="item">联系电话：</td>
                            <td class="item_value">${agricultural.qyphone}</td>
                        </tr>
                        <tr>
                            <td class="label"><i class="icon-card"></i></td>
                            <td class="item">证&nbsp;&nbsp;件&nbsp;&nbsp;号：</td>
                            <td class="item_value">
                                ${agricultural.idNumberEncrypt}                           
                            </td>
                        </tr>
                        <tr>
                            <td class="label"><i class="icon-category"></i></td>
                            <td class="item">经营类目：</td>
                            <td class="item_value">${agricultural.itemsOfBusiness}</td>
                        </tr>
                        <tr>
                            <td class="label"><i class="icon-address"></i></td>
                            <td class="item">经营地址：</td>
                            <td class="item_value">${agricultural.scaddress}</td>
                        </tr>
                    </tbody></table>
                </div>
            </div>
            <div class="operates">
                <div class="row">
                    <a href="${pageContext.request.contextPath}/xiaotandian/flex.do?businessLicense=${agricultural.businessLicense}&smallStallregistrationCard=${agricultural.smallStallregistrationCard}&healthCertificate=${agricultural.healthCertificate}">
                        <div class="col-3 menu">
                            <div class="label"><i class="icon-rzzz"></i></div>
                            <div class="text">经营资质</div>
                        </div>
                    </a>
                    <a href="${pageContext.request.contextPath}/xiaotandian/list.do?qyname=${agricultural.qyname}">
                        <div class="col-3 menu">
                            <div class="label"><i class="icon-jhtz"></i></div>
                            <div class="text">进货台账</div>
                        </div>
                    </a>
                    <a href="${pageContext.request.contextPath}/xiaotandian/checkList.do?qyname=${agricultural.qyname}">
                        <div class="col-3 menu">
                            <div class="label"><i class="icon-sccj"></i></div>
                            <div class="text">食品快检</div>
                        </div>
                    </a>
                    <a href="tel:03158812315" mce_href="tel:03158812315">
                        <div class="col-3 menu">
                            <div class="label"><i class="icon-rxdh"></i></div>
                            <div class="text">举报电话</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
      <div class="page-footer">
        <ul class="nav">
            <li class="ft-line1">
                &nbsp;&nbsp;&nbsp;
                监管单位：&nbsp;
                <div class="marquee-box" style="max-width: 4.5rem;text-align: left;vertical-align: middle;height: 100%;">
                    <span>唐山市曹妃甸区市场监督管理局</span>
                </div>
            </li>
            <li class="ft-line2">技术支持：&nbsp;&nbsp;魅云科技有限公司</li>
        </ul>
    </div>
</div>

</body></html>