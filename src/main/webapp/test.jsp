<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="context/context.jsp"%>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>课程列表</title>
<link href="agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="agency/img/top_footer.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="topx">
<div class="top">
<div class="t1"><a href="#">首页</a> |  <a href="#" class="ks1">快速选课</a> |  <a href="#" class="ks2">网校列表</a></div>
<div class="t3"><a href="#">报名流程</a> | <a href="#">常见问题</a> | <a href="#">交易安全</a></div>
<div class="t2">您好，请<a href="#" class="bold">登录</a> <a href="#" class="bold">注册</a>（<a href="#" cl class="cRed1 bold">进入会员中心</a>）</div>
</div>
</div>
<div class="header">
<div class="logo"><img src="agency/img/logo.gif" width="224" height="79" /></div>
<div class="search-box">
<div class="search"><span>选课程</span><input name="" type="text" class="search1" value="请输入您要搜索的关键词" /><div class="ss"><a href="#"></a></div></div>
</div>
</div>
<div class="nav">
<ul>
<c:forEach items=""></c:forEach>
</ul>
</div>
<div class="blk10"></div>
<div class="contentx">
<div class="classList ret">
<h1>课程列表</h1>
<ul class="zxtop2">
<li><div class="aaa">选择地区：</div><div class="xzdq"><i><A href="#" class="cur">全国</a></i><i><A href="#">安徽</a></i><i><A href="#">北京</a></i><i><A href="#">福建</a></i><i><A href="#">甘肃</a></i><i><A href="#">广东</a></i><i><A href="#">广西</a></i><i><A href="#">贵州</a></i><i><A href="#">海南</a></i><i><A href="#">河北</a></i><i><A href="#">河南</a></i><i><A href="#">湖北</a></i><i><A href="#">湖南</a></i><i><A href="#">吉林</a></i><i><A href="#">江苏</a></i><i><A href="#">江西</a></i><i><A href="#">辽宁</a></i><i><A href="#">宁夏</a></i><i><A href="#">青海</a></i><i><A href="#">山东</a></i><i><A href="#">山西</a></i><i><A href="#">陕西</a></i><i><A href="#">上海</a></i><i><A href="#">天津</a></i><i><A href="#">浙江</a></i><i><A href="#">四川</a></i><i><A href="#">重庆</a></i><i><A href="#">云南</a></i><i><A href="#">新疆</a></i><i><A href="#">西藏</a></i><i><A href="#">黑</a></i><i><A href="#">蒙</a></i></div></LI>
        </ul>
<ul class="zxtop2">
<li><div class="aaa">学习方式：</div><div class="xzdq"><i><A href="#" class="cur">全部</a></i><i><A href="#">面授</a></i><i><A href="#">网校</a></i></div></LI>
        </ul>
<ul class="zxtop2">
<li><div class="aaa">选择课程：</div><div class="xzdq"><i><A href="#" class="cur">全部</a></i><i><A href="#">公务员</a></i><i><A href="#">建筑类</a></i><i><A href="#">医药类</a></i><i><A href="#">职业资格类</a></i><i><A href="#">学历类</a></i><i><A href="#">会计类</a></i><i><A href="#">外语类</a></i><i><A href="#">外贸类</a></i><i><A href="#">计算机类</a></i></div></LI>
        </ul>
</div>

<div class="classList">
<ul class="kbox">
<c:forEach items="${page.list}" var="course">
<c:if test="course.coursetype=='0'">
<li>
<div class="item1">
<span><img src="agency/img/1.jpg" width="" height="" /></span>
<h2><a href="#">${course.coursename}</a></h2>
<h2><em class="price">￥250</em><em class="pricey"><a href="#">马上报名</a></em></h2>
<h2>已有<em class="xl">100</em>人报名  <a href="#" class="cBlue">评论数52</a></h2>
<h3><em class="fl">开课时间：2013-08-31</em><em class="fr">城市：长沙</em></h3>
<div class="clear"></div>
<div class="hot"></div>
</div>
</li>
</c:if>
<c:if test="course.coursetype=='1'">
<li>
<div class="item1">
<span><img src="agency/img/1.jpg" width="" height="" /></span>
<h2><a href="#">${course.coursename}</a></h2>
<h2><em class="price">￥250</em><em class="pricey"><a href="#">马上报名</a></em></h2>
<h2>已有<em class="xl">100</em>人报名  <a href="#" class="cBlue">评论数52</a></h2>
<h3><em class="fl">中华考试网</em><em class="fr"></em></h3>
<div class="clear"></div>
<div class="wxkc"></div>
</div>
</li>
</c:if>
</c:forEach>
</ul>
<div class="show_page">
${page}
 <span class="disabled">< </span><a href="#?page=2">首页</a><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=200">尾页</a><a href="#?page=2">
 > </a><span>第</span><input name="Page" value="2" type="text" size="3"><span>页</span><span class="btn1"><a href="#">提交</a></span>
</div>
</div>
</div>
<div class="blk10"></div>
<div class="footer">
<div class="nfoot">
<a href="#">关于本站</a> | <a href="#">网站地图</a> | <a href="#">网站声明</a> | <a href="#">广告服务</a> | <a href="#">友情链接</a> | <a href="#">诚聘英才</a> | <a href="#">联系我们</a> | <a href="#">意见咨询</a> | <a href="#">返回顶部</a><br />
全国服务专线：4000-525-585 传 真：4000-525-585（拨2） 湘ICP备12004088号<br />
Copyright 2006 - 2013 中华考试网(Examw.com) All Rights Reserved <br />
</div>
</div>
<div style="display: none">
<form action="" method="post" id="course">
<input name="coursecategory.id" value="${course.coursecategory.id}" type="text" id="category"/>
<input name="city.fatherid" value="${course.city.fatherid}" type="text" id="area"/>
<input name="coursetype" value="${course.coursetype}" type="text" id="coursetype"/>
<input name="pageNo" value="${page.pageNo}" type="text" id="pageNo"/>
<input name="orderBy" value="1" type="text" id="orderBy"/>
</form>
</div>
<script type="text/javascript" src ="/agency/img/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert($(input['name=orderBy']).val())
	});
	function page(n){
		$("#pageNo").val(n);
		$("#course").submit("agencyfront.do?course");
	}
</script>
</body>
</html>
