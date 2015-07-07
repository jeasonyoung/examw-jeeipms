<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${ksbd.ksbdTitle}</title>
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
<div class="wbody">
<div class="clearfix"></div>
<div class="jianjie">
<div class="title01 c_o"><strong>${ksbd.updateTime}</strong></div>
<div class="jianjienr">
<div class="jianjienr_left">
<img src="/plug-in/ksbd/img/pci.jpg">
<div class="youhui"><span>优惠价：${ksbd.price}元/套</span></div>
</div>
<div class="jianjienr_right">
<table cellspacing="0" cellpadding="0" class="biaoge">
<tbody> 
<tr height="30">
<td width="224">软件版本：<span>${ksbd.ksbdVersion}</span> </td>
<td width="374">更新时间：<span>${ksbd.addTime}</span></td>
</tr>
<tr height="30">
<td>软件性质：<span>收费软件</span> </td>
<td>安全认证：<span>瑞星、360、卡巴斯基已通过</span></td>
</tr>  
<tr height="30">
<td>推荐指数：<img src="/plug-in/ksbd/img/xing.gif"><img src="/plug-in/ksbd/img/xing.gif"><img src="/plug-in/ksbd/img/xing.gif"><img src="/plug-in/ksbd/img/xing.gif"><img src="/plug-in/ksbd/img/xing.gif"></td>

<td>运行环境：<span>WinXP/Vista/Win7/2000/2003</span></td>
</tr>  
<tr height="30">
<td width="224">解题思路：<span>有</span> </td>
<td width="374">历年真题：<span>没有</span></td>
</tr>
<tr height="30">
<td>软件价格：<span><strong>${ksbd.goodPrice}</strong>元</span></td>
<td>试题数量：<span>${ksbd.questionNum}道</span></td>
</tr>  
<tr height="30">
<td colspan="2" align="center"><a href="http://test.examw.com/user/ShopCart/?SoftID=381" target="_blank"><img src="/plug-in/ksbd/img/BuyBD.gif"></a>&nbsp;&nbsp;  <a href="http://jump.ksbao.com/down.aspx?c=ksbd&amp;n=ZC_JYJSS&amp;a=100329-1&amp;f=agent&amp;t=1" target="_blank"><img src="/plug-in/ksbd/img/dxxz.gif"></a>&nbsp;&nbsp;  <a href="http://jump.ksbao.com/down.aspx?c=ksbd&amp;n=ZC_JYJSS&amp;a=100329-1&amp;f=agent&amp;t=2" target="_blank"><img src="/plug-in/ksbd/img/wtxz.gif"></a></td>
</tr>
  
<tr height="30">
<td colspan="2"><span style=" float:left; margin-top:15px; color:#333;">购买流程：</span><img src="/plug-in/ksbd/img/lc.gif" style="margin-top:7px;"></td>

</tr>  

<tr>
<td colspan="2" style=" text-align:left;">
</td>
</tr>       
</tbody>
</table>  
</div>
</div>
</div>
<div class="rjjj">
<div class="titile01">
<div class="titile01_left">
${ksbd.ksbdIntro}

</div>
<div class="titile01_right"><img src="/plug-in/ksbd/img/title_bg.jpg"></div>
</div>

</div>
<div class="rjjj">
<div class="title02" style=" margin:10px;"><img src="/plug-in/ksbd/img/zi2.gif"></div>
<div class="gongneng">
<table cellspacing="0" cellpadding="0" class="gongneng1">

<tbody> 
<tr class="ys">
<td width="85" align="center"><img src="/plug-in/ksbd/img/t1.gif"></td>
<td width="374"><span>免费升级</span><br>我们根据每年最新考试大纲提供及时更新升级服务，我们郑重承诺，只要您不更换电脑，我们将提供终身免费升级。</td>
</tr>
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t2.gif"></td>
<td><span>人机对话</span><br>输入任意准考证号后进入全真模拟上机考试系统，仿真考试界面，无限次自动组卷，让您身临其境感受真实考场氛围。</td>

</tr> 
<tr class="ys">
<td align="center"><img src="/plug-in/ksbd/img/t3.gif"></td>
<td><span>智能阅卷</span><br>答题完毕后，软件自动批阅并显示得分、用红色标记答错试题，并显示答题的正确率。</td>

</tr> 
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t4.gif"></td>
<td><span>试题过滤</span><br>输入任意准考证号后进入全真模拟上机考试系统，仿真考试界面，无限次自动组卷，让您身临其境感受真实考场氛围。</td>
</tr> 
<tr class="ys">
<td align="center"><img src="/plug-in/ksbd/img/t5.gif"></td>
<td><span>打印功能</span><br>答题完毕后，软件自动批阅并显示得分、用红色标记答错试题，并显示答题的正确率。</td>

</tr> 
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t6.gif"></td>
<td><span>温故知新</span><br>输入任意准考证号后进入全真模拟上机考试系统，仿真考试界面，无限次自动组卷，让您身临其境感受真实考场氛围。</td>

</tr> 
<tr class="ys">
<td align="center"><img src="/plug-in/ksbd/img/t7.gif"></td>
<td><span>试题查找</span><br>就某个知识点进行查找，将包含此知识点的所有试题进行汇总出题，针对性强。</td>
</tr> 
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t8.gif"></td>
<td><span>个性设置</span><br>字号自由放大缩小，使您的阅读更轻松；您可以将答题背景设置为您喜欢的颜色，减少阅读疲劳。可以针对每种题型设置分值。</td>

