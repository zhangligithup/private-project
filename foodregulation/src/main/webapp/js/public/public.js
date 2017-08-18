
function _submit(){
	var val = $("#department").val();
	var add = $("#address").val();
	var qyname = $("#qyname").val();
	var zzcode = $("#zzcode").val();
	var fddelegate = $("#fddelegate").val();
	if(qyname.trim() == ""){
		alert("请填写企业名称");
		return false;
	}else if(add == 0){
		alert("请选择行政区域");
		return false;
	}else if(fddelegate.trim() == ""){
		alert("请填写法定代表人");
		return false;
	}else if(zzcode.trim() == ""){
		alert("请填写注册号");
		return false;
	}else if(val == 0){
		alert("请选择监管单位");
		return false;
	}else{
		return true;
	}
}

function sumbit_sure(id){
	
	var val = $("#department").val();
	var add = $("#address").val();
	var qyname = $("#qyname").val();
	var zzcode = $("#zzcode").val();
	var fddelegate = $("#fddelegate").val();
	if(qyname.trim() == ""){
		alert("请填写企业名称");
		return false;
	}else if(add == 0){
		alert("请选择行政区域");
		return false;
	}else if(fddelegate.trim() == ""){
		alert("请填写法定代表人");
		return false;
	}else if(zzcode.trim() == ""){
		alert("请填写注册号");
		return false;
	}else if(val == 0){
		alert("请选择监管单位");
		return false;
	}else{
		var sub = confirm("确定要修改吗？");
   		if(sub == true){
   			return true;
   		}else{
   			return false;
   		}
	}
}

//根据地址转换成经纬度
function searchAddress(longitude,latitude){
    var address = $.trim($('#scaddress').val());
    if (address != undefined && address != '') {
        var url = 'http://api.map.baidu.com/geocoder/v2/?ak=gDeQq7ugvRsGL9L4GoqVkKzTIxWscPmk&output=json&address=' + encodeURIComponent(address);
       //根据地点名称获取经纬度信息
       $.ajax({
          type: 'POST',
          url: url,
           dataType: 'JSONP',
           success: function (data) {
               if (parseInt(data.status) == 0) {
                   $('#'+longitude).val(data.result.location.lng);
                   $('#'+latitude).val(data.result.location.lat);
               }
           }
       });
    }
}