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
<li class="on"><a href="/cstudyRecordController.do?info"><span>基本资料</span></a></li>
<li><a href="/cstudyRecordController.do?head"><span>上传头像</span></a></li>
<li><a href="/cstudyRecordController.do?password"><span>修改密码</span></a></li>
</ul>
</div>
<div class="ebady">
<div class="user-info">
<ul class="form">
<li><label class="lb">登录名称：</label>${student.username}</li>
<li>
<label class="lb">性别：</label>
<input name="gender" value="0"  type="radio" ${student.gender=='0'?'checked':''}><label for="UserSex1">男</label>
<input name="gender" value="1"  type="radio" ${student.gender=='1'?'checked':''}><label for="UserSex2">女</label>
</li>
<li><label class="lb">真实姓名：</label><input type="text" name="truename" value="${student.realname }" class="text"> <span style="color: red"></span></li>
<li><label class="lb">手机：</label><input type="text" name="telPhone" value="${student.phone }" class="text"><span style="color: red"></span></li>
<li><label class="lb">电子邮箱：</label><input type="text" name="Email" value="${student.email }" class="text"><span style="color: red"></span></li>
<li><label class="lb">通迅地址：</label><textarea id="Address" class="input3">${student.address }</textarea></li>
<li><label class="lb"></label><span class="gray">请填写能收到快递的详细地址</span></li>
</ul>
</div>
<div class="user-info-main">
<div class="user-card-main">
<ul>
<li class="ico-d">邮箱绑定是为了更好地保护您的帐号安全，如果密码丢失，可以通过邮箱找回。</li>
<li class="ico-d">填写手机号码可以免费体验课程</li>
</ul>
</div>
</div>
<div class="next">
<span class="y-btn-blue"><a href="javascript:;" id="subform">保 存</a></span>
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
$(function(){
	 $("#subform").click(function(){
		    var usex,truename,MobilePhone,Address
			if($("input[name='telPhone']").val().length>5){
				  if(!checkTel($("input[name='telPhone']").val())){
					  var msgobj = $("input[name='telPhone']").next("span");
					  //msgobj.html('手机号码错误!');
					  //msgobj.attr("class","ts2");
					  return ;
				  }
				}
			if($("input[name='Email']").val().length>3){
				  if(!checkmail($("input[name='Email']").val())){
					  var msgobj = $("input[name='Email']").next("span");
					  //msgobj.html('电子邮箱错误!');
					 // msgobj.attr("class","ts2");
					  return ;
				  }
				}
			var dataoption = {
				 "gender"  : $("input[name='gender']:checked").val(),
				 "realname" : $("input[name='truename']").val(),
				 "phone" : $("input[name='telPhone']").val(),
				 "email"    : $("input[name='Email']").val(),
				 "address"  : $("#Address").val()
				};
			$.post("/cstudyRecordController.do?saveInfo",dataoption,function(j){
				if(!j.success){
				   error(j.msg,3);
				   return;
				}
				$(".title-wrapper").html(j.msg);
				$(".title-wrapper").css("display","block");
				notice("修改成功",2);
			});
	       })
});

function checkTel(mobile){ 
    if(/^1[3458]\d{9}$/.test(mobile)) return true;
	 else return false;
}

function checkmail(email){
	 if(/^([a-zA-Z0-9\._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/.test(email)) return true;
	 else return false;
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