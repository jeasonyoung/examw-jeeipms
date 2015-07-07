<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>面授课程</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">.sort{color:#0663A2;cursor:pointer;}</style>
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">课程管理</a><a href="javascript:;" class="current">面授课程</a></div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>课程列表</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
		    <form:form id="searchForm" modelAttribute="course" action="agencycmscourse.do?facelist" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<div style="margin-top:8px;">
				<label>类别：</label><tags:treeselect id="category" name="category.id" value="${course.category.id}" labelName="category.categoryname" labelValue="${course.category.categoryname}"
					title="类别" url="agencycmscourseCategory.do?treeData"  notAllowSelectRoot="false" cssClass="input-small" allowClear="true"/>
				<label>课程名：</label><form:input path="coursename" htmlEscape="false" maxlength="15" class="input-medium"/>&nbsp;&nbsp;
				<label>状&nbsp;态：</label>
            	<form:select path="status" id="select1">  
            		<form:option selected="selected" value="4">不限</form:option>  
	                <form:option value="0">未审核</form:option>  
	                <form:option value="1">审核通过</form:option>  
	                <form:option value="2">审核未过</form:option>  
            	</form:select>&nbsp;&nbsp;
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="button" value="添加" onclick="return add();"/>
				</div>
			</form:form>
			<table id="contentTable" class="table table-striped table-bordered table-hover  table-condensed">
				<thead><tr><th>课程名称</th><th>类别</th><th>学费</th><th>优惠价</th><th>添加时间</th><th>开课时间</th><th>状态</th><th>备注</th><th>操作</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="c" varStatus="index">
					<tr>
						<td>${c.coursename }</td>
						<td>${c.category.categoryname}</td>
						<td>${c.price }</td>
						<td>${c.favorableprice}</td>
						<%--<td>${c.teachtime}</td>--%>
						<td><fmt:formatDate value="${c.addtime}" type="both"/></td>
						<c:if test="${not empty  c.opentime }"><td><fmt:formatDate value="${c.opentime}" type="date"/></td></c:if>
						<c:if test="${empty c.opentime}"><td>随到随学</td></c:if>
						<td><tags:status status='${c.status}'/></td>
						<td>${c.content}</td>
						<td>
							<a href="agencycmscourse.do?addorupdate&id=${c.id}" onclick=""  class="tip-bottom"  data-original-title="修改" ><i class="icon-edit"></i></a>
							<a href="agencycmscourse.do?del&courseId=${c.id}" onclick="return confirmx('确认要删除该课程？', this.href)"  class="tip-bottom"  data-original-title="删除"><i class="icon-remove"></i></a>
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
</style>
<script type="text/javascript">
		$(function(){
			//导航栏样式
			var style = $("#li_course").attr("class");
			$("#li_course").attr("class","active  open "+style);
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","agencycmscourse.do?facelist");
			$("#searchForm").submit();
	    	return false;
	    }
		
		function add(){
			window.location.href='agencycmscourse.do?addorupdate';
		}
	</script>
</html>
