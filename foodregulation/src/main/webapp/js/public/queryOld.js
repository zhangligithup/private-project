	
	//提交到详细信息页面
	function onclick1(id){
		
  			var category = $("#category").val();
  			if(category == "食品流通企业" ){
  				$("#id").attr("value",id);
  				$("#formValidate").submit();
  			}else if(category == "食品餐饮企业"){
  				$("#idF").attr("value",id);
  				$("#formFood").submit();
  			}else if(category == "食品生产企业"){
  				$("#idP").attr("value",id);
  				$("#formPro").submit();
  			}else if(category == "保健食品销售企业"){
  	  			$("#idH").attr("value",id);
  	  			$("#formHealth").submit();
  			}else if(category == "医疗器械销售企业"){
  	  			$("#idM").attr("value",id);
  	  			$("#formMedical").submit();
  			}else if(category == "酒类销售企业"){
  	  			$("#idW").attr("value",id);
  	  			$("#formWine").submit();
  			}else if(category == "药品零售企业"){
  	  			$("#idD").attr("value",id);
  	  			$("#formDrug").submit();
  			}else if(category == "化妆品销售企业"){
  	  			$("#idC").attr("value",id);
  	  			$("#formCosmetic").submit();
  			}else if(category == "医疗器械使用企业"){
  	  			$("#idU").attr("value",id);
  	  			$("#formUsemed").submit();
  			}
  	}
	
	//查看详细信息及修改后返回到查询页面
	$(function(){
		var name = $("#name").val();	//企业名称
  		var category = $("#category").val();	//企业类别
  		var address = $("#address").val();		//企业地址
  		var department = $("#department").val();//监管单位
  		var fddelegate = $("#fddelegate").val();//法定代表人
  		var zzcode = $("#zzcode").val();		//注册号统一社会信用代码
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	});
	
	//法定代表人
	function fddelegateShow(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	}
	
	//注册号统一社会信用代码
	function zzcodeShow(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	}
	
	//企业名称
	function showValue(){
		//setTimeout("_myonclick(1)", 3000);
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	}
	
	//企业类别
	function _category(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	}
	
	//监管单位
	function _address(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	}
	
	//企业地址
	function _department(){
		var name = $("#name").val();
  		var category = $("#category").val();
  		var address = $("#address").val();
  		var department = $("#department").val();
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();			//当前所属的监管单位
  		
  		if(name != null){
  			_myonclick(0, name, category, address, department, fddelegate, zzcode, depart);
  		}
	}
	
	//翻译全局变量
    var pageCode; //当前页
  	var datas;    //查询到数据的list集合
  	var totalRecord; //总记录数
  	var url;
  	var totalPage;   //总页数
  	
  	function _myonclick(page, name, category, address, department, fddelegate, zzcode, depart){
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
  			data:{pageCode:page, name:name, category:category, address:address, department:department, fddelegate:fddelegate, zzcode:zzcode,depart:depart},
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
  				
  			//需要改变
  				if(category == "食品生产企业"){
  						if(jsonData.pb.datas.length == 0){
  							htmlStr = "";
  							htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/ProductionFormServlet'>" +
  									   "现在去添加</a></b></td></tr>";
  						}else{
  							var htmlStr = "";
  		  					htmlStr += "<tr><td colspan='6'><b>一、食品生产企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
	  					$("table").html(htmlStr);
  					
  				}else if(category == "食品流通企业"){
  						
  						if(jsonData.pb.datas.length == 0){
							htmlStr = "";
							htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/CriculateFormServlet'>" +
									   "现在去添加</a></b></td></tr>";
						}else{
							var htmlStr = "";
							htmlStr += "<tr><td colspan='6'><b>一、食品流通企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
								"<th width='18%' align='left'>企业名称</th>" +
								"<th width='18%' align='left'>监管单位</th>" +
								"<th width='18%' align='left'>企业地址</th>" + 
								"<th width='18%' align='left'>法定代表人</th>" + 
								"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
						for(var i = 0; i < jsonData.pb.datas.length;){
								htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
								htmlStr +=
									  	"<td>" + ((pc-1)*10 + i+1) + "</td>"
									  	+"<td>" + jsonData.pb.datas[i].qyname + "</td>"
									  	+"<td>" + jsonData.pb.datas[i].department + "</td>"
									  	+"<td>" + jsonData.pb.datas[i].address + "</td>"
									  	+"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
									  	+"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
									  	htmlStr +="</tr>"
									  		i += 1;
							}
						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
  						$("table").html(htmlStr);
	
  				}else if(category == "食品餐饮企业"){
  					
	  					if(jsonData.pb.datas.length == 0){
							htmlStr = "";
							htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/FoodFormServlet'>" +
									   "现在去添加</a></b></td></tr>";
						}else{
							var htmlStr = "";
							htmlStr += "<tr><td colspan='6'><b>一、食品餐饮企业信用档案</b></td></tr>"
							htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
							"<th width='18%' align='left'>企业名称</th>" +
							"<th width='18%' align='left'>监管单位</th>" +
							"<th width='18%' align='left'>企业地址</th>" + 
							"<th width='18%' align='left'>法定代表人</th>" + 
							"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
					for(var i = 0; i < jsonData.pb.datas.length;){
							htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
							htmlStr +=
								  	"<td>" + ((pc-1)*10 + i+1) + "</td>"
								  	+"<td>" + jsonData.pb.datas[i].qyname + "</td>"
								  	+"<td>" + jsonData.pb.datas[i].department + "</td>"
								  	+"<td>" + jsonData.pb.datas[i].address + "</td>"
								  	+"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
								  	+"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
								  	htmlStr +="</tr>"
								  		i += 1;
						}
					}
						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
						$("table").html(htmlStr);
  				}else if(category == "保健食品销售企业"){
  					
  					if(jsonData.pb.datas.length == 0){
						htmlStr = "";
						htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/health/health.jsp'>" +
								   "现在去添加</a></b></td></tr>";
					}else{
						var htmlStr = "";
						htmlStr += "<tr><td colspan='6'><b>一、保健食品经营企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
	  					$("table").html(htmlStr);
  						
				}else if(category == "医疗器械销售企业"){
  					
  					if(jsonData.pb.datas.length == 0){
						htmlStr = "";
						htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/medical/medical.jsp'>" +
								   "现在去添加</a></b></td></tr>";
					}else{
						var htmlStr = "";
						htmlStr += "<tr><td colspan='6'><b>一、医疗器械销售企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
	  					$("table").html(htmlStr);
  						
				}else if(category == "酒类销售企业"){
  					
  					if(jsonData.pb.datas.length == 0){
						htmlStr = "";
						htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/wine/wine.jsp'>" +
								   "现在去添加</a></b></td></tr>";
					}else{
						var htmlStr = "";
						htmlStr += "<tr><td colspan='6'><b>一、酒类销售企业备案登记表</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
	  					$("table").html(htmlStr);
				}else if(category == "药品零售企业"){
  					
  					if(jsonData.pb.datas.length == 0){
						htmlStr = "";
						htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/drug/drug.jsp'>" +
								   "现在去添加</a></b></td></tr>";
					}else{
						var htmlStr = "";
						htmlStr += "<tr><td colspan='6'><b>一、药品零售企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
	  					$("table").html(htmlStr);
				}else if(category == "化妆品销售企业"){
  					
  					if(jsonData.pb.datas.length == 0){
						htmlStr = "";
						htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/cosmetic/cosmetic.jsp'>" +
								   "现在去添加</a></b></td></tr>";
					}else{
						var htmlStr = "";
						htmlStr += "<tr><td colspan='6'><b>一、化妆品经营企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
	  					$("table").html(htmlStr);
				}else if(category == "医疗器械使用企业"){
  					
  					if(jsonData.pb.datas.length == 0){
						htmlStr = "";
						htmlStr += "<tr align='center'><td><b>您查找的信息为空<a href='${pageContext.request.contextPath }/pages/tables/usemed/usemed.jsp'>" +
								   "现在去添加</a></b></td></tr>";
					}else{
						var htmlStr = "";
						htmlStr += "<tr><td colspan='6'><b>一、医疗器械使用企业信用档案</b></td></tr>"
  		  					htmlStr += "<tr>" + "<th width='10%' align='left'>序号</th>" + 
  		  											"<th width='18%' align='left'>企业名称</th>" +
  		  											"<th width='18%' align='left'>监管单位</th>" +
  		  											"<th width='18%' align='left'>企业地址</th>" + 
  		  											"<th width='18%' align='left'>法定代表人</th>" + 
  		  											"<th width='18%' align='left'>注册号/统一社会信用代码</th></tr>"
	  		  				for(var i = 0; i < jsonData.pb.datas.length;){
	  		  					htmlStr += "<tr onclick='onclick1(" +  jsonData.pb.datas[i].id  + ")' style='cursor:pointer;'>";
	  		  					htmlStr +=
	  		  							  "<td>" + ((pc-1)*10 + i+1) + "</td>"
	  		  							 +"<td>" + jsonData.pb.datas[i].qyname + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].address + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].fddelegate + "</td>"
	  		  					         +"<td>" + jsonData.pb.datas[i].zzcode + "</td>"
	  		  					htmlStr +="</tr>"
	  		  					i += 1;
	  		  				}
  						}
  						htmlStr +="<tr><td colspan='6'>企业总数	:	"+ tr +"</td></tr>"
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
  		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();
  		
  		_myonclick(1,name, category, address, department, fddelegate, zzcode,depart);
    }
    //前一页
    function GoToPrePage(){
       pageCode -= 1;
       pageCode = pageCode >= 1 ? pageCode : 1;
       var name = $("#name").val();
 		var category = $("#category").val();
 		var address = $("#address").val();
 		var department = $("#department").val();
 		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();
 		
 		_myonclick(pageCode,name, category, address, department, fddelegate, zzcode,depart);
    }
    //后一页
    function GoToNextPage(){
    	pageCode += 1;
    	pageCode = pageCode <totalPage ? pageCode : totalPage
    	var name = $("#name").val();
 		var category = $("#category").val();
 		var address = $("#address").val();
 		var department = $("#department").val();
 		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();
 		
 		_myonclick(pageCode,name, category, address, department, fddelegate, zzcode,depart);
    }
    //尾页
    function GoToEndPage(){
    	var name = $("#name").val();
 		var category = $("#category").val();
 		var address = $("#address").val();
 		var department = $("#department").val();
 		var fddelegate = $("#fddelegate").val();
  		var zzcode = $("#zzcode").val();
  		var depart = $("#depart").val();
 		
 		_myonclick(totalPage,name, category, address, department, fddelegate, zzcode,depart);
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
         		var fddelegate = $("#fddelegate").val();
          		var zzcode = $("#zzcode").val();
          		var depart = $("#depart").val();
         		
         		_myonclick(page,name, category, address, department, fddelegate, zzcode,depart);
            }
        }
    }