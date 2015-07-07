<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name} - 机构相册</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/jquery-foxibox-0.2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${domain}/plug-in/jquery/jquery-1.8.0.min.js"></script>
</head>
<body>
<div id="top"></div>
<div class="jg-nav" id="head_nav">
</div>
<!--主体部分-->
<div class="content">
<div class="location">您现在所在的位置：<a href="#">机构培训首页</a> >> <a href="#">机构相册</a></div>
<!--左-->
<div class="jgLeft">
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_news"></div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">机构相册</a></div><div class="amore"><a href="#">更多>></a></div></div>
<ul class="jrbox">
<#list list as photo>
<li>
<div class="jgimg">
<div class="igimg1"><a href="${photo.urlpath}" rel="[gall1]" title="${photo.title}f">
<img src="${domain}${photo.thumbUrl}" alt="first picture" /></a></div>
<i><a href="#">${photo.title}</a></i>
</div>
</li>
</#list>
</ul>
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
<script type="text/javascript" src ="${domain}/plug-in/agencycms/js/jquery-foxibox-0.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_course").load("left_course.html");
		$("#left_news").load("left_news.html");
  $('.igimg1 a').foxibox();
});
</script>
</body>
</html>
