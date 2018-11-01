/*$(function(){
	var actionname;
	$.ajax({
		url:"http://localhost:8080/tslanpu/ActionServlet",
		data:{},
		type:"post",
		async:"false",
		dataType:"json",
		success:function(jsonData){
			actionname = jsonData.list[0].actionname;
			var htmlStr = "";
			htmlStr += "<label style='text-align: left'>选择权限：</label><br>"
			for(var i = 0; i < jsonData.list.length; i++){
				htmlStr += "<input type='checkbox' name='groupid' value='" + jsonData.list[i].department + "'/>" +
				 			"&nbsp&nbsp" + jsonData.list[i].actionname + "&nbsp&nbsp&nbsp&nbsp&nbsp";
				if((i + 1)%8==0){
					htmlStr += "<br>";
				}
			}
			htmlStr += "<br><br>";
			$("#divAction").append(htmlStr);
		}
	});
});*/