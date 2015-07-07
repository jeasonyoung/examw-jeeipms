<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>答疑管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">.sort{color:#0663A2;cursor:pointer;}</style>
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">答疑管理</a></div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>问题列表</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
		  <form:form id="searchForm" modelAttribute="ask" action="agencycmsAnswer.do?asklist" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<div style="margin-top:8px;">
				<label>类&nbsp;别：</label>
            	<form:select path="type" id="select1">  
            		<form:option selected="selected" value="4">不限</form:option>  
	                <form:option value="0">课程咨询</form:option>  
	                <form:option value="1">学习答疑</form:option>  
            	</form:select>&nbsp;&nbsp;
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="page();"/>
				</div>
			</form:form>
			<table id="contentTable" class="table table-striped table-bordered table-hover  table-condensed">
				<thead><tr><th>问题标题</th><th>内容</th><th>类型</th><th>状态</th><th>提问时间</th><th>操作</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="c" varStatus="index">
					<tr>
						<td><c:if test="${fn:length(c.title)<=10 }">${c.title }</c:if><c:if test="${fn:length(c.title)>10 }">${fn:substring(c.title,0,11)}...</c:if></td>
						<td><c:if test="${fn:length(c.content)<=20 }">${c.content }</c:if><c:if test="${fn:length(c.content)>20 }">${fn:substring(c.content,0,21) }&nbsp;...</c:if></td>
						<td><c:if test="${c.type eq 0 }">课程咨询</c:if><c:if test="${c.type eq 1 }">学习答疑</c:if></td>
						<td><c:if test="${c.status eq 0}">未回复</c:if><c:if test="${c.status != 0}">已回复</c:if></td>
						<%--<td>${c.teachtime}</td>--%>
						<td><fmt:formatDate value="${c.createDate}" type="both"/></td>
						<td>
							<a href="agencycmsAnswer.do?addAnswer&id=${c.id}" onclick=""  class="tip-bottom"  data-original-title="回复" ><i class="icon-edit"></i></a>
							<a href="agencycmsAnswer.do?addAnswer&id=${c.id}&load=detail" onclick=""  class="tip-bottom"  data-original-title="查看" ><i class="icon-search"></i></a>
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
			var style = $("#li_askAnswer").attr("class");
			$("#li_askAnswer").attr("class","active  open "+style);
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","agencycmsAnswer.do?asklist");
			$("#searchForm").submit();
	    	return false;
	    }
		
		function add(){
			window.location.href='agencycmscourse.do?addorupdate';
		}
	</script>
</html>
