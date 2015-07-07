<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${course.category.categoryname?default("全部")}——课程大全</title>
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/category.css" rel="stylesheet" type="text/css" />
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
<#list menuList as menu>
	<#if menu.enname=="course">
	<li  class="cur"><a href="/${menu.enname}/">${menu.cnname}</a></li>
	<#elseif menu.enname=="index">
	<li><a href="/">${menu.cnname}</a></li>
	<#else>
	<li><a href="/${menu.enname}/">${menu.cnname}</a></li>
	</#if>
</#list>
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
								<#if course.city.fatherId?exists>
									<i><A   href="0_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">全国</a></i>
									<#list provinceList as p>
									<#if p.provinceId==course.city.fatherId>
									<i><A class="cur" id="curp"  href="${p.provinceId?c}_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">${p.province}</a></i>
									<#else>
									<i><A href="${p.provinceId?c}_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">${p.province}</a></i>
									</#if>
									</#list>
									<#else>
									<i><A class="cur" id="curp" href="0_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">全国</a></i>
									<#list provinceList as p>
									<i><A href="${p.provinceId?c}_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">${p.province}</a></i>
									</#list>
								</#if>
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
								<#if course.category.id?exists>
								<i><A href="${course.city.fatherId?default(0)?c}_${course.coursetype?default("all")}_0.html">全部</a></i>
								<#list categoryList as c>
								<#if c.id == course.category.id>
								<i><A class="cur" id="cur_category" href="${course.city.fatherId?default(0)?c}_${course.coursetype?default("all")}_${c.id?default("0")}.html">${c.categoryname}</a></i>
								<#else>
								<i><A href="${course.city.fatherId?default(0)?c}_${course.coursetype?default("all")}_${c.id?default("0")}.html">${c.categoryname}</a></i>
								</#if>
								</#list>
								<#else>
								<i><A class="cur" id="cur_category" href="${course.city.fatherId?default(0)?c}_${course.coursetype?default("all")}_0.html">全部</a></i>
								<#list categoryList as c>
								<i><A href="${course.city.fatherId?default(0)?c}_${course.coursetype?default("all")}_${c.id?default("0")}.html">${c.categoryname}</a></i>
								</#list>
								</#if>
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
<#if course.city.fatherId?exists>
	<#list cityList as city>
	<#if city.cityId==course.city.cityId?default(0)>
	<i><A class="cur" href="${city.cityId?c}_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">${city.city}</a></i>
	<#else>
	<i><A href="${city.cityId?c}_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">${city.city}</a></i>
	</#if>
	</#list>
	<#else>
	<#list provinceList as p>
	<i><A href="${p.provinceId?c}_${course.coursetype?default("all")}_${course.category.id?default("0")}.html">${p.province}</a></i>
	</#list>
</#if>
</div></LI></ul>
<ul class="zxtop2">
<li><div class="aaa">学习方式：</div><div class="xzdq">
<#if course.coursetype?exists>
<#if course.coursetype="0">
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_all_${course.category.id?default("0")}.html">全部</a></i>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_0_${course.category.id?default("0")}.html"  class="cur">面授</a></i>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_1_${course.category.id?default("0")}.html">网校</a></i>
<#else>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_all_${course.category.id?default("0")}.html">全部</a></i>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_0_${course.category.id?default("0")}.html" >面授</a></i>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_1_${course.category.id?default("0")}.html"  class="cur">网校</a></i>
</#if>
<#else>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_all_${course.category.id?default("0")}.html" class="cur">全部</a></i>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_0_${course.category.id?default("0")}.html">面授</a></i>
<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_1_${course.category.id?default("0")}.html">网校</a></i>
</#if>
</div></LI></ul>
<ul class="zxtop2">
<li><div class="aaa">选择类别：</div>
<div class="xzdq">
<#if course.category.id?exists>
	<#list children as child>
	<#if child.id==course.category.id?default(0)>
	<i><A class="cur" href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_${course.coursetype?default("all")}_${child.id?default("0")}.html">${child.categoryname}</a></i>
	<#else>
	<i><A href="${course.city.cityId?default(course.city.fatherId?default(0))?c}_${course.coursetype?default("all")}_${child.id?default("0")}.html">${child.categoryname}</a></i>
	</#if>
	</#list>
	<#else>
	<#list categoryList as c>
	<i><A href="${course.city.fatherId?default(0)?c}_${course.coursetype?default("all")}_${c.id?default("0")}.html">${c.categoryname}</a></i>
	</#list>
