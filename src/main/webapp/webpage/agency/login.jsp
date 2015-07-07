<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机构登陆</title>
<link href="plug-in/agencycms/img/style.css" rel="stylesheet" type="text/css" />
<link href="plug-in/agencycms/img/top_footer.css" rel="stylesheet" type="text/css" />
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
<div class="logo"><img src="plug-in/agencycms/img/logo.gif" width="224" height="79" /></div>
<div class="search-box">
<div class="search"><span>选课程</span><input name="" type="text" class="search1" value="请输入您要搜索的关键词" /><div class="ss"><a href="#"></a></div></div>
</div>
</div>
<div class="contentx">
<div class="Rleft">
<div class="gadLeft"><img src="plug-in/agencycms/img/1.gif" width="618" height="80" /></div>
<div class="blk10"></div>
<div class="blk10"></div>
<form name="formLogin" id="formLogin" action="agencycms.do?login" check="agencycms.do?checkuser" method="post">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="61"><span>*</span>用户名</td>
    <td width="239">
        <input type="text" name="username" id="username"  class="wbk" onblur='checkUsername($("#username"),$("#usernameInfo"));'/>
      </td>
    <td width="318" id="usernameInfo"></td>
    </tr>
  <tr>
    <td><span>*</span>密码</td>
    <td>
      <input type="text" name="password" id="password"  class="wbk" onblur='checkPassword($("#password"),$("#passwordInfo"));'/>
      </td>
    <td id="passwordInfo"></td>
  </tr>
   <tr>
    <td><span>*</span>验证码</td>
    <td>
      <input type="text" name="code" id="code"  class="wbk1"  onblur='checkCode($("#code"),$("#codeInfo"),"agencycms.do?checkcode")'/>
    	<img id="createCheckCode" src="agencycms.do?getcode" >  
        <a href="javascript:;" onClick="myReload()">看不清？换一个</a>  
    </td>
    <td id="codeInfo">
    </td> 
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><div class="btn" id="but_login"><a href="javascript:;" class="dlbtn">登录</a> </div><div class="btn"><a href="agencycms.do?regist" class="dlbtn1">马上注册</a></div></td>
  </tr>
   </table>
</form>
</div>
<div class="Rright">
<div class="Rbox1">还没有帐号？<br />快速<span class="cRed">免费注册</span>，享受更多优惠</div>
<div class="Rbox1 Rbox3"><a href="agencycms.do?regist" class="tjbtn">马上注册</a></div>
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
</body>
<script type="text/javascript" src="plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src ="plug-in/agencycms/js/common.js"></script>
<script type="text/javascript" src="plug-in/agencycms/js/login.js"></script>
<script type="text/javascript">
$(function(){
	$("#username").focus(
			function(){
				$("#usernameInfo").html("<span class='Ver-w'></span>请输入您用户名");
				});
		$("#password").focus(
			function(){
				$("#passwordInfo").html("<span class='Ver-w'></span>请输入您的密码");
				});
});
</script>
</html>
