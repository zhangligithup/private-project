<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script language="javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
<script type="text/javascript">
	$(function() {
		//循环遍历type选中项
		var type = '${agricultural.mainBody}';
		var arr = new Array();
		arr = type.split(",");
		$("input:checkbox[name='mainBody']").each(function() {
			for (j = 0; j < arr.length; j++) {
				if (arr[j] == $(this).val()) {
					$(this).attr("checked", true);
					continue;
				}
			}
		});

		//循环遍历manage选中项
		var manage = '${agricultural.businessScope}';
		var arrManage = new Array();
		arrManage = manage.split(",");
		$("input:checkbox[name='businessScope']").each(function() {
			for (j = 0; j < arrManage.length; j++) {
				if (arrManage[j] == $(this).val()) {
					$(this).attr("checked", true);
					continue;
				}
			}
		});

		//循环遍历manage选中项
		var manage = '${agricultural.itemsOfBusiness}';
		var arrManage = new Array();
		arrManage = manage.split(",");
		$("input:checkbox[name='itemsOfBusiness']").each(function() {
			for (j = 0; j < arrManage.length; j++) {
				if (arrManage[j] == $(this).val()) {
					$(this).attr("checked", true);
					continue;
				}
			}
		});
		$("#ddd").jqprint();

	});

	function print() {
		$("#ddd").jqprint();
	}
</script>
</head>
<body>

	<a class="pull-right" href="javascript:" onclick="history.back(); ">返回上一页</a>
	<br>
	<br>
	<div id="ddd" class="tablec">
		<table border="1" id="" class="table table-condensed">
			<tbody>
				<tr>
					<td colspan="4" align="center"><b>食品小摊点经营户信息登记表</b></td>
				</tr>
				<tr>
					<td colspan="4"><b>一、基本情况</b></td>
				</tr>
				<tr>
					<td>经营户名称</td>
					<td>${agricultural.qyname }</td>
					<td>所属行政区域</td>
					<td><c:forEach items="${addressList}" var="addressLis">
							<c:if
								test="${agricultural.address eq addressLis.tDictionaryCode }">
                                    ${addressLis.tDictionaryName }
                                  </c:if>
						</c:forEach></td>
				</tr>
				<tr>
					<td>经营场所地址(具体到摊位号)</td>
					<td>${agricultural.scaddress }</td>
					<td>经营者姓名</td>
					<td>${agricultural.qydelegate }</td>
				</tr>
				<tr>
					<td>经营者身份证号</td>
					<td>${agricultural.idNumber }</td>
					<td>联系电话</td>
					<td>${agricultural.qyphone }</td>
				</tr>

				<tr>
					<td>注册号/统一社会信用代码</td>
					<td>${agricultural.zzcode }</td>
					<td>监管单位</td>
					<td><c:forEach items="${addressList}" var="addressLis">
							<c:if
								test="${agricultural.department eq addressLis.tDictionaryCode }">
                                    ${addressLis.tDictionaryName }
                                  </c:if>
						</c:forEach></td>
				</tr>

				<tr>
					<td>从业人员数量</td>
					<td>${agricultural.numberOfEmployees }</td>
					<td>监管人员</td>
					<td>${agricultural.spdelegate }</td>
				</tr>


				<tr>
					<td>备案日期</td>
					<td>${agricultural.recordDate }</td>
					<td>备案有效日期</td>
					<td>${agricultural.recordEffectiveDate }</td>
				</tr>

				<tr>
					<td>备案机关</td>
					<td>${agricultural.recordOrgan }</td>
					<td>备案卡编号</td>
					<td>${agricultural.recordCardNumber }</td>
				</tr>
				<tr>
					<td>经度</td>
					<td>${agricultural.longitude }</td>
					<td>纬度</td>
					<td>${agricultural.latitude }</td>
				</tr>


				<tr>
					<td colspan="4"><b>二、主体业态</b></td>
				</tr>
				<tr>
					<td><input type="checkbox" value="流动摊点" name="mainBody">&nbsp&nbsp&nbsp流动摊点</td>
					<td><input type="checkbox" value="固定摊点" name="mainBody">&nbsp&nbsp&nbsp固定摊点</td>
					<td><input type="checkbox" value="小食杂店" name="mainBody">&nbsp&nbsp&nbsp小食杂店</td>
					<td><input type="checkbox" value="市场内摊点" name="mainBody">&nbsp&nbsp&nbsp市场内摊点</td>
				</tr>
				<tr>
					<td colspan="4"><b>三、经营范围</b></td>
				</tr>
				<tr>
					<td><input type="checkbox" value="食品销售 " name="businessScope">&nbsp&nbsp&nbsp食品销售
					</td>
					<td><input type="checkbox" value="餐饮服务" name="businessScope">&nbsp&nbsp&nbsp餐饮服务</td>
				</tr>


				<tr>
					<td colspan="4"><b>四、经营项目</b></td>
				</tr>
				<tr>
					<td><input type="checkbox" value="预包装食品销售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp预包装食品销售</td>
					<td><input type="checkbox" value="散装食品销售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp散装食品销售</td>
					<td><input type="checkbox" value="食用农产品销售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp食用农产品销售</td>
					<td><input type="checkbox" value="热食类食品制售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp热食类食品制售</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="冷食类食品制售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp冷食类食品制售</td>
					<td><input type="checkbox" value="生食类食品制售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp生食类食品制售</td>
					<td><input type="checkbox" value="糕点类食品制售"
						name="itemsOfBusiness">&nbsp&nbsp&nbsp糕点类食品制售</td>
					<td><input type="checkbox" value="自制饮品制售" name=itemsOfBusiness>&nbsp&nbsp&nbsp自制饮品制售</td>
				</tr>
				<tr>
					<td colspan="4"><input type="checkbox" value="其它"
						name=itemsOfBusiness>&nbsp&nbsp&nbsp其它</td>
				</tr>
				<tr>
					<td colspan="4"><b>五、相关证照</b></td>
				</tr>
				<tr>
					<td><img
						src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${agricultural.businessLicense }"
						style="width: 150px; display: block" id="businessLicenseImg" /></td>
					<td><img
						src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${agricultural.smallStallregistrationCard }"
						style="width: 150px; display: block"
						id="smallStallregistrationCardImg" /></td>
					<td><img
						src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${agricultural.healthCertificate }"
						style="width: 150px; display: block" id="healthCertificateImg" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br />
	<br />
	<div align="center">
		<input type="button" onclick="print()" width="50px" value="打印" />
	</div>
</body>
</html>
