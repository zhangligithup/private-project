<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
    	
    	$(function(){
    		//$("tbody>tr>td>input").attr("readonly", readonly);
    		/*if(${groupid eq 1})
    		{
    			$(":input[readonly]").removeAttr("readonly");
    			$("#textarea").removeAttr("readonly");
    			$("#selectId").removeAttr("disabled");
    			$(":checkbox").removeAttr("disabled");
    		}*/
    		//循环遍历type选中项
	   		var everyOne = '${industry.everyOne}';
	           var arr = new Array();
	           arr = everyOne.split(",");
	           $("input:checkbox[name='everyOne']").each(function() {
	           	for(j=0;j<arr.length;j++){
	           		if(arr[j] == $(this).val()){
	           			$(this).attr("checked",true);
	           			continue;
	           		}
	           	}
			});
    	});
    	//打印
    	function print(){
    		$("#printForm").submit();
    	}
    	
    </script>
        <section class="content">
		
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3>五小食品业态信息登记表</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form id="deleteForm" action="" method="post">
                	<input type="hidden" name="method" value="delete">
                	<input type="hidden" name="id" value="${industry.id }">
                	<input type="hidden" name="pageCode" value="${pageCode }">
                </form>
                
                <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/IndustryServlet" method="post">
                	<input type="hidden" name="method" value="print">
                	<input type="hidden" name="idI" value="${industry.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbit_sure()" id="IndustryForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="idI" value="${industry.id}">
                  <label class="pull-left">最后修改人: ${industry.amend }</label>
                  
                  <table id="" class="table table-condensed" >                   
                    <tbody>
					 <tr>
                        <td ><b>一、基本情况</b></td>
                         <td></td>
                        <td></td>
                        <td align="right"><font color="red" size="0.8e"></font></td>                 
                     </tr>
					 <tr>
						<td>企业名称</td>
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" value="${industry.qyname }"/></td>
						<td>所属行政区域</td>
                        <td>
                        	<select id="address" style="width:280px" name="address" >
                        		<option value="0">请选择</option>
                 			  <c:forEach items="${addressList}" var="addressLis">
                  		           <option  value="${addressLis.tDictionaryCode }" <c:if test="${industry.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                       </td>
					 </tr>
					  <tr>
                        <td>经营地址(具体到门牌号)</td>
                        <td><input id="scaddress" type="text" style="width:280px" name="scaddress" value="${industry.scaddress }" onblur="searchAddress('inlongitude','inlatitude')"/>
                        </td>
                        <td>邮政编码</td>
                        <td><input id="ems" type="text" style="width:280px" name="ems" value="${industry.ems }"/></td>                   
                      </tr>
					  <tr>
                        <td>固定电话</td>
                        <td><input id="phone" type="text" style="width:280px" name="phone" value="${industry.phone }"/></td>
						<td>传    真</td>
                        <td><input id="fax" type="text" style="width:280px" name="fax" value="${industry.fax }"/></td>
                      </tr>
					  <tr>                        
                        <td>电子邮箱</td>
                        <td><input id="email" type="text" style="width:280px" name="email" value="${industry.email }"/></td>
						<td>经济类型</td>
                        <td> 
                        	<select id="" style="width:280px" name="jjtype">
                  		            <option value="">请选择</option>
                 			  <c:forEach items="${economicTypeList}" var="economicType">
                  		          <option  value="${economicType.tDictionaryCode }" <c:if test="${industry.jjtype eq economicType.tDictionaryCode }">selected='selected'</c:if>>${economicType.tDictionaryName }</option>
                 			  </c:forEach>	
                           </select>
                        </td>
                      </tr>
					  <tr> 
						<td>登记机关</td>
                        <td><input id="gsorganization" type="text" style="width:280px" name="gsorganization" value="${industry.gsorganization }"/></td>
                        <td>注册号/统一社会信用代码</td>
                        <td><input id="zzcode" type="text" style="width:280px" name="zzcode" value="${industry.zzcode }"/></td>
                      </tr>
                      
                      <tr>
                        <td>法定代表人</td>
                        <td><input id="fddelegate" type="text" style="width:280px" name="fddelegate" value="${industry.fddelegate }"/></td>
						<td>电话(手机)号</td>
                        <td><input id="fdphone" type="text" style="width:280px" name="fdphone" value="${industry.fdphone }"/></td>
                      </tr>
                      <tr>
                        <td>企业负责人</td>
                        <td><input id="qydelegate" type="text" style="width:280px" name="qydelegate" value="${industry.qydelegate }"/></td>
						<td>电话(手机)号</td>
                        <td><input id="qyphone" type="text" style="width:280px" name="qyphone" value="${industry.qyphone }"/></td>
                      </tr>
                      
                      <tr>
                        <td>监管单位</td>
                      	<td><select style="width:280px" id="department" name="department">
                      			<option value="0">请选择</option>
                      			<c:forEach items="${unitList}" var="list">
                        			<option value="${list.tDictionaryCode }" <c:if test="${industry.department eq list.tDictionaryCode }">selected='selected'</c:if>>${list.tDictionaryName }</option>
                        		</c:forEach>
                            </select>
                        </td>
						<td>监管人员</td>
                        <td><input id="spdelegate" type="text" style="width:280px" name="spdelegate" value="${industry.spdelegate }"/></td>
                      </tr>
                      <tr>
                        <td>监督人员</td>
                        <td><input id="jiandurenyuan" type="text" style="width:280px" value="${industry.jiandurenyuan }" name="jiandurenyuan" /></td>
						<td>协管人员</td>
                        <td><input id="xieguanrenyuan" type="text" style="width:280px" value="${industry.xieguanrenyuan }" name="xieguanrenyuan" /></td>
                      </tr>
                      
                      <tr>
						 <td>从业人员数</td>
                         <td><input id="cyNum" type="text" style="width:280px" value="${industry.cyNum }" name="cyNum" /></td>
						 <td>持健康证人数</td>
                         <td><input id="healthNum" type="text" style="width:280px" value="${industry.healthNum }" name="healthNum" /></td>
					 </tr>
                      
                      <tr>
                        <td>所在区域</td>
                        <td>
                        	<select id="" style="width:280px" name="area">
                  		          <option  value="" >请选择</option>
                  		          <option  value="城市" <c:if test="${industry.area eq '城市' }">selected='selected'</c:if>>城市</option>
                  		          <option  value="乡镇" <c:if test="${industry.area eq '农村' }">selected='selected'</c:if>>乡镇</option>
                  		          <option  value="农村" <c:if test="${industry.area eq '农村' }">selected='selected'</c:if>>农村</option>
                           </select>
                        </td>
						 <td>生产经营场所性质</td>
                        <td>
                        	<select id="" style="width:280px" name="scJyAddressXingZhi">
                  		          <option  value="" >请选择</option>
                  		          <option  value="住宅" <c:if test="${industry.scJyAddressXingZhi eq '住宅' }">selected='selected'</c:if>>住宅</option>
                  		          <option  value="商用" <c:if test="${industry.scJyAddressXingZhi eq '独立厂房' }">selected='selected'</c:if>>商用</option>
                  		          <option  value="临时建筑" <c:if test="${industry.scJyAddressXingZhi eq '独立厂房' }">selected='selected'</c:if>>临时建筑</option>
                  		          <option  value="独立厂房" <c:if test="${industry.scJyAddressXingZhi eq '独立厂房' }">selected='selected'</c:if>>独立厂房</option>
                  		          <option  value="惠民工程厅" <c:if test="${industry.scJyAddressXingZhi eq '其他' }">selected='selected'</c:if>>惠民工程厅</option>
                  		          <option  value="其他" <c:if test="${industry.scJyAddressXingZhi eq '其他' }">selected='selected'</c:if>>其他</option>
                           </select>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>经营时间</td>
                        <td>
                        	<select id="" style="width:280px" name="jyTime">
                  		          <option  value="" >请选择</option>
                  		          <option  value="3个月以下" <c:if test="${industry.jyTime eq '3个月以下' }">selected='selected'</c:if>>3个月以下</option>
                  		          <option  value="3个月至6个月" <c:if test="${industry.jyTime eq '3个月至6个月' }">selected='selected'</c:if>>3个月至6个月</option>
                  		          <option  value="6个月至1年" <c:if test="${industry.jyTime eq '6个月至1年' }">selected='selected'</c:if>>6个月至1年</option>
                  		          <option  value="1年以上" <c:if test="${industry.jyTime eq '1年以上' }">selected='selected'</c:if>>1年以上</option>
                           </select>
                        </td>
                        <td>生产经营场所面积</td>
                        <td>
                        	<select id="" style="width:280px" name="addressArea">
                  		          <option  value="" >请选择</option>
                  		          <option  value="10平方米以下" <c:if test="${industry.addressArea eq '10至20平方米' }">selected='selected'</c:if>>10平方米以下</option>
                  		          <option  value="10至20平方米" <c:if test="${industry.addressArea eq '10至20平方米' }">selected='selected'</c:if>>10至20平方米</option>
                  		          <option  value="20至30平方米" <c:if test="${industry.addressArea eq '50平方米以上' }">selected='selected'</c:if>>20至30平方米</option>
                  		          <option  value="30至50平方米" <c:if test="${industry.addressArea eq '50平方米以上' }">selected='selected'</c:if>>30至50平方米</option>
                  		          <option  value="50平方米以上" <c:if test="${industry.addressArea eq '50平方米以上' }">selected='selected'</c:if>>50平方米以上</option>

                           </select>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>食品处理区面积</td>
                        <td>
                        	<select id="" style="width:280px" name="processArea">
                  		          <option  value="" >请选择</option>
                  		          <option  value="5平方米以下" <c:if test="${industry.processArea eq '5至8平方米' }">selected='selected'</c:if>>5平方米以下</option>
                  		          <option  value="5至8平方米" <c:if test="${industry.processArea eq '5至8平方米' }">selected='selected'</c:if>>5至8平方米</option>
                  		          <option  value="8至15平方米" <c:if test="${industry.processArea eq '8至15平方米' }">selected='selected'</c:if>>8至15平方米</option>
                  		          <option  value="15至30平方米" <c:if test="${industry.processArea eq '15至30平方米' }">selected='selected'</c:if>>15至30平方米</option>
                  		          <option  value="30平方米以上" <c:if test="${industry.processArea eq '30平方米以上' }">selected='selected'</c:if>>30平方米以上</option>

                           </select>
                        </td>
						<td>销售方式</td>
                        <td>
                        	<select id="" style="width:280px" name="market">
                  		          <option  value="" >请选择</option>
                  		          <option  value="含网络销售" <c:if test="${industry.market eq '含网络销售' }">selected='selected'</c:if>>含网络销售</option>
                  		          <option  value="不含网络销售" <c:if test="${industry.market eq '不含网络销售' }">selected='selected'</c:if>>不含网络销售</option>
                           </select>
                        </td>
                      </tr>
                      
                       <tr>
                        <td>就餐座位数</td>
                        <td>
                        	<select id="" style="width:280px" name="zuoWeiNum">
                  		          <option  value="" >请选择</option>
                  		          <option  value="5座以下" <c:if test="${industry.zuoWeiNum eq '5座以下' }">selected='selected'</c:if>>5座以下</option>
                  		          <option  value="5至9座" <c:if test="${industry.zuoWeiNum eq '5至9座' }">selected='selected'</c:if>>5至9座</option>
                  		          <option  value="9至33座" <c:if test="${industry.zuoWeiNum eq '9至33座' }">selected='selected'</c:if>>9至33座</option>
                  		          <option  value="33座以上" <c:if test="${industry.zuoWeiNum eq '33座以上' }">selected='selected'</c:if>>33座以上</option>

                           </select>
                        </td>
						<td>是否送餐</td>
                        <td>
                        	<select id="" style="width:280px" name="shiFoSongCan">
                  		          <option  value="" >请选择</option>
                  		          <option  value="是" <c:if test="${industry.shiFoSongCan eq '是' }">selected='selected'</c:if>>是</option>
                  		          <option  value="否" <c:if test="${industry.shiFoSongCan eq '否' }">selected='selected'</c:if>>否</option>
                           </select>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>生产经营时段性质</td>
                        <td>
                        	<select id="" style="width:280px" name="shiDuanXingZhi">
                  		          <option  value="" >请选择</option>
                  		          <option  value="临时" <c:if test="${industry.shiDuanXingZhi eq '临时' }">selected='selected'</c:if>>临时</option>
                  		          <option  value="季节性" <c:if test="${industry.shiDuanXingZhi eq '季节性' }">selected='selected'</c:if>>季节性</option>
                  		          <option  value="间断性" <c:if test="${industry.shiDuanXingZhi eq '间断性' }">selected='selected'</c:if>>间断性</option>
                  		          <option  value="长期" <c:if test="${industry.shiDuanXingZhi eq '长期' }">selected='selected'</c:if>>长期</option>

                           </select>
                        </td>
						<td>小餐桌就餐学生数</td>
                        <td>
                        	<select id="" style="width:280px" name="studentNum">
                  		          <option  value="" >请选择</option>
                  		          <option  value="5人以下" <c:if test="${industry.studentNum eq '5人以下' }">selected='selected'</c:if>>5人以下</option>
                  		          <option  value="5至10人" <c:if test="${industry.studentNum eq '5至10人' }">selected='selected'</c:if>>5至10人</option>
                  		          <option  value="10至20人" <c:if test="${industry.studentNum eq '10至20人' }">selected='selected'</c:if>>10至20人</option>
                  		          <option  value="20人以上" <c:if test="${industry.studentNum eq '20人以上' }">selected='selected'</c:if>>20人以上</option>
                           </select>
                        </td>
                      </tr>
                      
                      <tr>
                       <td>许可证编号</td>
                        <td><input id="scpermit" type="text" style="width:280px" name="scpermit" value="${industry.scpermit }"/></td>
						<td>发证机关</td>
                        <td><input id="fazhengjiguan" type="text" style="width:280px" value="${industry.fazhengjiguan }" name="fazhengjiguan" /></td>
                      </tr>
                      <tr>
                        <td>发证日期</td>
                        <td><input id="fazhengriqi" type="text" style="width:280px" value="${industry.fazhengriqi }" name="fazhengriqi" /></td>
						<td>有效日期</td>
                        <td><input id="youxiaodate" type="text" style="width:280px" value="${industry.youxiaodate }" name="youxiaodate" /></td>
                      </tr>
                      <tr>
                        <td>经度</td>
                        <td><input id="inlongitude" type="text" style="width:280px" value="${industry.longitude }" name="longitude" /></td>
						<td>纬度</td>
                        <td><input id="inlatitude" type="text" style="width:280px" value="${industry.latitude }" name="latitude" /></td>
                      </tr>
                      
                      <tr>
                    	<td><b>二、食品业态</b></td>
                 	  </tr>
                    		
            		  <tr>
              			<td><input id="type" type="checkbox" value="食品生产加工小作坊" name="everyOne">&nbsp&nbsp&nbsp食品生产加工小作坊</td>
                		<td><input id="superMarket" type="checkbox" value="小食杂店" name="everyOne">&nbsp&nbsp&nbsp小食杂店</td>
                		<td><input id="cvs" type="checkbox" value="小餐饮店" name="everyOne">&nbsp&nbsp&nbsp小餐饮店</td>
                		<td><input id="store" type="checkbox" value="餐馆" name="everyOne">&nbsp&nbsp&nbsp餐馆</td>
             		 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="快餐店" name="everyOne">&nbsp&nbsp&nbsp快餐店</td>
                		<td><input id="superMarket" type="checkbox" value="小吃店" name="everyOne">&nbsp&nbsp&nbsp小吃店</td>
                		<td><input id="cvs" type="checkbox" value="饮品店" name="everyOne">&nbsp&nbsp&nbsp饮品店</td>
                		<td><input id="store" type="checkbox" value="小餐桌" name="everyOne">&nbsp&nbsp&nbsp小餐桌</td>
             		 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="食品摊贩" name="everyOne">&nbsp&nbsp&nbsp食品摊贩</td>
              			<td><input id="foodMarket" type="checkbox" value="销售固定" name="everyOne">&nbsp&nbsp&nbsp食品销售摊贩(固定)</td>
                		<td><input id="superMarket" type="checkbox" value="销售流动" name="everyOne">&nbsp&nbsp&nbsp食品销售摊贩(流动)</td>
                		<td><input id="cvs" type="checkbox" value="服务固定" name="everyOne">&nbsp&nbsp&nbsp食品服务摊贩(固定)</td>
             		 </tr>
             		
             		 <tr>
              			
                		<td><input id="store" type="checkbox" value="服务流动" name="everyOne">&nbsp&nbsp&nbsp食品服务摊贩(流动)</td>
                		<td><input id="foodMarket" type="checkbox" value="其他1" name="everyOne">&nbsp&nbsp&nbsp其他</td>
             		 </tr>
             		
             		<tr>
                    	<td><b>三、主体资格性质</b></td>
                 	 </tr>
             		
             		 <tr>
              			<td><input id="c" type="checkbox"  value="有营业执照" name="everyOne">&nbsp&nbsp&nbsp有营业执照</td>
                		<td><input id="c1" type="checkbox" onclick="check();" value="企业" name="everyOne">&nbsp&nbsp&nbsp企业</td>
                		<td><input id="c2" type="checkbox" onclick="check();" value="个体" name="everyOne">&nbsp&nbsp&nbsp个体</td>
                		<td><input id="c3" type="checkbox" onclick="check();" value="其他2" name="everyOne">&nbsp&nbsp&nbsp其他</td>
             		 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="无营业执照" name="everyOne">&nbsp&nbsp&nbsp无营业执照</td>
                		<td><input id="superMarket" type="checkbox" value="单位" name="everyOne">&nbsp&nbsp&nbsp单位</td>
                		<td><input id="cvs" type="checkbox" value="无个人" name="everyOne">&nbsp&nbsp&nbsp个人</td>
             		 </tr>
             		
             		<tr>
                    	<td><b>三、主体资格性质</b></td>
                 	 </tr>
             		
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="批发市场" name="everyOne">&nbsp&nbsp&nbsp批发市场</td>
                		<td><input id="superMarket" type="checkbox" value="集贸市场" name="everyOne">&nbsp&nbsp&nbsp集贸市场</td>
                		<td><input id="cvs" type="checkbox" value="社区菜市场" name="everyOne">&nbsp&nbsp&nbsp社区菜市场</td>
                		<td><input id="store" type="checkbox" value="集市" name="everyOne">&nbsp&nbsp&nbsp集市</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="夜市" name="everyOne">&nbsp&nbsp&nbsp夜市</td>
                		<td><input id="superMarket" type="checkbox" value="社区大排档" name="everyOne">&nbsp&nbsp&nbsp社区大排档</td>
                		<td><input id="cvs" type="checkbox" value="景区" name="everyOne">&nbsp&nbsp&nbsp景区</td>
                		<td><input id="store" type="checkbox" value="商场超市" name="everyOne">&nbsp&nbsp&nbsp商场超市</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="学校及周边" name="everyOne">&nbsp&nbsp&nbsp学校及周边</td>
                		<td><input id="store" type="checkbox" value="其他3" name="everyOne">&nbsp&nbsp&nbsp其他</td>
             		 </tr>
					 
					<tr>
                    	<td><b>四、生产经营品种</b></td>
                 	 </tr>
                 	 
                 	 <tr>
                    	<td>食品生产加工小作坊</td>
                 	 </tr>
                 	 
                 	 <tr>
              			<td><input id="foodMarket" type="checkbox" value="粮食加工品" name="everyOne">&nbsp&nbsp&nbsp粮食加工品</td>
                		<td><input id="superMarket" type="checkbox" value="食用油油脂及其制品" name="everyOne">&nbsp&nbsp&nbsp食用油、油脂及其制品</td>
                		<td><input id="cvs" type="checkbox" value="调味品" name="everyOne">&nbsp&nbsp&nbsp调味品</td>
                		<td><input id="store" type="checkbox" value="肉制品" name="everyOne">&nbsp&nbsp&nbsp肉制品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="乳制品" name="everyOne">&nbsp&nbsp&nbsp乳制品</td>
                		<td><input id="superMarket" type="checkbox" value="饮料" name="everyOne">&nbsp&nbsp&nbsp饮料</td>
                		<td><input id="cvs" type="checkbox" value="方便食品" name="everyOne">&nbsp&nbsp&nbsp方便食品</td>
                		<td><input id="store" type="checkbox" value="饼干" name=everyOne>&nbsp&nbsp&nbsp饼干</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="罐头" name="everyOne">&nbsp&nbsp&nbsp罐头</td>
                		<td><input id="store" type="checkbox" value="冷冻饮品" name="everyOne">&nbsp&nbsp&nbsp冷冻饮品</td>
                		<td><input id="foodMarket" type="checkbox" value="速冻食品" name="everyOne">&nbsp&nbsp&nbsp速冻食品</td>
                		<td><input id="store" type="checkbox" value="薯类和膨化食品" name="everyOne">&nbsp&nbsp&nbsp薯类和膨化食品</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value=糖果制品 name="everyOne">&nbsp&nbsp&nbsp糖果制品</td>
                		<td><input id="superMarket" type="checkbox" value="茶叶及相关制品" name="everyOne">&nbsp&nbsp&nbsp茶叶及相关制品</td>
                		<td><input id="cvs" type="checkbox" value="酒类" name="everyOne">&nbsp&nbsp&nbsp酒类</td>
                		<td><input id="store" type="checkbox" value="蔬菜制品" name="everyOne">&nbsp&nbsp&nbsp蔬菜制品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="水果制品" name="everyOne">&nbsp&nbsp&nbsp水果制品</td>
                		<td><input id="superMarket" type="checkbox" value="炒货食品及坚果制品" name="everyOne">&nbsp&nbsp&nbsp炒货食品及坚果制品</td>
                		<td><input id="cvs" type="checkbox" value="蛋制品" name="everyOne">&nbsp&nbsp&nbsp蛋制品</td>
                		<td><input id="store" type="checkbox" value="可可及烘烤咖啡制品" name="everyOne">&nbsp&nbsp&nbsp可可及烘烤咖啡制品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="食堂" name="everyOne">&nbsp&nbsp&nbsp食堂</td>
                		<td><input id="store" type="checkbox" value="水产制品" name="everyOne">&nbsp&nbsp&nbsp水产制品</td>
                		<td><input id="foodMarket" type="checkbox" value="速冻食品" name="everyOne">&nbsp&nbsp&nbsp速冻食品</td>
                		<td><input id="store" type="checkbox" value="淀粉及淀粉制品" name="everyOne">&nbsp&nbsp&nbsp淀粉及淀粉制品</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="糕点" name="everyOne">&nbsp&nbsp&nbsp糕点</td>
                		<td><input id="superMarket" type="checkbox" value="豆制品" name="everyOne">&nbsp&nbsp&nbsp豆制品</td>
                		<td><input id="cvs" type="checkbox" value="蜂产品" name="everyOne">&nbsp&nbsp&nbsp蜂产品</td>
                		<td><input id="store" type="checkbox" value="保健食品" name="everyOne">&nbsp&nbsp&nbsp保健食品</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="特殊医学用途配方食品" name="everyOne">&nbsp&nbsp&nbsp特殊医学用途配方食品</td>
                		<td><input id="superMarket" type="checkbox" value="婴幼儿配方食品" name="everyOne">&nbsp&nbsp&nbsp婴幼儿配方食品</td>
                		<td><input id="cvs" type="checkbox" value="特殊膳食食品" name="everyOne">&nbsp&nbsp&nbsp特殊膳食食品</td>
                		<td><input id="store" type="checkbox" value="其他食品" name="everyOne">&nbsp&nbsp&nbsp其他食品</td>
             		 </tr>
             		 
             		 <tr>
                    	<td>小食杂店、小餐饮店、小餐桌、食品摊贩</td>
                 	 </tr>
                 	
                 	  <tr>
              			<td><input id="foodMarket" type="checkbox" value="食用农产品" name="everyOne">&nbsp&nbsp&nbsp食用农产品</td>
                		<td><input id="superMarket" type="checkbox" value="食用添加剂" name="everyOne">&nbsp&nbsp&nbsp食用添加剂</td>
                		<td><input id="cvs" type="checkbox" value="热食类食品制售" name="everyOne">&nbsp&nbsp&nbsp热食类食品制售</td>
                		<td><input id="store" type="checkbox" value="冷食类食品制售" name="everyOne">&nbsp&nbsp&nbsp冷食类食品制售</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="生食类食品制售" name="everyOne">&nbsp&nbsp&nbsp生食类食品制售</td>
                		<td><input id="superMarket" type="checkbox" value="糕点类食品制售" name="everyOne">&nbsp&nbsp&nbsp糕点类食品制售</td>
                		<td><input id="cvs" type="checkbox" value="自制饮品制售" name="everyOne">&nbsp&nbsp&nbsp自制饮品制售</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="预包装食品销售" name="everyOne">&nbsp&nbsp&nbsp预包装食品销售</td>
                		<td><input id="superMarket" type="checkbox" value="含冷藏冷冻食品" name="everyOne">&nbsp&nbsp&nbsp含冷藏冷冻食品</td>
                		<td><input id="cvs" type="checkbox" value="不含冷藏冷冻食品" name="everyOne">&nbsp&nbsp&nbsp不含冷藏冷冻食品</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="散装食品销售" name="everyOne">&nbsp&nbsp&nbsp散装食品销售</td>
                		<td><input id="superMarket" type="checkbox" value="散含冷藏冷冻食品" name="everyOne">&nbsp&nbsp&nbsp含冷藏冷冻食品</td>
                		<td><input id="cvs" type="checkbox" value="散不含冷藏冷冻食品" name="everyOne">&nbsp&nbsp&nbsp不含冷藏冷冻食品</td>
                		<td><input id="store" type="checkbox" value="含熟食" name="everyOne">&nbsp&nbsp&nbsp含熟食</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="不含熟食" name="everyOne">&nbsp&nbsp&nbsp不含熟食</td>
                		<td><input id="superMarket" type="checkbox" value="含散装酒" name="everyOne">&nbsp&nbsp&nbsp含散装酒</td>
                		<td><input id="cvs" type="checkbox" value="不含散装酒" name="everyOne">&nbsp&nbsp&nbsp不含散装酒</td>
             		 </tr>
             		 
             		  <tr>
              			<td><input id="foodMarket" type="checkbox" value="特殊食品销售" name="everyOne">&nbsp&nbsp&nbsp特殊食品销售</td>
                		<td><input id="superMarket" type="checkbox" value="保健食品销售" name="everyOne">&nbsp&nbsp&nbsp保健食品销售</td>
                		<td><input id="cvs" type="checkbox" value="特殊医学用途配方食品销售" name="everyOne">&nbsp&nbsp&nbsp特殊医学用途配方食品销售</td>
                		<td><input id="cvs" type="checkbox" value="婴幼儿配方乳粉销售" name="everyOne">&nbsp&nbsp&nbsp婴幼儿配方乳粉销售</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="其他婴幼儿配方食品销售" name="everyOne">&nbsp&nbsp&nbsp其他婴幼儿配方食品销售</td>
             		 </tr>
             		 
             		 <tr>
              			<td><input id="foodMarket" type="checkbox" value="其他类食品" name="everyOne">&nbsp&nbsp&nbsp其他类食品制(销)售</td>
             		 </tr>
             		 
             		 <tr>
                    	<td>其他食品业态</td>
                 	 </tr>
                 	 <tr>
              			<td><input id="foodMarket" type="checkbox" value="农家乐" name="everyOne">&nbsp&nbsp&nbsp农家乐</td>
                		<td><input id="superMarket" type="checkbox" value="私人会所" name="everyOne">&nbsp&nbsp&nbsp私人会所</td>
                		<td><input id="cvs" type="checkbox" value="豆芽生产" name="everyOne">&nbsp&nbsp&nbsp豆芽生产</td>
                		
             		 </tr>
             		 
             		 <tr>
             		 	<td><input id="cvs" type="checkbox" value="食用初级" name="everyOne">&nbsp&nbsp&nbsp食用初级农产品去籽、净化、剥皮、腿毛、沤软及包装等</td>
              			<td><input id="foodMarket" type="checkbox" value="其他4" name="everyOne">&nbsp&nbsp&nbsp其他</td>
             		 </tr>
                      
						<tr>
						<td colspan="2" align="right"><input type="submit" class="btn btn-primary"  width="30px" value="修改"/></td>
						<td><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>						
                     </tr>											  
                    </tfoot>
                  </table>	
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->			                         
            </div><!-- /.col -->
			
          </div><!-- /.row -->
        </section><!-- /.content -->
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
      function sumbit_sure(){
    	  confirmMessage('con_punishBasis','确定要修改吗',{width:300,height:150,sure:callBack}); 
  		function callBack(){
  			$.ajax({
  				url:"${pageContext.request.contextPath }/IndustryServlet",
  				type:"post",
  				dataType:"json",
  				data:$('#IndustryForm').serialize(),
  				success : function(data) {
  					if(data>0){
  						alertEase("修改成功",'alert_succ');
  					}else{
  						alertEase("修改失败",'alert_err');
  					}
  				}
  			}); 
  		}
  	}
    </script>
