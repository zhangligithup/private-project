/**
 * Created by monica on 2016/11/8.
 */

//首页折叠菜单的添加class
$(function(){
    $('#accordion a[data-toggle="collapse"]').on('click',function(){

        $('#accordion a[data-toggle="collapse"]').removeClass('father_hover').parent().removeClass('father_lihover');
        $(this).addClass('father_hover').parent().addClass('father_lihover');
    });
});

//首页table标签页面的js效果
var aHistoryMinTab=[];
var oActiveTab=null;
function findInArr(arr,num){
    for(var i=0; i<arr.length; i++){
        if(arr[i]==num){
            return true;
        }
    }
    return false;
}
$(document).ready(function(){
    //每次点击的时候存储当前活动页面
    $('#myTab').on('shown.bs.tab','a',function(e){
        oActiveTab= $(e.target);
    });
//三级标签上面的关闭按钮点击关闭该标签同时移除对应的div
    $('#myTab').on('click','span',function(){
        var oPrevA=$(this).prev();
        var oDivId=$(this).prev().attr('href');
        $.each(aHistoryMinTab,function(index,item){// index是索引值（即下标）   item是每次遍历得到的值；
            var str = "#div-"+item;
            if(str==oPrevA.attr("href")){
                aHistoryMinTab.splice(index,1);
            }
        });
        $(this).parent().remove();
        $(oDivId).remove();
        //判断关闭标签是不是当前活动标签如果是让第一个显示
        if(oActiveTab){
            if(oPrevA.get(0)==oActiveTab.get(0)){
                $('#myTab li:last() a').tab('show');
            }
        }
    });
});
//打开新标签
function creatTabPage(id,url){
    if(findInArr(aHistoryMinTab,id)){  //二级页面的菜单点击打开新标签。判断标签是不是已经打开
        $('a[href="#div-'+id+'"]').tab('show');
        return;
    }else{
        aHistoryMinTab.push(id);//添加历史记录
        var oLi= $('<li class="active"><b class="nav_bg_left"></b><a href="#div-'+id+'" data-toggle="tab">'+$('#li-'+id).text()+'</a><span  class="module_span_close">X</span><b class="nav_bg_right"></b></li>');
        var oDiv=$('<div class="tab-pane fade in active " id="div-'+id+'">'+'</div>');
        oLi.appendTo('#myTab');
        oDiv.appendTo('#myTabContent');
        oLi.siblings().removeClass('active');
        oDiv.siblings().removeClass('in active');
        oActiveTab=oLi.children('a');
        $.get(url,function(data){
            $("#div-"+id).html(data);
        });

    }
}

// 1成功 2失败 3忙碌 4 加载
function alertEase(msg,type){
    var oWin=window.top?window.top:window;
    var oDiv=document.createElement("div");
    oDiv.className='creatAlert_box';
    oWin.document.body.appendChild(oDiv);

    var type=type||1;
    var width=300;
    var height=90;
    var fade=500;
    var showTime=2000;

    var oContentBox=document.createElement("div");
    oDiv.appendChild(oContentBox);
    var msg_type='';
    switch(type){
        case 1:
            msg_type='alert_succ';
            break;
        case 2:
            msg_type='alert_err';
            break;
        case 3:
            msg_type='alert_busy';
            break;
        case 4:
            msg_type='alert_loading';
            break;
    }

    $(oContentBox).css({
        'width':width,
        'margin-left':-(width/2+30),
        'margin-top':-height,
        'opacity':1
    })
    $(oContentBox).addClass('creatAlert '+msg_type);
    $(oContentBox).html('<span>'+msg+'</span>');

    setTimeout(function(){
    	 $(oDiv).remove();
    },showTime);

}

