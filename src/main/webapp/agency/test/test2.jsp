<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link href="agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="agency/img/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src ="agency/img/jquery-1.8.3.min.js"></script>
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
<li class="cur"><a href="#">首页</a></li>
<li><a href="#">课程大全</a></li>
<li><a href="#">培训机构</a></li>
</ul>
</div>
<!--主体部分-->
<div class="content">
<div class="blk10"></div>
<div class="gads"><img src="agency/img/ad1.jpg" width="1000" height="73" /></div>
<div class="blk10"></div>
<div class="leftBar">
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">造价工程师</a></li>
<li><a href="#">造价员</a></li>
<li><a href="#">结构工程师</a></li>
<li><a href="#">投资项目管理</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
<div class="hl-item Hidebox">
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
<div class="itemBox">
<h3><i class="h01"><a href="#">会计类</a></i><i class="arrow"></i></h3>
<ul>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
<li><a href="#">一级建造师</a></li>
</ul>
</div>
</div>
<div class="rightBar">
<div class="rBox1">
<div id="focus" class="foucs">
	<ul>
        <li><a href="#" ><img src="agency/img/main2.jpg"  /></a></li>  
        <li><a href="#" ><img src="agency/img/main3.jpg"  /></a></li>  
        <li><a href="#" ><img src="agency/img/main2.jpg"  /></a></li>  
        <li><a href="#" ><img src="agency/img/main5.jpg"  /></a></li> 
	</ul>
</div>
<div class="infoBox">
<div class="reg1">
<a href="#" class="btn1">用户登录</a>
<a href="#" class="btn2">用户注册</a>
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
<div class="rBtit"><div class="h02">选<span>机构</span></div>
<div class="rBbtn1" id="se_1" onMouseOver="switchTag('se_','he_list',1,2,'rBbtn1','rBbtn2');"><a href="#">网校课程</a></div>
<div class="rBbtn2" id="se_2" onMouseOver="switchTag('se_','he_list',2,2,'rBbtn1','rBbtn2');"><a href="#">面授课程</a></div>
<div class="amore"><a href="#">更多>></a></div></div>
<div id="he_list1">
<div class="rbox">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>课程名称</td>
    <td>课时</td>
    <td>原价</td>
    <td>优惠价</td>
    <td>免费试听</td>
    <td>报名</td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
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
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
  <tr>
    <td><a href="#" class="cBlue">一级建造师VIP保过套餐班</a></td>
    <td>192</td>
    <td><span class="yprice">￥3000</span></td>
    <td><span class="price">￥1500</span></td>
    <td><a href="#" class="st">免费试听</a></td>
    <td><a href="#" class="buy"></a></td>
  </tr>
</table>
<div class="leftsj"></div>
<div class="rightsj"></div>
</div>
</div>

</div>
<div class="blk10"></div>
<div class="gads1"><img src="agency/img/758-80.gif" width="730" height="80" /></div>
<div class="blk10"></div>

<div class="rBox2">
<div class="rBtit"><div class="h02">选<span>机构</span></div>
<div class="rBbtn1" id="si_1" onMouseOver="switchTag('si_','hi_list',1,2,'rBbtn1','rBbtn2');"><a href="#">网校课程</a></div>
<div class="rBbtn2" id="si_2" onMouseOver="switchTag('si_','hi_list',2,2,'rBbtn1','rBbtn2');"><a href="#">面授课程</a></div>
<div class="amore"><a href="#">更多>></a></div></div>
<div id="hi_list1">
<div class="rbox">
<ul class="jigou">
<li><a href="#"><em><img src="agency/img/a1.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a2.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a3.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a4.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a5.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a6.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a7.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a8.jpg" /></em><i>环球网校</i></a></li>
</ul>

<div class="leftsj"></div>
<div class="rightsj"></div>
</div>
</div>
<div id="hi_list2" class="Hidebox">
<div class="rbox">
<ul class="jigou">
<li><a href="#"><em><img src="agency/img/a1.jpg" /></em><i>环g球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a2.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a3.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a4.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a5.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a6.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a7.jpg" /></em><i>环球网校</i></a></li>
<li><a href="#"><em><img src="agency/img/a8.jpg" /></em><i>环球网校</i></a></li>
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
<div class="footer">
<div class="nfoot map">
<ul>
<h3>新手指南</h3>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&nbsp;</li>
<li>&nbsp;</li>
<li>&nbsp;</li>
<li>&nbsp;</li>
</ul>
<ul>
<h3>新手指南</h3>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
</ul>
<ul>
<h3>新手指南</h3>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&nbsp;</li>
<li>&nbsp;</li>
</ul>
<ul>
<h3>新手指南</h3>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&nbsp;</li>
<li>&nbsp;</li>
</ul>
<ul>
<h3>新手指南</h3>
<li>&raquo; <a href="#">购买流程</a></li>
<li>&raquo; <a href="#">常见问题</a></li>
<li>&nbsp;</li>
<li>&nbsp;</li>
<li>&nbsp;</li>
<li>&nbsp;</li>
</ul>

<span class="fl wlogo">
<img src="agency/img/logo.gif" width="224" height="79" /> <br />
官方客服电话：4000-525-585<br />
周一到周日<br />
</span>
</div>
</div>
<div class="blk10"></div>
<div class="footer">
<div class="nfoot link">
友情链接：<a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a> <a href="#">中关村下载</a>
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
</body>
</html>