</#if>
</div></LI></ul>
</div>
<div class="classList">
<ul class="kbox">
<#list page.list as course>
<#if course.coursetype="0" >
<li>
<div class="item1">
<span><a href="/agency/${course.agency.id?substring(21,32)}/course_${course.id}.html" target="_bank"><img src="/agency/img/1.jpg" width="" height="" /></a></span>
<h2><a href="/agency/${course.agency.id?substring(21,32)}/course_${course.id}.html" target="_bank">${course.coursename}</a></h2>
<h2><em class="price">￥${course.favorableprice?default("")}</em><em class="pricey"><a href="/agency/${course.agency.id?substring(21,32)}/course_${course.id}.html">马上报名</a></em></h2>
<h2>已有<em class="xl">${course.buycount}</em>人报名  <a href="#" class="cBlue">评论数${course.commentcount}</a></h2>
<h3>
<#if course.opentime?exists>
<em class="fl">开课时间：${course.opentime?string("yyyy-MM-dd")}</em>
<#else>
<em class="fl">开课时间：随到随学</em>
</#if>
<em class="fr">城市：${course.city.city?default("")}</em></h3>
<div class="clear"></div>
<div class="hot"></div>
</div>
</li>
<#else>
<li>
<div class="item1">
<span><a  href="/agency/${course.agency.id?substring(21,32)}/course_${course.id}.html" target="_bank" ><img src="/agency/img/1.jpg" width="" height="" /></a></span>
<h2><a  href="/agency/${course.agency.id?substring(21,32)}/course_${course.id}.html" target="_bank" >${course.coursename}</a></h2>
<h2><em class="price">￥${course.favorableprice?default("")}</em><em class="pricey"><a href="/agency/${course.agency.id?substring(21,32)}/course_${course.id}.html">马上报名</a></em></h2>
<h2>已有<em class="xl">${course.buycount?default("0")}</em>人报名  <a href="#" class="cBlue">评论数${course.commentcount?default("0")}</a></h2>
<h3><em class="fl">中华考试网</em><em class="fr"></em></h3>
<div class="clear"></div>
<div class="wxkc"></div>
</div>
</li>
</li>
</#if>
</#list>
</ul>
<div class="show_page">
${page}
 </div>

</div>
</div>
<div class="blk10"></div>
<div class="footer" id="footer_about">

</div>
<div>
</div>
<div style="display: none">
<form action="/agencyfront.do?searchCourse" method="post" id="courseform">
<input name="category.id" value="${course.category.id?default("0")}" type="text" id="category"/>
<input name="city.fatherId" value="${course.city.fatherId?default(0)?c}" type="text" id="area"/>
<input name="coursetype" value="${course.coursetype?default("all")}" type="text" id="coursetype"/>
<input name="pageNo" value="${page.pageNo?default("")}" type="text" id="pageNo"/>
<input name="orderBy" value="${page.orderBy?default("")}" type="text" id="orderBy"/>
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
		$("#courseform").submit();
	}
	$(function(){
		$("#footer_about").load("/common/footer_about.html");
	if($("#curp").length>0){
		if($("#curp").html()=='全国')
		{$("#province").html("请选地区<B></B>");}
		else{
			$("#province").html($("#curp").html()+"<B></B>");
		}
	}
	if($("#cur_category").length>0){
		if($("#cur_category").html()=='全部'){
			$("#m_category").html("请选类别<B></B>");
		}else
			$("#m_category").html($("#cur_category").html()+"<B></B>");
	}		
	});
	</script>
</body>
</html>
