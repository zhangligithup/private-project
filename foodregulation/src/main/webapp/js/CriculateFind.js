	
	//提交到详细信息页面
	function onclick1(id){
		
  			var category = $("#category").val();
  			if(category == "流通企业" ){
  				$("#id").attr("value",id);
  				$("#formValidate").submit();
  			}else if(category == "餐饮企业"){
  				$("#idF").attr("value",id);
  				$("#formFood").submit();
  			}else if(category == "生产企业"){
  				$("#idP").attr("value",id);
  				$("#formPro").submit();
  			}else{
  				
  			}
  	}
	
	//查看详细信息及修改后返回到查询页面
	$(function(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		_myonclick(0, name, category, address, department);
	});
	
	
	function showValue(){
		//setTimeout("_myonclick(1)", 3000);
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
		_myonclick(1, name, category, address, department);
	}
	
	function _category(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		_myonclick(1,name, category, address, department);
	}
	
	function _address(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		_myonclick(1,name, category, address, department);
	}
	
	function _department(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		_myonclick(1,name, category, address, department);
	}
	
	//翻译全局变量
    var pageCode; //当前页
  	var datas;    //查询到数据的list集合
  	var totalRecord; //总记录数
  	var url;
  	var totalPage;   //总页数
  	
  	function _myonclick(page, name, category, address, department){
  		var pc;
  		var dt;
  		var tr;
  		var ur;
  		var tp;
  		if(page != 0){
  			$("#page").attr("value",page);
  		}
  		if(page == 0){
  			var pageC = $("#page").val();
  			page = pageC;
  		}
  		$.ajax({
  			url:"${pageContext.request.contextPath }/QueryServlet",
  			data:{pageCode:page, name:name, category:category, address:address, department:department},
  			async:false,
  			type:"post",
  			dataType:"JSON",
  			success:function(jsonData){
  				tp = jsonData.pb.totalPage;//总页数
  				pc = jsonData.pb.pageCode; //当前页码
  				dt = jsonData.pb.datas;
  				tr = jsonData.pb.totalRecord;
  				ur = jsonData.pb.url;
  				var htmlPc = "";
  				
  				if(category == "生产企业"){
  						if(jsonData.pb.datas.length == 0){
  							htmlStr = "";
  							htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/production.jsp'>" +
  									   "现在去添加</a></b></td></tr>";
  						}else{
  							var htmlStr = "";
  		  					htmlStr += "<tr><td><b>一、食品生产企业基本情况</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='30%' align='left'>企业名称</th>" + "<th width='25%' align='left'>企业责任人</th>" +
  		  							"<th width='30%' align='left'>企业地址</th>" + "<th width='15%' align='left'>联系电话</th>" +
  		  								"</tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +="<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].qydelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].phone + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
	  					
	  					$("table").html(htmlStr);
  					
  				}else if(category == "流通企业"){
  						
  						if(jsonData.pb.datas.length == 0){
							htmlStr = "";
							htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/criculate.jsp'>" +
									   "现在去添加</a></b></td></tr>";
						}else{
							var htmlStr = "";
		  					htmlStr += "<tr><td><b>一、餐饮服务经营户基本情况</b></td></tr>"
		  					htmlStr += "<tr>" + "<th width='30%' align='left'>企业名称</th>" + "<th width='25%' align='left'>企业代码</th>" +
		  							"<th width='30%' align='left'>经营场所</th>" + "<th width='15%' align='left'>联系电话</th>" +
		  								"</tr>"
			  				for(var i = 0; i < jsonData.pb.datas.length;){
			  					htmlStr += "<tr style='cursor:pointer;' onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")'>";
			  					htmlStr +="<td>" + jsonData.pb.datas[i].qyname + "</td>"
			  					         +"<td>" + jsonData.pb.datas[i].qycode + "</td>"
			  					         +"<td>" + jsonData.pb.datas[i].jyaddress + "</td>"
			  					         +"<td>" + jsonData.pb.datas[i].phone + "</td>"
			  					htmlStr +="</tr>"
			  					i += 1;
			  				}
						}
	  					
	  					$("table").html(htmlStr);
  				}else if(category == "餐饮企业"){
  					
	  					if(jsonData.pb.datas.length == 0){
							htmlStr = "";
							htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/food.jsp'>" +
									   "现在去添加</a></b></td></tr>";
						}else{
							var htmlStr = "";
		  					htmlStr += "<tr><td><b>一、餐饮服务经营户基本情况</b></td></tr>"
		  					htmlStr += "<tr>" + "<th width='30%' align='left'>企业名称</th>" + "<th width='25%' align='left'>企业代码</th>" +
		  							"<th width='30%' align='left'>经营场所</th>" + "<th width='15%' align='left'>联系电话</th>" +
		  								"</tr>"
			  				for(var i = 0; i < jsonData.pb.datas.length;){
			  					htmlStr += "<tr style='cursor:pointer;' onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")'>";
			  					htmlStr +="<td>" + jsonData.pb.datas[i].qyname + "</td>"
			  					         +"<td>" + jsonData.pb.datas[i].qycode + "</td>"
			  					         +"<td>" + jsonData.pb.datas[i].jyaddress + "</td>"
			  					         +"<td>" + jsonData.pb.datas[i].phone + "</td>"
			  					htmlStr +="</tr>"
			  					i += 1;
			  				}
						}
	  					
	  					$("table").html(htmlStr);
  				}
  					
  					 htmlPc += "第" + pc + "页/共" + tp +　"页"
  					 htmlPc += "<a href='javascript:void' onclick='GoToFirstPage()' id='aFirstPage' >首页</a>"
  					 htmlPc += "<c:if test='${pb.pageCode > 1}'><a href='javascript:void' onclick='GoToPrePage()' id='aPrePage' >上一页</a></c:if>"
  					 htmlPc += "<a href='javascript:void' onclick='GoToNextPage()' id='aNextPage'>下一页</a>"
  					 htmlPc += "<a href='javascript:void' onclick='GoToEndPage()' id='aEndPage' >尾    页</a>"
  					 htmlPc += "<input width='20px' type='text' /><input type='button'  value='跳转' onclick='GoToAppointPage(this)'/> ";
  					 $("#pageCode").html(htmlPc);
  			}
  		});
  		pageCode = pc; //当前页码
  		datas = dt;		
  		totalRecord = tr;//总记录数
  		url = ur;//当前url
  		totalPage = tp;//总页数
  	}
  	
  	
    //首页
    function GoToFirstPage(){
    	var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		_myonclick(1,name, category, address, department);
    }
    //前一页
    function GoToPrePage(){
       pageCode -= 1;
       pageCode = pageCode >= 1 ? pageCode : 1;
       var name = $("#name").val();
 		var category = $("#category").val();
 		var address = $("#address").val();
 		var department = $("#department").val();
 		_myonclick(pageCode,name, category, address, department);
    }
    //后一页
    function GoToNextPage(){
    	pageCode += 1;
    	pageCode = pageCode <totalPage ? pageCode : totalPage
    	var name = $("#name").val();
 		var category = $("#category").val();
 		var address = $("#address").val();
 		var department = $("#department").val();
 		_myonclick(pageCode,name, category, address, department);
    }
    //尾页
    function GoToEndPage(){
    	var name = $("#name").val();
 		var category = $("#category").val();
 		var address = $("#address").val();
 		var department = $("#department").val();
 		_myonclick(totalPage,name, category, address, department);
    }
    //跳转
    function GoToAppointPage(e){
        var page = $(e).prev().val();
        if (isNaN(page)){
            alert("请输入数字!");
        }
        else{
            page = parseInt(page);
            if (page <= 0 || page > totalPage){
                alert("请输入有效的页面范围!");
            }
            else{
            	var name = $("#name").val();
         		var category = $("#category").val();
         		var address = $("#address").val();
         		var department = $("#department").val();
         		_myonclick(page,name, category, address, department);
            }
        }
    }
