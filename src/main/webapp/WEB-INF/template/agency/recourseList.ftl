<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${agency.name}- 机构新闻</title>
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
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="#">新闻列表</a></div>
<!--左-->
<div class="jgLeft">
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_agencyinfo"></div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">新闻列表</a></div></div>
<div class="news-list"><!--新闻列表-->
    <ul>
      <#list recourseList as recourse>
      <li><div class="nl-wenzi"><a href="recourse_${recourse.id}.html" target="_blank" class="lanse14">${recourse.title}</a></div><div class="nl-date">${recourse.addtime?string("yyyy-MM-dd")}</div></li>
     </#list>
    </ul>
  </div>
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
<script type="text/javascript" src="${domain}/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src ="${domain}/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_course").load("left_course.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
	});
</script>
</body>
</html>
