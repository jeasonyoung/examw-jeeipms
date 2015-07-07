<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>套餐添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">课程管理</a><a href="javascript:;" class="current">套餐管理</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>课程套餐</h5>
          </div>
        <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form class="form-horizontal" method="post"  action="agencycmscoursePackageController.do?save" name="courseform" id="courseform" >
                <div class="row-fluid">
                <div class="span6 control-group">
                  <label class="control-label">套餐名称</label>
                  <div class="controls">
                    <input type="text" name="pkgName" value="${coursePackage.pkgName}" id="pkgName" validate="{required:true,minlength:2,maxlength:20}" />
                  	<input id="pakId" name="id" type="hidden" value="${coursePackage.id}"/>
                  	<input id="agencyId" name="agency.id" type="hidden" value="${coursePackage.agency.id}"/>
                  </div>
                </div>
                 <div class="span6 control-group">
                  <label class="control-label">课程类别</label>
                  <div class="controls">
                    <tags:treeselect id="category" name="category.id" value="${coursePackage.category.id}"  labelName="category.categoryname" labelValue="${coursePackage.category.categoryname}" 
					title="类别"  url="agencycmscourseCategory.do?treeData"  cssStyle="width:161px;" notAllowSelectRoot="false" cssClass="input-small" allowClear="true" />
                  </div>
                </div> 
                </div>
                 <div class="row-fluid">
                 <div class="span6 control-group">
                  <label class="control-label">所属省份</label>
                  <div class="controls">
                    <tags:treeselect id="province" name="province.id" value="${coursePackage.province.id}"  labelName="province.province" labelValue="${coursePackage.province.province}"
					title="省份" url="agencycmscourse.do?treeData"  notAllowSelectRoot="false" cssClass="input-small" allowClear="true" cssStyle="width:161px;"/>
                  </div>
                </div> 
                 <div class="span6 control-group">
                  <label class="control-label">包含课程</label>
                  <div class="controls">
                    <tags:treeselect id="courseIds" name="courseIds" value="${coursePackage.courseIds}" labelValue="" labelName="courseNames" title="课程" url="agencycmscoursePackageController.do?treeData"  notAllowSelectRoot="false" checked="true" cssClass="input-small" allowClear="false" cssStyle="width:161px;"/>
                  </div>
                </div> 
                </div>
                <div class="row-fluid">              
	               <div class="span6 control-group">
	                  <label class="control-label">原价</label>
	                  <div class="controls">
	                    <input type="text" name="pkgPrice" id="pkgPrice" value="${coursePackage.pkgPrice}" validate="{number:true,maxlength:10}"/>
	                  </div>
	                </div>
	                <div class="span6 control-group">
	                  <label class="control-label">优惠价</label>
	                  <div class="controls">
	                    <input type="text" name="goodPrice" id="goodPrice" value="${coursePackage.goodPrice}" validate="{number:true,maxlength:10}"/>
	                  </div>
	                </div>
                </div>
               
                <div class="row-fluid">
                  <div class="span6 control-group">
                  <label class="control-label">套餐图片</label>
                  <div class="controls">
                  	<input id="imageurl" name="imageurl" maxlength="255" class="input-xlarge" type="hidden" value="${coursePackage.imageurl}"/> 
				    <tags:ckfinder input="imageurl" type="images" uploadPath="test" selectMultiple="false"/>
                  	<span class="help-inline">图片大小178x134</span>
                  </div>
                </div>
                <div class="span6 control-group">
                  <label class="control-label">试听地址</label>
                  <div class="controls">
                    <input id="audition" name="audition" maxlength="255" class="input-xlarge" type="hidden" value="${coursePackage.audition}"/> 
				    <tags:ckfinder input="audition" type="flash" uploadPath="test" selectMultiple="false"/>
                  </div>
                </div>
                </div>
                <div class="row-fluid">
                <div class="span6 control-group" >
                  <label class="control-label">课时</label>
                  <div class="controls">
                   	 <input type="text" name="pkgTime" id="pkgTime" value="${coursePackage.pkgTime}" validate="{required:true,digits:true}"/>
                  </div>
                </div> 
                </div> 
                <div class="row-fluid">
                <div class="control-group">
                <label class="control-label">套餐摘要</label>
                <div class="controls">
                  <textarea rows="6"  name="summary" class="span10"  validate="{required:true,minlength:20,maxlength:240}" >${coursePackage.summary}</textarea>
                </div>
                </div>
                </div>
                <div class="row-fluid">
                <div class="control-group">
                  <label class="control-label">套餐介绍</label>
                  <div class="controls">  
                  	<script type="text/plain" id="editor" name="myeditor">${coursePackage.pkgDescri}</script> 
                  </div>
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
			var style = $("#li_course").attr("class");
			$("#li_course").attr("class","active  open "+style);
			//修改表单验证
			$.metadata.setType("attr", "validate");
			$("#courseform").validate({
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
