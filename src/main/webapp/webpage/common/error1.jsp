<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>全部——课程大全</title>
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/category.css" rel="stylesheet" type="text/css" />
<style>
#box_404 {
    width: 476px;
    margin: 0 auto;
    padding-top: 300px;
    background: url('/agency/img/bg-404.gif') no-repeat;
}
#title_404 {
width: 500px;
margin-left: 0;
}
.title {
height: 40px;
width: 425px;
margin-left: 15px;
position: relative;
overflow: hidden;
clear: both;
}

#title_404 span {
background: url('/agency/img/title-404.gif') no-repeat;
}
.title span {
position: absolute;
width: 100%;
height: 100%;
}
</style>
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
	<li><a href="/">首页</a></li>
	<li  class="cur"><a href="/course/">课程大全</a></li>
	<li><a href="/agency/">培训机构</a></li>
</ul>
</div>
<div class="blk10"></div>

<div class="contentx" id="content" style="background: #fff;">
        <div class="content clearfix">
            <div id="box_404"><h1 id="title_404" class="title"><span><!-- --></span>Sorry! That page doesn't seem to exist.</h1>
<p>Try clicking on the navigation to find what you're after.</p></div>        </div><!-- /.content -->
</div>
<div class="blk10"></div>
<div class="footer">
<div class="nfoot">
<a href="#">关于本站</a> | <a href="#">网站地图</a> | <a href="#">网站声明</a> | <a href="#">广告服务</a> | <a href="#">友情链接</a> | <a href="#">诚聘英才</a> | <a href="#">联系我们</a> | <a href="#">意见咨询</a> | <a href="#">返回顶部</a><br />
全国服务专线：4000-525-585 传 真：4000-525-585（拨2） 湘ICP备12004088号<br />
Copyright 2006 - 2013 中华考试网(Examw.com) All Rights Reserved <br />
</div>
</div>
<div>
</div>
<div style="display: none">
<form action="/agencyfront.do?searchCourse" method="post" id="courseform">
<input name="category.id" value="0" type="text" id="category"/>
<input name="city.fatherId" value="0" type="text" id="area"/>
<input name="coursetype" value="all" type="text" id="coursetype"/>
<input name="pageNo" value="1" type="text" id="pageNo"/>
<input name="orderBy" value="courseorder asc" type="text" id="orderBy"/>
</form>
</div>
<script type="text/javascript" src ="/agency/img/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
</body>
</html>
