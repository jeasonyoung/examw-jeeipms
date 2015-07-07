<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name}-面授列表</title>
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
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="#">面授课程</a></div>
<!--左-->
<div class="jgLeft">
<div class="jgboxl" id="left_facecategory">
</div>
<div class="blk10"></div>
<div class="jgboxl" id="left_agencyinfo"></div>
<div class="jgboxl" id="left_news"></div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob">
<#if category?exists>
<a href="javascript:;">${category.categoryname?default("课程列表")}</a>
<#else>
<a href="javascript:;">推荐课程</a>
</#if>
</div></div>
<#list courseList as course>
<div class="jgItem1">
<div class="jgItem">
<div class="behalf"><img src="${domain}${course.imageurl}" /></div>
<div class="intro">
<h3><a href="course_${course.id}.html">${course.coursename}</a></h3>
<#if course.summary?length lt 51 > 
<i class="jj bjj">${course.summary}<a href="course_${course.id}.html" class="cRed">查看详细>></a></i>
<#else>
<i class="jj bjj">${course.summary[0..50]}....<a href="course_${course.id}.html" class="cRed">查看详细>></a></i>
</#if>
<i class="jj">联系电话:<span class="cRed1">4000-525-585</span></i>
<i class="jj"><span><a href="course_${course.id}.html" class="cGreen">查看公开课视频</a></span> <a href="contact.html" class="fr ljst">立即报名</a></i>
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
		$("#left_facecategory").load("left_facecategory.html");
		$("#left_news").load("left_news.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
	});
</script>
</body>
</html>
