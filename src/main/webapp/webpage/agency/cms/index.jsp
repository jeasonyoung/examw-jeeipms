<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>机构中心</title>
<link href="plug-in/agencycms/cms/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/jquery.gritter.css" />
</head>
<body>
<!--Header-part-->
<%@include file="common/head.jsp"%>
<!--close-Header-part--> 
<!--top-Header-menu-->
<!--sidebar-menu-->
<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i> 会员首页</a></div>
  </div>
<!--End-breadcrumbs-->
<!--Action boxes-->
  <div class="container-fluid">
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
        <li class="bg_lg"> <a href="/agencycmsStudent.do?list"><i class="icon-user"></i>  咨询学员</a> </li>
        <li class="bg_lr"> <a href="/agencycmscourse.do?facelist"> <i class="icon-list-alt"></i>  课程列表</a> </li>
        <li class="bg_ly"> <a href="/agencycmsteacher.do?list"> <i class="icon-heart"></i>  老师列表 </a> </li>
        <li class="bg_lo"> <a href="/agencycms.do?filemanger"> <i class="icon-folder-close"></i>  文件管理</a> </li>
        <li class="bg_ls"> <a href="/agencycmsUser.do?addorupdate"> <i class="icon-wrench"></i>  个人信息</a> </li>
        <li class="bg_lb"> <a href="/agencycms.do?login"> <i class="icon-home"></i>	管理首页</a> </li>
      </ul>
    </div>
    <hr/>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title bg_ly" data-toggle="collapse" href="#collapseG2"><span class="icon"><i class="icon-chevron-down"></i></span>
            <h5>欢迎信息</h5>
          </div>
          <div class="widget-content nopadding collapse in" id="collapseG2">
            <ul class="recent-posts">
              <li>
                <div class="user-thumb"> <img width="40" height="40" alt="User" src="plug-in/agencycms/cms/img/demo/av1.jpg"> </div>
                <div class="article-post"> <span class="user-info"> 尊敬的 ${agencyuser.username } 您好:</span>
                  <p><a href="javascript:;">您是我们的普通用户，最多可以发布3条课程，每天只可以发布一篇文章/新闻。普通会员无法查看和处理咨询信息，为让您更好享受宣传招生，请联系我们认证审核，认证后可享受更多附加服务。</a> </p>
				</div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="row-fluid">
         <div class="span6">
          <div class="widget-box">
          	<div class="widget-title"> <span class="icon"><i class="icon-ok"></i></span>
            <h5>个人信息</h5>
          	</div>
			   <table class="table table-striped table-bordered">
              <tbody>
                <tr class="odd gradeX">
                  <td style="text-align: right;">用户名：</td>
                  <td>${agencyuser.username }</td>
                </tr>
                <tr class="even gradeC">
                   <td style="text-align: right;">真实姓名：</td>
                  <td>${agencyuser.realname }</td>
                </tr>
                <tr class="odd gradeA">
                  <td style="text-align: right;">手机号码：</td>
                  <td>${agencyuser.mobilephone }</td
                </tr>
                <tr class="even gradeA">
                   <td style="text-align: right;">电子邮箱：</td>
                  <td>${agencyuser.email }</td>        
                </tr>
                 <tr class="even gradeA">
                   <td style="text-align: right;">登陆次数：</td>
                  <td>${agencyuser.logincount }</td>        
                </tr>
                 <tr class="even gradeA">
                   <td style="text-align: right;">登陆IP：</td>
                  <td>${agencyuser.loginip }</td>        
                </tr>
              </tbody>
            </table>
            </div>
		</div>
       <div class="span6">
		 <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-ok"></i></span>
            <h5>相关信息</h5>
          </div>
          <div class="widget-content nopadding collapse in" id="collapseG2">
            <ul class="recent-posts">
              <li>
                <div class="user-thumb"> <img width="40" height="40" alt="User" src="plug-in/agencycms/cms/img/demo/av1.jpg"> </div>
                <div class="article-post"> <span class="user-info">报名咨询信息汇总：</span>
                  <p><a href="javascript:;">昨天到现在新增咨询留言0条；7天内新增咨询留言0条；30天内新增咨询留言0条</a></p>
                </div>
              </li>
              <li>
                <div class="user-thumb"> <img width="40" height="40" alt="User" src="plug-in/agencycms/cms/img/demo/av2.jpg"> </div>
                <div class="article-post"> <span class="user-info">报名咨询信息汇总： </span>
                  <p><a href="javascript:;">昨天到现在新增咨询留言0条；7天内新增咨询留言0条；30天内新增咨询留言0条</a> </p>
                </div>
              </li>
              <li>
                <div class="user-thumb"> <img width="40" height="40" alt="User" src="plug-in/agencycms/cms/img/demo/av4.jpg"> </div>
                <div class="article-post"> <span class="user-info">机构数据统计：</span>
                  <p><a href="javascript:;">机构当前综合排名：0；总课程数量：0个；总咨询数量：0条；总报名数量：0条</a> </p>
                </div>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="javascript:;">failymiss</a> </div>
</div>
<!--end-Footer-part-->
<script src="plug-in/agencycms/cms/js/jquery.gritter.min.js"></script>
<script src="plug-in/agencycms/cms/js/jquery.peity.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	/*var date = new Date("${user.lastlogintime}");
	alert("${user.lastlogintime}");
	alert(date);
	alert(date.format("yyyy-MM-dd hh:mm:ss"))*/
	// === jQuery Peity === //
	//导航栏样式
	$("#li_main").attr("class","active");
	$.fn.peity.defaults.line = {
		strokeWidth: 1,
		delimeter: ",",
		height: 24,
		max: null,
		min: 0,
		width: 50
	};
	$.fn.peity.defaults.bar = {
		delimeter: ",",
		height: 24,
		max: null,
		min: 0,
		width: 50
	};
	$(".peity_line_good span").peity("line", {
		colour: "#B1FFA9",
		strokeColour: "#459D1C"
	});
	$(".peity_line_bad span").peity("line", {
		colour: "#FFC4C7",
		strokeColour: "#BA1E20"
	});	
	$(".peity_line_neutral span").peity("line", {
		colour: "#CCCCCC",
		strokeColour: "#757575"
	});
	$(".peity_bar_good span").peity("bar", {
		colour: "#459D1C"
	});
	$(".peity_bar_bad span").peity("bar", {
		colour: "#BA1E20"
	});	
	$(".peity_bar_neutral span").peity("bar", {
		colour: "#757575"
	});
	
	// === jQeury Gritter, a growl-like notifications === //
	$.gritter.add({
		title:	'上一次登陆',
		text:	"登陆时间:${date}<br>&nbsp;&nbsp;&nbsp;IP地址:${ip}",
		image: 	'plug-in/agencycms/cms/img/demo/envelope.png',
		sticky: false
	});	
	$('#gritter-notify .normal').click(function(){
		$.gritter.add({
			title:	'Normal notification',
			text:	'This is a normal notification',
			sticky: false
		});		
	});
	
	$('#gritter-notify .sticky').click(function(){
		$.gritter.add({
			title:	'Sticky notification',
			text:	'This is a sticky notification',
			sticky: true
		});		
	});
	
	$('#gritter-notify .image').click(function(){
		var imgsrc = $(this).attr('data-image');
		$.gritter.add({
			title:	'Important Unread messages',
			text:	'You have 12 unread messages.',
			image: imgsrc,
			sticky: false
		});		
	});
});

</script>
</body>
</html>
