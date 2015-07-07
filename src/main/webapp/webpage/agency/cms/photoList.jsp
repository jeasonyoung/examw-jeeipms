<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>机构相册</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">
.sort{color:#0663A2;cursor:pointer;}
</style>
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">机构相册</a><a href="javascript:;" class="current">在线课程</a></div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
      	<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>机构相册</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
           <form:form id="searchForm" modelAttribute="photo" action="agencycmsStudent.do?list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<div style="margin-top:8px;">
				<label>图片标题：</label><form:input path="title" htmlEscape="false" maxlength="20" class="input-medium"/>&nbsp;&nbsp;
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="button" value="添加" onclick="return add();"/>
				</div>
			</form:form>
		  <table id="contentTable" class="table table-striped table-bordered table-hover  table-condensed">
				<thead><tr><th>图片标题</th><th>图片展示</th><th>添加时间</th><th>操作</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="photo" varStatus="index">
					<tr>
						<td  style="padding-top: 30px">${photo.title}</td>
						<td><img src="${photo.thumbUrl}" /></td>				
						<td  style="padding-top: 30px"><fmt:formatDate value="${photo.addtime}" type="both"/></td>
						<td  style="padding-top: 30px">
							<a href="javascript:;" onclick="return update('${photo.title}','${photo.thumbUrl}','${photo.id}');">修改</a>
							<a href="agencycmsphoto.do?delete&id=${photo.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
						</td>
					</tr>				
				</c:forEach>
				</tbody>
		  </table>
          </div>
          <div class="pagination">${page}</div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--修改学员 -->
<div id="photoshow" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">机构图片</h3>
  </div>
  <div class="modal-body">
  <form class="form-horizontal" method="post" action="agencycmsphoto.do?save" name="photoshowform" id="photoshowform" >
            <div class="control-group">
              <label class="control-label">图片标题</label>
              <div class="controls">
                <input type="text" name="title" id="name" validate="{required:true,minlength:2,maxlength:20}" />
              	<input id="photoId" name="id" type="hidden" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">班级图片</label>
              <div class="controls">
              	<input id="imageurl" name="urlpath" maxlength="255" class="input-xlarge" type="hidden" /> 
    			<tags:ckfinder input="imageurl" type="images" uploadPath="test" selectMultiple="false"/>
              </div>
            </div> 
            <div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button type="submit" class="btn btn-primary" id="but_login">保存</button>
       </div>             
   </form>
 </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <%@include file="common/foot.jsp"%>
</div>
<!--end-Footer-part-->
</body>
<style>
.pagination .controls input{border:0;color:#999;width:30px;padding:0;margin:-3px 0 0 0;text-align:center}
#select1 {
width: 150px;
}
img{width: 72px;height: 72px;}
</style>
<script src="plug-in/agencycms/cms/js/jquery.validate.js"></script> 
<script src="plug-in/agencycms/cms/js/jquery.metadata.js"></script> 
<script src="plug-in/agencycms/cms/js/messages_cn.js"></script> 
<script src="plug-in/agencycms/cms/js/validator.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			var style = $("#li_course").attr("class");
			$("#li_course").attr("class","active  open "+style);
			//修改表单验证
			$.metadata.setType("attr", "validate");
			$("#photoshowform").validate({
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
			//初始化
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","agencycmscourse.do?onlinelist");
			$("#searchForm").submit();
	    	return false;
	    }
		function add(){
			$("#photoId").val("");
			$("#name").val("");
			$("#imageurl").val("");
			$('#photoshow').modal('show');
		}
		
		function update(name,url,id){
			$("#photoId").val(id);
			$("#name").val(name);
			$("#imageurl").val(url);
			$('#photoshow').modal('show');
		}
	</script>
</html>
