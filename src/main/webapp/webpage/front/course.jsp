<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>课程列表</title>
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/category.css" rel="stylesheet" type="text/css" />
<style type="text/css">
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
<div class="logo"><img src="agency/img/logo.gif" width="224" height="79" /></div>
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
<li class="cur"><a href="/course/">课程大全</a></li>
<li><a href="/agency/">培训机构</a></li>
</ul>
</div>
<div class="blk10"></div>
<div class="contentx">
<div class="classList ret">
<div id=page>
	<div class="chl-poster simple" id=header>
		<div id=site-nav>
			<UL class=quick-menu>
			  <LI class="mytaobao menu-item">
				  <div class=menu>
					  <A class=menu-hd href="#" target=_top rel=nofollow id="province">选择地区<B></B></A> 
					  <div class=menu-bd>
						  <div class=menu-bd-panel>
							  <div class="xzdq">
								<c:forEach items="${provinceList}" var="p" varStatus="index">
								<c:if test="${p.provinceId eq course.city.fatherId}">
								<i><A href="/course/${p.provinceId}_${course.coursetype}_${course.category.id}.html" class="cur" id="curp">${p.province}</a></i>
								</c:if>
								<c:if test="${p.provinceId ne course.city.fatherId}">
								<i><A href="/course/${p.provinceId}_${course.coursetype}_${course.category.id}.html">${p.province}</a></i>
								</c:if>
								</c:forEach>
							 </div>
						  </div>
						  <S class=r></S><S class=rt></S><S class=lt></S><S class=b></S><S class="b b2"></S><S class=rb></S><S class=lb></S>
					  </div>
				  </div>
			  </LI>
			  <LI class="services menu-item last">
				  <div class=menu>
					  <A class=menu-hd href="#" target=_top id="m_category">选择类别<B></B></A> 
					  <div class=menu-bd style="WIDTH: 340px; HEIGHT: 80px; _width: 202px">
						  <div class=menu-bd-panel>
							<div class="xzdq">
								<c:forEach items="${categoryList}" var="c" varStatus="index">
								<c:if test="${c.id eq course.category.id}">
								<i><A href="/course/${course.city.fatherId}_${course.coursetype}_${c.id}.html" class="cur" id="cur_category">${c.categoryname}</a></i>
								</c:if>
								<c:if test="${c.id ne course.category.id}">
								<i><A href="/course/${course.city.fatherId}_${course.coursetype}_${c.id}.html" >${c.categoryname}</a></i>
								</c:if>
								</c:forEach>
							</div>	
						  </div>
						  <S class=r></S><S class=rt></S><S class=lt></S><S class=b style="WIDTH: 169px"></S><S class="b b2" style="WIDTH: 169px"></S><S class=rb></S><S class=lb></S>
					  </div>
				  </div>
			  </LI>
		    </UL>
		</div>
	</div>
