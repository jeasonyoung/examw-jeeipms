<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${agency.name}-试卷下载</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${domain}/plug-in/jquery/jquery-1.8.0.min.js"></script>
</head>
<body>
<div id="top"></div>
<div class="jg-nav" id="head_nav">
</div>
<!--主体部分-->
<div class="content">
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="resourceList.html">试卷下载</a></div>
<!--左-->
<div class="jgLeft">
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_agencyinfo"></div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">试卷详情</a></div></div>
<div class="list_leftbox">
		<div class="category_wrap">
			<div class="title">${paper.paperName}</div>
			<div class="category_con">
			  <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td width="280" rowspan="3" align="center"><img src="${domain}/agency/img/shijuan.jpg" width="220" height="320" /></td>
                  <td height="38" style="border-bottom:#CCCCCC dotted 1px;">价格：￥${paper.paperPrice} 元</td>
                </tr>
                <tr>
                  <td height="38" style="border-bottom:#CCCCCC dotted 1px;">卷面总分：<strong>${paper.paperScore}</strong> 分</td>
                </tr>
                <tr>
                  <td height="38" style="border-bottom:#CCCCCC dotted 1px;">答题时间：${paper.paperTime}分钟</td>
                </tr>
              </table>
				<div class="info">
					<div class="shuoming"><div style="border-bottom:1px dotted #ccc; font-size:14px; line-height:24px; height:24px; margin-bottom:10px; padding-left:10px;"><strong>试卷描述：</strong></div><div>${paper.paperSummary}</div></div>
					<div class="shuoming"><div style="border-bottom:1px dotted #ccc; font-size:14px; line-height:24px; height:24px; margin-bottom:10px; padding-left:10px;"><strong>题目说明：</strong></div>
					${paper.paperDescr}
					</div>
					<div class="shuoming"><div class="bttn"><a href="/cartController.do?cartList&courseId=${paper.id}">立即购买</a></div></div>
				</div>
			</div>
		</div>
	</div>
<dl class="adr">
<dd><span>机构地址</span>:${agency.address?default("")}</dd>
<dd><span>联系电话</span>:${agency.officephone?default("")}</dd>
</dl>
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
		$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_course").load("left_course.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
	});
</script>
</body>
</html>
