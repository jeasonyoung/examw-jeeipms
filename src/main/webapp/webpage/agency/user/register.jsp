<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- base需要放到head中 --> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机构注册</title>
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
<div class="lad"><img src="/agency/img/002.gif" /></div>
<div class="blk10"></div>
<form action="agencycms.do?register"  method="post" id="form">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td colspan="3"><span><strong>个人信息</strong></span></td>
  </tr>
  <tr>
    <td width="61"><span>*</span>用户名</td>
    <td width="239">
        <input type="text" name="username" id="username"  class="wbk" onblur='checkUsername($("#username"),$("#usernameInfo"),"agencycms.do?checkusername");' />
      </td>
    <td width="318" id="usernameInfo"></td>
    </tr>
   <tr>
    <td width="61"><span>*</span>真实姓名</td>
    <td width="239">
        <input type="text" name="realname" id="realname"  class="wbk" onblur='checkRealname($("#realname"),$("#realnameInfo"));'/>
      </td>
    <td width="318" id="realnameInfo"></td>
   </tr>
  <tr>
    <td><span>*</span>密码</td>
    <td>
        <input type="password" name="password" id="password"  class="wbk" onblur='checkPassword($("#password"),$("#passwordInfo"));'/>
      </td>
    <td id="passwordInfo"></td>
    </tr>
   <tr>
     <td><span>*</span>确认密码</td>
     <td>
         <input type="password" name="re_password" id="re_password"  class="wbk" onblur='checkRepeatPwd($("#re_password"),$("#password"),$("#re_passwordInfo"));'/>
        </td>
    <td  id="re_passwordInfo"></td>
   </tr>
   <tr>
    <td><span>*</span>手机号码</td>
    <td>
        <input type="text" name="mobilephone" id="mobilephone"  class="wbk" onblur='checkPhone($("#mobilephone"),$("#mobilephoneInfo"))'/>
      </td>
    <td id="mobilephoneInfo"></td>
   </tr>
   <tr>
     <td><span>*</span>邮箱</td>
     <td>
         <input type="text" name="email" id="email"  class="wbk" onblur='checkEmail($("#email"),$("#emailInfo"),"agencycms.do?checkemail")'/>
        </td>
     <td id="emailInfo"></td>
   </tr>
   <tr>
  		<td colspan="3"><span><strong>机构信息</strong></span></td>
   </tr>
   <tr>
     <td><span>*</span>机构全称</td>
     <td> <input type="text" name="name" id="name"  class="wbk" onblur='checkName($("#name"),$("#nameInfo"))'/></td>
     <td id="nameInfo"></td>
   </tr>
  <!--<tr>
     <td><span>*</span>机构简称</td>
     <td> <input type="text" name="abbreviation" id="abbreviation"  class="wbk" onblur='checkAbbreviation($("#abbreviation"),$("#abbreviationInfo"))'/></td>
     <td id="abbreviationInfo"></td>
   </tr>-->
  <tr>
    <td><span>*</span>机构电话</td>
    <td>
      <input type="text" name="officephone" id="officephone"  class="wbk" onblur='checkOfficephone($("#officephone"),$("#officephoneInfo"))'/>
      </td>
    <td id="officephoneInfo"></td>
  </tr>
  <tr>
    <td><span>*</span>所属区域</td>
    <td colspan="2">
    <span id="area"  style="display:inline-block"></span>
    <input class="inputxt" id="provinceid" type="hidden" name="province.id">
	<input class="inputxt" id="cityid" type="hidden" name="city.id">
	<input class="inputxt" id="areaid" name="area.id" type="hidden">
  	</td>
    </tr>
  <tr>
    <td><span>*</span>详细地址</td>
    <td>
      <input type="text" name="address" id="address"  class="wbk" onblur='checkAddress($("#address"),$("#addressInfo"))'/>
    </td>
    <td id="addressInfo"></td>
  </tr>
  <tr>
  <tr>
     <td><span>*</span>关键字</td>
     <td><input type="text" name="keywords" id="keywords"  class="wbk" onblur='checkKeywords($("#keywords"),$("#keywordsInfo"))'/></td>
     <td id="keywordsInfo"></td>
   </tr>
   <tr>
    <td><span></span>机构简介</td>
    <td colspan="2"><textarea name="abbreviation" cols="" rows="" class="wby"></textarea></td>
    </tr>
  <tr>
   <tr>
    <td><span>*</span>验证码</td>
    <td>
      <input type="text" name="code" id="code"  class="wbk1"  onblur='checkCode($("#code"),$("#codeInfo"),"agencycms.do?checkcode")'/>
    	<img id="createCheckCode" src="agencycms.do?getcode" >  
        <a href="javascript:;" onClick="myReload()">看不清？换一个</a>  
    </td>
    <td id="codeInfo">
    </td> 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2">
          <input type="checkbox" name="checkbox" id="deal" />
      我已阅读并同意《<a href="webpage/agency/deal.jsp" target="_blank" class="cBlue">教育平台服务条款</a>》</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><a href="javascript:;" class="tjbtn" id="register">同意协议，提交</a></td>
  </tr>
   </table>
  </form>