//信息确认框
function confirmMessage(id,msg,options){
    var oWin=window.top?window.top:window;
    var oDiv=document.createElement("div");
    oDiv.id=id;
    oDiv.className='creatAlert_box';
    oWin.document.body.appendChild(oDiv);
    var options=options||{};
    options.width=options.width||300;
    options.height=options.height||130;
    options.fade=options.fade||500;

    var oContentBox=document.createElement("div");
    oDiv.appendChild(oContentBox);

    $(oContentBox).css({
        'width':options.width,
        'height':options.height,
        'margin-left':-options.width/2,
        'margin-top':-options.height
    })
    $(oContentBox).addClass('confirmContent');
    $(oContentBox).html(msg+'<div class="confirm_footer"><a class="confirm_sure" href="javascript:;" id="confirm_ok">确定</a><a class="confirm_cancel" href="javascript:;" id="confirm_cancel">取消</a></div>');
    $(oContentBox).animate({opacity:1},options.fade,function(){
        var oConfirmCancel=oWin.document.getElementById('confirm_cancel');
        var oConfirmOk=oWin.document.getElementById('confirm_ok');

        $(oConfirmCancel).on('click',function(){
        	$(oDiv).remove();
        });
        $(oConfirmOk).on('click',function(){
        	$(oDiv).remove();
            options.sure&&options.sure();
        });

    });
}
function confirmMessage2(id,msg,options){
    var oWin=window.top?window.top:window;
    var oDiv=document.createElement("div");
    oDiv.id=id;
    oDiv.className='creatAlert_box';
    oWin.document.body.appendChild(oDiv);
    var options=options||{};
    options.width=options.width||300;
    options.height=options.height||130;
    options.fade=options.fade||500;

    var oContentBox=document.createElement("div");
    oDiv.appendChild(oContentBox);

    $(oContentBox).css({
        'width':options.width,
        'height':options.height,
        'margin-left':-options.width/2,
        'margin-top':-options.height
    })
    $(oContentBox).addClass('confirmContent');
    $(oContentBox).html(msg+'<div class="confirm_footer"><a class="confirm_sure" href="javascript:;" id="confirm_ok" style="margin-right:0">确定</a></div>');
    $(oContentBox).animate({opacity:1},options.fade,function(){
        var oConfirmCancel=oWin.document.getElementById('confirm_cancel');
        var oConfirmOk=oWin.document.getElementById('confirm_ok');

        $(oConfirmCancel).on('click',function(){
        	$(oDiv).remove();
        });
        $(oConfirmOk).on('click',function(){
        	$(oDiv).remove();
            options.sure&&options.sure();
        });

    });
}
//分页
function page(divId,totalCount,showPage,limit,callBackTemp){
	$('#'+divId).css("text-align","center");
	
	$('#'+divId).html('<div class="page" style="display:inline-block;padding-top:4px"></div>'
            +'<div class="query-refooter" style="display:inline-block;margin-bottom:4px">' 
            //+'<div class="pull-right"><a href="javascript:void(0)" class="ref-t">跳转</a></div>'
            +'<div class="ref-s"><span>共'+Math.ceil(totalCount/limit)+'页</span><span>'+totalCount+'条</span></div></div>');
	$('#'+divId+' :input').on("keyup",function (){
		this.value=this.value.replace(/[^\d]/g,'');
	});
	$('#'+divId+' .ref-t').on("click",function (){
		var num = $('#'+divId+' :input').val();
		if(num){
			if(num>Math.ceil(totalCount/limit)||num<1){
				return false;
			}
		}else{
			return false;
		}
		callBackTemp(this.value, limit, totalCount);
	});
	$('#'+divId+' .page').extendPagination({
		totalCount : totalCount,
		showPage : showPage,
		limit : limit,
		callback : function(curr, limit, totalCount) {
			callBackTemp(curr);
		}
	});
}


/*
 序列化表单数据到JSON对象
 */
