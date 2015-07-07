<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/center/css/top_footer.css" />
<link type="text/css" rel="stylesheet" href="/center/css/index.css" />
<link type="text/css" rel="stylesheet" href="/center/css/info.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  基本信息</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div class="Container" style="margin: 0px"> 
<div class="Main" style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="rightside">
<h1>我的帐号管理</h1>
<div class="test clearfix">
<ul class="test-ul">
<li><a href="/cstudyRecordController.do?info"><span>基本资料</span></a></li>
<li  class="on"><a href="/cstudyRecordController.do?head"><span>上传头像</span></a></li>
<li><a href="/cstudyRecordController.do?password"><span>修改密码</span></a></li>
</ul>
</div>
<div class="ebady" style="position:relative;">
<form id="FormHeadpic" name="FormHeadpic" target="hidden_frame" action="/cstudyRecordController.do?upload" method="post" enctype="multipart/form-data">
<div class="userface cf">
                  <div class="userface-pic fl"> <img id="myheadpic" src="${student.imageurl}" alt="用户头像" /> </div>
                  <div class="userface-summary">
                    <ol class="userface-summary-text">
                      <li>上传自定义头像<em>(规格为120X120像素或接近这个比例)</em></li>
                      <li>头像图片支持JPG、GIF、PNG类型<em>(大小不要超过300K)</em></li>
                    </ol>
                    <div  class="pic y-btn">			
						<a id="uploadBtnStyle" href="javascript:;">选择照片</a>
						</div>
						<input size=1 type="file" id="filename"  name="filename" style="position:absolute;width:89px;height:31px;left:140px;top:72px;filter:alpha(opacity=0);-moz-opacity:0;opacity:0;border:none;cursor:pointer;overflow:hidden;">
						<span id="picpath"></span>
					</div>
                  </div>
        </div>
<div class="user-info-main" style="display:none">
  <div class="user-card-main">
<ul>
<li class="user-name"><strong>jiangwei3457</strong></li>
<li><label class="left">资料完整度</label></li>
<li><span class="user-info-co"><span class="progress-bar" style="width:%"></span></span><label class="left">%</label></li>
</ul>
</div>
</div>

<div class="next">
			<!--<span class="y-btn-blue"><a href="javascript:;" id="savepic">保 存</a></span>-->
			
			<input type="button" id="submit1" value="保 存"  class="submit1" onmouseover="this.className='submit2'" onmouseout="this.className='submit1'"/>
	  </div>
	  </form>

</div>
</div>
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:0px;}
.submit1 {background: url(http://img.233.com/wx/img/uc/edit/tc.png) no-repeat scroll 0 -154px transparent;color: #FFFFFF;float: left; font-weight: bold;height: 26px; line-height: 26px;margin-left: 85px;text-align: center;width: 68px; border:none;cursor:pointer;} 
.submit2{background: url(http://img.233.com/wx/img/uc/edit/tc.png) no-repeat scroll 0 -184px transparent;color: #FFFFFF;float: left; font-weight: bold;height: 26px; line-height: 26px;margin-left: 85px;text-align: center;width: 68px; border:none;cursor:pointer;} 
</style>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=exam" ></script>
<script type="text/javascript">
$(function(){
	$("#left_info").addClass("cur");
	$("#left_info").siblings().removeClass("cur")
});
$(document).ready(function(){
	$("#uploadBtnStyle").click(function(){
		$("#filename").click();
	});
	
	$("#filename").change(function(){
		$("#picpath").html($("#filename").val());
	})
	
	$("#submit1").click(function(){
		if($("#filename").val()!=""){
			$("#FormHeadpic").submit();
			return false;
		}
		else
		{
			notice("请选择文件",3);
		}
	});
	
});

function notice(content,t)
{//提示框
	dianotice = art.dialog({id:"notice",content:content,icon:"warning",lock:true,opacity:0.1,time:t,title: false,fixed:true});
}

function loading(content)
{//提示框
	dialoading = art.dialog({id:"loading123",content:content,icon:"loading",cancel:false,title: false,fixed:true});
}

function succeed(content,t)
{
	artdialog = art.dialog({id:"artdialog",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true,title: false});
}



</script>
</body>
</html>