</div>
<div class="Rright">
<div class="Rbox1">已有帐号，<span class="cRed">直接登录</span></div>
<div class="Rbox1 Rbox3"><a href="agencycms.do?login" class="tjbtn">马上登录</a></div>
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
<%@ include file="../../common/footer_about.jsp"%> 
</body>
<script type="text/javascript" src="/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript" src="/plug-in/area/chinaprovinces_0.2.1.js"></script>
<script type="text/javascript" src="/plug-in/agencycms/js/checkRegister.js"></script>
<script type="text/javascript">
	$(function(){
		//地区下拉框
		$("#area").chinaprovinces({
			valueType:'id',
			change:function(province,city,area){
				$("#provinceid").val(province);
				$("#cityid").val(city);
				$("#areaid").val(area);
			}
		});
		//focus input得到焦点，提示输入内容要求
		$("#username").focus(
			function(){
				$("#usernameInfo").html("<span class='Ver-w'></span>4-15位(数字或者字母)");
				});
		$("#realname").focus(
			function(){
				$("#realnameInfo").html("<span class='Ver-w'></span>请输入您的真实姓名");
				});		
		$("#password").focus(
			function(){
				$("#passwordInfo").html("<span class='Ver-w'></span>6-15位(数字或者字母)");
				});
		$("#re_password").focus(
			function(){
				$("#re_passwordInfo").html("<span class='Ver-w'></span>请再输入一次上面的密码");
				});
		$("#mobilephone").focus(
			function(){
				$("#mobilephoneInfo").html("<span class='Ver-w'></span>请输入您的手机号码");
				});
		$("#email").focus(
			function(){
				$("#emailInfo").html("<span class='Ver-w'></span>请输入您的邮箱   | 例：examw@163.com");
				});
		
		//机构信息  哎 这样写 有点麻烦  
		$("#name").focus(
			function(){
				$("#nameInfo").html("<span class='Ver-w'></span>请输入机构名称");
			});
		$("#abbreviation").focus(
			function(){
				$("#abbreviationInfo").html("<span class='Ver-w'></span>请输入机构简称");
			});
		$("#officephone").focus(
				function(){
					$("#officephoneInfo").html("<span class='Ver-w'></span>请输入办公电话  | 例:0826-6205910");
				});
		$("#address").focus(
				function(){
					$("#addressInfo").html("<span class='Ver-w'></span>请输入机构详细地址");
				});
		$("#keywords").focus(
				function(){
					$("#keywordsInfo").html("<span class='Ver-w'></span>请输入课程关键字，方便学员搜索");
				});
		
		//提交
		$("#register").click(function(){
			if(checkAll()){$("#form").submit();};
		});
	});
	function checkAll()
	{
		if($("#cityid").val()==""){
			alert("请选择地区，至少精确到城市");
			return false;
		};
		if(!checkDeal($("#deal"))){
			return false;
		}
		return checkUsername($("#username"),$("#usernameInfo"),"agencycms.do?checkusername")&checkRealname($("#realname"),$("#realnameInfo"))&checkPassword($("#password"),$("#passwordInfo"))&checkRepeatPwd($("#re_password"),$("#password"),$("#re_passwordInfo"))&checkPhone($("#mobilephone"),$("#mobilephoneInfo"))&checkEmail($("#email"),$("#emailInfo"),"agencycms.do?checkemail")&checkName($("#name"),$("#nameInfo"))&checkOfficephone($("#officephone"),$("#officephoneInfo"))&checkCode($("#code"),$("#codeInfo"),"agencycms.do?checkcode")&checkAddress($("#address"),$("#addressInfo"))&checkKeywords($("#keywords"),$("#keywordsInfo"));
	}
	function myReload(){  
            document.getElementById("createCheckCode").src=document.getElementById("createCheckCode").src + "&nocache="+new Date().getTime();  
        }  
	
</script>
</html>
