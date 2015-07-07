<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/home/home.ico" media="screen" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/bootstrap.min.css" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/matrix-style.css" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/matrix-media.css" />
<link href="plug-in/jquery-jbox/2.3/Skins/Bootstrap/jbox.css" rel="stylesheet" />
<link href="plug-in/agencycms/cms/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="plug-in/agencycms/css/jeeipms.css" />
</head>
<body>
<div id="header">
  <h1><a href="javascript:;">Failymiss</a></h1>
</div>
<!--close-Header-part--> 
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="javascript:;" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text"><%=session.getAttribute("username")%>,欢迎您</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="agencycmsUser.do?addorupdate"><i class="icon-user"></i>个人信息</a></li>
        <li class="divider"></li>
        <li><a href="#myModal" data-toggle="modal"><i class="icon-check"></i>修改密码</a></li>
        <li class="divider"></li>
        <li><a href="agencycms.do?logout"><i class="icon-key"></i>登出</a></li>
      </ul>
    </li>
      <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> 新消息</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> 收件箱</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> 发件箱</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> 垃圾箱</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="/agencycms.do?update"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
    <li class=""><a title="" href="/agencycms.do?logout"><i class="icon icon-share-alt"></i> <span class="text">登出</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->
<div id="sidebar"><a href="javascript:;" class="visible-phone"><i class="icon icon-home"></i> 功能模块</a>
  <ul>
     <li  id="li_main" ><a href="agencycms.do?login"><i class="icon icon-home"></i> <span>会员首页</span></a> </li>
     <li id="li_student" class="submenu"> <a href="javascript:;"><i class="icon icon-th-list"></i> <span>报名咨询</span> <span class="label label-important">1</span></a>
      <ul>
        <li><a href="agencycmsStudent.do?list">咨询学员</a></li>
      </ul>
    </li>
    <li id="li_course" class="submenu"> <a href="javascript:;"><i class="icon icon-file"></i> <span>课程管理</span> <span class="label label-important">6</span></a>
      <ul>
        <li><a href="agencycmscourse.do?facelist">面授课程</a></li>
        <li><a href="agencycmscourse.do?onlinelist">网络课程</a></li>
        <li><a href="agencycmscoursePackageController.do?packageList">套餐管理</a></li>
        <li><a href="agencycmscourse.do?addorupdate">面授添加</a></li>
        <li><a href="agencycmscourse.do?addorupdateonline">网课添加</a></li>
        <li><a href="agencycmscoursePackageController.do?addorupdate">套餐添加</a></li>
       
      </ul>
    </li>
     <li class="submenu" id="li_teacher"> <a href="javascript:;"><i class="icon icon-file"></i> <span>老师管理</span> <span class="label label-important">2</span></a>
      <ul>
        <li><a href="agencycmsteacher.do?list">老师列表</a></li>
        <li><a href="agencycmsteacher.do?addorupdate">老师添加</a></li>
      </ul>
    </li>
     <li class="submenu"> <a href="javascript:;"><i class="icon icon-info-sign"></i> <span>内容管理</span> <span class="label label-important">2</span></a>
      <ul>
        <li><a href="agencycmsphoto.do?photoList">机构相册</a></li>
        <li><a href="agencycmsrecourseController.do?recourseList">机构新闻</a></li>
      </ul>
    </li>
     <li id="li_file"><a href="agencycms.do?filemanger"><i class="icon icon-th"></i> <span>文件管理</span></a></li>
     <li id="li_askAnswer"><a href="agencycmsAnswer.do?asklist"><i class="icon icon-th"></i> <span>答疑管理</span></a></li>
     <li id="li_paper"><a href="agencycmsPaper.do?paperList"><i class="icon icon-th"></i> <span>试卷管理</span></a></li>
    <li class="submenu" id="li_agency"> <a href="javascript:;"><i class="icon icon-info-sign"></i> <span>机构信息</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="agencycmsUser.do?addorupdate">个人信息</a></li>
        <li><a href="agencycms.do?update">机构信息</a></li>
         <c:choose>
       		<c:when test="${empty secondDomain || secondeDomain==''}">
       			 <li><a href="/agency/${fn:substring(agengcyid,21,32)}">机构首页</a></li>
       		</c:when>
       		<c:otherwise>
       			 <li><a href="http://${secondDomain}.quanxuehao.com" target="_blank">机构首页</a></li>
       		</c:otherwise>
		</c:choose>
        <li><a href="#myModal" data-toggle="modal" >密码修改</a></li>
      </ul>
    </li>
  </ul>