(function($){
    $.fn.serializeJson=function(){
        var serializeObj={};
        var array=this.serializeArray();
        var str=this.serialize();
        $(array).each(function(){
            if(serializeObj[this.name]){
                if($.isArray(serializeObj[this.name])){
                    serializeObj[this.name].push(this.value);
                }else{
                    serializeObj[this.name]=[serializeObj[this.name],this.value];
                }
            }else{
                serializeObj[this.name]=this.value;
            }
        });
        return serializeObj;
    };
    $.fn.setForm = function(jsonValue) {
        var obj=this;
        $.each(jsonValue, function (name, ival) {
            var $oinput = obj.find("input[name=" + name + "]");
                if ($oinput.attr("type")== "radio" || $oinput.attr("type")== "checkbox"){
                $oinput.each(function(){
                    if(Object.prototype.toString.apply(ival) == '[object Array]'){//是复选框，并且是数组
                        for(var i=0;i<ival.length;i++){
                            if($(this).val()==ival[i])
                                $(this).attr("checked", "checked");
                        }
                    }else{
                        if($(this).val()==ival)
                            $(this).attr("checked", "checked");
                    }
                });
            }else if($oinput.attr("type")== "textarea"){//多行文本框
                obj.find("[name="+name+"]").html(ival);
            }else{
                obj.find("[name='"+name+"']").val(ival);
            }
        });
    };
})(jQuery);

/**
 * js获取当前日期 例如：2016-08-09
 */

 function getDateDay(){
    var myDate = new Date();
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var date = myDate.getDate();
    var hours = myDate.getHours();
    var minutes = formatTime(myDate.getMinutes());
    var seconds = formatTime(myDate.getSeconds());
    var date = year + "-" + month +"-" + date;
    return date;
 }
//格式化时间：分秒
 function formatTime (i){
   if(i < 10){
     i = "0" + i;
   }
   return i;
 }
 /**
  * 下拉搜索框调用例子
  * $("#inputId").focus(function(){
 	showPullDownSearchData('inputId',datas,itemSelectFuntion);
 	});
 	var datas =[{"id":"2","text":"23"}, 
 	            {"id":"4","text":"23"},
 	            {"id":"3","text":"er"}];
 	var itemSelectFuntion = function(){
 	  alert(this.id + "," + this.innerHTML);
 	};
  */
