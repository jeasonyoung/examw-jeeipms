<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/context/context.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机构列表</title>
<link rel="shortcut icon" href="/agency/img/favicon.ico" />
<link rel="icon" href="/agency/img/animated_favicon.gif" type="image/gif" />
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<style type="text/css">
#nav{position:absolute}
</style>
<![endif]-->
<script type="text/javascript" src ="/agency/img/jquery-1.8.3.min.js"></script>
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
<div class="nav">
<ul>
</ul>
</div>
<div class="blk10"></div>
<div class="contentx">
<div class="classList ret">
<ul class="zxtop2">
<li><div class="aaa">选择地区：</div>
<div class="xzdq">
<c:forEach items="${provinceList}" var="p" varStatus="index">
<c:if test="${p.provinceId eq agency.province.provinceId}">
<i><A href="/agency/${p.provinceId}_${agency.category}.html" class="cur">${p.province}</a></i>
</c:if>
<c:if test="${p.provinceId ne agency.province.provinceId}">
<i><A href="/agency/${p.provinceId}_${agency.category}.html" >${p.province}</a></i>
</c:if>
</c:forEach>
</div>
</ul>
</div>
<div class="blk10"></div>
<!--机构列表左-->
<div class="insLeft">
<div id="nav" class="leftFixed">
<ul class="insArea">
<h3>选择<span>类别</span></h3>
<c:forEach items="${categoryList}" var="c" varStatus="index">
<c:if test="${c.id eq agency.category}">
<li><a href="/agency/${agency.province.provinceId}_${c.id}.html" class="cur">${c.categoryname}</a></li>
</c:if>
<c:if test="${c.id ne agency.category}">
<li><a href="/agency/${agency.province.provinceId}_${c.id}.html">${c.categoryname}</a></li>
</c:if>
</c:forEach>
</ul>
</div>
</div>
<!--机构列表右-->
<div class="insRight">
<div class="insItem">
<div class="behalf"><img src="/agency/img/jg1.jpg" /></div>
<div class="intro">
<h3><a href="">21212121</a></h3>
<i class="jj bjj">中华考试网，经济师、一级建造师、二级建造师、报关员考试等百多种考试中华考试网，经济师、一级建造师、二级建造师、报关员考试等百多种...<a href="" class="cRed">查看详细>></a></i>
<i class="jj">机构地址：解放桥校区：历山路95号；历北校区：历山北路北口；石门</i>
<i class="jj">联系电话： 0531-86912018 15165159359</i>
<i class="jj">网址:<span class="wwz">12121212121</span><span class="enter"><a href="#">进入网站</a></span></i>
</div>
</div>
<div class="blk10"></div>
<div class="show_page">

</div>
</div>
</div>
<div class="blk10"></div>
<%@ include file="../common/footer_about.jsp"%> 
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
</body>
</html>
