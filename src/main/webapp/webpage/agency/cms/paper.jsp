<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>试卷管理</title>
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
            <h5>试卷详细</h5>
          </div>
        <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form class="form-horizontal" method="post" action="agencycmsPaper.do?savePaper" name="courseform" id="courseform" >
                <input id="stuId" name="id" type="hidden" value="${paper.id}"/>
                <input id="agencyId" name="agency.id" type="hidden" value="${paper.agency.id}"/>
                <div class="row-fluid">
                <div class="span6 control-group">
                  	<label class="control-label">试卷名称</label>
                  	 <div class="controls">
                     <input type="text" name="paperName" value="${paper.paperName}" id="name" validate="{required:true,minlength:2,maxlength:50}" />
                 	 </div>    
                </div>
                <div class="span6 control-group">         
                     <label class="control-label">考试时间</label>
                 	 <div class="controls">
                 	 <input type="text" name="paperTime" value="${paper.paperTime}" id="name" validate="{required:true,digits:true}" />
                  	 </div>
                </div> 
                </div>
                <div class="row-fluid">
                <div class="span6 control-group">
                  <label class="control-label">试卷总分</label>
                  <div class="controls">
                    <input type="text" name="paperScore" value="${paper.paperScore}" id="name" validate="{required:true,digits:true}" />                  </div>
                </div> 
                <div class="span6 control-group">
                 <label class="control-label"></label>
                  <div class="controls">
                  	<%--<label class="radio inline">
  						<input type="radio" checked="checked" id="inlineCheckbox1" value="0" name="paperType" > 模拟卷
				 	</label>
				 	<label class="radio inline">
  						<input type="radio" id="inlineCheckbox2" value="1" name="paperType"> 真题卷
				 	</label>
                  --%></div>        
                </div>
                </div>
                 <div class="row-fluid">
                 <div class="span6 control-group">
                  <label class="control-label">试卷价格</label>
                  <div class="controls">
                    <input type="text" name="paperPrice" id="price" value="${paper.paperPrice}" validate="{required:true,digits:true}"/>
                  </div>
                </div>
                <div class="span6 control-group">
                  <label class="control-label">试卷地址</label>
                  <div class="controls">
                    <input id="audition" name="paperUrl" maxlength="255" class="input-xlarge" type="hidden" value="${paper.paperUrl}"/> 
				    <tags:ckfinder input="audition" type="files" uploadPath="test" selectMultiple="false"/>
                  </div>
                </div>
                </div>  
                <div class="row-fluid">
                <div class="control-group">
                <label class="control-label">试卷介绍</label>
                <div class="controls">
                  <textarea rows="4"  name="paperSummary" class="span10"  validate="{required:true,minlength:20,maxlength:240}" >${paper.paperSummary}</textarea>
                </div>
                </div>
                </div>
                <div class="row-fluid">
                <div class="control-group">
                  <label class="control-label">试卷摘要</label>
                  <div class="controls">    
                    <script type="text/plain" id="editor" name="myeditor">${paper.paperDescr}</script> 
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
