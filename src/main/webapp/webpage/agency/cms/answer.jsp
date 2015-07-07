<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>答疑</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">.ask{border: 1px solid #CCCCCC;padding:4px 6px;height:auto;margin-right:245px}</style>
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">答疑管理</a><a href="javascript:;" class="current">回复</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>回复疑问</h5>
          </div>
        <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form class="form-horizontal" method="post"  action="agencycmsAnswer.do?saveAnswer" name="courseform" id="courseform" >
                <div class="row-fluid">
                <div class="control-group">
                  <label class="control-label">问题标题:</label>
                  <div class="controls">
                    <div class="ask">${ask.title}</div>
                  	<input id="askId" name="id" type="hidden" value="${ask.id}"/>
                  </div>
                </div>
                </div>
                 <div class="row-fluid">
                <div class="span6 control-group">
                  <label class="control-label">问题类型:</label>
                  <div class="controls">
                  		<div class="ask"><c:if test="${ask.type eq 0 }">课程咨询</c:if><c:if test="${ask.type eq 1 }">学习答疑</c:if></div>
                  </div>
                </div>      
                </div>
                <div class="row-fluid">
                <div class="control-group">
                <label class="control-label">问题内容:</label>
                <div class="controls">
                	<div class="ask">${ask.content }</div>
                </div>
                </div>
                </div>
                <div class="row-fluid">
                <div class="control-group">
                  <label class="control-label">回复</label>
                  <div class="controls">
                  <c:choose>
                  	<c:when test="${fn:length(load)>0}"><div class="ask">${ask.answerList[0].content }</div></c:when>
                  	<c:otherwise><script type="text/plain" id="editor" name="answerList[0].content"></script></c:otherwise>
                  </c:choose>
                  </div>
                </div>
                </div>
                <div class="modal-footer">
                <span id="msgg" style="margin-right:10px;color:red"></span>
                <c:choose>
                  	<c:when test="${fn:length(load)>0}"><input type="button" class="btn btn-primary" id="but_submit" onclick="goBack();" value="返回"></c:when>
                  	<c:otherwise><input type="button" class="btn btn-primary" id="but_submit" onclick="submitFn();" value="保存"></c:otherwise>
                  </c:choose>
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
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by </div>
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
			var style = $("#li_ask").attr("class");
			$("#li_ask").attr("class","active  open "+style);
			//修改表单验证
			if("${load}" == '')
			{
				UE.getEditor('editor');
				UE.getEditor('editor').addListener('focus',function(){$("#msgg").html("");});
			}
		});
		function submitFn()
		{
			if("${load}" == 'detail'){window.location="/agencycmsAnswer.do?asklist"; return;}
			var content = UE.getEditor('editor').getContent();
			if($.trim(content)=='')
			{
				$("#msgg").html("请输入回复内容");
				return false;
			}else
			{
				$("#courseform").submit();
			}
		}
		function goBack()
		{
			window.location = "/agencycmsAnswer.do?asklist";
		}
	</script>
</html>
