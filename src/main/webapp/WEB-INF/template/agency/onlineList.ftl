<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name}-视频列表</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${domain}/plug-in/jquery/jquery-1.8.0.min.js"></script>
</head>
<body>
<div id="top"></div>
<div class="jg-nav" id="head_nav">
</div>
<!--主体部分-->
<div class="content">
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="#">视频课程</a></div>
<!--左-->
<div class="jgLeft">
<div class="jgboxl" id="left_onlinecategory">
</div>
<div class="blk10"></div>
<div class="jgboxl" id="left_agencyinfo"></div>
<div class="jgboxl" id="left_news"></div>
</div>
<!--右-->
<div class="jgRight">
<#if category?exists>
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob">
<a href="#">${category.categoryname?default("推荐课程")}</a>
</div></div>
<#if plist?exists>
<div class="dqList">
<div class="xzdq">选择地区：</div>
<div class="dqname">
	<#if province?exists>
	<i><a href="onlineList_${category.id}_0.html">全国</a></i>
	<#list plist as p>
	<#if p.provinceId==province.provinceId>
	<i><a href="onlineList_${category.id}_${p.id}.html" class="red">${p.province}</a></i>
	<#else>
	<i><a href="onlineList_${category.id}_${p.id}.html">${p.province}</a></i>
	</#if>
	</#list>
	<#else>
	<i><a href="onlineList_${category.id}_0.html" class="red">全国</a></i>
	<#list plist as p>
	<i><a href="onlineList_${category.id}_${p.id}.html">${p.province}</a></i>
	</#list>
	</#if>
</div>
</div>
</#if>
<#else>
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob">
<a href="#">推荐课程</a>
</div></div>
<#if plist?exists>
<div class="dqList">
<div class="xzdq">选择地区：</div>
<div class="dqname">
	<#if province?exists>
	<i><a href="onlineList.html">全国</a></i>
	<#list plist as p>
	<#if p.provinceId==province.provinceId>
	<i><a href="onlineList_0_${p.id}.html" class="red">${p.province}</a></i>
	<#else>
	<i><a href="onlineList_0_${p.id}.html">${p.province}</a></i>
	</#if>
	</#list>
	<#else>
	<i><a href="onlineList.html" class="red">全国</a></i>
	<#list plist as p>
	<i><a href="onlineList_0_${p.id}.html">${p.province}</a></i>
	</#list>
	</#if>
</div>
</div>
</#if>
</#if>
<#list courseList as course>
<div class="jgItem1">
<div class="jgItem">
<div class="behalf"><img src="${domain}${course.imageurl}" /></div>
<div class="intro">
<h3><a href="course_${course.id}.html">${course.coursename}</a></h3>
<#if course.summary?length lt 61 > 
<i class="jj bjj">${course.summary}<a href="course_${course.id}.html" class="cRed">查看详细>></a></i>
<#else>
<i class="jj bjj">${course.summary[0..60]}....<a href="course_${course.id}.html" class="cRed">查看详细>></a></i>
</#if>
<i class="jj">原价:<span class="cRed1">￥${course.price}</span>&nbsp;&nbsp;&nbsp;<span>优惠价</span>:<span class="cGreen">￥${course.favorableprice}</span></i>
<#if course.teacher.id?exists>
<i class="jj">主讲老师:<span> <a href="teacher_${course.teacher.id}.html" class="cGreen">${course.teacher.realname?default("暂无介绍")}</a></span><a href="/cartController.do?cartList&courseId=${course.id}" class="fr ljgm">立即购买</a> <a href="course_${course.id}.html" class="fr ljst">立即试听</a></i>
<#else>
<i class="jj">主讲老师:<span> <a href="#" class="cGreen">暂无介绍</a></span><a href="/cartController.do?cartList&courseId=${course.id}" class="fr ljgm">立即购买</a> <a href="course_${course.id}.html" class="fr ljst">立即试听</a></i>
</#if>
</div>
</div>
</div>
</#list>
</div>
</div>
</div>
<!--尾部-->
<div class="blk10"></div>
<div class="footer" id="footer_nav">

</div>
<div class="blk10"></div>
<div class="footer" id="footer_link">

</div>
<div class="blk10"></div>
<div class="footer" id="footer_about">

</div>
<script type="text/javascript">
	$(function(){
		$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_onlinecategory").load("left_onlinecategory.html");
		$("#left_news").load("left_news.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
	});
</script>
</body>
</html>