function showPullDownSearchData(target, data, itemSelectFunction) {
 	    var defaulOption = {
 	      suggestMaxHeight: '200px',//弹出框最大高度
 	      //itemColor : '#000000',//默认字体颜色
 	      itemBackgroundColor:'#f1f2f4',//默认背景颜色
 	     // itemOverColor : '#ffffff',//选中字体颜色
 	      itemOverBackgroundColor : '#d8dfeb',//选中背景颜色
 	      itemPadding : 3 ,//item间距
 	      fontSize : 12 ,//默认字体大小
 	      alwaysShowALL : false //点击input是否展示所有可选项
 	      };
 	      var maxFontNumber = 0;//最大字数
 	      var currentItem;
 	      var suggestContainerId = target + "-suggest";
 	      var suggestContainerWidth = $('#' + target).innerWidth();
 	      var suggestContainerLeft = $('#' + target).offset().left;
 	      var suggestContainerTop = $('#' + target).offset().top + $('#' + target).outerHeight();
 	      var showClickTextFunction = function() {
 	        $('#' + target).val(this.innerText);
 	        currentItem = null;
 	        $('#' + suggestContainerId).hide();
 	      }
 	      var suggestContainer;
 	      if ($('#' + suggestContainerId)[0]) {
 	        suggestContainer = $('#' + suggestContainerId);
 	        suggestContainer.empty();
 	      } else {
 	        suggestContainer = $('<div></div>'); //创建一个子<div>
 	      }
 	      suggestContainer.attr('id', suggestContainerId);
 	      suggestContainer.attr('tabindex', '0');
 	      suggestContainer.hide();
 	      var _initItems = function(items) {
 	        suggestContainer.empty();
 	          var itemHight=0;
 	        for (var i = 0; i < items.length; i++) {
 	            if(items[i].text.length > maxFontNumber){
 	              maxFontNumber = items[i].text.length;
 	              }
 	          var suggestItem = $('<div></div>'); //创建一个子<div>
 	          //最多显示8条
 	          if(i>8){
 	        	  return false;
 	          }
 	          suggestItem.attr('id', items[i].id);
 	          suggestItem.append(items[i].text);
 	          suggestItem.css({
 	              'padding':defaulOption.itemPadding + 'px',
 	            'white-space':'nowrap',
 	            'cursor': 'pointer',
 	            'background-color': defaulOption.itemBackgroundColor,
 	            'color': defaulOption.itemColor
 	          });
 	          suggestItem.bind("mouseover",
 	          function() {
 	            $(this).css({
 	              'background-color': defaulOption.itemOverBackgroundColor,
 	              'color': defaulOption.itemOverColor
 	            });
 	            currentItem = $(this);
 	          });
 	          suggestItem.bind("mouseout",
 	          function() {
 	            $(this).css({
 	              'background-color': defaulOption.itemBackgroundColor,
 	              'color': defaulOption.itemColor
 	            });
 	            currentItem = null;
 	          });
 	          suggestItem.bind("click", showClickTextFunction);
 	          suggestItem.bind("click", itemSelectFunction);
 	          suggestItem.appendTo(suggestContainer);
 	          suggestContainer.appendTo(document.body);
 	        }
 	      }
 	      var inputChange = function() {
 	        var inputValue = $('#' + target).val();
 	        inputValue = inputValue.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&");
 	        var matcher = new RegExp(inputValue, "i");
 	        return $.grep(data,
 	        function(value) {
 	          return matcher.test(value.text);
 	        });
 	      }
 	      $('#' + target).bind("keyup",
 	      function() {
 	        _initItems(inputChange());
 	      });
 	      $('#' + target).bind("blur",
 	      function() {
 	          if(!$('#' + suggestContainerId).is(":focus")){
 	            $('#' + suggestContainerId).hide();
 	            if (currentItem) {
 	          currentItem.trigger("click");
 	          }
 	          currentItem = null;
 	            return;
 	            }					   
 	      });
 	      $('#' + target).bind("click",
 	      function() {
 	        if (defaulOption.alwaysShowALL) {
 	          _initItems(data);
 	        } else {
 	          _initItems(inputChange());
 	        }
 	        $('#' + suggestContainerId).removeAttr("style");
 	        var tempWidth = defaulOption.fontSize*maxFontNumber + 2 * defaulOption.itemPadding + 30;
 	        var containerWidth = Math.max(tempWidth, suggestContainerWidth);
 	        var h = this.scrollHeight;
 	        $('#' + suggestContainerId).css({
 	        	'max-height' : defaulOption.suggestMaxHeight,
 	        	'top' : suggestContainerTop,
 				'left' : suggestContainerLeft,
 				'width' : suggestContainerWidth,
 				'position' : 'absolute',
 				'z-index' : 2000,
 				'overflow-y' : 'auto',
 				'overflow-x' : 'hidden'
 	        });
 	        $('#' + suggestContainerId).show();
 	      });
 	      _initItems(data);
 	      $('#' + suggestContainerId).bind("blur",
 	      function() {
 	        $('#' + suggestContainerId).hide();
 	      });
 }
//格式化时间到秒
function formatDateS (strTime) {
    var myDate = new Date(strTime);
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var date = myDate.getDate();
    var hours = myDate.getHours();
    var minutes = formatTime(myDate.getMinutes());
    var seconds = formatTime(myDate.getSeconds());
    var date = year + "-" + month +"-" + date + " " + hours + ":" + minutes + ":" + seconds;
    return date;
}
//格式化时间格式到天
function formatDatedD (strTime) {
    var myDate = new Date(strTime);
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var date = myDate.getDate();
    var hours = myDate.getHours();
    var minutes = formatTime(myDate.getMinutes());
    var seconds = formatTime(myDate.getSeconds());
    var date = year + "-" + month +"-" + date;
    return date;
}
//格式化时间：分秒
function formatTime (i){
  if(i < 10){
    i = "0" + i;
  }
  return i;
}