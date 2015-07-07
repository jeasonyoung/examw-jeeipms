$(document).ready(function(){
	
	$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
	
	$('select').select2();
	
	// Form Validation
    $("#basic_validate").validate({
		rules:{
			username:{
				required:true,
				minlength:4,
				maxlength:15
			},
			realname:{
				required:true,
				minlength:2,
				maxlength:15
			},
			email:{
				required:true,
				email: true
			},
			mobilephone:{
				required:true,
				digits:true,
				minlength:11,
				maxlength:11
			},
			officephone:{
				minlength:7,
				maxlength:15
			},
			qq:{
				digits:true,
				minlength:4,
				maxlength:12
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('success');
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
});
