<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>在线课程</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">课程管理</a><a href="javascript:;" class="current">在线课程</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>网络课程</h5>
          </div>
        <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form class="form-horizontal" method="post" action="agencycmscourse.do?saveonline" name="courseform" id="courseform" >
                <input id="stuId" name="id" type="hidden" value="${course.id}"/>
                <input id="agencyId" name="agency.id" type="hidden" value="${course.agency.id}"/>
                <div class="row-fluid">
                <div class="span6 control-group">
                  	<label class="control-label">课程名称</label>
                  	 <div class="controls">
                     <input type="text" name="coursename" value="${course.coursename}" id="name" validate="{required:true,minlength:2,maxlength:20}" />
                 	 </div>    
                </div>
                <div class="span6 control-group">         
                     <label class="control-label">课程类别</label>
                 	 <div class="controls">
                     <tags:treeselect id="category" name="category.id" value="${course.category.id}" validate="{required:true}" labelName="category.categoryname" labelValue="${course.category.categoryname}"
					 title="类别" url="agencycmscourseCategory.do?treeData"  notAllowSelectRoot="false" cssClass="input-small" allowClear="true" cssStyle="width:161px;"/>
                  	 </div>
                </div> 
                </div>
                <div class="row-fluid">
                <div class="span6 control-group">
                  <label class="control-label">所属省份</label>
                  <div class="controls">
                    <tags:treeselect id="province" name="province.id" value="${course.province.id}"  labelName="province.province" labelValue="${course.province.province}"
					title="省份" url="agencycmscourse.do?treeData"  notAllowSelectRoot="false" cssClass="input-small" allowClear="true" cssStyle="width:161px;"/>
                  </div>
                </div> 
                <div class="span6 control-group">
                 <label class="control-label">免费</label>
                  <div class="controls">
                  	<label class="radio inline">
  						<input type="radio" checked="checked" id="inlineCheckbox1" value="0" name="isfree" > 否
				 	</label>
				 	<label class="radio inline">
  						<input type="radio" id="inlineCheckbox2" value="1" name="isfree"> 是
				 	</label>
                  </div>        
                </div>
                </div>
                <div class="row-fluid">
        		<div class="span6 control-group" >
                  <label class="control-label">老师</label>
                  <div class="controls">
                   		<tags:treeselect id="teacher" name="teacher.id" value="${course.teacher.id}"  labelName="teacher.realname" labelValue="${course.teacher.realname}" 
						title="老师" url="agencycmsteacher.do?treeData"  cssStyle="width:161px;" notAllowSelectRoot="false" cssClass="input-small" allowClear="true" />
                  </div>
                </div>    
                <div class="span6 control-group" >
                  <label class="control-label">课时</label>
                  <div class="controls">
                   	 <input type="text" name="period" id="period" value="${course.period}" validate="{required:true,digits:true}"/>
                  </div>
                </div>  
                 </div>  
                 <div class="row-fluid">
                 <div class="span6 control-group">
                  <label class="control-label">原价</label>
                  <div class="controls">
                    <input type="text" name="price" id="price" value="${course.price}" validate="{required:true,digits:true}"/>
                  </div>
                </div>
                <div class="span6 control-group">
                  <label class="control-label">优惠价</label>
                  <div class="controls">
                    <input type="text" name="favorableprice" id="favorableprice" value="${course.favorableprice}" validate="{required:true,digits:true}"/>
                  </div>
                </div>
                 </div>  
                 <div class="row-fluid">
                <div class="span6 control-group">
                  <label class="control-label">班级图片</label>
                  <div class="controls">
                    <!--<input type="text" name="imageurl" id="imageurl" value="${course.imageurl}" validate="{minlength:2,maxlength:50}"/>-->
                  	<input id="imageurl" name="imageurl" maxlength="255" class="input-xlarge" type="hidden" value="${course.imageurl}"/> 
				    <tags:ckfinder input="imageurl" type="images" uploadPath="test" selectMultiple="false"/>
                  	<span class="help-inline">图片大小178x134</span>
                  </div>
                </div> 
                <div class="span6 control-group">
                  <label class="control-label">试听地址</label>
                  <div class="controls">
                    <input id="audition" name="audition" maxlength="255" class="input-xlarge" type="hidden" value="${course.audition}"/> 
				    <tags:ckfinder input="audition" type="flash" uploadPath="test" selectMultiple="false"/>
                  </div>
                </div>
                </div>  
                <div class="row-fluid">
                <div class="control-group">
                <label class="control-label">课程摘要</label>
                <div class="controls">
                  <textarea rows="4"  name="summary" class="span10"  validate="{required:true,minlength:20,maxlength:240}" >${course.summary}</textarea>
                </div>
                </div>
                </div>
                <div class="row-fluid">
                <div class="control-group">
                  <label class="control-label">课程介绍</label>
                  <div class="controls">    
                    <script type="text/plain" id="editor" name="myeditor">${course.description}</script> 
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
			//修改悬空的值
			var isfree ="${course.isfree}"
			if(isfree!=""){
				var radios = document.getElementsByName("isfree");//获取单选框    
				for(i=0;i<radios.length;i++){          //循环单选框
				    if(radios[i].value == isfree)   //判断是否等于单选框的值
				    radios[i].checked = true;          //选中单选框
				    }
				}
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
