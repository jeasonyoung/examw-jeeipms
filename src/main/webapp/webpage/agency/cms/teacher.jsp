<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>机构老师</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">课程管理</a><a href="javascript:;" class="current">面授课程</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>机构老师</h5>
          </div>
        <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form class="form-horizontal" method="post" action="agencycmsteacher.do?save" name="teacherform" id="teacherform" >
                <div class="control-group">
                  <label class="control-label">老师名称</label>
                  <div class="controls">
                    <input type="text" name="realname" value="${teacher.realname}" id="name" validate="{required:true,minlength:2,maxlength:20}" />
                  	<input name="id" type="hidden" value="${teacher.id}"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">头像</label>
                  <div class="controls">
                    <!--<input type="text" name="imageurl" id="imageurl" value="${course.imageurl}" validate="{minlength:2,maxlength:50}"/>-->
                  	<input id="imageurl" name="imageurl" maxlength="255" class="input-xlarge" type="hidden" value="${teacher.imageurl}"/> 
				    <tags:ckfinder input="imageurl" type="images" uploadPath="test" selectMultiple="false"/>
                  </div>
                </div> 
                <div class="control-group">
                  <label class="control-label">联系电话</label>
                  <div class="controls">
                    <input type="text" name="phone" id="phone" value="${teacher.phone}" validate="{telephone:true}"/>
                  </div>
                 </div>
                 <div class="control-group">
                  <label class="control-label">电子邮箱</label>
                  <div class="controls">
                    <input type="text" name="email" id="email" value="${teacher.email}" validate="{email:true}"/>
                  </div>
                </div>
                  <div class="control-group">
                  <label class="control-label">联系QQ</label>
                  <div class="controls">
                    <input type="text" name="qq" id="qq" value="${teacher.qq}" validate="{qq:true}"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">推荐排序</label>
                  <div class="controls">
                     <input type="text" name="teacherorder" id="teacherorder" value="${teacher.teacherorder}" validate="{digits:true}"/>
                  </div>
                </div> 
               	<div class="control-group">
                  <label class="control-label">主要课程</label>
                  <div class="controls">
                    <textarea rows="" cols="" name="lessons">${teacher.lessons}</textarea>
                  </div>
                </div> 
                
                <div class="control-group">
                  <label class="control-label">老师介绍</label>
                  <div class="controls">  
                 	<script type="text/plain" id="editor" name="myeditor">${teacher.description}</script>
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
			//导航栏样式
			var style = $("#li_teacher").attr("class");
			$("#li_teacher").attr("class","active  open "+style);
			//修改表单验证
			$.metadata.setType("attr", "validate");
			$("#teacherform").validate({
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
