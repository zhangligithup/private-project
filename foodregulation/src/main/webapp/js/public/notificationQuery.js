	
	function _delete(id){
  			if(confirm('确定要删除吗?')){
  				$.ajax({
  	  				url:"${pageContext.request.contextPath }/NotificationDeleteServlet",
  	  				data:{id:id},
  	  				type:"post",
  	  				async:false,
  	  				dataType:"JSON",
  	  				success: function(jsonData){
  	  					if(jsonData == 1){
  	  						
  	  						var type = $("#selectId").val();
  	  						_myonclick(0, type);
  	  						alert("删除成功！");
  	  					}else{
  	  						//alert("删除失败！")
  	  					}
  	  				}
  	  			});
  				return true;
  			}
  	}


	function queryInfor(id){
		$("#id").attr("value",id);
		$("#formValidate").submit();
	}
	

	function myonchange(){
        var type = $("#selectId").val();
  		_myonclick(1, type);
  	}
	
	
	var pageCode; //当前页
  	var datas;    //查询到数据的list集合
  	var totalRecord; //总记录数
  	var url;
  	var totalPage;   //总页数
	function _myonclick(page, type){
		var pc;
  		var dt;
  		var tr;
  		var ur;
  		var tp;
        	 var url = "${pageContext.request.contextPath }/NotificationQueryServlet";
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
     			data:{pageCode:page, type:type},
     			type: "POST",
     	        async: false,
     	        dataType:"JSON",
     	        success: function(jsonData) {
     				tp = jsonData.pb.totalPage;//总页数
      				pc = jsonData.pb.pageCode; //当前页码
      				dt = jsonData.pb.datas;
      				tr = jsonData.pb.totalRecord;
      				ur = jsonData.pb.url;
     				var htmlStr = "<tr><td colspan='2'><b></b></td><td colspan='2' align='right'><a href='${pageContext.request.contextPath }/pages/index.jsp'>返回</a></td></tr>";
     				var htmlPc = "";
     				
     	  			for(var i = 0; i < jsonData.pb.datas.length;){
     	  						
     		  					htmlStr +="<td>" + ((pc-1)*10 + i+1) + "</td>"
     		  							 +"<td><a href='javascript:void' onclick='queryInfor(" +  jsonData.pb.datas[i].id  + ")'>" + jsonData.pb.datas[i].title + "</a></td>"
     		  					         +"<td>[" + jsonData.pb.datas[i].time + "]</td>"
     		  					      +"<td align='left' class='hui oprate_con'>"
  									 +	"<a href='javascript:void(0);'  onclick=' _delete(" + jsonData.pb.datas[i].id + ");' class='blue'>删除</a></td>"
     								
     		  					htmlStr +="</tr>"
     		  					i += 1;
     	  			}
     				htmlStr +="<tr><td colspan='6'>总数	:	"+ tr +"</td></tr>"
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
		 var type = $("#selectId").val();
		_myonclick(0, type);
		
	});
	
	//首页
    function GoToFirstPage(){
    	 var type = $("#selectId").val();
  		_myonclick(1, type);
    }
    //前一页
    function GoToPrePage(){
    	var type = $("#selectId").val();
       pageCode -= 1;
       pageCode = pageCode >= 1 ? pageCode : 1;
 		_myonclick(pageCode, type);
    }
    //后一页
    function GoToNextPage(){
    	var type = $("#selectId").val();
    	pageCode += 1;
    	pageCode = pageCode <totalPage ? pageCode : totalPage;
 		_myonclick(pageCode, type);
    }
    //尾页
    function GoToEndPage(){
    	var type = $("#selectId").val();
 		_myonclick(totalPage, type);
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
            	var type = $("#selectId").val();
         		_myonclick(page, type);
            }
        }
    }