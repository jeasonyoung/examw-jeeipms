<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>老师列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"><a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">课程管理</a><a href="javascript:;" class="current">面授课程</a></div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
            <h5>老师列表</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
		    <form:form id="searchForm" modelAttribute="teacher" action="agencycmsteacher.do?list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<div style="margin-top:8px;">
				<label>姓名：</label><form:input path="realname" htmlEscape="false" maxlength="15" class="input-medium"/>&nbsp;&nbsp;
				<label>手机：</label><form:input path="phone" htmlEscape="false" maxlength="15" class="input-medium"/>&nbsp;&nbsp;
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="button" value="添加" onclick="return add();"/>
				</div>
			</form:form>
			<table id="contentTable" class="table table-striped table-bordered table-hover  table-condensed">
				<thead><tr><th>老师姓名</th><th>头像地址</th><th>电话</th><th>添加时间</th><th>主要课程</th><th>操作</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="t" varStatus="index">
					<tr>
						<td style="padding-top: 20px">${t.realname}</td>
						<td><img src="${t.imageurl}" /></td>	
						<td style="padding-top: 20px">${t.phone}</td>
						<td style="padding-top: 20px"><fmt:formatDate value="${t.addtime}" type="both"/></td>
						<td style="padding-top: 20px">${t.lessons}</td>
						<td style="padding-top: 20px">
							<a href="agencycmsteacher.do?addorupdate&id=${t.id}" onclick=""  class="tip-bottom"  data-original-title="修改" ><i class="icon-edit"></i></a>
							<a href="agencycmsteacher.do?del&teacherId=${t.id}" onclick="return confirmx('确认要删除该课程？', this.href)"  class="tip-bottom"  data-original-title="删除"><i class="icon-remove"></i></a>
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
.sort{color:#0663A2;cursor:pointer;}
img{width: 72px;height: 72px;}
</style>
<script type="text/javascript">
		$(function(){
			//导航栏样式
			var style = $("#li_teacher").attr("class");
			$("#li_teacher").attr("class","active  open "+style);
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","agencycmsteacher.do?list");
			$("#searchForm").submit();
	    	return false;
	    }
		
		function add(){
			window.location.href='agencycmsteacher.do?addorupdate';
		}
	</script>
</html>
