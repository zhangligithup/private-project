	
	function _delete(id){
  			if(confirm('确定要删除吗?')){
  				$.ajax({
  	  				url:"${pageContext.request.contextPath }/UserDeleteServlet",
  	  				data:{id:id},
  	  				type:"post",
  	  				async:false,
  	  				dataType:"JSON",
  	  				success: function(jsonData){
  	  					if(jsonData == 1){
  	  						
  	  						var queryQyName = $("#queryQyName").val();
  	  						var department = $("#selectId").val();
  	  						_myonclick(0,queryQyName, department);
  	  						alert("删除成功！");
  	  					}else{
  	  						//alert("删除失败！")
  	  					}
  	  				}
  	  			});
  				return true;
  			}
  	}
	
	//初始化密码
	function _initialize(id){
		if(confirm('确定要初始化密码？')){
			$.ajax({
				url:"${pageContext.request.contextPath }/UserInitializeServlet",
				data:{id:id},
				type:"post",
				async:false,
				success: function(jsonData){
						alert(jsonData);
				}
			});
			return true;
		}
	}

	function myonchange(){
		var queryQyName = $("#queryQyName").val();
        var department = $("#selectId").val();
  		_myonclick(1,queryQyName, department);
  	}
	
	function _onclick(){
  		 var queryQyName = $("#queryQyName").val();
  		 var department = $("#selectId").val();
   		_myonclick(1,queryQyName, department);
  	}
	
	var pageCode; //当前页
  	var datas;    //查询到数据的list集合
  	var totalRecord; //总记录数
  	var url;
  	var totalPage;   //总页数
	function _myonclick(page, queryQyName, department){
		var pc;
  		var dt;
  		var tr;
  		var ur;
  		var tp;
         if($.trim(queryQyName) == "" && department == ""){
        	 var url = "${pageContext.request.contextPath }/UserFindServlet";
         }else{
        	 var url = "${pageContext.request.contextPath }/UserNameServlet";
         }
         //保留当前页码，用于查看信息及删除后返回当前页面
         if(page != 0){
   			$("#page").attr("value",page);
   		 }
   		 if(page == 0){
   			 var pageC = $("#page").val();
   			 page = pageC;
   		 }
        	 $.ajax({
     			url:url,
     			data:{pageCode:page,queryQyName:queryQyName,department:department},
     			type: "POST",
     	        async: false,
     	        dataType:"JSON",
     	        success: function(jsonData) {
     				tp = jsonData.pb.totalPage;//总页数
      				pc = jsonData.pb.pageCode; //当前页码
      				dt = jsonData.pb.datas;
      				tr = jsonData.pb.totalRecord;
      				ur = jsonData.pb.url;
     				var htmlStr = "";
     				var htmlPc = "";
     				htmlStr += "<tr><td colspan='7'><b>一、食品安全监管人员信息</b></td></tr>"
     	  					htmlStr += "<tr>"+ "<th width='5%' align='left'>序号</th>" + "<th width='15%' align='left'>姓名</th>" + "<th width='20%' align='left'>单位</th>" +
     	  							"<th width='15%' align='left'>职务</th>" + "<th width='16%' align='left'>办公电话</th>" + "<th width='15s%' align='left'>移动电话</th>"
     	  							+ "<th width='20%' align='center'>操作</th>" +	"</tr>"
     	  			for(var i = 0; i < jsonData.pb.datas.length;){
     		  					htmlStr += "<tr>";
     		  					htmlStr +="<td>" + ((pc-1)*10 + i+1) + "</td>"
     		  							 +"<td>" + jsonData.pb.datas[i].name + "</td>"
     		  					         +"<td>" + jsonData.pb.datas[i].department + "</td>"
     		  					         +"<td>" + jsonData.pb.datas[i].role + "</td>"
     		  					         +"<td>" + jsonData.pb.datas[i].phone + "</td>"
     		  					         +"<td>" + jsonData.pb.datas[i].tel + "</td>"
     		  					         +"<td align='left' class='hui oprate_con'>"
     									 +	"<a href='javascript:void(0);'  onclick='+operate(" + jsonData.pb.datas[i].id + ");' class='blue'>编辑</a>|"
     									 +	"<a href='javascript:void(0);'  onclick=' _delete(" + jsonData.pb.datas[i].id + ");' class='blue'>删除</a>|"
     									 +	"<a href='javascript:void(0);'  onclick=' _initialize(" + jsonData.pb.datas[i].id + ");' class='blue'>初始化密码</a></td>"
     								
     		  					htmlStr +="</tr>"
     		  					i += 1;
     	  			}
     				htmlStr +="<tr><td colspan='6'>人员总数	:	"+ tr +"</td></tr>"
     	  			$("table").html(htmlStr);
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
	
	$(function(){
		var queryQyName = $("#queryQyName").val();
        var department = $("#selectId").val();
		_myonclick(0,queryQyName, department);
		
	});
	
	//首页
    function GoToFirstPage(){
    	 var queryQyName = $("#queryQyName").val();
         var department = $("#selectId").val();
  		_myonclick(1,queryQyName, department);
    }
    //前一页
    function GoToPrePage(){
       pageCode -= 1;
       pageCode = pageCode >= 1 ? pageCode : 1;
       var queryQyName = $("#queryQyName").val();
       var department = $("#selectId").val();
 		_myonclick(pageCode,queryQyName,department);
    }
    //后一页
    function GoToNextPage(){
    	pageCode += 1;
    	pageCode = pageCode <totalPage ? pageCode : totalPage;
    	var queryQyName = $("#queryQyName").val();
        var department = $("#selectId").val();
 		_myonclick(pageCode,queryQyName, department);
    }
    //尾页
    function GoToEndPage(){
    	 var queryQyName = $("#queryQyName").val();
         var department = $("#selectId").val();
 		_myonclick(totalPage,queryQyName,department);
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
            	 var queryQyName = $("#queryQyName").val();
                 var department = $("#selectId").val();
         		_myonclick(page,queryQyName, department);
            }
        }
    }