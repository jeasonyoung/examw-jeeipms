// 点击登录
$('#but_login').click(function(e) {
	Login();
});
//回车登录
$(document).keydown(function(e){
	if(e.keyCode == 13) {
		Login();
	}
});
//登录处理函数
function Login() {
	if(!checkAll()){return;}
	var actionurl=$('#formLogin').attr('action');//提交路径
	var checkurl=$('#formLogin').attr('check');//验证路径
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		url : checkurl,// 请求的action路径
		data : {username:$.trim($("#username").val()),password:$("#password").val(),code:$("#code").val()},
		error : function() {// 请求失败处理函数
			$("#usernameInfo").html("<span class='Ver-n'></span>系统错误，稍后再试");
		},
		success : function(data) {
			if (data.success) {
				window.location.href=actionurl;
			} else {
				myReload();
				$("#usernameInfo").html("<span class='Ver-n'></span>"+data.msg);
			}
		},
		dataType:"json"
	});
}

//检查密码
function checkPassword(input,span) {
	var pwd = input.val();
	var reg = /^[0-9a-zA-Z_]+$/;
	if (pwd.length < 6 || pwd.length > 50
			|| !reg.test(pwd)
			) {
		span.html("<span class='Ver-n'></span>密码不合法");
		return false;
	} else {
		span.html("<span class='Ver-r'></span>");
		return true;
	}
}

//检查用户名
function checkUsername(input,span) {
	var name = $.trim(input.val());
	var $nameInfo = span;
	var length = name.length;
	if (length < 4 || length > 15) {
		$nameInfo.html("<span class='Ver-n'></span>用户名不合法");
		return false;
	} else {
		var reg = /^[0-9a-zA-Z_]+$/;
		if (reg.test(name)) {
			$nameInfo.html("<span class='Ver-r'></span>");
			return true;
		} else {
			$nameInfo.html("<span class='Ver-n'></span>用户名不合法");
			return false;
		}
	}
}

//检查验证码
function checkCode(input,span,url) {
	var code = input.val();
	if (!code || !$.trim(code)) {
		span.html("<span class='Ver-n'></span>验证码不能为空");
		return false;
	} else {
		var flag = false;
		$.ajax({
			async : false,
			url : url,	//"SCCMS/user/getCode?"
			type : "post",
			data : "code=" + code,
			success : function(data) {
				if (!data.success) {
					span.html("<span class='Ver-n'></span>"+data.msg);
					myReload();
					flag = false;
				} else {
					span.html("<span class='Ver-r'></span>"+data.msg);
					flag = true;
				}
			},
			error: function ()
            {
				span.html("<span class='Ver-n'></span>系统错误稍后再试");
            },
            beforeSend: function ()
            {
            	span.html("<span class='Ver-r'></span>验证中.....");
            },
			dataType:"json"
		});
		return flag;
	}
}
/**
 * 重置验证码
 */
function myReload(){  
    document.getElementById("createCheckCode").src=document.getElementById("createCheckCode").src + "&nocache="+new Date().getTime();  
}  

//设置cookie
function setCookie()
{
	if ($('#on_off').val() == '1') {
		$("input[iscookie='true']").each(function() {
			$.cookie(this.name, $("#"+this.name).val(), "/",24);
			$.cookie("COOKIE_NAME","true", "/",24);
		});
	} else {
		$("input[iscookie='true']").each(function() {
			$.cookie(this.name,null);
			$.cookie("COOKIE_NAME",null);
		});
	}
}
//读取cookie
function getCookie()
{
	var COOKIE_NAME=$.cookie("COOKIE_NAME");
	if (COOKIE_NAME !=null) {
		$("input[iscookie='true']").each(function() {
			$($("#"+this.name).val( $.cookie(this.name)));
		});
		$("#on_off").attr("checked", true);
		$("#on_off").val("1");
	} 
	else
	{
		$("#on_off").attr("checked", false);
		$("#on_off").val("0");
	}
}
function checkAll(){
	return checkUsername($("#username"),$("#usernameInfo"),"agencycms.do?checkusername")&checkPassword($("#password"),$("#passwordInfo"))&checkCode($("#code"),$("#codeInfo"),"agencycms.do?checkcode");
}