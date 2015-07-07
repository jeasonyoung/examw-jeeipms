<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>机构资源</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">内容管理</a><a href="javascript:;" class="current">机构资源</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>机构资源</h5>
          </div>
        <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form class="form-horizontal" method="post"  action="agencycmsrecourseController.do?save" name="recourseform" id="recourseform" >
                <div class="control-group">
                  <label class="control-label">资源标题</label>
                  <div class="controls">
                    <input type="text" name="title" value="${recourse.title}" id="name" validate="{required:true,minlength:2,maxlength:30}" />
                  	<input id="recourseId" name="id" type="hidden" value="${recourse.id}"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">推荐排序</label>
                  <div class="controls">
                    <input type="text" name="aorder" id="aorder" value="${recourse.aorder}" validate="{digits:true,maxlength:10}"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">资源内容</label>
                  <div class="controls">  
                  	<script type="text/plain" id="editor" name="myeditor">${recourse.content}</script> 
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
<!--修改学员 -->
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>
<!--end-Footer-part-->
</body>
<style>
.pagination .controls input{border:0;color:#999;width:30px;padding:0;margin:-3px 0 0 0;text-align:center}
#select1 {
width: 180px;
}
</style>
<script type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
<script src="plug-in/agencycms/cms/js/jquery.validate.js"></script> 
<script src="plug-in/agencycms/cms/js/jquery.metadata.js"></script> 
<script src="plug-in/agencycms/cms/js/messages_cn.js"></script> 
<script src="plug-in/agencycms/cms/js/validator.js"></script>
<script type="text/javascript">window.UEDITOR_HOME_URL= "/plug-in/ueditor/"</script>
<script type="text/javascript" src="plug-in/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="plug-in/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			//修改表单验证
			$.metadata.setType("attr", "validate");
			$("#recourseform").validate({
					errorClass: "help-inline",
					errorElement: "span",
					highlight:function(element, errorClass, validClass) {
						$(element).parents('.control-group').removeClass('success');
						$(element).parents('.control-group').addClass('error');
					},
					unhighlight: function(element, errorClass, validClass) {
						$(element).parents('.control-group').removeClass('error');
						$(element).parents('.control-group').addClass('success');
					}	
			});
			//初始化ueditor
			UE.getEditor('editor');
		});
	</script>
</html>
