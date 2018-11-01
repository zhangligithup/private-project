$.validator.setDefaults({
    submitHandler: function(form) {
      form.submit();
    }
});
$().ready(function() {
    $("#formValidate").validate({
    	rules:{
    	 	username:{
    			required:true
    		},
    		password:{
    			required:true,
    		 	rangelength:[3,15]
    		}
    	},
    	
    	messages:{
    		username:{
    			required:"请输入用户名"
			},
			password:{
				required:"请输入密码",
				rangelength: $.validator.format("密码必须在3~15之间")
			}
    	}
    });
});
