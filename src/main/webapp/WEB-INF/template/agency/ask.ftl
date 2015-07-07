<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name}- 在线答疑</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/ask.css" rel="stylesheet" type="text/css" />
<link href="${domain}/plug-in/jquery-jbox/2.3/Skins/Bootstrap/jbox.css" rel="stylesheet" />
<link href="${domain}/plug-in/jquery-plugs/pager/Pager.css" rel="stylesheet" />
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
<div class="location">您现在所在的位置：<a href="index.html">${agency.name}</a> >> <a href="#">在线答疑</a></div>
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
<div class="jgtitl"><div class="Hleft nob"><a href="#">课程答疑</a></div></div>
<div class="blk10"></div>
<form action="${domain}/agencyfront.do?saveAsk" id="studentInfo"  method="post">
<input type="hidden" name="agency.id" value="${agency.id}" id="agencyId"/>
<div class="content2">
                        <dl>
                            <dd>问题标题：</dd>
                            <dt>
                                <input name="title" type="text" id="txtRealName" class="input_r"  validate="{required:true,minlength:10}"/>
                                </dt>
        				</dl>
                        <dl>
                            <dd>问题类别：</dd>
                            <dt>
                                <select name="type" id="typeSelect" style="width:260px;float:left;margin-top:5px;padding:5px; border: 1px solid #DEDEDE;">
                                	<option value='0' selected="selected">课程咨询</option>
                                	<option value='1'>学习答疑</option>
                                </select> 
                               </dt>
                        </dl>
                        <dl>
                            <dd>问题内容：</dd>
                            <dt>
                                <textarea name="content" rows="2"  style="width:400px" id="txtJoindes" class="area1" validate="{required:true,minlength:10,maxlength:1000}"></textarea></dt>
                        </dl>
                       <input name="" type="button" class="btn" value="提交" onclick="checkAndSubmit();"/>
      </div>
       	  <div class="main-content-right no-border leave-message-wrap">
				<div class="message-area">
					<ul class="tab-list clearfix">
						<li class="first"><span>问题列表</span></li>
			    		<li class="commtent click current" status='all' tag='li_click'><span>全部</span></li>
			        	<li class="question click" status='answered' tag='li_click'><span>已解答</span></li>
			       		<li class="evaluate click" status='unanswered' tag='li_click'><span>未解答</span></li>
			       		<li style="width:270px"><span></span></li>
					</ul>
					<div class="show-area">
						<div class="message-total" >共<span id="total"></span>条</div>
						<div id="J_imgLoad" style="text-align:center;margin-top:15px;display:none">
							<img alt="" src="../img/loading.gif">
						</div>
						<ul id="list">
							
						</ul>
						<div id="pager" ></div>
					</div>
				</div>		
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
<script src="${domain}/plug-in/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="${domain}/plug-in/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js" type="text/javascript"></script>
<script src="${domain}/plug-in/jquery-plugs/pager/jquery.pager.js" type="text/javascript"></script>
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
		//载入问题列表
		getAskList("all",1);
		$("li[tag='li_click']").click(function(){
			var status = $(this).attr("status");
			$(this).addClass('current');
			$(this).siblings().removeClass('current');
			getAskList(status,1);
		});
	});
	function getAskList(status,page)
	{
		$("#J_imgLoad").show();
		$.ajax({
			async:true,
			url:'/agencyfront.do?askList',//&status=all&agencyId=4028816c42c0dc420142c18ab49b0000&page=1,
			type:'post',
			data:{"status":status,"page":page,"agencyId":$("#agencyId").val()},
			dataType:'json',
			success:function(data){
				$("#total").html(data.total);
				var pagecount = Number(data.pagecount);
				PageClick = function(pageclickednumber) {
					$("#pager").pager({ pagenumber: pageclickednumber, pagecount: pagecount, buttonClickCallback: PageClick });
					getAskList(status,pageclickednumber);
				}
				$("#pager").pager({ pagenumber: 1, pagecount: pagecount, buttonClickCallback: PageClick });
				$("#list").html("");
				
				for(var i=0;i<data.list.length;i++)
				{
					var ask = data.list[i];
					var li = "<li courseid='0' itemtype='gossip' itemid='25697' class='item-comment clearfix'><div class='question-area'><a class='avatar' hidefocus='true' target='_blank' href='#'><img src='"+ask.imgurl+"'></a>";
					li = li + "<div class='say clearfix'><a hidefocus='true' target='_blank' href='#'>"+ask.username+"：</a>"+ask.content+"<span style='margin-top:5px' class='answer-list'>（ "+ask.createDate+"）</span></div></div>";
					li = li + "<div class='replay-area'><div class='question-sourse'>问题分类：<a class='direct-ask' href='javascript:;'>"+ask.type+"</a></div><div class='replay-pup clearfix'></div>";
					li = li + "<div style='margin-top:1px' class='answer-list'><div class='item-replay adminMessgae clearfix'>";
					var replylist = ask.replyList;
					if(replylist.length>0)
					{
						for(var j=0;j<replylist.length;j++)
						{
							var reply = replylist[j];
							li = li + "<div class='say clearfix'><a hidefocus='true' target='_blank' href='index.html' style='color:blue'>"+reply.createBy+"</a><b style='font-weight:normal;padding:0 3px'>答</b>："+reply.answer+"<span style='color: #AAAAAA;margin-left: 5px;'>（"+reply.addtime+"）</span></div>";
						}
					}
					li = li + "</div></div></div></li>";
					$("#list").append(li);
				}
				$("#J_imgLoad").hide();
			}
		});
	}
	//修改表单验证
	$.metadata.setType("attr", "validate");
	$("#studentInfo").validate({
		errorClass: "error",
		errorElement: "span"
	});
	var flag=false;
	function checkAndSubmit()
	{
		if(flag){$("#studentInfo").submit(); return;}
		if(!"${domain}")
		{		
		$.ajax({
			async : false,
			cache : false,
			type : 'POST',
			url : "${domain}"+"/stuCenter.do?checkStu",// 请求的action路径
			error : function() {// 请求失败处理函数
				$.jBox.tip("系统错误请稍后再试",'error');
			},
			success : function(data) {
			if (data.success) {
				flag = true;
				$("#studentInfo").submit();
			} else {
				$.jBox(html, { title: "用户登录", submit: submit });
			}
		},
		dataType:"json"
		});}else
		{
			$.getJSON("${domain}"+"/stuCenter.do?checkStu&callback=?",function(data){
				if (data.success) {
				flag = true;
				$("#studentInfo").submit();
			} else {
				$.jBox(html, { title: "用户登录", submit: submit });
			}
			});
		}
	}
	var html = "<div style='padding:10px;'>用户名：<input type='text' id='username' name='username' style='border: 1px solid #DEDEDE;height: 20px;'/></div>"+
			   "<div style='padding:10px;'>密   码：<input type='password' id='password' style='border: 1px solid #DEDEDE;height: 20px;' name='password' /></div>";
	var submit = function (v, h, f) {
    if (f.username == '') {
        $.jBox.tip("请输入用户名", 'error', { focusId: "username" }); // 关闭设置 yourname 为焦点
        return false;
    }
	if(f.password == ''){
		$.jBox.tip("请输入密码", 'error', { focusId: "password" }); // 关闭设置 yourname 为焦点
        return false;
	}
	$.jBox.tip("正在登录，你懂的...", 'loading');
	if(!"${domain}")
	{
    $.ajax({
		async : false,
		cache : false,
		type : 'POST',
		url : "${domain}"+"/stuCenter.do?checkLogin",// 请求的action路径
		data : {username:$.trim(f.username),spassword:f.password},
		error : function() {// 请求失败处理函数
			$.jBox.tip("系统错误请稍后再试",'error');
		},
		success : function(data) {
			if (data.success) {
				$.jBox.tip("登录成功", 'success');
				$("#stu").html("您好，"+ f.username+"（<a href='${domain}/stuCenter.do?index' cl class='cRed1 bold'>会员中心</a>）"+"【<a href='javascript:;' id='loginout'  class='cRed1 bold'>退出</a>】");
				loginSate=1;
				stuName = f.username;
				flag = true;
			} else {
				flag =false;
				loginSate=0;
				$.jBox.tip(data.msg, 'error', { focusId: "password" });
			}
		},
		dataType:"json"
	});}else{
		$.getJSON("${domain}"+"/stuCenter.do?checkLogin&callback=?",{username:$.trim(f.username),spassword:f.password},function(data){
				if (data.success) {
				$.jBox.tip("登录成功", 'success');
				$("#stu").html("您好，"+ f.username+"（<a href='${domain}/stuCenter.do?index' cl class='cRed1 bold'>会员中心</a>）"+"【<a href='javascript:;' id='loginout'  class='cRed1 bold'>退出</a>】");
				loginSate=1;
				stuName = f.username;
				flag = true; $.jBox.close(true);
			} else {
				flag =false;
				loginSate=0;
				$.jBox.tip(data.msg, 'error', { focusId: "password" });
			}
		});
	}
    return flag;
	};
</script>
</body>
</html>
