<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/uniform.css" />
<link rel="stylesheet" href="plug-in/agencycms/cms/css/select2.css" />
</head>
<body>
<!--Header-part-->
<%@include file="common/head.jsp"%>
<!--close-Header-part--> 
<!--top-Header-menu-->
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;">机构管理</a> <a href="javascript:;" class="current">用户管理</a></div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>基本信息</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
            <form class="form-horizontal" method="post" action="agencycmsUser.do?addorupdate" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              <div class="control-group">
                <label class="control-label">用&nbsp;&nbsp;户&nbsp;名</label>
                <div class="controls">
                  <input id="disabledInput" type="text" placeholder="${user.username}" disabled>
                  <input type="hidden" name="id"  value="${user.id}">
                </div>
              </div>
               <div class="control-group">
                <label class="control-label">真实姓名</label>
                <div class="controls">
                  <input type="text" name="realname" id="required" value="${user.realname}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">电子邮箱</label>
                <div class="controls">
                  <input type="text" name="email" id="email" value="${user.email}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">手机号码</label>
                <div class="controls">
                  <input type="text" name="mobilephone" id="date" value="${user.mobilephone}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">办公电话</label>
                <div class="controls">
                  <input type="text" name="officephone" id="date" value="${user.officephone}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">联&nbsp;系QQ</label>
                <div class="controls">
                  <input type="text" name="qq" id="min" value="${user.qq}" />
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="but_login">保存</button>
              </div>   
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<%@include file="common/foot.jsp"%>
<!--end-Footer-part-->
<script src="plug-in/agencycms/cms/js/jquery.uniform.js"></script> 
<script src="plug-in/agencycms/cms/js/select2.min.js"></script> 
<script src="plug-in/agencycms/cms/js/jquery.validate.js"></script> 
<script src="plug-in/agencycms/cms/js/matrix.form_validation.js"></script>
<script type="text/javascript">
	$(function(){
		//导航栏样式
		var style = $("#li_agency").attr("class");
		$("#li_agency").attr("class","active  "+style);
	});
</script>
</body>
</html>