</div>
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">修改密码</h3>
  </div>
  <div class="modal-body">
  <form class="form-horizontal" method="post" action="agencycmsUser.do?savenewpwd" name="password_validate" id="password_validate" novalidate="novalidate">
                <div class="control-group">
                  <label class="control-label">旧密码</label>
                  <div class="controls">
                    <input type="password" name="oldpwd" id="oldpwd" onblur='checkPassword($("#oldpwd"),$("#oldpwdInfo"));'/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">新密码</label>
                  <div class="controls">
                    <input type="password" name="pwd" id="pwd"  onblur='checkPassword($("#pwd"),$("#pwdInfo"));'/>
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label">确认密码</label>
                  <div class="controls">
                    <input type="password" name="pwd2" id="pwd2" onblur='checkRepeatPwd($("#pwd2"),$("#pwd"),$("#pwd2Info"));'/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"></label>
                  <div class="controls" id="info">
                  </div>
                </div>                       
              </form>
 </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <button class="btn btn-primary" id="but_login">保存</button>
  </div>
 
</div>
</body>
<script src="plug-in/agencycms/cms/js/jquery.min.js"></script> 
<script src="plug-in/agencycms/cms/js/jquery.ui.custom.js"></script> 
<script src="plug-in/agencycms/cms/js/bootstrap.min.js"></script> 
<script src="plug-in/agencycms/cms/js/matrix.js"></script>
<script src="plug-in/agencycms/js/failymiss.min.js"></script>
<script src="plug-in/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="plug-in/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js" type="text/javascript"></script>
<script>
function checkPassword(input,span) {
	var pwd = input.val();
	//
	var reg = /^[0-9a-zA-Z_]+$/;
	if (pwd.length < 6 || pwd.length > 20
			|| !reg.test(pwd)
			) {
		input.parents('.control-group').removeClass('success');
		input.parents('.control-group').addClass('error');
		return false;
	} else {
		input.parents('.control-group').removeClass('error');
		input.parents('.control-group').addClass('success');
		return true;
	}
}
//检查重复密码
function checkRepeatPwd(input1,input2,span) {
	if(!checkPassword(input1,span))
	{
		input1.parents('.control-group').removeClass('success');
		input1.parents('.control-group').addClass('error');
		return false;
	}
	var pwd = input1.val();
	var pwd1 = input2.val();
	if (pwd1 && (!pwd1.indexOf(pwd) && pwd.length == pwd1.length)) {
		input1.parents('.control-group').removeClass('error');
		input1.parents('.control-group').addClass('success');
		return true;
	} else {
		input1.parents('.control-group').removeClass('success');
		input1.parents('.control-group').addClass('error');
		return false;
	}
}

//点击登录
$('#but_login').click(function(e) {
	Login();
});
//登录处理函数
function Login() {
	if(!checkAll()){return;}
	var actionurl=$('form').attr('action');//提交路径
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		url : actionurl,// 请求的action路径
		data : {pwd:$("#pwd").val(),oldpwd:$("#oldpwd").val()},
		error : function() {// 请求失败处理函数
			$("#info").html("<span style='color:red;'>系统错误</span>");
		},
		success : function(data) {
			if (data.success) {
				$("#info").html("<span style='color:green;'>修改成功</span>");
			} else {
				$("#info").html("<span style='color:red;'>"+data.msg+"</span>");
			}
		},
		dataType:"json"
	});
}

function checkAll(){
	return checkPassword($("#oldpwd"),$("#oldpwdInfo"))&checkPassword($("#pwd"),$("#pwdInfo"))&checkRepeatPwd($("#pwd2"),$("#pwd"),$("#pwd2Info"));
}

</script>
</html>