</tr>      
</tbody>
</table>
<table cellspacing="0" cellpadding="0" class="gongneng1">

<tbody> 
<tr class="ys">
<td width="82" align="center"><img src="/plug-in/ksbd/img/t1.gif"></td>
<td width="377"><span>模拟考场</span><br>
  试题经专业人员精心选择，可以根据需要指定试题科目、试题范围、试题来源、各种题型的题量进行自由组卷，可自主设置每种题型的分值，测试结交后系统给出总分和答题正确率。</td>
</tr>
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t9.gif"></td>
<td><span>章节练习</span><br>

  按考试的科目进行分类练习，针对性强，覆盖了应考的全部知识点，可根据需要显示答案或隐藏答案，测试完毕给出答题正确率。</td>

</tr> 
<tr class="ys">
<td align="center"><img src="/plug-in/ksbd/img/t10.gif"></td>
<td><span>错题重做</span><br>
  软件记录下每次答题情况，您可以将错题重新调出重做，反复刺激，加深印象。</td>
</tr> 
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t11.gif"></td>
<td><span>解题思路</span><br>
  重点试题提供专业级的解题思路，让您掌握各类答题技巧。</td>

</tr> 
<tr class="ys">
<td align="center"><img src="/plug-in/ksbd/img/t12.gif"></td>
<td><span>统计分析</span><br>
  软件以列表、走势图显示得分、正确率，可以按考试科目分类显示，使您可以针对薄弱环节进行加强训练。</td>
</tr> 
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t13.gif"></td>
<td><span>试题收藏</span><br>
  按考试的科目进行分类练习，针对性强，覆盖了应考的全部知识点，可根据需要显示答案或隐藏答案，测试完毕给出答题正确率。</td>
</tr> 


<tr class="ys">
<td align="center"><img src="/plug-in/ksbd/img/t14.gif"></td>
<td><span>数据备份</span><br>
  软件以列表、走势图显示得分、正确率，可以按考试科目分类显示，使您可以针对薄弱环节进行加强训练。</td>
</tr> 
<tr>
<td align="center"><img src="/plug-in/ksbd/img/t15.gif"></td>
<td><span>数据恢复</span><br>
  系统重装后，可以轻松从已经备份文件中恢复您的答题记录、精华试题、已经收藏试题。<br></td>
</tr>      
</tbody>

</table>
</div>


</div>
<div class="rjjj">
<div class="titile3"></div>

<div class="clearfix"></div>
<div style="margin-bottom: 6px;clear:both; margin:5px;">

      <table border="0" cellpadding="0" cellspacing="0" width="960">
  <tbody>
  <tr>
    <td><img src="/plug-in/ksbd/img/3335.gif" width="960" height="132" alt=""></td>
  </tr>
  <tr>
    <td><img src="/plug-in/ksbd/img/2011101837.gif" width="960" height="92" alt=""></td>
  </tr>
  <tr>
    <td><img src="/plug-in/ksbd/img/2011101838.gif" width="960" height="122" alt=""></td>
  </tr>
  <tr>
    <td><img src="/plug-in/ksbd/img/2011101839.gif" width="960" height="87" alt=""></td>
  </tr>
  <tr>
    <td><img src="/plug-in/ksbd/img/2011101840.gif" width="960" height="119" alt=""></td>
  </tr>
  <tr>
    <td><img src="/plug-in/ksbd/img/2011101841.gif" width="960" height="93" alt=""></td>
  </tr>
  <tr>
    <td><img src="/plug-in/ksbd/img/2011101842.gif" width="960" height="513" alt=""></td>
  </tr>
</tbody></table>

    </div>
 </div>

<div id="help">
    <div class="help"> 
        <h1 class="help01">购课指南</h1>
        <ul>
            <li><a target="_blank" href="/help/network.html">什么是网络教育</a></li>
            <li><a target="_blank" href="/help/register.html">如何注册会员</a></li>
            <li><a target="_blank" href="/help/buycourse.html">如何购买课程</a></li>
            <li><a target="_blank" href="/help/payprocess.html">付费开课流程</a></li>
        </ul>      	
    </div>
    <div class="help">
        <h1 class="help02">如何支付</h1>
        <ul>
            <li><a target="_blank" href="/about/pay.html">支付方式</a></li>
            <li><a target="_blank" href="/help/flow.html">付款流程</a></li>
            <li><a target="_blank" href="/help/flow.html">如何得知课程已开通</a></li>
            <li><a target="_blank" href="/help/flow.html">网校可否提供发票</a></li>
        </ul>      	
    </div>
    <div class="help">
        <h1 class="help03">常见问题</h1>
        <ul>
            <li><a target="_blank" href="/help/learningquestion.html">网络学习疑问解答</a></li>
            <li><a target="_blank" href="/help/oldstudents.html">什么是老学员</a></li>
            <li><a target="_blank" href="/help/download.html">如何下载课件</a></li>
            <li><a target="_blank" href="/help/software.html">常用软件下载</a></li>
        </ul>      	
    </div>
    <div class="help help4">
        <h1 class="help04">关于我们</h1>
        <ul>
            <li><a target="_blank" href="/about/">网站简介</a></li>
            <li><a target="_blank" href="/help/aboutuscontent.html#tese01">教学特色</a></li>
            <li><a target="_blank" href="/help/aboutuscontent.html#tese02">服务特色</a></li>
            <li><a target="_blank" href="/help/aboutuscontent.html#tese03">技术优势</a></li>
        </ul>      	
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
