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
		data : {username:$.trim($("#username").val()),spassword:$("#password").val()},
		error : function() {// 请求失败处理函数
			$("#info").html("<span class='Ver-n'></span>系统错误，稍后再试");
		},
		success : function(data) {
			if (data.success) {
				window.location.href=actionurl;
			} else {
				$("#info").html("<span class='Ver-n'></span>"+data.msg);
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
			return true;
		} else {
			$nameInfo.html("<span class='Ver-n'></span>用户名不合法");
			return false;
		}
	}
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
	return checkUsername($("#username"),$("#info"))&checkPassword($("#password"),$("#info"));
}