</div>
<ul class="zxtop2">
<li><div class="aaa">选择地区：</div>
<div class="xzdq">
<c:if test="${!empty cityList }">
<c:forEach items="${cityList}" var="c" varStatus="index">
<c:if test="${c.cityId eq course.city.cityId}">
<i><A href="/course/${c.cityId}_${course.coursetype}_${course.category.id}.html" class="cur">${c.city}</a></i>
</c:if>
<c:if test="${c.cityId ne course.city.fatherId}">
<i><A href="/course/${c.cityId}_${course.coursetype}_${course.category.id}.html">${c.city}</a></i>
</c:if>
</c:forEach>
</c:if>
<c:if test="${empty cityList }">
<c:forEach items="${provinceList}" var="p" varStatus="index">
<c:if test="${p.provinceId eq course.city.fatherId}">
<i><A href="/course/${p.provinceId}_${course.coursetype}_${course.category.id}.html" class="cur">${p.province}</a></i>
</c:if>
<c:if test="${p.provinceId ne course.city.fatherId}">
<i><A href="/course/${p.provinceId}_${course.coursetype}_${course.category.id}.html">${p.province}</a></i>
</c:if>
</c:forEach>
</c:if>
</div>
</ul>
<ul class="zxtop2">
<li><div class="aaa">学习方式：</div><div class="xzdq">
<c:if test="${course.coursetype eq 'all'}">
<i><A href="/course/${course.city.fatherId}_all_${course.category.id}.html" class="cur">全部</a></i>
<i><A href="/course/${course.city.fatherId}_0_${course.category.id}.html">面授</a></i>
<i><A href="/course/${course.city.fatherId}_1_${course.category.id}.html">网校</a></i>
</c:if>
<c:if test="${course.coursetype eq '0'}">
<i><A href="/course/${course.city.fatherId}_all_${course.category.id}.html" >全部</a></i>
<i><A href="/course/${course.city.fatherId}_0_${course.category.id}.html" class="cur">面授</a></i>
<i><A href="/course/${course.city.fatherId}_1_${course.category.id}.html">网校</a></i>
</c:if>
<c:if test="${course.coursetype eq '1'}">
<i><A href="/course/${course.city.fatherId}_all_${course.category.id}.html" >全部</a></i>
<i><A href="/course/${course.city.fatherId}_0_${course.category.id}.html">面授</a></i>
<i><A href="/course/${course.city.fatherId}_1_${course.category.id}.html" class="cur">网校</a></i>>
</c:if>
</div>
</li>
</ul>
<ul class="zxtop2"><li><div class="aaa">选择课程：</div><div class="xzdq">
<c:forEach items="${categoryList}" var="c" varStatus="index">
<c:if test="${c.id eq course.category.id}">
<i><A href="/course/${course.city.fatherId}_${course.coursetype}_${c.id}.html" class="cur" >${c.categoryname}</a></i>
</c:if>
<c:if test="${c.id ne course.category.id}">
<i><A href="/course/${course.city.fatherId}_${course.coursetype}_${c.id}.html" >${c.categoryname}</a></i>
</c:if>
</c:forEach>
</div></LI></ul>
</div>
<div class="classList">
<ul class="kbox">
<c:forEach items="${page.list}" var="course">
<c:if test="${course.coursetype eq '0'}">
<li>
<div class="item1">
<span><img src="agency/img/1.jpg" width="" height="" /></span>
<h2><a href="#">${course.coursename}</a></h2>
<h2><em class="price">${course.favorableprice}</em><em class="pricey"><a href="/agency/${fn:substring(course.agency.id,21,32)}/course_${course.id}.html">马上报名</a></em></h2>
<h2>已有<em class="xl">${course.buycount}</em>人报名  <a href="#" class="cBlue">评论数${course.commentcount}</a></h2>
<h3><em class="fl">开课时间：2013-08-31</em><em class="fr">城市：${course.city.city}</em></h3>
<div class="clear"></div>
<div class="hot"></div>
</div>
</li>
</c:if>
<c:if test="${course.coursetype eq '1'}">
<li>
<div class="item1">
<span><img src="agency/img/1.jpg" width="" height="" /></span>
<h2><a href="#">${course.coursename}</a></h2>
<h2><em class="price">${course.favorableprice}</em><em class="pricey"><a href="/agency/${fn:substring(course.agency.id,21,32)}/course_${course.id}.html">马上报名</a></em></h2>
<h2>已有<em class="xl">${course.buycount}</em>人报名  <a href="#" class="cBlue">评论数${course.commentcount}</a></h2>
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
</div>
</div>
</div>
<div class="blk10"></div>
<%@ include file="../common/footer_about.jsp"%> 
<div style="display: none">
<form action="/agencyfront.do?searchCourse" method="post" id="coursefrom">
<input name="category.id" value="${course.category.id}" type="text" id="category"/>
<input name="city.fatherId" value="${course.city.fatherId}" type="text" id="area"/>
<input name="coursetype" value="${course.coursetype}" type="text" id="coursetype"/>
<input name="pageNo" value="${page.pageNo}" type="text" id="pageNo"/>
<input name="orderBy" value="${page.orderBy}" type="text" id="orderBy"/>
</form>
</div>
<script type="text/javascript" src ="/agency/img/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript">
	function page(n){
		if(n==""){
			n=1;
		}
		$("#pageNo").val(n);
		$("#coursefrom").submit();
	}
	$(function(){
		var  s =$("#curp").html();
		$("#province").html(s+"<B></B>");
		$("#m_category").html($("#cur_category").html()+"<B></B>");
	});
</script>
</body>
</html>
