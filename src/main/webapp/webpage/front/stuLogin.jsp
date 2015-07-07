<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学员登陆</title>
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
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
	<div class="dlbg">
		<div class="dlr">
<form name="formLogin" id="formLogin" action="stuCenter.do?index" check="stuCenter.do?checkLogin" method="post">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="75">用户名</td>
    <td width="297"><input type="text" name="username" id="username" / class="wbk" /></td>
    </tr>
  <tr>
    <td>密码</td>
    <td>
      <input type="password" name="password" id="password" / class="wbk">
    </td>
    </tr>
	<tr>
	<TD></TD>
	<td id="info"></td>
	</tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="but_login" class="btn"><a href="#" class="dlbtn">登录</a> </div><div class="btn"><a href="/stuCenter.do?regist" class="dlbtn1">马上注册</a></div></td>
  </tr>
   </table>
  </form>
		</div>
    </div>
</div>
<div class="blk10"></div>
<%@ include file="../common/footer_about.jsp"%> 
</body>
<script type="text/javascript" src="/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/plug-in/agencycms/js/stuLogin.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
</html>

