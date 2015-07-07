<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name}- 联系我们</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${domain}/plug-in/jquery/jquery-1.8.0.min.js"></script>
<style type="">
	.error{color: red}
</style>
</head>
<body>
<div id="top"></div>
<div class="jg-nav" id="head_nav">
</div>
<!--主体部分-->
<div class="content">
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="#">联系我们</a></div>
<!--左-->
<div class="jgLeft">
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_agencyinfo"></div>
<div class="blk10"></div>
<div class="jgboxl" id="left_news"></div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="#">课程列表</a></div></div>
<div class="blk10"></div>
<span class="bmlc"><img src="../img/jg_ms_lc.gif" width="654" height="113" /></span>
<form action="/agencyfront.do?savestu" id="studentInfo"  method="post">
<input type="hidden" name="agency.id" value="${agency.id}" />
<div class="content2">
                        <dl>
                            <dd>姓名：</dd>
                            <dt>
                                <input name="realname" type="text" id="txtRealName" class="input_r"  validate="{required:true}"/>
                                </dt>
        </dl>
                        <dl>
                            <dd>电话：</dd>
                            <dt>
                                <input name="phone" type="text" id="txtTel" class="input_r" validate="{required:true,telephone:true}"/>
                               </dt>
                        </dl>
                        <dl>
                            <dd>QQ：</dd>
                            <dt>
                                <input name="qq" type="text" id="txtQQ" class="input_r"  validate="{qq:true}"/>
                            </dt>
                        </dl>
                        <dl>
                            <dd>Email：</dd>
                            <dt>
                                <input name="email" type="text" id="txtEmail" class="input_r" validate="{email:true,required:true}" />
                            </dt>
                        </dl> 
                        <dl>
                            <dd>咨询课程：</dd>
                            <dt>
                                <input name="course" type="text" id="txtEmail" class="input_r" validate="{required:true}" />
                            </dt>
                        </dl> 
                        <dl>
                            <dd>咨询内容：</dd>
                            <dt>
                                <textarea name="content" rows="2"  style="width:400px" id="txtJoindes" class="area1" validate="{required:true,maxlength:100}"></textarea></dt>
                        </dl>
                        <dl>
                            <dd>详细地址：</dd>
                            <dt>
                                <textarea name="address" rows="2"   style="width:400px"  id="txtMydes" class="area1" validate="{required:true,maxlength:100}"></textarea></dt>
                        </dl>
                       <input name="" type="submit" class="btn" value="提交" />
      </div>
</div>
</div>
</form>
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
<script src="${domain}/plug-in/agencycms/cms/js/jquery.validate.js"></script> 
<script src="${domain}/plug-in/agencycms/cms/js/jquery.metadata.js"></script> 
<script src="${domain}/plug-in/agencycms/cms/js/messages_cn.js"></script> 
<script src="${domain}/plug-in/agencycms/cms/js/validator.js"></script>
<script type="text/javascript">
	$(function(){
		$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_course").load("left_course.html");
		$("#left_news").load("left_news.html");
		$("#left_agencyinfo").load("left_agencyinfo.html");
	});
	//修改表单验证
	$.metadata.setType("attr", "validate");
	$("#studentInfo").validate({
		errorClass: "error",
		errorElement: "span"
	});
</script>
</body>
</html>
