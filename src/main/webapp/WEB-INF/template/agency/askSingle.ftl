<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${agency.name}- 在线答疑</title>
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
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="askAndAnswer.html">在线答疑</a></div>
<!--左-->
<div class="jgLeft">
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_agencyinfo"></div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">答疑详情</a></div></div><em>
<div style="padding:10px;width:710px">问题标题：<span style="font: bold 14px/28px simsun;">${ask.title}</div>
<div style="padding:10px;width:710px">问题内容：
	<p style="margin-top: 10px; margin-bottom: 0px; padding: 10px 16px 10px 26px; border: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);word-wrap: break-word; word-break: normal;">
		${ask.content}<span style="float:right">${ask.createDate?string('yyyy-MM-dd hh:mm')}</span>
	</p>
</div>
<div style="padding:10px">机构回复：
	<#if ask.answerList?exists && (ask.answerList?size>0)>
	<#list ask.answerList as answer>
	<div style="margin-top: 10px; margin-bottom: 10px; padding: 10px 16px 10px 26px; border: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">
		回复内容：${answer.content}回复时间：<span>${answer.createDate?string('yyyy-MM-dd hh:mm')}</span>
	</div>
	</#list>
	<#else>
	<p style="font-align:center;margin-top: 10px; margin-bottom: 10px; padding: 10px 16px 10px 26px; border: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">
	暂无回复
	</p>
	</#if>
</div>
</em>
<dl class="adr">
<dd><span>机构地址</span>:${agency.address?default("")}</dd>
<dd><span>联系电话</span>:${agency.officephone?default("")}</dd>
</dl>
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
		$("#left_course").load("left_course.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
	});
</script>
</body>
</html>
