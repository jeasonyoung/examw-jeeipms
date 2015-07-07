<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/center/css/top_footer.css" />
<link type="text/css" rel="stylesheet" href="/center/css/index.css" />
<link type="text/css" rel="stylesheet" href="/center/css/info.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  基本信息</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div class="Container" style="margin: 0px"> 
<div class="Main" style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="rightside">
<h1>我的帐号管理</h1>
<div class="test clearfix">
<ul class="test-ul">
<li><a href="/cstudyRecordController.do?info"><span>基本资料</span></a></li>
<li><a href="/cstudyRecordController.do?head"><span>上传头像</span></a></li>
<li  class="on"><a href="/cstudyRecordController.do?password"><span>修改密码</span></a></li>
</ul>
</div>
<div class="dbady">
<div class="user-info">
<ul class="form">
<li><label class="lb">原密码：</label><input type="password" id="oldpwd" value="" class="text"><span class="error" style="display:none"></span></li>
<li><label class="lb">新密码：</label><input type="password" id="newpwd" class="text"></li>
<li><div class="tools" id="pwdtools"></div></li>
<li><label class="lb">确认新密码：</label><input type="password" id="renewpwd" class="text"><span class="error" style="display:none"></span></li>            
</ul>
</div>
<div class="next">
<span class="y-btn-blue"><a href="javascript:;" id="changepwd">保 存</a></span>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:0px;}
</style>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=exam" ></script>
<script type="text/javascript">
$(function(){
	$("#left_info").addClass("cur");
	$("#left_info").siblings().removeClass("cur")
});
$(document).ready(function(){  
		
	   $("#newpwd").keyup(function(){
		    var pwdval = this.value;
			var pwdStrongNum = 0;
			var pwdtools = $("#pwdtools");
			if(pwdval==""){
				pwdtools.innerHTML="";
			}else{
			  pwdStrongNum = checkPwdStrong(pwdval);
			  var pwdStrongStr = '';
			  if(pwdStrongNum <= 2){
				  pwdStrongStr = '弱';
			  }
			  else if(pwdStrongNum <= 4){
				  pwdStrongStr = '中';
			  }
			  else{
				  pwdStrongStr = '强';
			  }
			  pwdtools.html('<SPAN class=trigger>密码强度：</SPAN> <SPAN class=status-bar><span class="blue" style="width:'+13*pwdStrongNum+'px;"></span></SPAN><SPAN>'+pwdStrongStr+'</SPAN>');
		   }
	   })	
		
	   $("#changepwd").click(function(){
			if($("#oldpwd").val().length==""){
			  	//$("#oldpwd").attr("class","input-r");
				$("#oldpwd").next(".error").html("请输入原始密码");
				$("#oldpwd").next(".error").css("display","");
				return ;
			}
			if($("#oldpwd").val().length<6||$("#oldpwd").val().length>15){
			  	//$("#oldpwd").attr("class","input-r");
				$("#oldpwd").next(".error").html("密码为6-16个字符");
				$("#oldpwd").next(".error").css("display","");
				return ;
			}			

			if($("#newpwd").val().length==""){
			  	//$("#newpwd").attr("class","input-r");
				$("#newpwd").next(".span").html("请输入新密码");
				$("#newpwd").next(".span").css("display","");
				return ;
			}
			if($("#newpwd").val().length<6||$("#newpwd").val().length>15){
			  	//$("#newpwd").attr("class","input-r");
				$("#newpwd").next("span").html("密码为6-16个字符");
				$("#newpwd").next("span").css("display","");
				return ;
			}

			if($("#renewpwd").val().length==""){
			  	//$("#renewpwd").attr("class","input-r");
				$("#renewpwd").next(".error").html("请输入确认密码");
				$("#renewpwd").next(".error").css("display","block");
				return ;
			}
			if($("#renewpwd").val().length<6||$("#renewpwd").val().length>15){
			  	//$("#renewpwd").attr("class","input-r");
				$("#renewpwd").next(".error").html("密码为6-16个字符");
				$("#renewpwd").next(".error").css("display","block");
				return ;
			}
		  if($("#newpwd").val()!=$("#renewpwd").val()){
			  	//$("#renewpwd").attr("class","input-r");
				$("#renewpwd").next(".error").html("两次密码输入不一致");
				$("#renewpwd").next(".error").css("display","block");
				return ;			  
		  }
		 var dataoption = {
			 "oldpwd"  : $("#oldpwd").val(),
			 "newpwd"  : $("#newpwd").val(),
		  };
		  $.post("/cstudyRecordController.do?updatePwd",dataoption,function(j){
				if(j.success){
			    	$(".title-wrapper").html(j.msg);
				    $(".title-wrapper").css("display","block");	
					editesuccess();
				}else{
			     	//$("#oldpwd").attr("class","input-r");
			    	$("#oldpwd").next(".error").html(j.msg);
			    	$("#oldpwd").next(".error").css("display","");					
				}
		  });
		  
	    })
	   
 })

function checkPwdStrong(regPwd){
	if(regPwd.length <= 6){
		typeNum = 0;
	}else if(regPwd.length < 10 && regPwd.length>6){
		typeNum = 1; 
	}else if(regPwd.length>=10){
		typeNum = 2; 
	}
	typeNum = typeNum + countType(regPwd);
	if(regPwd.length < 6) typeNum = 1;
	return typeNum;
}
function countType(regPwd){
	var count = 0;
	count += (/\d/.test(regPwd)) ? 1 : 0;
	count += (/[a-z]/.test(regPwd)) ? 1 : 0;
	count += (/[A-Z]/.test(regPwd)) ? 1 : 0;
	count += (/[!@#$%^&*\(\)_\-+.]/.test(regPwd)) ? 1 : 0;
	return count;
}
function notice(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true});
}
function editesuccess()
{
	dianotice = art.dialog({id:"notice",title:"学员中心",content:"密码修改成功，请重新登陆！",icon:"succeed",lock:true,opacity:0.1,fixed:true,
	   ok:function(){
		     location.href="/stuCenter.do?index";
			 return false;
		   }
		});
}

function notice(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true});
}

function error(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"warning",lock:true,opacity:0.1,time:t,fixed:true});
}

</script>
</body>
</html>