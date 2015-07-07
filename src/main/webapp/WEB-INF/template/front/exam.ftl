<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${exam.examTitle}</title>
<link href="/plug-in/ksbd/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/plug-in/ksbd/img/ksbd.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src ="/plug-in/jquery/jquery-1.8.3.min.js"></script>
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
<div class="logo"><img src="/plug-in/ksbd/img/logo.gif" width="224" height="79" /></div>
<div class="search-box">
<div class="search"><span>考试宝典</span><input name="" type="text" class="search1" value="请输入您要搜索的关键词" /><div class="ss"><a href="#"></a></div></div>
</div>
<div class="time"><img src="/plug-in/ksbd/img/time.gif" align="absmiddle" width="205" height="84" /></div>
</div>
<div class="nav">
<DIV id=menu>
<UL>
  <#list list as menu>
  <LI><A>${menu.examCname}</A> 
  <DL style="DISPLAY: none">
  <#list menu.examList as child>
  <DD><A href="/ksbd/${child.examEname}" target=_blank>${child.examCname}</A></DD>
  </#list>
  </DL>
  </LI>
  </#list>
 <span style="float: right; padding-right:20px;"><a href="/ksbd" ><img alt="返回首页" title="返回首页"  src="/plug-in/ksbd/img/index.gif"></a></span>
 </UL>
</DIV><!--导航效果------><br />
<SCRIPT type=text/javascript>
    /*导航效果*/
    $("#menu ul li").mouseover(function () {
        $(this).addClass("active");
        $(this).find("dl").show();
    })
    $("#menu ul li").mouseout(function () {
        $(this).find("dl").hide();
        $(this).removeClass("active");
    })
</SCRIPT>
</div>
<!--主体部分-->
<div class="content">
 <div class="soft_list">
<div class="lt">
 
<h1>${exam.pexam.examCname}-${exam.examCname}</h1>
<dl>
  <#list examList as menu>
  <#if menu.examEname==exam.examEname>
  <dd class="at"><a href="/ksbd/${menu.examEname}" target="_blank">${menu.examCname}（${menu.ksbd?size}）</a></dd>
  <#else>
  <dd><a href="/ksbd/${menu.examEname}" target="_blank">${menu.examCname}（${menu.ksbd?size}）</a></dd>
  </#if>
  </#list>
</dl></div>
<div class="ri">
<div class="chanpin">
<div class="cp_top"><span>${exam.examCname}</span>
<li>查看</li>
<li>产品价格</li>
<li>试题量</li>
<li></li>
<li>立即下载</li></div>
<#list ksbdlist as ksbd>
<div class="cp_list"><span><a title="${ksbd.ksbdCname}" href="${ksbd.savepath}" target="_blank">${ksbd.ksbdCname}</a></span> 
<li><a title="产品详细信息target=_blank" href="${ksbd.savepath}">详细信息</a></li>
<li style="COLOR: red">￥${ksbd.goodPrice}元</li>
<li>${ksbd.questionNum}题</li>
<li style="width:200"></li>
<li class="down" style="width:200"><a href="${ksbd.dxUrl}" target="_blank" title="点击右键选择目标另存为，或用迅雷下载更迅速"><img src="/plug-in/ksbd/img/rar.gif" border="0">点此立即下载</a></li></div>
</#list>
</div>
<div class="cp_list_space"></div></div></div>
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
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript" >
	$(function(){
		$("#footer_nav").load("/common/footer_nav.html");
		$("#footer_link").load("/common/footer_link.html");
		$("#footer_about").load("/common/footer_about.html");
	})
</script>
</body>
</html>
