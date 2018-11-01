<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
        
        $(function(){
            //循环遍历type选中项
            var type = '${agricultural.mainBody}';
               var arr = new Array();
               arr = type.split(",");
               $("input:checkbox[name='mainBody']").each(function() {
                for(j=0;j<arr.length;j++){
                    if(arr[j] == $(this).val()){
                        $(this).attr("checked",true);
                        continue;
                    }
                }
            });
            
             //循环遍历manage选中项
               var manage = '${agricultural.businessScope}';
                  var arrManage = new Array();
                  arrManage = manage.split(",");
                  $("input:checkbox[name='businessScope']").each(function() {
                   for(j=0;j<arrManage.length;j++){
                       if(arrManage[j] == $(this).val()){
                           $(this).attr("checked",true);
                           continue;
                       }
                   }
               });
                  
            //循环遍历manage选中项
            var manage = '${agricultural.itemsOfBusiness}';
               var arrManage = new Array();
               arrManage = manage.split(",");
               $("input:checkbox[name='itemsOfBusiness']").each(function() {
                for(j=0;j<arrManage.length;j++){
                    if(arrManage[j] == $(this).val()){
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
        
        //提交修改
        function sumbitsure(id){
            var val = $("#department").val();
            var add = $("#address").val();
            var qyname = $("#qyname").val();
            var zzcode = $("#zzcode").val();
            var qydelegate = $("#qydelegate").val();
            var recordDate = $("#recordDate").val();
            var recordEffectiveDate = $("#recordEffectiveDate").val();
            if(qyname.trim() == ""){
                alert("请填写经营户名称");
                return false;
            }else if(add == 0){
                alert("请选择行政区域");
                return false;
            }else if(qydelegate.trim() == ""){
                alert("请填写法定代表人");
                return false;
            }else if(zzcode.trim() == ""){
                alert("请填写注册号");
                return false;
            }else if(val == 0){
                alert("请选择监管单位");
                return false;
            }else{
                confirmMessage('con_punishBasis','确定要修改吗',{width:300,height:150,sure:callBack}); 
                function callBack(){
                    $.ajax({
                        url:"${pageContext.request.contextPath }/AgriculturalServlet",
                        type:"post",
                        dataType:"json",
                        data:$('#AgriculturalForm').serialize(),
                        success : function(data) {
                            if(data>0){
                                alertEase("修改成功",1);
                            }else{
                                alertEase("修改失败",2);
                            }
                        }
                    }); 
                }
            }
        }
        
    </script>
        <section class="content">
        
          <div class="row" style="text-align:center">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3>食品小摊点经营户信息登记表</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                
                <!-- 打印 -->
                <form id="printForm" action="${pageContext.request.contextPath }/AgriculturalServlet" method="post">
                    <input type="hidden" name="method" value="print">
                    <input type="hidden" name="id" value="${agricultural.id }">
                </form>
                
                <form action="javascript:void(0)" method="post" onsubmit="return sumbitsure()" id="AgriculturalForm">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="idA" value="${agricultural.id}">
                  <label class="pull-left">最后修改人: ${agricultural.amend }</label>
                  
                  <table id="" class="table table-condensed" >     
                    <tbody>
                     <tr>
                        <td ><b>一、基本情况</b></td>
                         <td></td>
                        <td></td>
                        <td></td>                 
                     </tr>
                     <tr>
                        <td>经营户名称</td>
                        <td><input id="qyname" type="text" style="width:280px" name="qyname" value="${agricultural.qyname }"/></td>
                        <td>所属行政区域</td>
                        <td>
                            <select id="address" style="width:280px" name="address">
                                <option value="0">请选择</option>
                              <c:forEach items="${addressList}" var="addressLis">
                                  <option  value="${addressLis.tDictionaryCode }" <c:if test="${agricultural.address eq addressLis.tDictionaryCode }">selected='selected'</c:if>>${addressLis.tDictionaryName }</option>
                              </c:forEach>  
                           </select>
                       </td>
                     </tr>
                      <tr>
                        <td>经营场所地址(具体到摊位号)</td>
                        <td><input id="scaddress" value="${agricultural.scaddress }" type="text" style="width:280px" name="scaddress" class="" onblur="searchAddress('aglongitude','aglatitude')"/>
                        </td>
                        <td>经营者姓名</td>
                        <td><input id="qydelegate" value="${agricultural.qydelegate }" type="text" style="width:280px" name="qydelegate" class=""/></td>                   
                      </tr>
                      <tr>
                        <td>经营者身份证号</td>
                        <td><input id="idNumber" value="${agricultural.idNumber }" type="text" style="width:280px" name="idNumber" class=""/></td>
                        <td>联系电话</td>
                        <td><input id="qyphone" value="${agricultural.qyphone }" type="text" style="width:280px" name="qyphone" class=""/></td>
                      </tr>
                      
                      <tr>
                        <td>注册号/统一社会信用代码</td>
                        <td><input id="zzcode" value="${agricultural.zzcode }" type="text" style="width:280px" name="zzcode" class=""/></td>
                        <td>监管单位</td>
                        <td><select style="width:280px" id="department" name="department">
                                <option value="0">请选择</option>
                                <c:forEach items="${unitList}" var="list">
                                    <option value="${list.tDictionaryCode }" <c:if test="${agricultural.department eq list.tDictionaryCode }">selected='selected'</c:if>>${list.tDictionaryName }</option>
                                </c:forEach>
                            </select>
                        </td>
                      </tr>
                      <tr>                        
                        <td>从业人员数量</td>
                        <td><input id="numberOfEmployees" value="${agricultural.numberOfEmployees }" type="text" style="width:280px" name="numberOfEmployees" class=""/></td>
                        <td>监管人员</td>
                        <td><input id="spdelegate" value="${agricultural.spdelegate }" type="text" style="width:280px" name="spdelegate" class=""/></td>
                      </tr>
                      <tr>                        
                        <td>备案日期</td>
                        <td>
                            <div id="recordDateBox1" style="position:relative">
                                <input id="recordDate" value="${agricultural.recordDate }" name="recordDate" class="bg_calender" style="width:280px" size="16" type="text" value="">
                            </div>
                        </td>
                        <td>备案有效日期</td>
                        <td>
                            <div id="recordEffectiveDateBox2" style="position:relative">
                                <input id="recordEffectiveDate" value="${agricultural.recordEffectiveDate }" name="recordEffectiveDate" style="width:280px" class="bg_calender" size="16" type="text" value="">
                            </div>
                        </td>
                      </tr>
                      <tr>                        
                        <td>备案机关</td>
                        <td><input id="recordOrgan" value="${agricultural.recordOrgan }" type="text" style="width:280px" name="recordOrgan" class=""/></td>
                        <td>备案卡编号</td>
                        <td><input id="recordCardNumber" value="${agricultural.recordCardNumber }" type="text" style="width:280px" name="recordCardNumber" class=""/></td>
                      </tr>
                      
                       <tr>    
                        <td>经度</td>
                        <td><input id="aglongitude" value="${agricultural.longitude }" type="text" style="width:280px" name="longitude" class=""/></td>                    
                        <td>纬度</td>
                        <td><input id="aglatitude" value="${agricultural.latitude }" type="text" style="width:280px" name="latitude" class=""/></td>
                      </tr>
                      
                     
                      <tr>
                        <td><b>二、主体业态</b></td>                 
                      </tr>
                      <tr>
                        <td><input type="checkbox" value="流动摊点" name="mainBody">&nbsp&nbsp&nbsp流动摊点</td>
                        <td><input type="checkbox" value="固定摊点" name="mainBody">&nbsp&nbsp&nbsp固定摊点</td>
                        <td><input type="checkbox" value="小食杂店" name="mainBody">&nbsp&nbsp&nbsp小食杂店</td>                        
                        <td><input type="checkbox" value="市场内摊点" name="mainBody">&nbsp&nbsp&nbsp市场内摊点</td>                        
                      </tr>
                      <tr>
                        <td><b>三、经营范围</b></td>                 
                      </tr>
                      <tr>
                        <td><input type="checkbox" value="食品销售 " name="businessScope">&nbsp&nbsp&nbsp食品销售 </td>
                        <td><input type="checkbox" value="餐饮服务" name="businessScope">&nbsp&nbsp&nbsp餐饮服务</td>
                      </tr>
                      
                      
                      <tr>
                        <td><b>四、经营项目</b></td>                 
                      </tr>
                      <tr>
                        <td><input type="checkbox" value="预包装食品销售" name="itemsOfBusiness">&nbsp&nbsp&nbsp预包装食品销售</td>
                        <td><input type="checkbox" value="散装食品销售" name="itemsOfBusiness">&nbsp&nbsp&nbsp散装食品销售</td>
                        <td><input type="checkbox" value="食用农产品销售" name="itemsOfBusiness">&nbsp&nbsp&nbsp食用农产品销售</td> 
                        <td><input type="checkbox" value="热食类食品制售" name="itemsOfBusiness">&nbsp&nbsp&nbsp热食类食品制售</td>                       
                      </tr>
                      <tr>
                        <td><input type="checkbox" value="冷食类食品制售" name="itemsOfBusiness">&nbsp&nbsp&nbsp冷食类食品制售</td>
                        <td><input type="checkbox" value="生食类食品制售" name="itemsOfBusiness">&nbsp&nbsp&nbsp生食类食品制售</td>
                        <td><input type="checkbox" value="糕点类食品制售" name="itemsOfBusiness">&nbsp&nbsp&nbsp糕点类食品制售</td>
                        <td><input type="checkbox" value="自制饮品制售" name=itemsOfBusiness>&nbsp&nbsp&nbsp自制饮品制售</td>
                        <td><input type="checkbox" value="其它" name=itemsOfBusiness>&nbsp&nbsp&nbsp其它</td>
                      </tr>
                      <tr>
                        <td><b>五、相关证照</b></td>                 
                      </tr>
                      <tr>
                        <td style="width:200px;text-align: left">
                             <input type="hidden" name="businessLicense" value="${agricultural.businessLicense }">
                             <input type="file" style="display:none;"  id="businessLicense" onchange="previewImg(this);">
                             <img src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${agricultural.businessLicense }" style="width:150px;display:block" id="businessLicenseImg"/>
                             <input type="button" value="上传营业执照" onclick="uploadImg('businessLicense')">
                        </td>
                        <td style="width:200px;text-align: left">
                             <input type="hidden" name="smallStallregistrationCard" value="${agricultural.smallStallregistrationCard }">
                             <input type="file" style="display:none;"  id="smallStallregistrationCard" onchange="previewImg(this);">
                             <img src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${agricultural.smallStallregistrationCard }" style="width:150px;display:block" id="smallStallregistrationCardImg"/>
                             <input type="button" value="上传小摊点备案卡" onclick="uploadImg('smallStallregistrationCard')">
                        </td>
                        <td style="width:200px;text-align: left">
                             <input type="hidden" name="healthCertificate" value="${agricultural.healthCertificate }">
                             <input type="file" style="display:none;"  id="healthCertificate" onchange="previewImg(this);">
                             <img src="http://lanpubucket1.oss-cn-beijing.aliyuncs.com/${agricultural.healthCertificate }" style="width:150px;display:block" id="healthCertificateImg"/>
                             <input type="button" value="上传健康证" onclick="uploadImg('healthCertificate')">
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2" align="right"><input type="submit" class="btn btn-primary"  width="30px" value="修改"/></td>
                        <td olspan="2"><input type="button" onclick="print()" class="btn btn-primary"  width="50px" value="打印"/></td>      
                      </tr>
                      <tr>
                        <td colspan="4" style="text-align:center"><img alt="" src="${agricultural.QRcode}"></td>
                      </tr>                                            
                   </tbody>
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
        $('#recordDate').datetimepicker({
            container:'#recordDateBox1',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format:'yyyy-mm-dd'
        });
        $('#recordEffectiveDate').datetimepicker({
            container:'#recordEffectiveDateBox2',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format:'yyyy-mm-dd'
        });
      });
      var temp = "";
      function uploadImg(idStr){
           temp = idStr;
           $("#"+idStr).click();
      }
      function previewImg(ele){
          var formData = new FormData();
          formData.append('fileselect',ele.files[0]);    //将文件转成二进制形式
          $.ajax({
              type:"post",
              url:"${pageContext.request.contextPath}/supervisionAndCheck/upload.do",
              async:false,
              contentType: false,    //这个一定要写
              processData: false, //这个也一定要写，不然会报错
              data:formData,
              dataType:'text',    //返回类型，有json，text，HTML。
              success : function(data) {
                  var url = data;
                  $("#"+temp+"Img").attr("src","http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+url);
                  $("input[name='"+temp+"']").val(url);
                }
              });
      }
    </script>
