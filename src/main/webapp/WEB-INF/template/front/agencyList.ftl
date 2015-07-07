<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.province.province?default("全国")}-机构列表</title>
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
<#list menuList as menu>
	<#if menu.enname=="agency">
	<li  class="cur"><a href="/${menu.enname}/">${menu.cnname}</a></li>
	<#elseif menu.enname=="index">
	<li><a href="/">${menu.cnname}</a></li>
	<#else>
	<li><a href="/${menu.enname}/">${menu.cnname}</a></li>
	</#if>
</#list>
</ul>
</div>
<div class="blk10"></div>
<div class="contentx">
<div class="classList ret">
<ul class="zxtop2">
<li><div class="aaa">选择地区：</div><div class="xzdq">
<#if agency.province.id?exists>
<i><A href="0_${agency.category?default("0")}.html">全国</a></i>
<#list provinceList as p>
<#if p.provinceId==agency.province.provinceId>
<i><A class="cur" href="${p.provinceId?c}_${agency.category?default("0")}.html">${p.province}</a></i>
<#else>
<i><A href="${p.provinceId?c}_${agency.category?default("0")}.html">${p.province}</a></i>
</#if>
</#list>
<#else>
<i><A class="cur" href="0_${agency.category?default("0")}.html">全国</a></i>
<#list provinceList as p>
<i><A href="${p.provinceId?c}_${agency.category?default("0")}.html">${p.province}</a></i>
</#list>
</#if>
</div></LI>
</ul>
</div>
<div class="blk10"></div>
<!--机构列表左-->
<div class="insLeft">
<div id="nav" class="leftFixed">
<ul class="insArea">
<h3>选择<span>类别</span></h3>
<#list categoryList as category>
<#if category.id = agency.category?default("0")>
<li><a href="${agency.province.provinceId?default(0)?c}_${category.id?default("0")}.html" class="cur">${category.categoryname}</a></li>
<#else>
<li><a href="${agency.province.provinceId?default(0)?c}_${category.id?default("0")}.html">${category.categoryname}</a></li>
</#if>
</#list>
</ul>
</div>
</div>
<!--机构列表右-->
<div class="insRight">
<#list page.list as agency>
<div class="insItem">
<div class="behalf"><img src="/agency/img/jg1.jpg" /></div>
<div class="intro">
<h3>
<#if agency.secondDomain?? || agency.secondDomain=="" > 
	<a href="/agency/${agency.id?substring(21,32)}">${agency.name}</a>
<#else>
	<a href="http://${agency.secondDomain}${domainS}">${agency.name}</a>
</#if>
</h3>
<#if agency.abbreviation?length lt 100 > 
<i class="jj bjj">${agency.abbreviation}...
<#if agency.secondDomain?? || agency.secondDomain=="" > 
	<a href="/agency/${agency.id?substring(21,32)}/agencyInfo.html" class="cRed">查看详细>></a>
<#else>
	<a href="http://${agency.secondDomain}${domainS}" class="cRed">查看详细>></a>
</#if>
</i>
<#else>
<i class="jj bjj">${agency.abbreviation[0..80]}...
	<#if agency.secondDomain?? || agency.secondDomain=="" > 
	<a href="/agency/${agency.id?substring(21,32)}/agencyInfo.html" class="cRed">查看详细>></a>
<#else>
	<a href="http://${agency.secondDomain}${domainS}" class="cRed">查看详细>></a>
</#if>
</i>
</#if>
<i class="jj">机构地址：${agency.address}</i>
<i class="jj">联系电话： ${agency.officephone}</i>
<i class="jj">网址:
	<span class="wwz">
		<#if agency.secondDomain?? || agency.secondDomain=="" >
			${domain}/agency/${agency.id?substring(21,32)}/
		<#else>
			http://${agency.secondDomain}${domainS}/
		</#if>
	</span>
	<span class="enter">
		<#if agency.secondDomain?? || agency.secondDomain=="" >
			<a href="/agency/${agency.id?substring(21,32)}/">进入网站</a>
		<#else>
			<a href="http://${agency.secondDomain}${domainS}/">进入网站</a>
		</#if>
	</span>
</i>
</div>
</div>
</#list>
<div class="blk10"></div>
<div class="show_page" style="width:800px;">
 ${page}
</div>
</div>
</div>
<div class="blk10"></div>
<div class="footer" id="footer_about">
</div>
</div>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript" >
	$(function(){
		$("#footer_about").load("/common/footer_about.html");
	})
</script>
</body>
</html>
