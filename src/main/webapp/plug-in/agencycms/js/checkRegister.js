//检查email
function checkEmail(input,span,url) {
	//input,span为jquery对象�
	var flag = false;
	if (!input.val() || !$.trim(input.val())) {
		span.html("<span class='Ver-n'></span>邮箱不能为空  | 例：examw@163.com");
		return false;
	} else {
		var reg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
		if (!reg.test(input.val())) {
			span.html("<span class='Ver-n'></span>Email不合法   | 例：examw@163.com");
			return false;
		} else {
			$.ajax({
				async : false,
				url : url,
				type : "post",
				data : "email=" + input.val(),
				success : function(data) {
					if (!data.success) {
						span.html("<span class='Ver-n'></span>"+data.msg+" | 例：examw@163.com");
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
}
//检查QQ
function checkQICQ(input,$qqInfo){
 	var qq=input.val();
 	var reg=/^\d{5,10}$/; 
 	if(qq!=""&&!reg.test(qq)){
 		$qqInfo.html("<p class='error'>请输入正确格式的QQ号码</p>");
 		return false;
 	}else if(qq==""){
 		$qqInfo.html("");
 		return true;
 	}else{
 		$qqInfo.html("<p class='succ'>QQ号输入正确</p>");
 		return true;
 	}
 }
//检查用户名
function checkUsername(input,span,url) {
	var flag=false;
	var name = $.trim(input.val());
	var $nameInfo = span;
	var length = name.length;
	if (length < 4 || length > 15) {
		$nameInfo.html("<span class='Ver-n'></span>用户名不合法");
		return false;
	} else {
		var reg = /^[0-9a-zA-Z_]+$/;
		if (reg.test(name)) {
			$.ajax({
				async : false,
				url : url,
				type : "post",
				data : "username=" + input.val(),
				success : function(data) {
					if (data.success) {
						span.html("<span class='Ver-r'></span>"+data.msg);
						flag = true;
					} else {
						span.html("<span class='Ver-n'></span>"+data.msg);
						flag = false;
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
		} else {
			$nameInfo.html("<span class='Ver-n'></span>用户名不合法");
			return false;
		}
	}
}
//真实姓名
function checkRealname(obj, span) {
    var objvalue;
    objvalue = $.trim(obj.val());
    //真实姓名这里做了修改
    if (objvalue != '') {
        if (objvalue.length >= 2 && objvalue.length <= 16 &&/^[\u4E00-\u9FA5]{2,5}$/.test(objvalue)) {
        	span.html("<span class='Ver-r'></span>");
            return true;
        }
        else {
        	span.html("<span class='Ver-n'></span>请认真填写真实姓名");
            return false;
        }
    }
    else {
    	span.html("<span class='Ver-n'></span>真实姓名不能为空");
        return false;
    }
}
//检查密码
function checkPassword(input,span) {
	var pwd = input.val();
	//
	var reg = /^[0-9a-zA-Z_]+$/;
	if (pwd.length < 6 || pwd.length > 20
			|| !reg.test(pwd)
			) {
		span.html("<span class='Ver-n'></span>密码不合法");
		return false;
	} else {
		span.html("<span class='Ver-r'></span>");
		return true;
	}
}
//检查重复密码
function checkRepeatPwd(input1,input2,span) {
	if(!checkPassword(input1,span))
	{
		span.html("<span class='Ver-n'></span>密码不合法");
		return false;
	}
	var pwd = input1.val();
	var pwd1 = input2.val();
	if (pwd1 && (!pwd1.indexOf(pwd) && pwd.length == pwd1.length)) {
		span.html("<span class='Ver-r'></span>");
		return true;
	} else {
		span.html("<span class='Ver-n'></span>两次密码不一致，请重新输入");
		return false;
	}

}
//检查手机号码
function checkPhone(input,span)
{
	var phone = input.val();
	if(!phone||!$.trim(phone)) {span.html("<span class='Ver-n'></span>请输入电话号码");return false;}
	var reg2 =/^1[3458]\d{9}$/;
	if(!reg2.test(phone))
	{
		span.html("<span class='Ver-n'></span>电话号码不合法");
		return false;
	}else
	{
		span.html("<span class='Ver-r'></span>");
		return true;
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
					myReload();
					span.html("<span class='Ver-n'></span>"+data.msg);
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
function checkName(input,span)
{
	var name = input.val();
	if(!name||!$.trim(name)) {span.html("<span class='Ver-n'></span>请输入机构名称");return false;}//可以不填
	var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
	if(!reg.test(name)||name.length>13||name.length<4)
	{
		span.html("<span class='Ver-n'></span>请认真填写机构名称,名称在4到12个字符之间");
		return false;
	}else
	{
		span.html("<span class='Ver-r'></span>");
		return true;
	}
	
}

function checkAddress(input,span)
{
	var name = input.val();
	if(!name||!$.trim(name)) {span.html("<span class='Ver-n'></span>请输入机构培训地址");return false;}//
	if(name.length>100||name.length<5)
	{
		span.html("<span class='Ver-n'></span>请认真填写");
		return false;
	}else
	{
		span.html("<span class='Ver-r'></span>");
		return true;
	}
	
}

function checkKeywords(input,span)
{
	var name = input.val();
	if(!name||!$.trim(name)) {span.html("<span class='Ver-n'></span>请输入主要培训课程关键字");return false;}//
	var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
	if(!reg.test(name)||name.length>100||name.length<2)
	{
		span.html("<span class='Ver-n'></span>请认真填写，方便学员搜索");
		return false;
	}else
	{
		span.html("<span class='Ver-r'></span>");
		return true;
	}
	
}

//检查办公电话
function checkOfficephone(input,span)
{
	var phone = input.val();
	if(!phone||!$.trim(phone)) {span.html("<span class='Ver-n'></span>请输入电话号码");return false;}//可以不填
	/*var reg1 =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;//�*/
	var reg2 =/^1[3458]\d{9}$/;//
	var reg1 =/^(\(\d{3,4}\)|\d{3,4}-)?\d{6,8}$/;
	if(!reg1.test(phone)&&!reg2.test(phone))
	{
		span.html("<span class='Ver-n'></span>电话号码格式不正确");
		return false;
	}else
	{
		span.html("<span class='Ver-r'></span>");
		return true;
	}
}


function checkDeal(input)
{
	if(!input.attr('checked'))
	{
		alert("必须先同意协议")
		return false;
	}
	return true;
}
