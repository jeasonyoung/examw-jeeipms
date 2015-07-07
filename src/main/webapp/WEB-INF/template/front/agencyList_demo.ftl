<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.province.province?default("全国")}-机构列表</title>
<link rel="shortcut icon" href="/agency/img/favicon.ico" />
<link rel="icon" href="/agency/img/animated_favicon.gif" type="image/gif" />
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/nav.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<style type="text/css">
#nav{position:absolute}
</style>
<![endif]-->
<script type="text/javascript" src ="/agency/img/jquery-1.8.3.min.js"></script>
<script language="javascript" src="/agency/img/common.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script language="javascript" src="/agency/img/nav.js"></script>
<script type="text/javascript">
// 定义菜单栏离页面顶部的距离，默认为200  
        var divOffsetTop = 200;  
        //滚动事件  
        window.onscroll=function(){  
            var div = document.getElementById("nav");  
            // 计算页面滚动了多少（需要区分不同浏览器）  
            var topVal = 0;  
            if(window.pageYOffset){//这一条滤去了大部分， 只留了IE678  
                topVal = window.pageYOffset;  
            }  
            else if(document.documentElement.scrollTop ){//IE678 的非quirk模式  
                topVal = document.documentElement.scrollTop;  
            }  
            else if(document.body.scrolltop){//IE678 的quirk模式  
                topVal = document.body.scrolltop;  
            }  
            if(topVal <= divOffsetTop){  
         
                div.style.position = "";  
            }  
            else {  
                div.style.position = "fixed";  
            }  
        };  
        // 页面加载完之后，计算菜单栏到页面顶部的实际距离  
        window.onload=function(){  
            var div = document.getElementById("nav");  
            divOffsetTop = offsetTop(div);  
        }; 
        
        function offsetTop( elements ){    
    		var top = elements.offsetTop;    
    		var parent  = elements.offsetParent;    
    		while( parent != null ){    
        	top += parent.offsetTop;    
        	parent = parent.offsetParent;    
   		 		};    
    		return top;    
		};   
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
<div class="logo"><img src="/agency/img/logo.gif" width="224" height="79" /></div>
<div class="search-box">
<div class="search"><span>选课程</span><input name="" type="text" class="search1" value="请输入您要搜索的关键词" /><div class="ss"><a href="#"></a></div></div>
</div>
</div>
<div class="nav">
<ul>
<#list menuList as menu>
	<#if menu.enname=="agency">
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
<ul class="zxtop2">
<li><div class="aaa">选择地区：</div><div class="xzdq">
<#if agency.province.id?exists>
<i><A href="0_${agency.category?default("0")}.html">全国</a></i>
<#list provinceList as p>
<#if p.provinceId==agency.province.provinceId>
<i><A class="cur" href="${p.provinceId?c}_${agency.category?default("0")}.html">${p.province}</a></i>
<#else>
<i><A href="${p.provinceId?c}_${agency.category?default("0")}.html">${p.province}</a></i>
</#if>
</#list>
<#else>
<i><A class="cur" href="0_${agency.category?default("0")}.html">全国</a></i>
<#list provinceList as p>
<i><A href="${p.provinceId?c}_${agency.category?default("0")}.html">${p.province}</a></i>
</#list>
</#if>
<i><A href="#">安徽</a></i>
</div></LI>
</ul>
</div>
<div class="blk10"></div>
<!--机构列表左-->
<div class="insLeft">
<div id="nav" class="leftFixed" style="top: 0px; ">
<div class="menuNav">
    <div class="navlist" id="SNmenuNav" >
    	<#list categoryList as c>	
        <dl>
            <dt class="icon" ><a href="">${c.categoryname}</a></dt>
            <dd class="menv0${c_index}">
            <#list c.childcategory as child>
                <ul class="sideleft">
                <#if child_index == 0>
                	 <li class="noline"> <b><a href="http://www.examw.com/" >${child.categoryname}</a></b>
                        <div> 
                        <#list child.childcategory as grandson>
                        <a href="#" >${grandson.categoryname}</a>
                        </#list>
                        </div>
                        <span class="clear"></span>
                    </li>
                 <#else>
                     <li><b><a href="http://www.examw.com/" >${child.categoryname}</a></b>
                        <div> 
                        <#list child.childcategory as grandson>
                        <a href="#" >${grandson.categoryname}</a>
                        </#list>
                        </div>
                        <span class="clear"></span>
                    </li>
     			 </#if>
                </ul>
            </#list>
            </dd>
        </dl>
        </#list>
    </div>
    <div class="clear"></div>
</div>
<div class="blk10"></div>
</div>
</div>
<!--机构列表右-->
<div class="insRight">
<#list page.list as agency>
<div class="insItem">
<div class="behalf"><img src="/agency/img/jg1.jpg" /></div>
<div class="intro">
<h3><a href="/agency/${agency.id?substring(21,32)}">${agency.name}</a></h3>
<i class="jj bjj">中华考试网，经济师、一级建造师、二级建造师、报关员考试等百多种考试中华考试网，经济师、一级建造师、二级建造师、报关员考试等百多种...<a href="/agency/${agency.id?substring(21,32)}/agencyInfo.html" class="cRed">查看详细>></a></i>
<i class="jj">机构地址：解放桥校区：历山路95号；历北校区：历山北路北口；石门</i>
<i class="jj">联系电话： 0531-86912018 15165159359</i>
<i class="jj">网址:<span class="wwz">http://localhost/agency/${agency.id?substring(21,32)}/</span><span class="enter"><a href="/agency/${agency.id?substring(21,32)}/">进入网站</a></span></i>
</div>
</div>
</#list>
<div class="blk10"></div>
<div class="show_page">
 ${page}
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
</body>
</html>
s