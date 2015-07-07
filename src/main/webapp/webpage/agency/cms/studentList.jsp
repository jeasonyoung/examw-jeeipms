<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>学员列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">.sort{color:#0663A2;cursor:pointer;}</style>
</head>
<body>
<%@include file="common/head.jsp"%>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;" class="current">学员信息</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>学员列表</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
		    <form:form id="searchForm" modelAttribute="stu" action="agencycmsStudent.do?list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<div style="margin-top:8px;">
				<label>姓&nbsp;名：</label><form:input path="realname" htmlEscape="false" maxlength="15" class="input-medium"/>&nbsp;&nbsp;
				<label>电&nbsp;话：</label><form:input path="phone" htmlEscape="false" maxlength="15" class="input-medium"/>&nbsp;&nbsp;
				<label>状&nbsp;态：</label>
            	<form:select path="status" id="select1">  
            		<form:option selected="selected" value="4">不限</form:option>  
	                <form:option value="0">未处理</form:option>  
	                <form:option value="1">跟踪中</form:option>  
	                <form:option value="2">已报名</form:option>  
	                <form:option value="3">不报名</form:option>
            	</form:select>&nbsp;&nbsp;
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				&nbsp;<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
				</div>
			</form:form>
			<table id="contentTable" class="table table-striped table-bordered table-hover  table-condensed">
				<thead><tr><th>课程名</th><th>学员姓名</th><th class="sort loginName">咨询时间</th><th class="sort name">状态</th><th>联系电话</th><th>电子邮箱</th><th>联系QQ</th><th>操作</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="stu" varStatus="index">
					<c:if test="${stu.status eq 0}">
					<tr class="info">
						<td >${stu.course}</td>
						<td >${stu.realname}</td>
						<td ><fmt:formatDate value="${stu.addtime}" type="both"/></td>
						<td	>未处理</td>
						<td >${stu.phone}</td>
						<td >${stu.email}</td>
						<td >${stu.qq}</td>
						<td >
		    				<a href="javascript:;" onclick="return update('${stu.realname}','${stu.phone}','${stu.email}','${stu.status}','${stu.address}','${stu.qq}','${stu.id}');">修改</a>
							<a href="agencycmsStudent.do?del&stuId=${stu.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
						</td>
					</tr>
					</c:if><c:if test="${stu.status eq 1}">
					<tr class="warning">
						<td >${stu.course}</td>
						<td >${stu.realname}</td>
						<td ><fmt:formatDate value="${stu.addtime}" type="both"/></td>
						<td	>跟踪中</td>
						<td >${stu.phone}</td>
						<td >${stu.email}</td>
						<td >${stu.qq}</td>
						<td >
		    				<a href="javascript:;" onclick="return update('${stu.realname}','${stu.phone}','${stu.email}','${stu.status}','${stu.address}','${stu.qq}','${stu.id}');">修改</a>
							<a href="agencycmsStudent.do?del&stuId=${stu.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
						</td>
					</tr>
					</c:if><c:if test="${stu.status eq 2}">
					<tr class="success">
						<td >${stu.course}</td>
						<td >${stu.realname}</td>
						<td ><fmt:formatDate value="${stu.addtime}" type="both"/></td>
						<td	>已报名</td>
						<td >${stu.phone}</td>
						<td >${stu.email}</td>
						<td >${stu.qq}</td>
						<td >
		    				<a href="javascript:;" onclick="return update('${stu.realname}','${stu.phone}','${stu.email}','${stu.status}','${stu.address}','${stu.qq}','${stu.id}');">修改</a>
							<a href="agencycmsStudent.do?del&stuId=${stu.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
						</td>
					</tr></c:if><c:if test="${stu.status eq 3}">
					<tr class="error">
						<td >${stu.course}</td>
						<td >${stu.realname}</td>
						<td ><fmt:formatDate value="${stu.addtime}" type="both"/></td>
						<td	>不报名</td>
						<td >${stu.phone}</td>
						<td >${stu.email}</td>
						<td >${stu.qq}</td>
						<td >
		    				<a href="javascript:;" onclick="return update('${stu.realname}','${stu.phone}','${stu.email}','${stu.status}','${stu.address}','${stu.qq}','${stu.id}');">修改</a>
							<a href="agencycmsStudent.do?del&stuId=${stu.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
						</td>
					</tr></c:if>							
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
<div id="studentInfo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">修改学员</h3>
  </div>
  <div class="modal-body">
  <form class="form-horizontal" method="post" action="agencycmsStudent.do?save" name="studentform" id="studentform" >
                <div class="control-group">
                  <label class="control-label">学员姓名</label>
                  <div class="controls">
                    <input type="text" name="realname" id="name" validate="{required:true,minlength:2,maxlength:10}" />
                  	<input id="stuId" name="id" type="hidden" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">联系电话</label>
                  <div class="controls">
                    <input type="text" name="phone" id="cellphone" validate="{required:true,cellphone:true}"/>
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label">电子邮箱</label>
                  <div class="controls">
                    <input type="text" name="email" id="email" validate="{required:true,email:true}"/>
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label">联系&nbsp;QQ</label>
                  <div class="controls">
                    <input type="text" name="qq" id="qq" validate="{qq:true}"/>
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label">状态</label>
                  <div class="controls">
                  <select name="status" id="status">
	                <option value="0">未处理</option>  
	                <option value="1">跟踪中</option>  
	                <option value="2">已报名</option>  
	                <option value="3">不报名</option>
				  </select>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">地址</label>
                  <div class="controls">
                    <textarea rows="2" validate="{required:true,minlength:4,maxlength:255}" name="address" id="address"></textarea>
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
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>
<!--end-Footer-part-->
</body>
<style>
.pagination .controls input{border:0;color:#999;width:30px;padding:0;margin:-3px 0 0 0;text-align:center}
#select1 {
width: 150px;
}
</style>
<script src="plug-in/agencycms/cms/js/jquery.validate.js"></script> 
<script src="plug-in/agencycms/cms/js/jquery.metadata.js"></script> 
<script src="plug-in/agencycms/cms/js/messages_cn.js"></script> 
<script src="plug-in/agencycms/cms/js/validator.js"></script>
<script type="text/javascript">
		
		$(document).ready(function() {
			//导航栏样式
			var style = $("#li_student").attr("class");
			$("#li_student").attr("class","active  open "+style);
			//数据导出
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","agencycmsStudent.do?exportXls");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			//修改表单验证
			$.metadata.setType("attr", "validate");
			$("#studentform").validate({
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
		function update(name,phone,email,status,address,qq,id){
			$("#name").val(name);
			$("#cellphone").val(phone);
			$("#email").val(email);
			$("#status").val(status);
			$("#qq").val(qq);
			$("#address").val(address);
			$("#stuId").val(id);
			$('#studentInfo').modal('show');
		}
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","agencycmsStudent.do?list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</html>
