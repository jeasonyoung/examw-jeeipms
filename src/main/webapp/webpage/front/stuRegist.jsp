<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>学员注册</title>
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="topx">
<div class="top">
<div class="t1"><a href="/">首页</a> |  <a href="/course/" class="ks1">快速选课</a> |  <a href="/agency/" class="ks2">网校列表</a></div>
<div class="t3"><a href="#">报名流程</a> | <a href="#">常见问题</a> | <a href="#">交易安全</a></div>
<div class="t2" id="stu"></div>
</div>
</div>
<div class="header">
<div class="logo"><img src="/agency/img/logo.gif" width="224" height="79" /></div>
<div class="search-box">
<div class="search">
<div id="J_SearchTab" class="search-triggers">
   <ul class="ks-switchable-nav" id="test1">
     <li class="J_SearchTab selected" data-searchtype="item"  data-defaultpage="/agencyfront.do?searchCourse" >
       <a href="#">课程</a>
     </li>
     <li class="J_SearchTab"  data-searchtype="item"  data-defaultpage="/agencyfront.do?searchAgency" >
       <a href="#">机构</a>
     </li>
   </ul>
   <i>
   <em></em>
   <span></span>
   </i>
</div>
<form action="/agencyfront.do?searchCourse" id="search_form" method="post">
<input name="keywords" type="text" class="search1" value="" />
<div class="ss" ><a href="#" id="search_button"></a></div></div>
</form>
</div>
</div>
<div class="contentx">
<div class="Rleft">
<div class="lad"><img src="/agency/img/001.gif" /></div>
<div class="blk10"></div>
<form name="formLogin" id="formLogin" action="stuCenter.do?index" check="stuCenter.do?save" method="post">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="61"><span>*</span>用户名</td>
    <td width="239">
        <input type="text" name="username" id="username" / class="wbk" onblur='checkUsername($("#username"),$("#usernameInfo"),"stuCenter.do?checkusername");'>
      </td>
    <td width="318" id="usernameInfo"></td>
    </tr>
  <tr>
    <td><span>*</span>密码</td>
    <td>
        <input type="password" name="spassword" id="password" / class="wbk" onblur='checkPassword($("#password"),$("#passwordInfo"));'>
      </td>
    <td id="passwordInfo"></td>
    </tr>
   <tr>
     <td><span>*</span>确认密码</td>
     <td>
         <input type="password" name="r_spassword" id="re_password" / class="wbk" onblur='checkRepeatPwd($("#re_password"),$("#password"),$("#re_passwordInfo"));'>
        </td>
     <td id="re_passwordInfo"></td>
   </tr>
   <tr>
     <td><span>*</span>邮箱</td>
     <td>
         <input type="text" name="email" id="email" / class="wbk" onblur='checkEmail($("#email"),$("#emailInfo"),"stuCenter.do?checkemail")'>
        </td>
     <td id="emailInfo"></td>
    </tr>
 <tr>
    <td><span>*</span>验证码</td>
    <td>
      <input type="text" name="code" id="code"  class="wbk1"  onblur='checkCode($("#code"),$("#codeInfo"),"agencycms.do?checkcode")'/>
    	<img id="createCheckCode" src="stuCenter.do?getcode" >  
        <a href="javascript:;" onClick="myReload()">看不清？换一个</a>  
    </td>
    <td id="codeInfo">
    </td> 
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"></span>
          <input type="checkbox" name="checkbox" id="deal" />
      我已阅读并同意《<a href="#" class="cBlue">教育平台服务条款</a>》</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><a href="#"  id="but_login" class="tjbtn">同意协议，提交</a></td>
  </tr>
   </table>
   </form>
</div>
<div class="Rright">
<div class="Rbox1">已有帐号，<span class="cRed">直接登录</span></div>
<div class="Rbox1 Rbox3"><a href="/stuCenter.do?index" class="tjbtn">马上登录</a></div>
<div class="Rbox2">
<span>登录后您可免费享受：</span>
<ul>
<li>制定专属适合您的学习计划</li>
<li>独家研发考前评测系统</li>
<li>7×24小时顾问式在线答疑</li>
</ul>
</div>
</div>
<div class="endline"></div>
</div>
<div class="blk10"></div>
<%@ include file="../common/footer_about.jsp"%> 
<script type="text/javascript" src="/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/plug-in/agencycms/js/checkRegister.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript">
$(function(){
		$("#username").focus(
			function(){
				$("#usernameInfo").html("<span class='Ver-w'></span>4-15位(数字或者字母)");
				});
		$("#password").focus(
			function(){
				$("#passwordInfo").html("<span class='Ver-w'></span>6-15位(数字或者字母)");
				});
		$("#re_password").focus(
			function(){
				$("#re_passwordInfo").html("<span class='Ver-w'></span>请再输入一次上面的密码");
				});
		$("#email").focus(
			function(){
				$("#emailInfo").html("<span class='Ver-w'></span>请输入您的邮箱   | 例：examw@163.com");
				});
});
function myReload(){  
    document.getElementById("createCheckCode").src=document.getElementById("createCheckCode").src + "&nocache="+new Date().getTime();  
}  
function checkAll()
{
	if(!checkDeal($("#deal"))){
		return false;
	}
	return checkUsername($("#username"),$("#usernameInfo"),"stuCenter.do?checkusername")&checkPassword($("#password"),$("#passwordInfo"))&checkRepeatPwd($("#re_password"),$("#password"),$("#re_passwordInfo"))&checkEmail($("#email"),$("#emailInfo"),"stuCenter.do?checkemail")&checkCode($("#code"),$("#codeInfo"),"agencycms.do?checkcode");
}

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
		data : {username:$.trim($("#username").val()),spassword:$("#password").val(),email:$("#email").val()},
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

</script>
</body>
</html>
