<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/context/context.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>";/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/plug-in/agencycms/cms/css/bootstrap.min.css" />
<link rel="stylesheet" href="/plug-in/agencycms/cms/css/bootstrap-responsive.min.css" />
<script src="/plug-in/agencycms/cms/js/jquery.min.js"></script> 
<script src="plug-in/agencycms/js/failymiss.min.js"></script>
<title>addVideoEntity</title>
</head>
<body>
<div>
	<tags:message content="${message}"/>
	<form action="/agencycmscourse.do?batchAdd" id="form2" method="post">
		<div class="row-fluid">
		<div class="span4">
		   	 <div class="control-group">
                  <label class="control-label">课程名称</label>                
              </div>
		   </div>
		   <div class="span4">
		   	<div class="control-group">
                  <label class="control-label">视频地址</label>                
             </div>
		   </div>
		   <div class="span2">
		   	  <div class="control-group">
                  <label class="control-label">排序</label>
              </div>
		   </div>
		   <div class="span2">
		   	  <div class="control-group">
                  <label class="control-label">操作</label>
              </div>
		   </div>
		</div>
		<div class="content" id="video_list">
		<input type="hidden" name="courseId" value="${courseId}" />
		<c:forEach items="${list}" var="video" varStatus="index">
		<div class="row-fluid">
		   <div class="span4">
		   	 <div class="control-group">
                  <div class="controls">
                    <input type="text" name="list[${index.index}].title" value="${video.title}" id="name" validate="{required:true,minlength:2,maxlength:20}" />
                  </div>
              </div>
		   </div>
		   <div class="span4">
		   	<div class="control-group">
                  <div class="controls">
                    <input id="audition${index.index}" name="list[${index.index}].videoUrl" maxlength="255" class="input-xlarge" type="hidden" value="${video.videoUrl}"/> 
				    <tags:ckfinder input="audition${index.index}" type="flash" uploadPath="test" selectMultiple="false"/>
                  </div>
             </div>
		   </div>
		   <div class="span2">
		   	  <div class="control-group">             
                  <div class="controls">
                    <input style="width: 100px;" type="text" name="list[${index.index}].videoorder" value="${video.videoorder}" id="name" validate="{required:true,minlength:2,maxlength:20}" />
                  </div>
              </div>
		   </div>
		    <div class="span2">
		   	  <div class="control-group">
                 <a href="agencycmscourse.do?deleteVideo&id=${video.id}" onclick="return confirmx('确认要删除该视频？', this.href)"  class="tip-bottom"  data-original-title="删除">删除</i></a>
              </div>
		   </div>
		</div>
		</c:forEach>
		</div>	
		<div class="modal-footer">
            <button type="button" class="btn" id="but_add">添加</button>
            <button type="submit" class="btn btn-primary" id="but_add">保存</button>
        </div>
	</form>
</div>
<div style="display:none">
    <!--  数据统计代码 --></div>
</body>
<script type="text/javascript">
	$("#but_add").click(function(){
		var length=$(".row-fluid").length-1,courseId =$("#course_id_0").val();
		var html="";
		html+="'<div class='row-fluid'>";
		html+="<div class='span4'>";
		html+="<div class='control-group'>";
		html+="<div class='controls'>";
		html+="<input type='text' name='list["+length+"].title' value=''  validate='{required:true,minlength:2,maxlength:20}' />";
		html+="</div>";
		html+="</div>";
		html+="</div>";
		html+="<div class='span4'>";
		html+="<div class='control-group'>";
		html+="<div class='controls'>";
		html+="<input type='text' id='audition' name='list["+length+"].videoUrl' maxlength='255'  value=''/>"; 
		html+="</div>";
		html+="</div>";
		html+="</div>";
		html+="<div class='span2'>";
		html+= "<div class='control-group'>";             
		html+= "<div class='controls'>";
		html+=  "<input style='width: 100px;' type='text' name='list["+length+"].videoorder' value=''  validate='{required:true,minlength:2,maxlength:20}' />";
		html+= "</div>";
		html+= "</div>";
		html+="</div>";
		html+= "<div class='span2'>";
		html+="<div class='control-group'>";
		html+="<a href='agencycmscourse.do?del&courseId=${c.id}' onclick='return confirmx('确认要删除该课程？', this.href)'  class='tip-bottom'  data-original-title='删除'>删除</i></a>";
		html+"</div>";
		html+="</div>";
		html+="</div>";
		var $tr = $(html);
		$("#video_list").append($tr);
	});
</script>
</html>
