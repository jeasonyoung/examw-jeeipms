<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name}-首页</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src ="${domain}/agency/img/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function() {
	var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
	var len = $("#focus ul li").length; //获取焦点图个数
	var index = 0;
	var picTimer;
	
	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var btn = "<div class='btnBg'></div><div class='btn'>";
	for(var i=0; i < len; i++) {
		btn += "<span></span>";
	}
	btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
	$("#focus").append(btn);
	$("#focus .btnBg").css("opacity",0.5);

	//为小按钮添加鼠标滑入事件，以显示相应的内容
	$("#focus .btn span").css("opacity",0.4).mouseover(function() {
		index = $("#focus .btn span").index(this);
		showPics(index);
	}).eq(0).trigger("mouseover");

	//上一页、下一页按钮透明度处理
	$("#focus .preNext").css("opacity",0.2).hover(function() {
		$(this).stop(true,false).animate({"opacity":"0.5"},300);
	},function() {
		$(this).stop(true,false).animate({"opacity":"0.2"},300);
	});

	//上一页按钮
	$("#focus .pre").click(function() {
		index -= 1;
		if(index == -1) {index = len - 1;}
		showPics(index);
	});

	//下一页按钮
	$("#focus .next").click(function() {
		index += 1;
		if(index == len) {index = 0;}
		showPics(index);
	});

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$("#focus ul").css("width",sWidth * (len));
	
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	$("#focus").hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			showPics(index);
			index++;
			if(index == len) {index = 0;}
		},4000); //此4000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) { //普通切换
		var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
		$("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
		//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
		$("#focus .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
	}
});
</script>
</head>
<body>
<div id="top">
<#include "head_top.ftl">
</div>
<div class="jg-nav" id="head_nav">
</div>
<!--主体部分-->
<div class="content">
<div class="location">您现在所在的位置：<a href="#">${agency.name}</a></div>
<!--左-->
<div class="jgLeft">
<div class="jgboxl" id="left_agencyinfo"></div>
<div class="blk10"></div>
<div class="jgboxl">
    <div class="jgtitl">
        <div class="Hleft">
            <a href="askAndAnswer.html">名师在线答疑</a>
        </div>
        <div class="amore">
            <a href="#">更多&gt;&gt;</a>
        </div>
    </div>
    <div class="species">
        <textarea name="ask" style="width: 207px; height: 62px;"></textarea>
        <i value="我要提问" name="PostAsk" onclick="location='askAndAnswer.html'" href="javascript:;">我要提问</i>
    </div>
</div>
<div class="blk10"></div>
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_news"></div>
</div>
<!--右-->
<div class="jgRight">
<!--div class="jgboxr">
<div id="focus">
	<ul>
        <li><a href="#" ><img src="${domain}/agency/img/index2.jpg"  /></a></li>  
        <li><a href="#" ><img src="${domain}/agency/img/index3.jpg"  /></a></li>  
        <li><a href="#" ><img src="${domain}/agency/img/index4.jpg"  /></a></li>  
        <li><a href="#" ><img src="${domain}/agency/img/index5.jpg"  /></a></li> 
	</ul>
</div>
</div-->

<div class="jgbox1" id="askList">
<#include "left_asklist.ftl">
</div>
<div class="jgbox1" id="paperList" style="margin-left:10px">
<#include "left_paperlist.ftl">
</div>
<div class="blk10"></div>
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">推荐课程</a></div><div class="amore"><a href="#">更多>></a></div></div>
<ul class="jrbox">
<#list hotList as hot>
<li>
<div class="jgimg">
<div class="igimg1"><a href="course_${hot.id}.html" ><img src="${domain}${hot.imageurl?default("/agency/img/jg1.jpg")}" /></a></div>
<i><a href="course_${hot.id}.html">${hot.coursename}</a></i>
</div>
</li>
</#list>
</ul>
</div>
<div class="blk10"></div>
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">精品试卷</a></div><div class="amore"><a href="paperList.html">更多>></a></div></div>
<ul class="jrbox">
<#list goodPaperList as paper>
<li>
<div class="jgimg">
<div class="igimg1"><a href="paper_${paper.id}.html" ><img src="${domain}${paper.imageurl?default("/agency/img/jg1.jpg")}" /></a></div>
<i><a href="paper_${paper.id}.html">${paper.paperName}</a></i>
</div>
</li>
</#list>
</ul>
</div>
<div class="blk10"></div>
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">最新课程</a></div><div class="amore"><a href="#">更多>></a></div></div>
<#list lastList as last>
<div class="jgItem1">
<div class="jgItem">
<div class="behalf"><a href="course_${last.id}.html" ><img src="${domain}${last.imageurl?default("/agency/img/jg1.jpg")}" /></a></div>
<div class="intro">
<h3><a href="course_${last.id}.html">${last.coursename}</a></h3>
<#if last.summary?length lt 100>
<i class="jj bjj">${last.summary}<a href="course_${last.id}.html" class="cRed">查看详细>></a></i>
<#else>
<i class="jj bjj">${last.summary[0..100]}...<a href="course_${last.id}.html" class="cRed">查看详细>></a></i>
</#if>
<i class="jj">价格:<span class="cRed1">￥${last.favorableprice?default("点击咨询")}</span></i>
<i class="jj"><a href="course_${last.id}.html" class="fr ljgm">立即购买</a> <a href="course_${last.id}.html" class="fr ljst">立即试听</a></i>
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
		//$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_course").load("left_course.html");
		$("#left_news").load("left_news.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
		//$("#askList").load("left_asklist.html");
		//$("#paperList").load("left_paperlist.html");
	});
</script>
</body>
</html>
