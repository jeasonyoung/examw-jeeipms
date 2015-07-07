<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>全学好</title>
<base target="_blank" />
<link href="./agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="./agency/img/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src ="./agency/img/jquery-1.8.3.min.js"></script>
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

  //切换
	function switchTag(tag,content,k,n,stylea,styleb){	 
	   for(i=1; i <=n; i++){if (i==k){
	      document.getElementById(tag+i).className=stylea;
		  document.getElementById(content+i).className="Showbox";
		  }else{
		     document.getElementById(tag+i).className=styleb;
			 document.getElementById(content+i).className="Hidebox";
			 }
		}
}
</script>
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
<div class="logo"><img src="./agency/img/logo.gif" width="224" height="79" /></div>
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
	<#if menu.enname=="index">
	<li  class="cur"><a href="/">${menu.cnname}</a></li>
	<#else>
	<li><a href="/${menu.enname}/">${menu.cnname}</a></li>
	</#if>
</#list>
</ul>
</div>
<!--主体部分-->
<div class="content">
<div class="blk10"></div>
<div class="gads">
<a href="/agencycms.do?login" target="_blank"><img src="./agency/img/ad1.jpg" width="1000" height="73" usemap="#Map"/></a>
<map name="Map">
    <area shape="rect" coords="943,23,1075,61" href="../index.jsp">
</map>
</div>
<div class="blk10"></div>
<div class="leftBar">
<#list courseCategory as c>
<div class="itemBox">
<h3><i class="h01"><a href="/course/0_all_${c.id}.html">${c.categoryname}</a></i><i class="arrow"></i></h3>
<ul>
<#list c.childcategory as child>
<li><a href="/course/0_all_${child.id}.html">${child.categoryname}</a></li>
</#list>
</ul>
</div>
</#list>
</div>
<div class="rightBar">
<div class="rBox1">
<div id="focus" class="foucs">
	<ul>
        <li><a href="#" ><img src="./agency/img/main2.jpg"  /></a></li>  
        <li><a href="#" ><img src="./agency/img/main3.jpg"  /></a></li>  
        <li><a href="#" ><img src="./agency/img/main2.jpg"  /></a></li>  
        <li><a href="#" ><img src="./agency/img/main5.jpg"  /></a></li> 
	</ul>
</div>
<div class="infoBox">
<div class="reg1">
<a href="stuCenter.do?index" class="btn1">学员登录</a>
<a href="stuCenter.do?regist" class="btn2">学员注册</a>
</div>
<div class="reg2">
<h2>机构升级VIP</h2>
<h3>·显示尊贵VIP标识<div class="V"></div></h3>
<h3>·购买模版享受折上折优惠<div class="zhe"></div></h3>
</div>
</div>
</div>
<div class="blk10"></div>
<div class="rBox2">
<div class="rBtit"><div class="h02">选<span>课程</span></div>
<div class="rBbtn1" id="se_1" onMouseOver="switchTag('se_','he_list',1,2,'rBbtn1','rBbtn2');"><a href="#">面授课程</a></div>
<div class="rBbtn2" id="se_2" onMouseOver="switchTag('se_','he_list',2,2,'rBbtn1','rBbtn2');"><a href="#">网校课程</a></div>
<div class="amore"><a href="#">更多>></a></div></div>
<div id="he_list1">
<div class="rbox">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>课程名称</td>
    <td>开课时间</td>
    <td>原价</td>
    <td>优惠价</td>
    <td>免费试听</td>
    <td>报名</td>
  </tr>
  <#list faceCourse as f>
  <tr>
    <td><a href="/agency/${f.agency.id?substring(21,32)}/course_${f.id}.html" class="cBlue">${f.coursename}</a></td>
    <td>${f.opentime?string("yyyy-MM-dd")}</td>
    <td><span class="yprice">￥${f.price?default("")}</span></td>
    <td><span class="price">￥${f.favorableprice?default("")}</span></td>
    <td><a href="/agency/${f.agency.id?substring(21,32)}/course_${f.id}.html" class="st">免费试听</a></td>
    <td><a href="/agency/${f.agency.id?substring(21,32)}/course_${f.id}.html" class="buy"></a></td>
  </tr>
  </#list>
</table>
<div class="leftsj"></div>
<div class="rightsj"></div>
</div>
</div>
<div id="he_list2" class="Hidebox">
<div class="rbox">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>课程名称</td>
    <td>课时</td>
    <td>原价</td>
    <td>优惠价</td>
    <td>免费试听</td>
    <td>购买</td>
  </tr>
  <#list onlineCourse as ocourse>
  <tr>
    <td><a href="/agency/${ocourse.agency.id?substring(21,32)}/course_${ocourse.id}.html" class="cBlue">${ocourse.coursename}</a></td>
    <td>${ocourse.period}</td>
    <td><span class="yprice">￥${ocourse.price?default("")}</span></td>
    <td><span class="price">￥${ocourse.favorableprice?default("")}</span></td>
    <td><a href="/agency/${ocourse.agency.id?substring(21,32)}/course_${ocourse.id}.html" class="st">免费试听</a></td>
    <td><a href="/cartController.do?cartList&courseId=${ocourse.id}" class="buy"></a></td>
  </tr>
  </#list>
</table>
<div class="leftsj"></div>
<div class="rightsj"></div>
</div>
</div>

</div>
<div class="blk10"></div>
<div class="gads1"><img src="./agency/img/758-80.gif" width="730" height="80" /></div>
<div class="blk10"></div>

<div class="rBox2">
<div class="rBtit"><div class="h02">选<span>机构</span></div>
<div class="rBbtn1" id="si_1" onMouseOver="switchTag('si_','hi_list',1,2,'rBbtn1','rBbtn2');"><a href="#">推荐机构</a></div>
<div class="rBbtn2" id="si_2" onMouseOver="switchTag('si_','hi_list',2,2,'rBbtn1','rBbtn2');"><a href="#">最新机构</a></div>
<div class="amore"><a href="#">更多>></a></div></div>
<div id="hi_list1">
<div class="rbox">
<ul class="jigou">
<#list hotAgency as ag>
<li><a href="/agency/${ag.id?substring(21,32)}"><em><img src="${ag.imageurl}" width="124" height="50" /></em><i>${ag.name}</i></a></li>
</#list>
</ul>
<div class="leftsj"></div>
<div class="rightsj"></div>
</div>
</div>
<div id="hi_list2" class="Hidebox">
<div class="rbox">
<ul class="jigou">
<#list newAgency as ag>
<li><a href="/agency/${ag.id?substring(21,32)}"><em><img src="${ag.imageurl}"  width="124" height="50" /></em><i>${ag.name}</i></a></li>
</#list>
</ul>
<div class="leftsj"></div>
<div class="rightsj"></div>
</div>
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
